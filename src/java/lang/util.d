module java.lang.util;

public import java.lang.wrappers;
public import java.lang.String;
public import java.lang.interfaces;

version(Tango){
    static import tango.text.convert.Format;
    static import tango.core.Exception;
    static import tango.util.log.Log;
    static import tango.util.log.Config;
    static import tango.stdc.stdlib;

    alias tango.stdc.stdlib.exit exit;
} else { // Phobos
    static import core.exception;
    static import std.c.stdlib;
    static import std.stdio;
    alias std.c.stdlib.exit exit;
}

version(Tango){
} else { // Phobos
}
version(Tango){
} else { // Phobos
}
version(Tango){
} else { // Phobos
}

interface IDwtLogger {
    void trace( String file, ulong line, String fmt, ... );
    void info( String file, ulong line, String fmt, ... );
    void warn( String file, ulong line, String fmt, ... );
    void error( String file, ulong line, String fmt, ... );
    void fatal( String file, ulong line, String fmt, ... );
}

version(Tango){
    class DwtLogger : IDwtLogger {
        tango.util.log.Log.Logger logger;
        private this( char[] name ){
            logger = tango.util.log.Log.Log.lookup( name );
        }
        private char[] format( String file, ulong line, String fmt, TypeInfo[] types, void* argptr ){
            auto msg = Format.convert( types, argptr, fmt );
            auto text = Format( "{} {}: {}", file, line, msg );
            return text;
        }
        void trace( String file, ulong line, String fmt, ... ){
            if( logger.trace ){
                logger.trace( format( file, line, fmt, _arguments, _argptr ));
            }
        }
        void info( String file, ulong line, String fmt, ... ){
            if( logger.info ){
                logger.info( format( file, line, fmt, _arguments, _argptr ));
            }
        }
        void warn( String file, ulong line, String fmt, ... ){
            if( logger.warn ){
                logger.warn( format( file, line, fmt, _arguments, _argptr ));
            }
        }
        void error( String file, ulong line, String fmt, ... ){
            if( logger.error ){
                logger.error( format( file, line, fmt, _arguments, _argptr ));
            }
        }
        void fatal( String file, ulong line, String fmt, ... ){
            if( logger.fatal ){
                logger.fatal( format( file, line, fmt, _arguments, _argptr ));
            }
        }
    }
} else { // Phobos
    class DwtLogger : IDwtLogger {
        private this( String name ){
        }
        void trace( String file, ulong line, String fmt, ... ){
            std.stdio.writefln( "TRC %s %d: %s", file, line, fmt );
        }
        void info( String file, ulong line, String fmt, ... ){
            std.stdio.writefln( "INF %s %d: %s", file, line, fmt );
        }
        void warn( String file, ulong line, String fmt, ... ){
            std.stdio.writefln( "WRN %s %d: %s", file, line, fmt );
        }
        void error( String file, ulong line, String fmt, ... ){
            std.stdio.writefln( "ERR %s %d: %s", file, line, fmt );
        }
        void fatal( String file, ulong line, String fmt, ... ){
            std.stdio.writefln( "FAT %s %d: %s", file, line, fmt );
        }
    }
}

private DwtLogger dwtLoggerInstance;

IDwtLogger getDwtLogger(){
    if( dwtLoggerInstance is null ){
        synchronized{
            if( dwtLoggerInstance is null ){
                dwtLoggerInstance = new DwtLogger( "dwt" );
            }
        }
    }
    return dwtLoggerInstance;
}

void implMissing( String file, uint line ){
    getDwtLogger().fatal( file, line, "implementation missing in file {} line {}", file, line );
    getDwtLogger().fatal( file, line, "Please create a bug report at http://www.dsource.org/projects/dwt" );
    getDwtLogger().fatal( file, line, "exiting ..." );
    exit(1);
}

version(Tango){
    public alias tango.text.convert.Format.Format Format;
} else { // Phobos
    class Format{
        static String opCall( String fmt, ... ){
            implMissing(__FILE__,__LINE__);
            return null;
        }
    }
}

version( D_Version2 ){
    mixin("invariant(T)[] _idup(T)( T[] str ){ return str.idup; }");
} else { // D1
    String16 _idup( String16 str ){
        return str.dup;
    }
    String _idup( String str ){
        return str.dup;
    }
}

private struct GCStats {
    size_t poolsize;        // total size of pool
    size_t usedsize;        // bytes allocated
    size_t freeblocks;      // number of blocks marked FREE
    size_t freelistsize;    // total of memory on free lists
    size_t pageblocks;      // number of blocks marked PAGE
}
private extern(C) GCStats gc_stats();

size_t RuntimeTotalMemory(){
    GCStats s = gc_stats();
    return s.poolsize;
}


template arraycast(T) {
    T[] arraycast(U) (U[] u) {
        static if (
            (is (T == interface ) && is (U == interface )) ||
            (is (T == class ) && is (U == class ))) {
            return(cast(T[])u);
        }
        else {
            int l = u.length;
            T[] res;
            res.length = l;
            for (int i = 0; i < l; i++) {
                res[i] = cast(T)u[i];
            }
            return(res);
        }
    }
}


bool ArrayEquals(T)( T[] a, T[] b ){
    if( a.length !is b.length ){
        return false;
    }
    for( int i = 0; i < a.length; i++ ){
        static if( is( T==class) || is(T==interface)){
            if( a[i] !is null && b[i] !is null ){
                if( a[i] != b[i] ){
                    return false;
                }
            }
            else if( a[i] is null && b[i] is null ){
            }
            else{
                return false;
            }
        }
        else{
            if( a[i] != b[i] ){
                return false;
            }
        }
    }
    return true;
}

int arrayIndexOf(T)( T[] arr, T v ){
    int res = -1;
    int idx = 0;
    foreach( p; arr ){
        if( p == v){
            res = idx;
            break;
        }
        idx++;
    }
    return res;
}

T[] arrayIndexRemove(T)(T[] arr, uint n) {
    if (n is 0)
        return arr[1..$];
    if (n > arr.length)
        return arr;
    if (n is arr.length-1)
        return arr[0..n-1];
    // else
    return arr[0..n] ~ arr[n+1..$];
}

struct ImportData{
    void[] data;
    String name;

    public static ImportData opCall( void[] data, String name ){
        ImportData res;
        res.data = data;
        res.name = name;
        return res;
    }
}

template getImportData(String name ){
    const ImportData getImportData = ImportData( cast(void[]) import(name), name );
}



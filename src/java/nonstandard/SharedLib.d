module java.nonstandard.SharedLib;

import java.lang.all;
version(Tango){
    static import tango.sys.SharedLib;
    static import tango.stdc.stringz;
}

struct Symbol {
    String name;
    void** symbol;
}

struct SymbolVersioned2 {
    String name;
    void** symbol;
    int major;
    int minor;
}

struct SharedLib {
    static void loadLibSymbols( SymbolVersioned2[] symbols, String libname, int major, int minor ){
        version(Tango){
            if (auto lib = tango.sys.SharedLib.SharedLib.load(libname)) {
                foreach( inout s; symbols ){
                    if( s.major > major ) continue;
                    if( s.major == major && s.minor > minor ) continue;
                    *s.symbol = lib.getSymbol( tango.stdc.stringz.toStringz(s.name ) );
                    if( s.symbol is null ){
                        getDwtLogger.error(  __FILE__, __LINE__, "{}: Symbol '{}' not found", libname, s.name );
                    }
                }
            } else {
                getDwtLogger.error(  __FILE__, __LINE__, "Could not load the library {}", libname );
            }
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }
    static void loadLibSymbols( Symbol[] symbols, String libname ){
        version(Tango){
            if (auto lib = tango.sys.SharedLib.SharedLib.load(libname)) {
                foreach( inout s; symbols ){
                    *s.symbol = lib.getSymbol( tango.stdc.stringz.toStringz(s.name ) );
                    if( s.symbol is null ){
                        getDwtLogger.error(  __FILE__, __LINE__, "{}: Symbol '{}' not found", libname, s.name );
                    }
                }
            } else {
                getDwtLogger.error(  __FILE__, __LINE__, "Could not load the library {}", libname );
            }
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }
    static bool tryUseSymbol( String symbolname, String libname, void delegate( void*) dg  ){
        bool result = false;
        version(Tango){
            if (auto lib = tango.sys.SharedLib.SharedLib.load( libname ) ) {
                void* ptr = lib.getSymbol( tango.stdc.stringz.toStringz(symbolname));
                if (ptr !is null){
                    dg(ptr);
                    result = true;
                }
                lib.unload();
            }
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
        return result;
    }
}



/**
 * Authors: Frank Benoit <keinfarbton@googlemail.com>
 */
module java.lang.System;

import java.lang.util;
import java.lang.exceptions;
import java.io.PrintStream;

version(Tango){
    static import tango.sys.Environment;
    static import tango.core.Exception;
    static import tango.io.model.IFile;
    static import tango.time.Clock;
    static import tango.stdc.stdlib;
} else { // Phobos
    static import std.c.stdlib;
    static import std.datetime;
    static import std.path;
}

template SimpleType(T) {
    debug{
        static void validCheck(uint SrcLen, uint DestLen, uint copyLen){
            if(SrcLen < copyLen || DestLen < copyLen|| SrcLen < 0 || DestLen < 0){
                //Util.trace("Error : SimpleType.arraycopy(), out of bounds.");
                assert(0);
            }
        }
    }

    static void remove(ref T[] items, int index) {
        if(items.length == 0)
            return;

        if(index < 0 || index >= items.length){
            throw new ArrayIndexOutOfBoundsException(__FILE__, __LINE__);
        }

        T element = items[index];

        int length = items.length;
        if(length == 1){
            items.length = 0;
            return;// element;
        }

        if(index == 0)
            items = items[1 .. $];
        else if(index == length - 1)
            items = items[0 .. index];
        else
            items = items[0 .. index] ~ items[index + 1 .. $];
    }

    static void insert(ref T[] items, T item, int index = -1) {
        if(index == -1)
            index = items.length;

        if(index < 0 || index > items.length ){
            throw new ArrayIndexOutOfBoundsException(__FILE__, __LINE__);
        }

        if(index == items.length){
            items ~= item;
        }else if(index == 0){
            T[] newVect;
            newVect ~= item;
            items = newVect ~ items;
        }else if(index < items.length ){
            T[] arr1 = items[0 .. index];
            T[] arr2 = items[index .. $];

            // Important : if you write like the following commented,
            // you get wrong data
            // code:  T[] arr1 = items[0..index];
            //        T[] arr2 = items[index..$];
            //        items = arr1 ~ item;      // error, !!!
            //        items ~= arr2;            // item replace the arrr2[0] here
            items = arr1 ~ item ~ arr2;
        }
    }

    static void arraycopy(in T[] src, uint srcPos, T[] dest, uint destPos, uint len)
    {
        if(len == 0) return;

        assert(src);
        assert(dest);
        debug{validCheck(src.length - srcPos, dest.length - destPos, len);}

        // overlapping?
        if((src.ptr <= dest.ptr && src.ptr + len > dest.ptr)
         ||(src.ptr >= dest.ptr && src.ptr < dest.ptr + len)){
            if( destPos < srcPos ){
                for(int i=0; i<len; ++i){
                    dest[destPos+i] = cast(T)src[srcPos+i];
                }
            }
            else{
                for(int i=len-1; i>=0; --i){
                    dest[destPos+i] = cast(T)src[srcPos+i];
                }
            }
        }else{
            dest[destPos..(len+destPos)] = cast(T[])src[srcPos..(len+srcPos)];
        }
    }
}


class System {
    static void arraycopy(T)(in T[] src, uint srcPos, T[] dest, uint destPos, uint len) {
        if(len == 0) return;

        assert(src);
        assert(dest);
        debug{SimpleType!(T).validCheck(src.length - srcPos, dest.length - destPos, len);}

        // overlapping?
        if((src.ptr <= dest.ptr && src.ptr + len > dest.ptr)
                ||(src.ptr >= dest.ptr && src.ptr < dest.ptr + len)){
            if( destPos < srcPos ){
                for(int i=0; i<len; ++i){
                    dest[destPos+i] = cast(T)src[srcPos+i];
                }
            }
            else{
                for(int i=len-1; i>=0; --i){
                    dest[destPos+i] = cast(T)src[srcPos+i];
                }
            }
        }else{
            dest[destPos..(len+destPos)] = cast(T[])src[srcPos..(len+srcPos)];
        }
    }

    static long currentTimeMillis(){
        version(Tango) return tango.time.Clock.Clock.now().ticks() / 10000;
        else           return std.datetime.Clock.currStdTime();
    }

    static void exit( int code ){
        version(Tango) tango.stdc.stdlib.exit(code);
        else           std.c.stdlib.exit(code);
    }
    public static int identityHashCode(Object x){
        if( x is null ){
            return 0;
        }
        return (*cast(Object *)&x).toHash();
    }

    public static String getProperty( String key, String defval ){
        String res = getProperty(key);
        if( res ){
            return res;
        }
        return defval;
    }
    public static String getProperty( String key ){
        /* Get values for local org.eclipse.swt specific keys */
        String* p;
        if (key[0..3] == "org.eclipse.swt") {
            return ((p = key in localProperties) != null) ? *p : null;
        /* else get values for global system keys (environment) */
        } else {
            switch( key ){
                case "os.name": return "linux";
                case "user.name": return "";
                case "user.home": return "";
                case "user.dir" : return "";
                case "file.separator" : 
                    version(Tango) return tango.io.model.IFile.FileConst.PathSeparatorString ;
                    else           return std.path.dirSeparator;
                default: return null;
            }
        }
    }

    public static void setProperty ( String key, String value ) {
        /* set property for local org.eclipse.swt keys */
        if (key[0..3] == "org.eclipse.swt") {
            if (key !is null && value !is null)
                localProperties[ key ] = value;
        /* else set properties for global system keys (environment) */
        } else {

        }

    }

    private static PrintStream err__;
    public static PrintStream err(){
        if( err__ is null ){
            err__ = new PrintStream(null);
        }
        return err__;
    }
    private static PrintStream out__;
    public static PrintStream out_(){
        if( out__ is null ){
            out__ = new PrintStream(null);
        }
        return out__;
    }

    private static String[String] localProperties;
}


module java.lang.Boolean;

import java.lang.util;
import java.lang.System;

version(Tango){
    static import tango.text.Ascii;
} else { // Phobos
    static import std.string;
}
class Boolean : ValueWrapperT!(bool) {
    public static Boolean TRUE;
    public static Boolean FALSE;

    static this(){
        TRUE  = new Boolean(true);
        FALSE = new Boolean(false);
    }
    public this( bool v ){
        super(v);
    }

    alias ValueWrapperT!(bool).opEquals opEquals;
    public equals_t opEquals( int other ){
        return value == ( other !is 0 );
    }
    public equals_t opEquals( Object other ){
        if( auto o = cast(Boolean)other ){
            return value == o.value;
        }
        return false;
    }
    public bool booleanValue(){
        return value;
    }
    public static Boolean valueOf( String s ){
        if( s == "yes" || s == "true" ){
            return TRUE;
        }
        return FALSE;
    }
    public static Boolean valueOf( bool b ){
        return b ? TRUE : FALSE;
    }
    public static bool getBoolean(String name){
        version(Tango){
            return tango.text.Ascii.icompare(System.getProperty(name, "false"), "true" ) is 0;
        } else { // Phobos
            return std.string.icmp(System.getProperty(name, "false"), "true" ) is 0;
        }
    }

    private static TypeInfo TYPE_;
    public static TypeInfo TYPE(){
        if( TYPE_ is null ){
            TYPE_ = typeid(bool);
        }
        return TYPE_;
    }

}

alias Boolean    ValueWrapperBool;

module java.lang.Integer;

import java.lang.util;
import java.lang.exceptions;
import java.lang.Number;

version(Tango){
} else { // Phobos
}

version(Tango){
} else { // Phobos
}


class Integer : Number {

    public static const int MIN_VALUE = 0x80000000;
    public static const int MAX_VALUE = 0x7fffffff;
    public static const int SIZE = 32;
    private int value;

    public this ( void* value ){
        super();
        this.value = cast(int)value;
    }
    public this ( int value ){
        super();
        this.value = value;
    }

    public this ( String s ){
        super();
        this.value = parseInt(s);
    }

    public static String toString( int i, int radix ){
        switch( radix ){
            case 2:
                return toBinaryString(i);
            case 8:
                return toOctalString(i);
            case 10:
                return toString(i);
            case 16:
                return toHexString(i);
            default:
                implMissing( __FILE__, __LINE__ );
                return null;
        }
    }

    public static String toHexString( int i ){
        version(Tango){
            return tango.text.convert.Integer.toString(i, "x" );
        } else { // Phobos
            return std.string.toString( cast(long)i, 16u );
        }
    }

    public static String toOctalString( int i ){
        version(Tango){
            return tango.text.convert.Integer.toString(i, "o" );
        } else { // Phobos
            return std.string.toString( cast(long)i, 8u );
        }
    }

    public static String toBinaryString( int i ){
        version(Tango){
            return tango.text.convert.Integer.toString(i, "b" );
        } else { // Phobos
            return std.string.toString( cast(long)i, 2u );
        }
    }

    public static String toString( int i ){
        version(Tango){
            return tango.text.convert.Integer.toString(i);
        } else { // Phobos
            return std.string.toString( i );
        }
    }

    public static int parseInt( String s, int radix ){
        version(Tango){
            try{
                return tango.text.convert.Integer.toLong( s, radix );
            }
            catch( IllegalArgumentException e ){
                throw new NumberFormatException( e );
            }
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return 0;
        }
    }

    public static int parseInt( String s ){
        return parseInt( s, 10 );
    }

    public static Integer valueOf( String s, int radix ){
        return new Integer( parseInt( s, radix ));
    }

    public static Integer valueOf( String s ){
        return valueOf( parseInt(s));
    }

    public static Integer valueOf( int i ){
        return new Integer(i);
    }

    public byte byteValue(){
        return cast(byte)value;
    }

    public short shortValue(){
        return cast(short)value;
    }

    public int intValue(){
        return value;
    }

    public long longValue(){
        return cast(long)value;
    }

    public float floatValue(){
        return cast(float)value;
    }

    public double doubleValue(){
        return cast(double)value;
    }

    public override  hash_t toHash(){
        return intValue();
    }

    public override String toString(){
        version(Tango){
            return tango.text.convert.Integer.toString( value );
        } else { // Phobos
            return std.string.toString(value);
        }
    }

    private static TypeInfo TYPE_;
    public static TypeInfo TYPE(){
        if( TYPE_ is null ){
            TYPE_ = typeid(int);
        }
        return TYPE_;
    }

}
alias Integer ValueWrapperInt;


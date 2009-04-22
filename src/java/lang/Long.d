module java.lang.Long;

import java.lang.util;
import java.lang.exceptions;
import java.lang.Number;
import java.lang.Class;

class Long : Number {
    public static const long MIN_VALUE = long.min;
    public static const long MAX_VALUE = long.max;
    private long value;
    this( long value ){
        super();
        this.value = value;
    }
    this( String str ){
        implMissing( __FILE__, __LINE__ );
        super();
    }
    public byte byteValue(){
        return cast(byte)value;
    }

    public short shortValue(){
        return cast(short)value;
    }

    public int intValue(){
        return cast(int)value;
    }

    public long longValue(){
        return value;
    }

    public float floatValue(){
        return cast(float)value;
    }

    public double doubleValue(){
        return cast(double)value;
    }
    public static long parseLong(String s){
        return parseLong( s, 10 );
    }
    public static long parseLong(String s, int radix){
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
    public static String toString( double value ){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    private static Class TYPE_;
    public static Class TYPE(){
        if( TYPE_ is null ){
            TYPE_ = Class.fromType!(long);
        }
        return TYPE_;
    }

}
alias Long ValueWrapperLong;


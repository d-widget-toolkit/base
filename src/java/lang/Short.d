module java.lang.Short;

import java.lang.util;
import java.lang.exceptions;
import java.lang.Number;

version(Tango){
    static import tango.text.convert.Integer;
} else { // Phobos
}
class Short : Number {
    public static const short MIN_VALUE = short.min;
    public static const short MAX_VALUE = short.max;
    private short value;
    public static byte parseShort( String s ){
        version(Tango){
            try{
                int res = tango.text.convert.Integer.parse( s );
                if( res < byte.min || res > byte.max ){
                    throw new NumberFormatException( "out of range" );
                }
                return res;
            }
            catch( IllegalArgumentException e ){
                throw new NumberFormatException( e );
            }
        } else { // Phobos
            implMissing( __FILE__, __LINE__);
            return 0;
        }
    }
    this( short value ){
        super();
        this.value = value;
    }

    public static String toString( short i ){
        return String_valueOf(i);
    }

    private static TypeInfo TYPE_;
    public static TypeInfo TYPE(){
        if( TYPE_ is null ){
            TYPE_ = typeid(short);
        }
        return TYPE_;
    }

    byte byteValue(){ return cast(byte)value; }
    double doubleValue(){ return value; }
    float floatValue(){ return value; }
    int intValue(){ return value; }
    long longValue(){ return value; }
    short shortValue(){ return value; }
}
alias Short ValueWrapperShort;


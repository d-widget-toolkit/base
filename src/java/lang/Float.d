module java.lang.Float;

import java.lang.util;
import java.lang.exceptions;
import java.lang.Number;

class Float : Number {

    public static float POSITIVE_INFINITY = (1.0f / 0.0f);
    public static float NEGATIVE_INFINITY = ((-1.0f) / 0.0f);
    public static float NaN = (0.0f / 0.0f);
    public static float MAX_VALUE = 3.4028235e+38f;
    public static float MIN_VALUE = 1.4e-45f;
    public static int SIZE = 32;
    private float value;

    this( float value ){
        super();
        this.value = value;
    }
    this( String str ){
        implMissing( __FILE__, __LINE__ );
        super();
    }
    public static String toString( float value ){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public static float parseFloat( String s ){
        version(Tango){
            try{
                return tango.text.convert.Float.toFloat( s );
            }
            catch( IllegalArgumentException e ){
                throw new NumberFormatException( e );
            }
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return 0.0f;
        }
    }

    private static TypeInfo TYPE_;
    public static TypeInfo TYPE(){
        if( TYPE_ is null ){
            TYPE_ = typeid(float);
        }
        return TYPE_;
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
        return cast(long)value;
    }

    public float floatValue(){
        return cast(float)value;
    }

    public double doubleValue(){
        return cast(double)value;
    }
}



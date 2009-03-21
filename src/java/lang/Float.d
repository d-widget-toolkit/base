module java.lang.Float;

import java.lang.util;
import java.lang.exceptions;

class Float : ValueWrapperT!(float) {

    public static float POSITIVE_INFINITY = (1.0f / 0.0f);
    public static float NEGATIVE_INFINITY = ((-1.0f) / 0.0f);
    public static float NaN = (0.0f / 0.0f);
    public static float MAX_VALUE = 3.4028235e+38f;
    public static float MIN_VALUE = 1.4e-45f;
    public static int SIZE = 32;

    this( float value ){
        super(value);
    }
    this( String str ){
        implMissing( __FILE__, __LINE__ );
        super(0.0);
    }
    public float floatValue(){
        return value;
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

}

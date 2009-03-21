module java.lang.Byte;

import java.lang.util;
import java.lang.exceptions;

version(Tango){
    static import tango.text.convert.Integer;
} else { // Phobos
}
class Byte : ValueWrapperT!(byte) {
    public static byte parseByte( String s ){
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
    this( byte value ){
        super( value );
    }

    public static String toString( byte i ){
        return String_valueOf(i);
    }

}
alias Byte ValueWrapperByte;


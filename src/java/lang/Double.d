module java.lang.Double;

import java.lang.util;

class Double : ValueWrapperT!(double) {
    public static double MAX_VALUE = double.max;
    public static double MIN_VALUE = double.min;
    this( double value ){
        super(value);
    }
    this( String str ){
        implMissing( __FILE__, __LINE__ );
        super(0.0);
    }
    public double doubleValue(){
        return value;
    }
    public static String toString( double value ){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public static double parseDouble(String s){
        implMissing( __FILE__, __LINE__ );
        return 0.0;
    }
}

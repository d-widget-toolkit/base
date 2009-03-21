module java.lang.Long;

import java.lang.util;

class Long : ValueWrapperT!(long) {
    public static const long MIN_VALUE = long.min;
    public static const long MAX_VALUE = long.max;
    this( long value ){
        super(value);
    }
    this( String str ){
        implMissing( __FILE__, __LINE__ );
        super(0);
    }
    public long longValue(){
        return value;
    }
    public static long parseLong(String s){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    public static String toString( double value ){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}
alias Long ValueWrapperLong;


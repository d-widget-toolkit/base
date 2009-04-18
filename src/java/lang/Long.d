module java.lang.Long;

import java.lang.util;
import java.lang.Number;

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
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    public static String toString( double value ){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    private static TypeInfo TYPE_;
    public static TypeInfo TYPE(){
        if( TYPE_ is null ){
            TYPE_ = typeid(long);
        }
        return TYPE_;
    }

}
alias Long ValueWrapperLong;


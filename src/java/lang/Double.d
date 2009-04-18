module java.lang.Double;

import java.lang.util;
import java.lang.Number;

class Double : Number {
    public static double POSITIVE_INFINITY = double.infinity;
    public static double NEGATIVE_INFINITY = -double.infinity;
    public static double MAX_VALUE = double.max;
    public static double MIN_VALUE = double.min;
    private double value;
    this( double value ){
        super();
        this.value = value;
    }
    this( String str ){
        implMissing( __FILE__, __LINE__ );
        super();
    }
    public static String toString( double value ){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public static double parseDouble(String s){
        implMissing( __FILE__, __LINE__ );
        return 0.0;
    }

    private static TypeInfo TYPE_;
    public static TypeInfo TYPE(){
        if( TYPE_ is null ){
            TYPE_ = typeid(double);
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



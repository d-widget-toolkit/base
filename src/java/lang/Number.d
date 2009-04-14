module java.lang.Number;

import java.lang.util;

class Number {
    this(){
        implMissing(__FILE__, __LINE__ );
    }
    byte byteValue(){
        implMissing(__FILE__, __LINE__ );
        return 0;
    }
    abstract  double doubleValue();
    abstract  float floatValue();
    abstract  int intValue();
    abstract  long longValue();
    short shortValue(){
        implMissing(__FILE__, __LINE__ );
        return 0;
    }
}


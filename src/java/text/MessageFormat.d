module java.text.MessageFormat;

import java.lang.all;

class MessageFormat {
    public static String format( String frmt, Object[] args... ){
        switch( args.length ){
        case 0: return Format(frmt);
        case 1: return Format(frmt, args[0]);
        case 2: return Format(frmt, args[0], args[1]);
        case 3: return Format(frmt, args[0], args[1], args[2]);
        case 4: return Format(frmt, args[0], args[1], args[2], args[3]);
        case 5: return Format(frmt, args[0], args[1], args[2], args[3], args[4]);
        default:
            implMissing(__FILE__, __LINE__ );
        }
    }
}


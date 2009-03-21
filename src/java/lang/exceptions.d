module java.lang.exceptions;

import java.lang.util;
import java.lang.String;

version(Tango){
    static import tango.core.Exception;
    public alias tango.core.Exception.IllegalArgumentException IllegalArgumentException;
    public alias tango.core.Exception.IOException IOException;
    public alias tango.core.Exception.PlatformException PlatformException;
    public alias tango.core.Exception.ArrayBoundsException ArrayIndexOutOfBoundsException;
    public alias tango.core.Exception.NoSuchElementException NoSuchElementException;
    public alias tango.core.Exception.UnicodeException UnicodeException;
    alias Exception Throwable;
} else { // Phobos

    static import core.exception;
    public alias core.exception.RangeError ArrayIndexOutOfBoundsException;

    class PlatformException : Exception {
        this( String e = null ){
            super(e);
        }
    }

    class IllegalArgumentException : Exception {
        this( String e = null ){
            super(e);
        }
    }

    class IOException : Exception {
        this( String e = null ){
            super(e);
        }
    }

    class NoSuchElementException : Exception {
        this( String e = null ){
            super(e);
        }
    }

    class UnicodeException : Exception {
        this( String msg, int idx){
            super( "" );
        }
    }

}

class InternalError : Exception {
    this( String file, long line, String e = null ){
        super(e);
    }
}

class ClassCastException : Exception {
    this( String e = null ){
        super(e);
    }
}

class IllegalStateException : Exception {
    this( String e = null ){
        super(e);
    }
    this( Exception e ){
        super(e.toString);
    }
}

class IndexOutOfBoundsException : Exception {
    this( String e = null){
        super(e);
    }
}

class InterruptedException : Exception {
    this( String e = null ){
        super(e);
    }
    this( Exception e ){
        super(e.toString);
    }
}

class NullPointerException : Exception {
    this( String e = null ){
        super(e);
    }
    this( Exception e ){
        super(e.toString);
    }
}

class NumberFormatException : IllegalArgumentException {
    this( String e ){
        super(e);
    }
    this( Exception e ){
        super(e.toString);
    }
}

class RuntimeException : Exception {
    this( String file, long line, String msg = null){
        super( msg, file, line );
    }
    this( String e = null){
        super(e);
    }
    this( Exception e ){
        super(e.toString);
        next = e;
    }
    public Throwable getCause() {
        return next; // D2 has next of type Throwable
    }
}

class UnsupportedOperationException : RuntimeException {
    this( String e = null){
        super(e);
    }
    this( Exception e ){
        super(e.toString);
    }
}

/// Extension to the D Exception
String ExceptionGetLocalizedMessage( Exception e ){
    return e.msg;
}

/// Extension to the D Exception
void ExceptionPrintStackTrace( Exception e ){
    ExceptionPrintStackTrace( e, & getDwtLogger().error );
}

/// Extension to the D Exception
void ExceptionPrintStackTrace( Throwable e, void delegate ( String file, ulong line, String fmt, ... ) dg ){
    Throwable exception = e;
    while( exception !is null ){
        dg( exception.file, exception.line, "Exception in {}({}): {}", exception.file, exception.line, exception.msg );
        if( exception.info !is null ){
            foreach( msg; exception.info ){
                dg( exception.file, exception.line, "trc {}", msg );
            }
        }
        exception = exception.next;
    }
}

void PrintStackTrace( int deepth = 100, String prefix = "trc" ){
    auto e = new Exception( null );
    int idx = 0;
    const start = 3;
    foreach( msg; e.info ){
        if( idx >= start && idx < start+deepth ) {
            getDwtLogger().trace( __FILE__, __LINE__, "{}: {}", prefix, msg );
        }
        idx++;
    }
}

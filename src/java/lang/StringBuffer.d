module java.lang.StringBuffer;

import java.lang.util;

version(Tango){
    static import tango.text.Text;
    static import tango.text.convert.Utf;
} else { // Phobos
    static import std.uni;
    static import std.utf;
}

class StringBuffer : CharSequence {
    version(Tango){
        alias tango.text.Text.Text!(char) TBuf;
        TBuf buf;
    } else { // Phobos
        const int STDINCR = 128;
        char[] buf;
        int used;
    }

    public this(){
        version(Tango){
            buf = new TBuf();
        } else { // Phobos
        }
    }

    public this( int cap ){
        version(Tango){
            buf = new TBuf(cap);
        } else { // Phobos
            buf.length = cap;
        }
    }

    public this( CString content ){
        version(Tango){
            buf = new TBuf( content );
        } else { // Phobos
            buf.length = content.length + STDINCR;
            buf[ 0 .. content.length ] = content;
            used = content.length;
        }
    }

    char charAt(int index){
        version(Tango){
            return buf.slice()[ index ];
        } else { // Phobos
            return buf[ index ];
        }
    }

    int length(){
        version(Tango){
            return buf.length();
        } else { // Phobos
            return used;
        }
    }

    CharSequence subSequence(int start, int end){
        version(Tango){
            return new StringBuffer( buf.slice()[ start .. end ] );
        } else { // Phobos
            return new StringBuffer( cast(String)buf[ start .. end ] );
        }
    }

    String toString(){
        version(Tango){
            return buf.slice();
        } else { // Phobos
            return cast(String)buf[ 0 .. used ];
        }
    }

    StringBuffer append( CString s ){
        version(Tango){
            buf.append( s );
        } else { // Phobos
            if( buf.length < used + s.length ){
                buf.length = used + s.length + STDINCR;
            }
            buf[ used .. used + s.length ] = s;
            used += s.length;
        }
        return this;
    }

    StringBuffer append( CString s, int offset, int len ){
        return append( s[ offset .. offset+len ] );
    }

    StringBuffer append( StringBuffer other ){
        return append( other.slice() );
    }

    StringBuffer append( Object obj ){
        return append( obj.toString() );
    }

    StringBuffer append( char c ){
        char[1] src;
        src[0] = c;
        return append( cast(String)src );
    }

    StringBuffer append( wchar c ){
        wchar[1] src;
        src[0] = c;
        version(Tango){
            char[2] trg;
            auto arr = tango.text.convert.Utf.toString( src, trg );
        } else { // Phobos
            auto arr = std.utf.toUTF8( src );
        }
        return append( arr );
    }

    StringBuffer append( bool i ){
        return append( String_valueOf(i) );
    }

    StringBuffer append( int i ){
        return append( String_valueOf(i) );
    }

    StringBuffer append( long i ){
        return append( String_valueOf(i) );
    }

    StringBuffer append( dchar c ){
        dchar[1] src;
        src[0] = c;
        version(Tango){
            char[4] trg;
            auto arr = tango.text.convert.Utf.toString( src, trg );
        } else { // Phobos
            auto arr = std.utf.toUTF8( src );
        }
        return append( arr );
    }


    StringBuffer insert(int offset, int i){
        return insert( offset, String_valueOf(i) );
    }
    StringBuffer insert(int offset, CString str){
        return replace( offset, offset, str );
    }

    StringBuffer insert(int offset, StringBuffer other){
        return insert( offset, other.slice());
    }

    StringBuffer replace(int start, int end, CString str) {
        version(Tango){
            buf.select(start, end-start);
            buf.replace(str);
            buf.select();
        } else { // Phobos
            int incr = end - start - str.length;
            if( incr > 0 ){
                if( buf.length < used + incr ){
                    char[] newbuf = new char[ 2*(used + incr) + STDINCR ];
                    newbuf[ 0 .. start ] = buf[ 0 .. start ];
                    newbuf[ start .. start + str.length ] = str;
                    newbuf[ start + str.length .. used + str.length ] = buf[ end .. used ];
                    buf = newbuf;
                }
                else{
                    char* s = buf.ptr + start;
                    char* t = buf.ptr + start + str.length;
                    char* e = buf.ptr + start + str.length;
                    while( s !is e ){
                        *t = *s;
                        s++; t++;
                    }
                    buf[ start .. start + str.length ] = str;
                }
            }
            else if( incr == 0 ){
                buf[ start .. end ] = str;
            }
            else{
                buf[ start .. end ] = str;
                char* s = buf.ptr + end;
                char* t = buf.ptr + start + str.length;
                char* e = buf.ptr + start + str.length;
                while( s !is e ){
                    *t = *s;
                    s--; t--;
                }
            }
            used += incr;
        }
        return this;
    }

    void setLength( int newLength ){
        version(Tango){
            buf.truncate( newLength );
        } else { // Phobos
            if( buf.length < newLength ){
                buf.length = 2*newLength + STDINCR;
            }
            used = newLength;
        }
    }

    String substring( int start, int end ){
        version(Tango){
            return buf.slice()[ start .. end ].dup;
        } else { // Phobos
            return buf[ start .. end ].idup;
        }
    }

    void delete_( int start, int end ){
        replace( start, end, "" );
    }
    String slice(){
        version(Tango){
            return buf.slice();
        } else { // Phobos
            return cast(String)buf[ 0 .. used ];
        }
    }
    void truncate( int start ){
        setLength( start );
    }
}



module java.lang.String;

import java.lang.util;
import java.lang.interfaces;
import java.lang.exceptions;

version(Tango){
    static import tango.stdc.stringz;
    static import tango.text.Util;
    static import tango.text.Unicode;
    static import tango.text.convert.Utf;
} else { // Phobos
    static import core.exception;
    static import std.uni;
    static import std.utf;
    static import std.string;
}

version(Tango){
    public alias char[] String;
    public alias char[] CString;
    public alias wchar[] String16;
    public alias wchar[] CString16;
    public alias char*   ICharPtr;
    public alias char*   CCharPtr;
    public alias wchar*  CWCharPtr;
    public alias wchar*  IWCharPtr;
} else { // Phobos
    public alias string String;
    public alias wstring String16;
    mixin("public alias const(char)[]     CString;");
    mixin("public alias const(wchar)[]    CString16;");
    mixin("public alias invariant(char)*  ICharPtr;");
    mixin("public alias const(char)*      CCharPtr;");
    mixin("public alias const(wchar)*     CWCharPtr;");
    mixin("public alias invariant(wchar)* IWCharPtr;");
}

int codepointIndexToIndex( CString str, int cpIndex ){
    int cps = cpIndex;
    int res = 0;
    while( cps > 0 ){
        cps--;
        if( str[res] < 0x80 ){
            res+=1;
        }
        else if( str[res] < 0xE0 ){
            res+=2;
        }
        else if( str[res] & 0xF0 ){
            res+=3;
        }
        else{
            res+=4;
        }
    }
    return res;
}

/++
+
+/
int indexToCodepointIndex( CString str, int index ){
    if( index < 0 ) return index;
    int i = 0;
    int res = 0;
    while( i < index ){
        if( i >= str.length ){
            break;
        }
        if( str[i] < 0x80 ){
            i+=1;
        }
        else if( str[i] < 0xE0 ){
            i+=2;
        }
        else if( str[i] & 0xF0 ){
            i+=3;
        }
        else{
            i+=4;
        }
        res++;
    }
    return res;
}

/++
+ Get that String, that contains the next codepoint of a String.
+/
String firstCodePointStr( CString str, out int consumed ){
    version(Tango){
        dchar[1] buf;
        uint ate;
        dchar[] res = tango.text.convert.Utf.toString32( str, buf, &ate );
        consumed = ate;
        return str[ 0 .. ate ];
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

/++
+ Get first codepoint of a String. If an offset is needed, simply use a slice:
+ ---
+ dchar res = str[ offset .. $ ].firstCodePoint();
+ ---
+/
dchar firstCodePoint( CString str ){
    int dummy;
    return firstCodePoint( str, dummy );
}
dchar firstCodePoint( CString str, out int consumed ){
    version(Tango){
        dchar[1] buf;
        uint ate;
        dchar[] res = tango.text.convert.Utf.toString32( str, buf, &ate );
        consumed = ate;
        if( ate is 0 || res.length is 0 ){
            getDwtLogger().trace( __FILE__, __LINE__, "str.length={} str={:X2}", str.length, cast(ubyte[])str );
        }
        assert( ate > 0 );
        assert( res.length is 1 );
        return res[0];
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return '\0';
    }
}
dchar firstCodePoint( CString16 str, out int consumed ){
    version(Tango){
        dchar[1] buf;
        uint ate;
        dchar[] res = tango.text.convert.Utf.toString32( str, buf, &ate );
        consumed = ate;
        if( ate is 0 || res.length is 0 ){
            getDwtLogger().trace( __FILE__, __LINE__, "str.length={} str={:X2}", str.length, cast(ubyte[])str );
        }
        assert( ate > 0 );
        assert( res.length is 1 );
        return res[0];
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return '\0';
    }
}

String dcharToString( dchar key ){
    version(Tango){
        dchar[1] buf;
        buf[0] = key;
        return tango.text.convert.Utf.toString( buf );
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

int codepointCount( CString str ){
    version(Tango){
        scope dchar[] buf = new dchar[]( str.length );
        uint ate;
        dchar[] res = tango.text.convert.Utf.toString32( str, buf, &ate );
        assert( ate is str.length );
        return res.length;
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
}

//alias tango.text.convert.Utf.toString16 toString16;
//alias tango.text.convert.Utf.toString toString;

int toAbsoluteCodePointStartOffset( CString str, int index ){
    //getDwtLogger().trace( __FILE__, __LINE__, "str={}, str.length={}, index={}", str, str.length, index );
    //getDwtLogger().trace( __FILE__, __LINE__, Trace.memory( str );
    if( str.length is index ){
        return index;
    }
    if( ( str[index] & 0x80 ) is 0x00 ) {
        return index;
    }
    else{
        int steps = 0;
        while(( str[index] & 0xC0 ) is 0x80 ){
            index--;
            steps++;
            if( steps > 3 || index < 0 ){
                break;
            }
        }
        if((( str[index] & 0xE0 ) is 0xC0) && ( steps <= 1 )){
            // ok
        }
        else if((( str[index] & 0xF0 ) is 0xE0) && ( steps <= 2 )){
            // ok
        }
        else if((( str[index] & 0xF8 ) is 0xF0) && ( steps <= 3 )){
            // ok
        }
        else{
            throw new UnicodeException( "invalid utf8 input to toAbsoluteCodePointStartOffset", index );
        }
        return index;
    }
}
int getRelativeCodePointOffset( CString str, int startIndex, int searchRelCp ){
    return getAbsoluteCodePointOffset( str, startIndex, searchRelCp ) - startIndex;
}
int getAbsoluteCodePointOffset( CString str, int startIndex, int searchRelCp ){

    //getDwtLogger().trace( __FILE__, __LINE__, "str={}, str.length={}, startIndex={}, searchRelCp={}", str, str.length, startIndex, searchRelCp );
    //getDwtLogger().trace( __FILE__, __LINE__, Trace.memory( str );

    int ignore;
    int i = startIndex;
    if( searchRelCp > 0 ){
        while( searchRelCp !is 0 ){

            if( ( i < str.length )
                    && (( str[i] & 0x80 ) is 0x00 ))
            {
                i+=1;
            }
            else if( ( i+1 < str.length )
                    && (( str[i+1] & 0xC0 ) is 0x80 )
                    && (( str[i  ] & 0xE0 ) is 0xC0 ))
            {
                i+=2;
            }
            else if( ( i+2 < str.length )
                    && (( str[i+2] & 0xC0 ) is 0x80 )
                    && (( str[i+1] & 0xC0 ) is 0x80 )
                    && (( str[i  ] & 0xF0 ) is 0xE0 ))
            {
                i+=3;
            }
            else if(( i+3 < str.length )
                    && (( str[i+3] & 0xC0 ) is 0x80 )
                    && (( str[i+2] & 0xC0 ) is 0x80 )
                    && (( str[i+1] & 0xC0 ) is 0x80 )
                    && (( str[i  ] & 0xF8 ) is 0xF0 ))
            {
                i+=4;
            }
            else{
                getDwtLogger().trace( __FILE__, __LINE__, "getAbsoluteCodePointOffset invalid utf8 characters:  {:X2}", cast(ubyte[]) str );
                throw new UnicodeException( "invalid utf8 input", i );
            }
            searchRelCp--;
        }
    }
    else if( searchRelCp < 0 ){
        while( searchRelCp !is 0 ){
            do{
                i--;
                if( i < 0 ){
                    return startIndex-1;
                }
            } while(( str[i] & 0xC0 ) is 0x80 );
            searchRelCp++;
        }
    }
    return i;
}
int getAbsoluteCodePointOffset( CString16 str, int startIndex, int searchRelCp ){
    int ignore;
    int i = startIndex;
    if( searchRelCp > 0 ){
        while( searchRelCp !is 0 ){

            if( ( i < str.length )
                    && ( str[i] & 0xD800 ) !is 0xD800 )
            {
                i+=1;
            }
            else if( ( i+1 < str.length )
                    && (( str[i+1] & 0xDC00 ) is 0xDC00 )
                    && (( str[i  ] & 0xDC00 ) is 0xD800 ))
            {
                i+=2;
            }
            else{
                getDwtLogger().trace( __FILE__, __LINE__, "invalid utf16 characters:  {:X2}", cast(ubyte[]) str );
                throw new UnicodeException( "invalid utf16 input", i );
            }
            searchRelCp--;
        }
    }
    else if( searchRelCp < 0 ){
        while( searchRelCp !is 0 ){
            do{
                i--;
                if( i < 0 ){
                    return startIndex-1;
                    //getDwtLogger().trace( __FILE__, __LINE__, "dwthelper.utils getRelativeCodePointOffset {}: str={}, startIndex={}, searchRelCp={}", __LINE__, str, startIndex, searchRelCp );
                    //tango.text.convert.Utf.onUnicodeError( "invalid utf16 input", i );
                }
            } while(( str[i] & 0xDC00 ) is 0xDC00 );
            searchRelCp++;
        }
    }
    return i;
}
dchar getRelativeCodePoint( CString str, int startIndex, int searchRelCp ){
    int dummy;
    return getRelativeCodePoint( str, startIndex, dummy );
}
dchar getRelativeCodePoint( CString str, int startIndex, int searchRelCp, out int relIndex ){
    relIndex = getRelativeCodePointOffset( str, startIndex, searchRelCp );
    int ignore;
    return firstCodePoint( str[ startIndex+relIndex .. $ ], ignore );
}

int utf8AdjustOffset( CString str, int offset ){
    if( str.length <= offset || offset <= 0 ){
        return offset;
    }
    while(( str[offset] & 0xC0 ) is 0x80 ){
        offset--;
    }
    return offset;
}
int utf8OffsetIncr( CString str, int offset ){
    int res = offset +1;
    if( str.length <= res || res <= 0 ){
        return res;
    }
    int tries = 4;
    while(( str[res] & 0xC0 ) is 0x80 ){
        res++;
        assert( tries-- > 0 );
    }
    return res;
}
int utf8OffsetDecr( CString str, int offset ){
    int res = offset-1;
    if( str.length <= res || res <= 0 ){
        return res;
    }
    int tries = 4;
    while(( str[res] & 0xC0 ) is 0x80 ){
        res--;
        assert( tries-- > 0 );
    }
    getDwtLogger().trace( __FILE__, __LINE__, "utf8OffsetDecr {}->{}", offset, res );
    getDwtLogger().trace( __FILE__, __LINE__, "{}", str );
    return res;
}

String new_String( CString cont, int offset, int len ){
    version(D_Version2){
        return cont[ offset .. offset+len ].idup;
    } else {
        return cont[ offset .. offset+len ].dup;
    }
}

String new_String( CString cont ){
    version(D_Version2){
        return cont.idup;
    } else {
        return cont.dup;
    }
}

String String_valueOf( bool v ){
    return v ? "true" : "false";
}

String String_valueOf( byte v ){
    version(Tango){
        return tango.text.convert.Integer.toString(v);
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

String String_valueOf( ubyte v ){
    version(Tango){
        return tango.text.convert.Integer.toString(v);
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

String String_valueOf( short v ){
    version(Tango){
        return tango.text.convert.Integer.toString(v);
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

String String_valueOf( int v ){
    version(Tango){
        return tango.text.convert.Integer.toString(v);
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

String String_valueOf( uint v ){
    version(Tango){
        return tango.text.convert.Integer.toString(v);
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

String String_valueOf( long v ){
    version(Tango){
        return tango.text.convert.Integer.toString(v);
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

String String_valueOf( float v ){
    version(Tango){
        return tango.text.convert.Float.toString(v);
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

String String_valueOf( double v ){
    version(Tango){
        return tango.text.convert.Float.toString(v);
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

String String_valueOf( dchar v ){
    return dcharToString(v);
}

String String_valueOf( char[] v ){
    version(D_Version2){
        return v.idup;
    } else {
        return v.dup;
    }
}

String String_valueOf( char[] v, int offset, int len ){
    version(D_Version2){
        return v[ offset .. offset+len ].idup;
    } else {
        return v[ offset .. offset+len ].dup;
    }
}

String String_valueOf( Object v ){
    return v is null ? "null" : v.toString();
}

String String_valueOf( CString16 wstr ){
    version(Tango){
        return tango.text.convert.Utf.toString(wstr);
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

int length( CString str ){
    return str.length;
}

/// Extension to String
public String toUpperCase( CString str ){
    version(Tango){
        return tango.text.Unicode.toUpper( str );
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

/// Extension to String
public String replaceFirst( CString str, CString regex, CString replacement ){
    implMissing(__FILE__,__LINE__);
    return null;
}

/// Extension to String
public int indexOf( CString str, char searched ){
    version(Tango){
        int res = tango.text.Util.locate( str, searched );
        if( res is str.length ) res = -1;
        return res;
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
}

/// Extension to String
public int indexOf( CString str, char searched, int startpos ){
    version(Tango){
        int res = tango.text.Util.locate( str, searched, startpos );
        if( res is str.length ) res = -1;
        return res;
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
}

/// Extension to String
public int indexOf(CString str, String ch){
    return indexOf( str, ch, 0 );
}

/// Extension to String
public int indexOf(CString str, String ch, int start){
    version(Tango){
        int res = tango.text.Util.locatePattern( str, ch, start );
        if( res is str.length ) res = -1;
        return res;
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
}

/// Extension to String
public int lastIndexOf(CString str, char ch){
    return lastIndexOf( str, ch, str.length );
}

/// Extension to String
public int lastIndexOf(CString str, char ch, int formIndex){
    version(Tango){
        int res = tango.text.Util.locatePrior( str, ch, formIndex );
        if( res is str.length ) res = -1;
        return res;
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
}

/// Extension to String
public int lastIndexOf(CString str, String ch ){
    return lastIndexOf( str, ch, str.length );
}

/// Extension to String
public int lastIndexOf(CString str, String ch, int start ){
    version(Tango){
        int res = tango.text.Util.locatePatternPrior( str, ch, start );
        if( res is str.length ) res = -1;
        return res;
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
}

/// Extension to String
public String replaceAll( CString str, String regex, String replacement ){
    implMissing(__FILE__,__LINE__);
    return null;
}

/// Extension to String
public String replace( CString str, char from, char to ){
    version(Tango){
        return tango.text.Util.replace( str.dup, from, to );
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

/// Extension to String
public String substring( CString str, int start ){
    return cast(String)str[ start .. $ ].dup;
}

/// Extension to String
public String substring( CString str, int start, int end ){
    return cast(String)str[ start .. end ].dup;
}

/// Extension to String
public wchar[] substring( CString16 str, int start ){
    return cast(wchar[])(str[ start .. $ ].dup);
}

/// Extension to String
public wchar[] substring( CString16 str, int start, int end ){
    return str[ start .. end ].dup;
}

/// Extension to String
public char charAt( CString str, int pos ){
    return str[ pos ];
}

/// Extension to String
public dchar dcharAt( CString str, int pos ){
    return str[ pos .. $ ].firstCodePoint();
}

/// Extension to String
public void getChars( String src, int srcBegin, int srcEnd, char[] dst, int dstBegin){
    dst[ dstBegin .. dstBegin + srcEnd - srcBegin ] = src[ srcBegin .. srcEnd ];
}

/// Extension to String
public String16 toWCharArray( CString str ){
    version(Tango){
        return tango.text.convert.Utf.toString16(str);
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

/// Extension to String
public char[] toCharArray( CString str ){
    return cast(char[])str;
}

/// Extension to String
public bool endsWith( CString src, CString pattern ){
    if( src.length < pattern.length ){
        return false;
    }
    return src[ $-pattern.length .. $ ] == pattern;
}

/// Extension to String
public bool equals( CString src, CString other ){
    return src == other;
}

/// Extension to String
public bool equalsIgnoreCase( CString src, CString other ){
    version(Tango){
        return tango.text.Unicode.toFold(src) == tango.text.Unicode.toFold(other);
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return false;
    }
}

/// Extension to String
public int compareToIgnoreCase( CString src, CString other ){
    version(Tango){
        return compareTo( tango.text.Unicode.toFold(src), tango.text.Unicode.toFold(other));
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
}

/// Extension to String
public int compareTo( CString src, CString other ){
    return typeid(String).compare( cast(void*)&src, cast(void*)&other );
}

/// Extension to String
public bool startsWith( CString src, CString pattern ){
    if( src.length < pattern.length ){
        return false;
    }
    return src[ 0 .. pattern.length ] == pattern;
}

/// Extension to String
public String toLowerCase( CString src ){
    version(Tango){
        return tango.text.Unicode.toLower( src );
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

/// Extension to String
public hash_t toHash( CString src ){
    return typeid(String).getHash(&src);
}
public alias toHash String_toHash;

/// Extension to String
public String trim( CString str ){
    version(Tango){
        return tango.text.Util.trim( str ).dup;
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

/// Extension to String
public String intern( CString str ){
    return str._idup();
}

/++
 + This is like tango.stdc.stringz.toStringz, but in case of an empty input string,
 + this function returns a pointer to a null value instead of a null ptr.
 +/
public char* toStringzValidPtr( CString src ){
    if( src ){
        return src.toStringz();
    }
    else{
        static const char[] nullPtr = "\0";
        return cast(char*)nullPtr.ptr;
    }
}

version(Tango){
    public alias tango.stdc.stringz.toStringz toStringz;
    public alias tango.stdc.stringz.toString16z toString16z;
    public alias tango.stdc.stringz.fromStringz fromStringz;
    public alias tango.stdc.stringz.fromString16z fromString16z;
} else { // Phobos
    public char* toStringz( CString s ){
        implMissing(__FILE__,__LINE__);
        return null;
    }
    public wchar* toString16z( CString16 s ){
        implMissing(__FILE__,__LINE__);
        return null;
    }
    public char[] fromStringz( CCharPtr s ){
        implMissing(__FILE__,__LINE__);
        return null;
    }
    public char[] fromString16z( CWCharPtr s ){
        implMissing(__FILE__,__LINE__);
        return null;
    }
}

static String toHex(uint value, bool prefix = true, int radix = 8){
    version(Tango){
        return tango.text.convert.Integer.toString(
                value,
                radix is 10 ? "d" :
                radix is  8 ? "o" :
                radix is 16 ? "x" :
                "d" );
    } else { // Phobos
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}

/++
+ String in java is implementing the interface CharSequence
+/
class StringCharSequence : CharSequence {
    private String str;
    this( String str ){
        this.str = str;
    }
    char           charAt(int index){
        return str[index];
    }
    int             length(){
        return str.length;
    }
    CharSequence    subSequence(int start, int end){
        return new StringCharSequence( str[ start .. end ]);
    }
    String          toString(){
        return str;
    }
}

class StringCls {
    private static TypeInfo TYPE_;
    public static TypeInfo TYPE(){
        if( TYPE_ is null ){
            TYPE_ = typeid(char[]);
        }
        return TYPE_;
    }

}



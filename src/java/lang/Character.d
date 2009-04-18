module java.lang.Character;

import java.lang.exceptions;
import java.lang.util;

version(Tango){
    static import tango.text.Unicode;
} else { // Phobos
    static import std.utf;
    static import std.uni;
    static import std.ctype;
    static import std.string;
}

class Character {
    public static bool isUpperCase( dchar c ){
        implMissing( __FILE__, __LINE__);
        return false;
    }
    public static dchar toUpperCase( wchar c ){
        version(Tango){
            wchar[1] src;
            src[0] = c;
            dchar[1] buf;
            uint ate;
            dchar[] darr = tango.text.convert.Utf.toString32( src, buf, &ate );
        } else { // Phobos
            wchar[1] src;
            src[0] = c;
            auto darr = std.utf.toUTF32(src);
        }
        return toUpperCase( darr[0] );
    }
    public static dchar toUpperCase( dchar c ){
        version(Tango){
            dchar[1] src;
            src[0] = c;
            dchar[] r = tango.text.Unicode.toUpper( src );
            return r[0];
        } else { // Phobos
            return std.uni.toUniUpper( c );
        }
    }
    public static dchar toLowerCase( wchar c ){
        version(Tango){
            wchar[1] src;
            src[0] = c;
            dchar[1] buf;
            uint ate;
            dchar[] darr = tango.text.convert.Utf.toString32( src, buf, &ate );
        } else { // Phobos
            wchar[1] src;
            src[0] = c;
            auto darr = std.utf.toUTF32(src);
        }
        return toLowerCase( darr[0] );
    }
    public static dchar toLowerCase( dchar c ){
        version(Tango){
            dchar[1] src;
            src[0] = c;
            dchar[] r = tango.text.Unicode.toLower( src );
            return r[0];
        } else { // Phobos
            return std.uni.toUniLower( c );
        }
    }
    public static bool isWhitespace( dchar c ){
        version(Tango){
            return tango.text.Unicode.isWhitespace( c );
        } else { // Phobos
            return std.string.iswhite(c);
        }
    }
    public static bool isDigit( dchar c ){
        version(Tango){
            return tango.text.Unicode.isDigit( c );
        } else { // Phobos
            return cast(bool)std.ctype.isdigit(c);
        }
    }
    public static bool isLetter( dchar c ){
        version(Tango){
            return tango.text.Unicode.isLetter(c);
        } else { // Phobos
            return cast(bool)std.ctype.isalpha(c);
        }
    }
    public static bool isSpace( dchar c ){
        version(Tango){
            return tango.text.Unicode.isSpace(c);
        } else { // Phobos
            return cast(bool)std.ctype.isspace(c);
        }
    }
    public static bool isWhiteSpace( dchar c ){
        version(Tango){
            return tango.text.Unicode.isWhitespace(c);
        } else { // Phobos
            return std.string.iswhite(c);
        }
    }
    public static bool isLetterOrDigit( dchar c ){
        return isDigit(c) || isLetter(c);
    }
    public static bool isUnicodeIdentifierPart(char ch){
        implMissing( __FILE__, __LINE__);
        return false;
    }
    public static bool isUnicodeIdentifierStart(char ch){
        implMissing( __FILE__, __LINE__);
        return false;
    }
    public static bool isIdentifierIgnorable(char ch){
        implMissing( __FILE__, __LINE__);
        return false;
    }
    public static bool isJavaIdentifierPart(char ch){
        implMissing( __FILE__, __LINE__);
        return false;
    }

    this( char c ){
        // must be correct for container storage
        implMissing( __FILE__, __LINE__);
    }

    private static TypeInfo TYPE_;
    public static TypeInfo TYPE(){
        if( TYPE_ is null ){
            TYPE_ = typeid(char);
        }
        return TYPE_;
    }

    public dchar charValue(){
        implMissing( __FILE__, __LINE__);
        return ' ';
    }
}

bool CharacterIsDefined( dchar ch ){
    version(Tango){
        return (ch in tango.text.UnicodeData.unicodeData) !is null;
    } else { // Phobos
        implMissing( __FILE__, __LINE__);
        return false;
    }
}

dchar CharacterFirstToLower( CString str ){
    int consumed;
    return CharacterFirstToLower( str, consumed );
}

dchar CharacterFirstToLower( CString str, out int consumed ){
    version(Tango){
        dchar[1] buf;
        buf[0] = firstCodePoint( str, consumed );
        dchar[] r = tango.text.Unicode.toLower( buf );
        return r[0];
    } else { // Phobos
        implMissing( __FILE__, __LINE__);
        return 0;
    }
}

dchar CharacterToLower( dchar c ){
    version(Tango){
        dchar[] r = tango.text.Unicode.toLower( [c] );
        return r[0];
    } else { // Phobos
        implMissing( __FILE__, __LINE__);
        return 0;
    }
}
dchar CharacterToUpper( dchar c ){
    version(Tango){
        dchar[] r = tango.text.Unicode.toUpper( [c] );
        return r[0];
    } else { // Phobos
        implMissing( __FILE__, __LINE__);
        return 0;
    }
}
bool CharacterIsWhitespace( dchar c ){
    version(Tango){
        return tango.text.Unicode.isWhitespace( c );
    } else { // Phobos
        implMissing( __FILE__, __LINE__);
        return false;
    }
}
bool CharacterIsDigit( dchar c ){
    version(Tango){
        return tango.text.Unicode.isDigit( c );
    } else { // Phobos
        implMissing( __FILE__, __LINE__);
        return false;
    }
}
bool CharacterIsLetter( dchar c ){
    version(Tango){
        return tango.text.Unicode.isLetter( c );
    } else { // Phobos
        implMissing( __FILE__, __LINE__);
        return false;
    }
}



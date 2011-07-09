module java.lang.Character;

import java.lang.util;
import java.lang.exceptions;
import java.lang.Class;
import java.lang.String;

version(Tango){
    static import tango.text.Unicode;
    static import tango.text.UnicodeData; //for getUnicodeData
} else { // Phobos
    static import std.utf;
    static import std.conv;
    static import std.uni;
    static import std.ctype;
    static import std.string;
}

class Character {
    public static const int MIN_RADIX = 2;
    public static const int MAX_RADIX = 36;
    public static bool isUpperCase( dchar c ){
        version(Tango){
            implMissingInTango( __FILE__, __LINE__);
            return false;
        } else { // Phobos
            return !!std.uni.isUniUpper(c);
        }
    }
    public static dchar toUpperCase( dchar c ){
        version(Tango){
            dchar[1] src = c;
            dchar[] r = tango.text.Unicode.toUpper( src );
            return r[0];
        } else { // Phobos
            return std.uni.toUniUpper( c );
        }
    }
    public static String toString( char c ){
        version(Tango){
            implMissingInTango(__FILE__, __LINE__ );
            return null;
        } else { // Phobos
            return std.conv.to!(String)( c );
        }
    }
    public static String toString( wchar c ){
        version(Tango){
            implMissingInTango(__FILE__, __LINE__ );
            return null;
        } else { // Phobos
            return std.conv.to!(String)( c );
        }
    }
    public static String toString( dchar c ){
        version(Tango){
            implMissingInTango(__FILE__, __LINE__ );
            return null;
        } else { // Phobos
            return std.conv.to!(String)( c );
        }
    }
    public static dchar toLowerCase( dchar c ){
        version(Tango){
            dchar[1] src = c;
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
    alias isWhitespace isWhiteSpace;
    public static bool isSpace( dchar c ){
        version(Tango){
            return tango.text.Unicode.isSpace(c);
        } else { // Phobos
            return !!std.ctype.isspace(c);
        }
    }
    public static bool isDigit( dchar c ){
        version(Tango){
            return tango.text.Unicode.isDigit( c );
        } else { // Phobos
            return !!std.ctype.isdigit(c);
        }
    }
    public static bool isLetter( dchar c ){
        version(Tango){
            return tango.text.Unicode.isLetter(c);
        } else { // Phobos
            return !!std.uni.isUniAlpha(c);
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

    private static Class TYPE_;
    public static Class TYPE(){
        if( TYPE_ is null ){
            TYPE_ = Class.fromType!(char);
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
    	return tango.text.UnicodeData.getUnicodeData(ch) !is null;
    } else { // Phobos
        return std.utf.isValidDchar(ch);
    }
}

dchar CharacterToLower( dchar c ){
    return Character.toLowerCase(c);
}
dchar CharacterToUpper( dchar c ){
    return Character.toUpperCase(c);
}
bool CharacterIsWhitespace( dchar c ){
    return Character.isWhitespace(c);
}
bool CharacterIsDigit( dchar c ){
    return Character.isDigit(c);
}
bool CharacterIsLetter( dchar c ){
    return Character.isLetter(c);
}



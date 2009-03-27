/**
 * Authors: Frank Benoit <keinfarbton@googlemail.com>
 */
module java.util.ResourceBundle;

import java.lang.util;
import java.lang.Integer;
import java.lang.exceptions;
import java.util.MissingResourceException;
version(Tango){
    //import tango.text.Util;
    import tango.io.device.File;
    import tango.text.locale.Core;
} else { // Phobos
}


class ResourceBundle {

    String[ String ] map;

    /++
     + First entry is the default entry if no maching locale is found
     +/
    public this( ImportData[] data ){
        version(Tango){
            char[] name = Culture.current().name.dup;
            if( name.length is 5 && name[2] is '-' ){
                name[2] = '_';
                char[] end = "_" ~ name ~ ".properties";
                foreach( entry; data ){
                    if( entry.name.length > end.length && entry.name[ $-end.length .. $ ] == end ){
                        //Trace.formatln( "ResourceBundle {}", entry.name );
                        initialize( cast(char[])entry.data );
                        return;
                    }
                }
            }
            char[] end = "_" ~ name[0..2] ~ ".properties";
            foreach( entry; data ){
                if( entry.name.length > end.length && entry.name[ $-end.length .. $ ] == end ){
                    //Trace.formatln( "ResourceBundle {}", entry.name );
                    initialize( cast(char[])entry.data );
                    return;
                }
            }
            //Trace.formatln( "ResourceBundle default" );
            initialize( cast(char[])data[0].data );
        } else { // Phobos
            implMissing(__FILE__,__LINE__);
        }
    }
    public this( ImportData data ){
        initialize( cast(String)data.data );
    }
    public this( String data ){
        initialize( data );
    }
    private void initialize( String data ){
        String line;
        int dataIndex;

        void readLine(){
            line.length = 0;
            char i = data[ dataIndex++ ];
            while( dataIndex < data.length && i !is '\n' && i !is '\r' ){
                line ~= i;
                i = data[ dataIndex++ ];
            }
        }

        bool linecontinue = false;
        bool iskeypart = true;
        String key;
        String value;
nextline:
        while( dataIndex < data.length ){
            readLine();
            line = java.lang.util.trim(line);
            if( line.length is 0 ){
                continue;
            }
            if( line[0] == '#' ){
                continue;
            }
            int pos = 0;
            bool esc = false;
            if( !linecontinue ){
                iskeypart = true;
                key = null;
                value = null;
            }
            else{
                linecontinue = false;
            }
            while( pos < line.length ){
                dchar c = line[pos];
                if( esc ){
                    esc = false;
                    switch( c ){
                        case 't' : c = '\t'; break;
                        case 'n' : c = '\n'; break;
                        case '\\': c = '\\'; break;
                        case '\"': c = '\"'; break;
                        case 'u' :
                               dchar d = Integer.parseInt( line[ pos+1 .. pos+5 ], 16 );
                               pos += 4;
                               break;
                        default: break;
                    }
                }
                else{
                    if( c == '\\' ){
                        if( pos == line.length -1 ){
                            linecontinue = true;
                            goto nextline;
                        }
                        esc = true;
                        pos++;
                        continue;
                    }
                    else if( iskeypart && c == '=' ){
                        pos++;
                        iskeypart = false;
                        continue;
                    }
                }
                pos++;
                if( iskeypart ){
                    key ~= dcharToString(c);
                }
                else{
                    value ~= dcharToString(c);
                }
            }
            if( iskeypart ){
                throw new RuntimeException( __FILE__, __LINE__, "Cannot find = in record" );
            }
            key = java.lang.util.trim(key);
            value = java.lang.util.trim(value);

            version(D_Version2){
                map[ key.idup ] = value.idup;
            } else {
                map[ key.dup ] = value.dup;
            }
        }
    }

    public bool hasString( CString key ){
        return ( key in map ) !is null;
    }

    public String getString( CString key ){
        if( auto v = key in map ){
            version(D_Version2){
                return (*v).idup;
            } else {
                return (*v).dup;
            }
        }
        throw new MissingResourceException( "key not found", this.classinfo.name, key._idup() );
    }

    public String[] getKeys(){
        return map.keys;
    }

    public static ResourceBundle getBundle( ImportData[] data ){
        return new ResourceBundle( data );
    }
    public static ResourceBundle getBundle( ImportData data ){
        return new ResourceBundle( data );
    }
    public static ResourceBundle getBundle( CString name ){
        try{
            version(Tango){
                return new ResourceBundle( cast(String) File.get(name) );
            } else { // Phobos
                implMissing(__FILE__,__LINE__);
            }
        }
        catch( IOException e){
            e.msg ~= " file:" ~ name;
            throw e;
        }
    }
    public static ResourceBundle getBundleFromData( String data ){
        return new ResourceBundle( data );
    }
}



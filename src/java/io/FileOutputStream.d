/**
 * Authors: Frank Benoit <keinfarbton@googlemail.com>
 */
module java.io.FileOutputStream;

public import java.io.File;
public import java.io.OutputStream;

import java.lang.all;

version(Tango){
    import TangoFile = tango.io.device.File;
} else { // Phobos
    static import std.file;
    static import std.path;
}

public class FileOutputStream : java.io.OutputStream.OutputStream {

    alias java.io.OutputStream.OutputStream.write write;
    alias java.io.OutputStream.OutputStream.close close;
    version(Tango){
        TangoFile.File fc;
    } else { // Phobos
    }

    public this ( String name ){
        version(Tango){
            fc = new TangoFile.File( name, TangoFile.File.WriteCreate );
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }

    public this ( String name, bool append ){
        version(Tango){
            fc = new TangoFile.File( name, append ? TangoFile.File.WriteAppending : TangoFile.File.WriteCreate );
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }

    public this ( java.io.File.File file ){
        this( file.toString );
    }

    public this ( java.io.File.File file, bool append ){
        this( file.toString, append );
    }

    public override void write( int b ){
        ubyte[1] a;
        a[0] = b & 0xFF;
        version(Tango){
            fc.write(a);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }

    public override void close(){
        version(Tango){
            fc.close();
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }

    public void finalize(){
        implMissing( __FILE__, __LINE__ );
    }


}



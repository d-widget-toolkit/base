/**
 * Authors: Frank Benoit <keinfarbton@googlemail.com>
 */
module java.io.ByteArrayOutputStream;

public import java.io.OutputStream;
import java.lang.all;

version(Tango){
    import tango.io.device.Array;
} else { // Phobos
}

public class ByteArrayOutputStream : java.io.OutputStream.OutputStream {

    version(Tango){
        protected Array buffer;
    } else { // Phobos
    }

    public this (){
        version(Tango){
            buffer = new Array(0);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }

    public this ( int par_size ){
        version(Tango){
            buffer = new Array(par_size);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }

    public synchronized override void write( int b ){
        version(Tango){
            byte[1] a;
            a[0] = b & 0xFF;
            buffer.append(a);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }

    public synchronized override void write( byte[] b, int off, int len ){
        version(Tango){
            buffer.append( b[ off .. off + len ]);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }

    public synchronized override void write( byte[] b ){
        version(Tango){
            buffer.append( b );
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }

    public synchronized void writeTo( java.io.OutputStream.OutputStream out_KEYWORDESCAPE ){
        implMissing( __FILE__, __LINE__ );
    }

    public synchronized void reset(){
        implMissing( __FILE__, __LINE__ );
    }

    public synchronized byte[] toByteArray(){
        version(Tango){
            return cast(byte[])buffer.slice();
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return null;
        }
    }

    public int size(){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }

    public override String toString(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }

    public String toString( String enc ){
        implMissing( __FILE__, __LINE__ );
        return null;
    }

    public String toString( int hibyte ){
        implMissing( __FILE__, __LINE__ );
        return null;
    }

    public  override void close(){
        implMissing( __FILE__, __LINE__ );
    }
}



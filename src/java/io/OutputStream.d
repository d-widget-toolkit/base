/**
 * Authors: Frank Benoit <keinfarbton@googlemail.com>
 */
module java.io.OutputStream;

import java.lang.all;

public abstract class OutputStream {

    public this(){
    }

    public abstract void write( int b );

    public void write( in byte[] b ){
        foreach( bv; b ){
            write(bv);
        }
    }

    public void write( in byte[] b, int off, int len ){
        write(b[off .. off+len]);
    }

    public void flush(){
    }

    public void close(){
    }
}



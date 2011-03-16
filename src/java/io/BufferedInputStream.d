/**
 * Authors: Frank Benoit <keinfarbton@googlemail.com>
 */
module java.io.BufferedInputStream;

import java.io.InputStream;
import java.lang.all;

public class BufferedInputStream : java.io.InputStream.InputStream {

    alias java.io.InputStream.InputStream.read read;

    private const int defaultSize = 8192;
    protected byte[] buf;
    protected int count = 0; /// The index one greater than the index of the last valid byte in the buffer.
    protected int pos   = 0; /// The current position in the buffer.
    protected int markpos = (-1);
    protected int marklimit;
    java.io.InputStream.InputStream istr;

    public this ( java.io.InputStream.InputStream istr ){
        this( istr, defaultSize );
    }

    public this ( java.io.InputStream.InputStream istr, int size ){
        this.istr = istr;
        if( size <= 0 ){
            throw new IllegalArgumentException( "Buffer size <= 0" );
        }
        buf.length = size;
    }

    private InputStream getAndCheckIstr(){
        InputStream res = istr;
        if( res is null ){
            throw new IOException( "Stream closed" );
        }
        return res;
    }
    private byte[] getAndCheckBuf(){
        byte[] res = buf;
        if( res is null ){
            throw new IOException( "Stream closed" );
        }
        return res;
    }
    private void fill(){
        assert( pos == count );
        pos = 0;
        count = 0;
        count = getAndCheckIstr().read( buf );
        if( count < 0 ){
            count = 0;
            istr = null;
        }
    }
    public int read(){
        synchronized {
            if( pos >= count ){
                fill();
                if( pos >= count ){
                    return -1;
                }
            }
            return getAndCheckBuf()[pos++] & 0xFF;
        }
    }

    public int read( byte[] b, int off, int len ){
        synchronized return super.read( b, off, len );
    }

    public long skip( long n ){
        synchronized return this.istr.skip(n);
    }

    public int available(){
        synchronized {
            int istr_avail = 0;
            if( istr !is null ){
                istr_avail = istr.available();
            }
            return istr_avail + (count - pos);
        }
    }

    public synchronized void mark( int readlimit ){
        implMissing( __FILE__, __LINE__ );
        this.istr.mark( readlimit );
    }

    public synchronized void reset(){
        implMissing( __FILE__, __LINE__ );
        this.istr.reset();
    }

    public bool markSupported(){
        implMissing( __FILE__, __LINE__ );
        return false;
    }

    public void close(){
        if (this.istr !is null) {
            this.istr.close();
        }
    }


}



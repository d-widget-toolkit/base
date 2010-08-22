/**
 * Authors: Frank Benoit <keinfarbton@googlemail.com>
 */
module java.io.File;

import java.lang.all;

version(Tango){
    static import tango.io.model.IFile;
    static import tango.io.FilePath;
    static import tango.io.Path;
    static import tango.io.FileSystem;
    static import tango.sys.Environment;
} else { // Phobos
    static import std.file;
    static import std.path;
}
// Implement this more efficient by using FilePath in Tango 
public class File {

    public static char separatorChar;
    public static String separator;
    public static char pathSeparatorChar;
    public static String pathSeparator;

    private String mFilePath;

    static this(){
        version(Tango){
            separator = tango.io.model.IFile.FileConst.PathSeparatorString;
            separatorChar = tango.io.model.IFile.FileConst.PathSeparatorChar;
            pathSeparator = tango.io.model.IFile.FileConst.SystemPathString;
            pathSeparatorChar = tango.io.model.IFile.FileConst.SystemPathChar;
        } else { // Phobos
            version(Windows){
                separator = "\\";
                separatorChar = '\\';
                pathSeparator = ";";
                pathSeparatorChar = ';';
            }
            else{
                separator = "/";
                separatorChar = '/';
                pathSeparator = ":";
                pathSeparatorChar = ':';
            }
        }
    }

    private static String toStd( CString path ){
        version(Tango){
            return tango.io.Path.standard( path._idup() );
        } else { // Phobos
            return path._idup();
        }
    }
    private static String join( CString path, CString file ){
        version(Tango){
            return tango.io.Path.join( path._idup(), file._idup() );
        } else { // Phobos
            return std.path.join( path._idup(), file._idup() );
        }
    }

    public this ( CString pathname ){
        mFilePath = toStd( pathname );
    }

    public this ( CString parent, CString child ){
        mFilePath = join( toStd(parent), toStd(child) );
    }

    public this ( java.io.File.File parent, CString child ){
        mFilePath = join( parent.mFilePath, toStd(child) );
    }

    public int getPrefixLength(){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }

    public String getName(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }

    public String getParent(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }

    public java.io.File.File getParentFile(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }

    public String getPath(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }

    public bool isAbsolute(){
        implMissing( __FILE__, __LINE__ );
        return false;
    }

    public String getAbsolutePath(){
        version(Tango){
            return (new tango.io.FilePath.FilePath(mFilePath)).absolute(tango.sys.Environment.Environment.cwd).toString;
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return "";
        }
    }

    public java.io.File.File getAbsoluteFile(){
        version(Tango){
            return new File( getAbsolutePath() );
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return null;
        }
    }

    public String getCanonicalPath(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }

    public java.io.File.File getCanonicalFile(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }

    public bool canRead(){
        implMissing( __FILE__, __LINE__ );
        return false;
    }

    public bool canWrite(){
        version(Tango){
            return tango.io.Path.isWritable(mFilePath);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }

    public bool exists(){
        version(Tango){
            return tango.io.Path.exists(mFilePath);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }

    public bool isDirectory(){
        version(Tango){
            return tango.io.Path.isFolder(mFilePath);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }

    public bool isFile(){
        implMissing( __FILE__, __LINE__ );
        return false;
    }

    public bool isHidden(){
        implMissing( __FILE__, __LINE__ );
        return false;
    }

    public long lastModified(){
        implMissing( __FILE__, __LINE__ );
        return 0L;
    }

    public long length(){
        implMissing( __FILE__, __LINE__ );
        return 0L;
    }

    public bool createNewFile(){
        implMissing( __FILE__, __LINE__ );
        return false;
    }

    public bool delete_KEYWORDESCAPE(){
        implMissing( __FILE__, __LINE__ );
        return false;
    }

    public void deleteOnExit(){
        implMissing( __FILE__, __LINE__ );
    }

    public String[] list(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }

    public java.io.File.File[] listFiles(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }

    public bool mkdir(){
        implMissing( __FILE__, __LINE__ );
        return false;
    }

    public bool mkdirs(){
        implMissing( __FILE__, __LINE__ );
        return false;
    }

    public bool renameTo( java.io.File.File dest ){
        implMissing( __FILE__, __LINE__ );
        return false;
    }

    public bool setLastModified( long time ){
        implMissing( __FILE__, __LINE__ );
        return false;
    }

    public bool setReadOnly(){
        implMissing( __FILE__, __LINE__ );
        return false;
    }

    public static java.io.File.File[] listRoots(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }

    public static java.io.File.File createTempFile( CString prefix, CString suffix, java.io.File.File directory ){
        implMissing( __FILE__, __LINE__ );
        return null;
    }

    public static java.io.File.File createTempFile( CString prefix, CString suffix ){
        implMissing( __FILE__, __LINE__ );
        return null;
    }

    public int compareTo( java.io.File.File pathname ){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }

    public String toString(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }


}



module java.util.AbstractMap;

import java.lang.all;
import java.util.Map;
import java.util.Collection;
import java.util.Set;

abstract class AbstractMap : Map {
    public this(){
        implMissing( __FILE__, __LINE__ );
    }
    void   clear(){
        implMissing( __FILE__, __LINE__ );
    }
    protected  Object       clone(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    bool        containsKey(Object key){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    bool        containsValue(Object value){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    abstract  Set   entrySet();

    public override equals_t       opEquals(Object o){
        if( Map other = cast(Map)o){
            return cast(equals_t)entrySet().opEquals( cast(Object) other.entrySet() );
        }
        return false;
    }

    Object         get(Object key){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public override hash_t    toHash(){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    bool        isEmpty(){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    Set    keySet(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    Object         put(Object key, Object value){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    void   putAll(Map t){
        implMissing( __FILE__, __LINE__ );
    }
    Object         remove(Object key){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    int    size(){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    String         toString(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    Collection     values(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
}


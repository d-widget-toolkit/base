module java.util.TreeSet;

import java.lang.all;
import java.util.SortedSet;
import java.util.AbstractSet;
import java.util.Collection;
import java.util.Iterator;

version(Tango){
    static import tango.util.container.SortedMap;
} else { // Phobos
}

class TreeSet : AbstractSet, SortedSet {

    version(Tango){
        alias tango.util.container.SortedMap.SortedMap!(Object,int) SetType;
        private SetType set;
    } else { // Phobos
    }

    public this(){
        version(Tango){
            set = new SetType();
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }
    public this(Collection c){
        implMissing( __FILE__, __LINE__ );
    }
    public this(Comparator c){
        implMissing( __FILE__, __LINE__ );
    }
    public this(SortedSet){
        implMissing( __FILE__, __LINE__ );
    }

    public bool    add(Object o){
        version(Tango){
            return set.add(o, 0);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }
    public bool    add(String o){
        version(Tango){
            return add(stringcast(o));
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }
    public bool    addAll(Collection c){
        version(Tango){
            foreach( o; c ){
                add(o);
            }
            return true;
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }
    public void   clear(){
        version(Tango){
            set.clear();
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }
    public bool    contains(Object o){
        version(Tango){
            return set.containsKey(o);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }
    public bool     contains(String o){
        version(Tango){
            return contains(stringcast(o));
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }
    public bool    containsAll(Collection c){
        version(Tango){
            foreach( o; c ){
                if( !contains(o) ){
                    return false;
                }
            }
            return true;
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }
    public Comparator     comparator(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public override equals_t    opEquals(Object o){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    public Object         first(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public override hash_t    toHash(){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    public SortedSet      headSet(Object toElement){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public bool    isEmpty(){
        version(Tango){
            return set.isEmpty();
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }
    public Iterator   iterator(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public Object         last(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public bool    remove(Object o){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    public bool remove(String key){
        version(Tango){
            return remove(stringcast(key));
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }
    public bool    removeAll(Collection c){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    public bool    retainAll(Collection c){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    public int    size(){
        version(Tango){
            return set.size();
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return 0;
        }
    }
    public SortedSet      subSet(Object fromElement, Object toElement){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public SortedSet      tailSet(Object fromElement){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public Object[]   toArray(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public Object[]   toArray(Object[] a){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public override String toString(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }


    // only for D
    public int opApply (int delegate(ref Object value) dg){
        version(Tango){
            int localDg( ref Object key, ref int value ){
                return dg( key );
            }
            return set.opApply(&localDg);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return 0;
        }
    }
}


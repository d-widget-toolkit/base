module java.util.LinkedList;

import java.lang.all;
import java.util.List;
import java.util.Iterator;
import java.util.ListIterator;
import java.util.Collection;

version(Tango){
    static import tango.util.container.CircularList;
} else { // Phobos
}

class LinkedList : List {
    version(Tango){
        alias tango.util.container.CircularList.CircularList!(Object) ListType;
        private ListType list;
    } else { // Phobos
    }

    this(){
        version(Tango){
            list = new ListType();
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }
    this( Collection c ){
        this();
        addAll(c);
    }
    void   add(int index, Object element){
        version(Tango){
            list.addAt(index,element);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }
    bool    add(Object o){
        version(Tango){
            list.add(o);
            return true;
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }
    public bool    add(String o){
        return add(stringcast(o));
    }
    bool    addAll(Collection c){
        if( c is null ) throw new NullPointerException();
        bool res = false;
        foreach( o; c ){
            res |= add( o );
        }
        return res;
    }
    bool    addAll(int index, Collection c){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    void   addFirst(Object o){
        version(Tango){
            list.prepend( o );
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }
    void   addLast(Object o){
        version(Tango){
            list.append( o );
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
        }
    }
    //     void   addElement(Object obj){
    //         implMissing( __FILE__, __LINE__ );
    //     }
    int    capacity(){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    void   clear(){
        version(Tango){
            list.clear();
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }
    Object     clone(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    bool    contains(Object elem){
        version(Tango){
            return list.contains(elem);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }
    bool    contains(String elem){
        return contains(stringcast(elem));
    }
    bool    containsAll(Collection c){
        version(Tango){
            foreach(o; c){
                if( !list.contains(o)) return false;
            }
            return true;
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }
    void   copyInto(Object[] anArray){
        implMissing( __FILE__, __LINE__ );
    }
    Object     elementAt(int index){
        version(Tango){
            return list.get(index);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return null;
        }
    }
    //     Enumeration    elements(){
    //         implMissing( __FILE__, __LINE__ );
    //         return null;
    //     }
    void   ensureCapacity(int minCapacity){
        implMissing( __FILE__, __LINE__ );
    }
    equals_t opEquals(Object o){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    Object     firstElement(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    Object     get(int index){
        version(Tango){
            return list.get(index);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return null;
        }
    }
    Object     getFirst(){
        version(Tango){
            return list.get(0);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return null;
        }
    }
    Object     getLast(){
        version(Tango){
            return list.get(list.size()-1);
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return null;
        }
    }
    hash_t    toHash(){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    int    indexOf(Object elem){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    int    indexOf(Object elem, int index){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    void   insertElementAt(Object obj, int index){
        implMissing( __FILE__, __LINE__ );
    }
    bool    isEmpty(){
        version(Tango){
            return list.isEmpty();
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }
    Iterator   iterator(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    Object     lastElement(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    int    lastIndexOf(Object elem){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    int    lastIndexOf(Object elem, int index){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    ListIterator   listIterator(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    ListIterator   listIterator(int index){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    Object     remove(int index){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    bool    remove(Object o){
        version(Tango){
            return list.remove(o,false) !is 0;
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }
    public bool remove(String key){
        return remove(stringcast(key));
    }
    bool    removeAll(Collection c){
        version(Tango){
            bool res = false;
            foreach( o; c){
                res |= list.remove(o,false) !is 0;
            }
            return res;
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return false;
        }
    }
    void   removeAllElements(){
        implMissing( __FILE__, __LINE__ );
    }
    Object     removeFirst(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    Object     removeLast(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    bool    removeElement(Object obj){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    void   removeElementAt(int index){
        implMissing( __FILE__, __LINE__ );
    }
    protected  void     removeRange(int fromIndex, int toIndex){
        implMissing( __FILE__, __LINE__ );
    }
    bool    retainAll(Collection c){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    Object     set(int index, Object element){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    void   setElementAt(Object obj, int index){
        implMissing( __FILE__, __LINE__ );
    }
    void   setSize(int newSize){
        implMissing( __FILE__, __LINE__ );
    }
    int    size(){
        version(Tango){
            return list.size();
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return 0;
        }
    }
    List   subList(int fromIndex, int toIndex){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    Object[]   toArray(){
        version(Tango){
            return list.toArray();
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return null;
        }
    }
    Object[]   toArray(Object[] a){
        version(Tango){
            return list.toArray( a );
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return null;
        }
    }
    String[]   toArray(String[] a){
        version(Tango){
            auto res = a;
            if( res.length < list.size() ){
                res.length = list.size();
            }
            int idx = 0;
            foreach( o; list ){
                res[idx] = stringcast(o);
            }
            return res;
        } else { // Phobos
            implMissing( __FILE__, __LINE__ );
            return null;
        }
    }
    String     toString(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    void   trimToSize(){
        implMissing( __FILE__, __LINE__ );
    }

    // only for D
    public int opApply (int delegate(ref Object value) dg){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }

}


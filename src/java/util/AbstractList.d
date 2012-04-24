module java.util.AbstractList;

import java.lang.all;
import java.util.Collection;
import java.util.AbstractCollection;
import java.util.List;
import java.util.ListIterator;
import java.util.Iterator;

abstract class AbstractList : AbstractCollection, List {
    this(){
    }

    public void add(int index, Object element){
        throw new UnsupportedOperationException();
    }
    public bool add(String o){
        return add(stringcast(o));
    }
    public bool add(Object o){
        add(size(), o);
        return true;
    }
    public bool addAll(Collection c){
        throw new UnsupportedOperationException();
    }
    public bool addAll(int index, Collection c){
        throw new UnsupportedOperationException();
    }
    public void clear(){
        throw new UnsupportedOperationException();
    }
    public bool contains(Object o){ return super.contains(o); }
    public bool contains(String str){ return contains(stringcast(str)); }
    public bool     containsAll(Collection c){ return super.containsAll(c); }
    public abstract equals_t opEquals(Object o);

    public abstract Object get(int index);

    public abstract hash_t  toHash();

    public int    indexOf(Object o){
        auto it = listIterator();
        int idx = 0;
        while(it.hasNext()){
            auto t = it.next();
            if( t is null ? o is null : t == o){
                return idx;
            }
            idx++;
        }
        return -1;
    }
    public bool     isEmpty(){
        return super.isEmpty();
    }
    public Iterator iterator(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public int    lastIndexOf(Object o){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    public ListIterator   listIterator(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public ListIterator   listIterator(int index){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public Object         remove(int index){
        throw new UnsupportedOperationException();
    }
    protected void         removeRange(int fromIndex, int toIndex){
    }
    public bool     remove(Object o){ return super.remove(o); }
    public bool     remove(String o){ return super.remove(o); }
    public bool     removeAll(Collection c){ return super.removeAll(c); }
    public bool     retainAll(Collection c){ return super.retainAll(c); }
    public Object set(int index, Object element){
        throw new UnsupportedOperationException();
    }
    public List   subList(int fromIndex, int toIndex){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public Object[] toArray(){ return super.toArray(); }
    public Object[] toArray(Object[] a){ return super.toArray(a); }
    public String[] toArray(String[] a){ return super.toArray(a); }
    public int opApply (int delegate(ref Object value) dg){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }

    public String toString(){
        return super.toString();
    }
}


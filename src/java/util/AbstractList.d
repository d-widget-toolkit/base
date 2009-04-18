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
    public equals_t  opEquals(Object o){
        if( auto other = cast(List)o ){
            if( other is cast(List)this ){
                return true;
            }
            auto it1 = this.iterator();
            auto it2 = other.iterator();
            while(true){
                bool n1 = it1.hasNext();
                bool n2 = it2.hasNext();
                if( !n1 && !n2 ) return true;
                if( (n1 && !n2) || (!n1 && n2 )) return false;
                Object o1 = it1.next();
                Object o2 = it2.next();
                if( o1 is null ){
                    if( o2 !is null ){
                        return false;
                    }
                }
                else{
                    if( o2 is null ){
                        return false;
                    }
                    if( o1 != o2 ){
                        return false;
                    }
                }
            }
        }
        return false;
    }

    public abstract Object get(int index);

    public hash_t  toHash(){
        // http://java.sun.com/j2se/1.4.2/docs/api/java/util/List.html#hashCode()
        hash_t hashCode = 1;
        Iterator i = iterator();
        while (i.hasNext()) {
            Object obj = i.next();
            hashCode = 31 * hashCode + (obj is null ? 0 : obj.toHash());
        }
        return hashCode;
    }

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


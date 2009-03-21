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

    public abstract void   add(int index, Object element);
    public abstract bool        add(Object o);
    public abstract bool     addAll(Collection c);
    public abstract bool        addAll(int index, Collection c);
    public abstract void   clear();
    public abstract bool     contains(Object o);
    public bool contains(String str){
        return contains(stringcast(str));
    }
    public abstract bool     containsAll(Collection c);
    public abstract equals_t  opEquals(Object o);
    public abstract  Object        get(int index);

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

    public abstract int    indexOf(Object o);
    public abstract bool     isEmpty();
    public abstract Iterator       iterator();
    public abstract int    lastIndexOf(Object o);
    public abstract ListIterator   listIterator();
    public abstract ListIterator   listIterator(int index);
    public abstract Object         remove(int index);
    protected abstract void         removeRange(int fromIndex, int toIndex);
    public abstract bool     remove(Object o);
    public abstract bool     remove(String o);
    public abstract bool     removeAll(Collection c);
    public abstract bool     retainAll(Collection c);
    public abstract Object         set(int index, Object element);
    public abstract List   subList(int fromIndex, int toIndex);
    public abstract Object[] toArray();
    public abstract Object[] toArray(Object[] a);

}


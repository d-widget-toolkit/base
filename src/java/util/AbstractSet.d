module java.util.AbstractSet;

import java.lang.all;
import java.util.Set;
import java.util.Collection;
import java.util.Iterator;
import java.util.AbstractCollection;

abstract class AbstractSet : AbstractCollection, Set {
    this(){
    }
    equals_t         opEquals(Object o){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    hash_t      toHash(){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    bool        removeAll(Collection c){
        return super.removeAll(c);
    }
    public abstract bool     add(Object o);
    public abstract bool     add(String o);
    public abstract bool     addAll(Collection c);
    public abstract void     clear();
    public abstract bool     contains(Object o);
    public abstract bool     contains(String o);
    public abstract bool     containsAll(Collection c);


    public abstract bool     isEmpty();
    public abstract Iterator iterator();
    public abstract bool     remove(Object o);
    public abstract bool     remove(String o);
    public abstract bool     removeAll(Collection c);
    public abstract bool     retainAll(Collection c);
    public abstract int      size();
    public abstract Object[] toArray();
    public abstract Object[] toArray(Object[] a);
    public abstract String   toString(){
        return super.toString();
    }

    // only for D
    public abstract int opApply (int delegate(ref Object value) dg);
}


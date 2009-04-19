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
    public bool     add(Object o){ return super.add(o); }
    public bool     add(String o){ return super.add(stringcast(o)); }
    public bool     addAll(Collection c){ return super.addAll(c); }
    public void     clear(){ super.clear(); }
    public bool     contains(Object o){ return super.contains(o); }
    public bool     contains(String o){ return super.contains(stringcast(o)); }
    public bool     containsAll(Collection c){ return super.containsAll(c); }


    public bool     isEmpty(){ return super.isEmpty(); }
    //public Iterator iterator(){ return super.iterator(); }
    public bool     remove(Object o){ return super.remove(o); }
    public bool     remove(String o){ return super.remove(o); }
    public bool     removeAll(Collection c){ return super.removeAll(c); }
    public bool     retainAll(Collection c){ return super.retainAll(c); }
    //public int      size(){ return super.size(); }
    public Object[] toArray(){ return super.toArray(); }
    public Object[] toArray(Object[] a){ return super.toArray(a); }
    public String   toString(){ return super.toString(); }

    // only for D
    //public int opApply (int delegate(ref Object value) dg){ return super.opApply(dg); }
}


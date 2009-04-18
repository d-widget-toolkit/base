module java.util.Vector;

import java.lang.all;
import java.util.AbstractList;
import java.util.List;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.ListIterator;

class Vector : AbstractList, List {
    Object[] vect;
    int used;
    int capacityIncrement = 32;
    public this(){
    }
    public this(Collection c){
        implMissing( __FILE__, __LINE__ );
    }
    public this(int initialCapacity){
        vect.length = initialCapacity;
    }
    public this(int initialCapacity, int capacityIncrement){
        implMissing( __FILE__, __LINE__ );
    }
    public void   add(int index, Object element){
        implMissing( __FILE__, __LINE__ );
    }
    public bool    add(Object o){
        if( used + 1 >= vect.length ){
            vect.length = vect.length + capacityIncrement;
        }
        vect[used] = o;
        used++;
        return true;
    }
    public bool    add(String o){
        return add(stringcast(o));
    }
    public bool    addAll(Collection c){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    public bool    addAll(int index, Collection c){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    public void   addElement(Object obj){
        add(obj);
    }
    public int    capacity(){
        return vect.length;
    }
    public void   clear(){
        used = 0;
    }
    public Object     clone(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public bool    contains(Object elem){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    public bool    contains(String str){
        return contains(stringcast(str));
    }
    public bool    containsAll(Collection c){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    public void   copyInto(void*[] anArray){
        implMissing( __FILE__, __LINE__ );
    }
    //public void   copyInto(Object[] anArray){
    //    implMissing( __FILE__, __LINE__ );
    //}
    public Object     elementAt(int index){
        return get(index);
    }
    public Enumeration    elements(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
   public  void   ensureCapacity(int minCapacity){
        implMissing( __FILE__, __LINE__ );
    }
    public equals_t opEquals(Object o){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    public Object     firstElement(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public Object     get(int index){
        if( index >= used || index < 0 ){
            throw new ArrayIndexOutOfBoundsException( __FILE__, __LINE__ );
        }
        return vect[index];
    }
    public hash_t    toHash(){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    public int    indexOf(Object elem){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    public int    indexOf(Object elem, int index){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    public void   insertElementAt(Object obj, int index){
        implMissing( __FILE__, __LINE__ );
    }
    public bool    isEmpty(){
        return used is 0;
    }
    public Iterator   iterator(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public Object     lastElement(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public int    lastIndexOf(Object elem){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    public int    lastIndexOf(Object elem, int index){
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
    public Object     remove(int index){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public bool    remove(Object o){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    public bool remove(String key){
        return remove(stringcast(key));
    }
    public bool    removeAll(Collection c){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    public void   removeAllElements(){
        implMissing( __FILE__, __LINE__ );
    }
    public bool    removeElement(Object obj){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    public void   removeElementAt(int index){
        implMissing( __FILE__, __LINE__ );
    }
    protected  void     removeRange(int fromIndex, int toIndex){
        implMissing( __FILE__, __LINE__ );
    }
    public bool    retainAll(Collection c){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    public Object     set(int index, Object element){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public void   setElementAt(Object obj, int index){
        implMissing( __FILE__, __LINE__ );
    }
    public void   setSize(int newSize){
        implMissing( __FILE__, __LINE__ );
    }
    public int    size(){
        return used;
    }
    public List   subList(int fromIndex, int toIndex){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public Object[]   toArray(){
        return vect[ 0 .. used ].dup;
    }
    public Object[]   toArray(Object[] a){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    String[]   toArray(String[] a){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public String     toString(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    public void   trimToSize(){
        implMissing( __FILE__, __LINE__ );
    }

    // only for D
    public int opApply (int delegate(ref Object value) dg){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }

}


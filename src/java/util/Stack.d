module java.util.Stack;

import java.lang.all;
import java.util.Vector;
import java.util.Iterator;
import java.util.ListIterator;
import java.util.Set;
import java.util.List;
import java.util.Collection;

class Stack : Vector {
    this(){
    }
    void   add(int index, Object element){
        implMissing( __FILE__, __LINE__ );
    }
    bool    add(Object o){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    public bool    add(String o){
        return add(stringcast(o));
    }
    bool    addAll(Collection c){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    bool    addAll(int index, Collection c){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    void   addElement(Object obj){
        implMissing( __FILE__, __LINE__ );
    }
    int    capacity(){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    void   clear(){
        implMissing( __FILE__, __LINE__ );
    }
    Object     clone(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    bool    contains(Object elem){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    bool    containsAll(Collection c){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    void   copyInto(Object[] anArray){
        implMissing( __FILE__, __LINE__ );
    }
    Object     elementAt(int index){
        implMissing( __FILE__, __LINE__ );
        return null;
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
        implMissing( __FILE__, __LINE__ );
        return null;
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
//     bool    isEmpty(){
//         implMissing( __FILE__, __LINE__ );
//         return false;
//     }
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
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    public bool remove(String key){
        return remove(stringcast(key));
    }
    bool    removeAll(Collection c){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    void   removeAllElements(){
        implMissing( __FILE__, __LINE__ );
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
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
    List   subList(int fromIndex, int toIndex){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    Object[]   toArray(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    Object[]   toArray(Object[] a){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    String[]   toArray(String[] a){
        implMissing( __FILE__, __LINE__ );
        return null;
    }

    // from Stack
    String     toString(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    void   trimToSize(){
        implMissing( __FILE__, __LINE__ );
    }
    bool     empty(){
        implMissing( __FILE__, __LINE__ );
        return false;
    }
    Object     peek(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    Object     pop(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    Object     push(Object item){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    int    search(Object o){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }

    // only for D
    public int opApply (int delegate(ref Object value) dg){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }

}


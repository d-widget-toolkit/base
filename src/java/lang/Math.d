module java.lang.Math;

version(Tango){
    static import tango.math.Math;
    alias tango.math.Math MathLib;
} else {
    static import std.math;
    alias std.math MathLib;
}

class Math {

    public const double PI = MathLib.PI;

    static double abs(double a){ return a > 0 ? a : -a; }
    static float  abs(float  a){ return a > 0 ? a : -a; }
    static int    abs(int    a){ return a > 0 ? a : -a; }
    static long   abs(long   a){ return a > 0 ? a : -a; }

    static double min(double a, double b){ return a < b ? a : b; }
    static double min(double a, int    b){ return a < b ? a : b; }
    static float  min(float  a, float  b){ return a < b ? a : b; }
    static float  min(float  a, int    b){ return a < b ? a : b; }
    static float  min(int    a, float  b){ return a < b ? a : b; }
    static int    min(byte   a, byte   b){ return a < b ? a : b; }
    static int    min(byte   a, int    b){ return a < b ? a : b; }
    static int    min(int    a, int    b){ return a < b ? a : b; }
    static int    min(uint   a, int    b){ return a < b ? a : b; }
    static int    min(int    a, uint   b){ return a < b ? a : b; }
    static int    min(uint   a, uint   b){ return a < b ? a : b; }
    static int    min(int    a, long   b){ return a < b ? a : b; }
    static long   min(long   a, long   b){ return a < b ? a : b; }
    static long   min(long   a, int    b){ return a < b ? a : b; }

    static double max(double a, double b){ return a > b ? a : b; }
    static double max(double a, int    b){ return a > b ? a : b; }
    static float  max(float  a, float  b){ return a > b ? a : b; }
    static float  max(float  a, int    b){ return a > b ? a : b; }
    static float  max(int    a, float  b){ return a > b ? a : b; }
    static int    max(byte   a, byte   b){ return a > b ? a : b; }
    static int    max(int    a, int    b){ return a > b ? a : b; }
    static int    max(uint   a, int    b){ return a > b ? a : b; }
    static int    max(int    a, uint   b){ return a > b ? a : b; }
    static int    max(uint   a, uint   b){ return a > b ? a : b; }
    static int    max(int    a, long   b){ return a > b ? a : b; }
    static long   max(long   a, long   b){ return a > b ? a : b; }
    static long   max(long   a, int    b){ return a > b ? a : b; }


    static double sin(double a)  { return MathLib.sin(a); }
    static double cos(double a)  { return MathLib.cos(a); }

    static long   round(double a) { return cast(long)MathLib.round(a); }
    static int    round(float a)  { return cast(int)MathLib.round(a); }
    static int    round(int a)  { return a; }
    static double rint(double a) {
        version(Tango) return MathLib.rndint(a);
        else           return MathLib.rint(a);
    }
    static double ceil(double a) { return MathLib.ceil(a); }
    static double floor(double a) { return MathLib.floor(a); }
    static double sqrt(double a) { return MathLib.sqrt(a); }
    static double atan2(double a, double b) { return MathLib.atan2(a,b); }
    static double pow(double a, double b) { return MathLib.pow(a, b); }
}



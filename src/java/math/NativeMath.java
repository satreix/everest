package math;

import com.github.fmeum.rules_jni.RulesJni;

import java.lang.annotation.Native;

public class NativeMath {
    static {
        RulesJni.loadLibrary("math", NativeMath.class);
    }

    @Native private static final int incrementBy = 1;

    public static native int increment(int arg);

    public static native int add(int arg1, int arg2);

    private NativeMath() {}
}

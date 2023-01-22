#include "math_NativeMath.h"

jint Java_math_NativeMath_increment(JNIEnv *env, jclass clazz, jint arg1) {
  return Java_math_NativeMath_add(env, clazz, arg1,
                                  math_NativeMath_incrementBy);
}

jint Java_NativeMath_add(JNIEnv *env, jclass clazz, jint arg1, jint arg2) {
  return arg1 + arg2;
}

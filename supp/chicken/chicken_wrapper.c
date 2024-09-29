/*
  Compile as:
  gcc -shared -fPIC -o libchicken.so chicken_wrapper.c \
      -I{$NIXPATH}/include/chicken -L{$NIXPATH}/lib -lchicken
*/
#include <chicken.h>
#include <stdio.h>

const char* eval_scheme(const char* expr) {
    static char result[1024];  // Don't do this at home

    // Initialize the Chicken runtime only once
    static int initialized = 0;
    if (!initialized) {
      CHICKEN_run(CHICKEN_default_toplevel);
      initialized = 1;
    }

    // Evaluate the Scheme expression
    CHICKEN_eval_string_to_string((char*)expr, result, sizeof(result));

    return result;
}

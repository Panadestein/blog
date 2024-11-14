#!/usr/bin/env fish

# Find the Nix store path for Chicken
set chicken_path (nix-store -qR (which chicken) | grep -m 1 "chicken")

# Build the shared library
if test -n "$chicken_path"
    gcc -shared -fPIC -o libchicken.so chicken_wrapper.c \
        -I$chicken_path/include/chicken \
        -L$chicken_path/lib \
        -lchicken
else
    echo "Chicken not found in Nix store paths."
end

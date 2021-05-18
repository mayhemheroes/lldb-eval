#!/bin/bash

git apply $SRC/patchara.patch

export LLVM_INSTALL_PATH=/usr/lib/llvm-11/

bazel build :all

export BAZEL_EXTRA_BUILD_FLAGS="--@rules_fuzzing//fuzzing:cc_engine=@rules_fuzzing_oss_fuzz//:oss_fuzz_engine"

#bazel_build_fuzz_tests --sandbox_debug

bash $SRC/my_bazel_build.sh

FROM gcr.io/oss-fuzz-base/base-builder

RUN apt update

# Wget is needed for downloading llvm.sh (it is also used by llvm.sh)
RUN apt install -y wget

# This is needed to avoid https apt install errors
RUN apt install -y apt-transport-https ca-certificates

# This is a compiler dependency
RUN apt install -y zlib1g-dev

# We also need recent version of libstdc++
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt update
RUN apt install -y gcc-9 g++-9

# Install the LLVM toolchaing and libraries
RUN wget https://apt.llvm.org/llvm.sh
RUN chmod +x llvm.sh
RUN ./llvm.sh 11
RUN apt install -y llvm-11-dev libclang-11-dev liblldb-11-dev

# Clone our repo
RUN git clone https://github.com/google/lldb-eval

WORKDIR lldb-eval
COPY my_bazel_build.sh build.sh patchara.patch  $SRC/

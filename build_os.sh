#!/bin/bash
# Zenith-AI OS: Automated Build Factory
# Purpose: Synthesize high-level logic into a standalone, weightless binary.

set -e

echo "--- Initializing Zenith-AI Synthesis ---"

# 1. Renormalize Python Logic into C++ (The Brain)
# The --embed flag ensures the Python runtime environment is part of the binary.
echo "[1/4] Cythonizing Kernel Manifold..."
cython --embed -3 kernel.pyx -o kernel.c

# 2. Synthesize the Unified Manifold (The Body)
# -static: Removes all external .so dependencies for a WNF Index of 1.0.
# -O3: Enables aggressive hardware optimization.
# -Wl,--gc-sections: Removes unused code chunks to maximize Kolmogorov Efficiency.
echo "[2/4] Synthesizing Static Binary..."
gcc -static -O3 kernel.c nervous_system.c zenith_box.c \
    $(pkg-config --cflags --libs python3-embed) \
    -lpthread -lm -ldl -lutil \
    -ffunction-sections -fdata-sections \
    -Wl,--gc-sections \
    -o zenith_os_core

# 3. Final Renormalization
echo "[3/4] Stripping Latent Metadata..."
strip --strip-all zenith_os_core

# 4. Verification
echo "[4/4] Verifying Weightless Status..."
if ldd zenith_os_core 2>&1 | grep -q "not a dynamic executable"; then
    echo "SUCCESS: Weightless Native Framework Generated."
else
    echo "ERROR: Dependencies detected. Check static linking flags."
    exit 1
fi

echo "--- Synthesis Complete: zenith_os_core is ready ---"

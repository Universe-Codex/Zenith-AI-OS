#!/bin/bash
# Zenith-AI OS: Automated Build Factory (v2.0 - Auto-Intelligence)
# Purpose: Synthesize high-level logic and fetch AI weights into a standalone binary.

set -e

echo "--- Initializing Zenith-AI Synthesis Factory ---"

# 1. Intelligence Acquisition (The Executive Function)
# We fetch the Phi-2 GGUF model. This is the 'Intelligence' of the OS.
if [ ! -f "model.gguf" ]; then
    echo "[1/5] Fetching AI Weights (Phi-2 Q4_K_M)..."
    # Using the Bartowski/TheBloke renormalization of Phi-2
    wget -q --show-progress https://huggingface.co/bartowski/phi-2-GGUF/resolve/main/phi-2-Q4_K_M.gguf -O model.gguf
else
    echo "[1/5] AI Weights already present in manifold."
fi

# 2. Renormalize Python Logic into C++ (The Brain)
echo "[2/5] Cythonizing Kernel Manifold logic..."
cython --embed -3 kernel.pyx -o kernel.c

# 3. Synthesize the Unified Manifold (The Body)
# -static: Removes all external .so dependencies for a WNF Index of 1.0.
# -O3: Maximum hardware throughput optimization.
echo "[3/5] Synthesizing Static Binary (Machine Level)..."
gcc -static -O3 kernel.c nervous_system.c zenith_box.c \
    $(pkg-config --cflags --libs python3-embed) \
    -lpthread -lm -ldl -lutil \
    -ffunction-sections -fdata-sections \
    -Wl,--gc-sections \
    -o zenith_os_core

# 4. Final Renormalization
echo "[4/5] Stripping Latent Metadata (Kolmogorov Optimization)..."
strip --strip-all zenith_os_core

# 5. Verification
echo "[5/5] Verifying Weightless Status..."
if ldd zenith_os_core 2>&1 | grep -q "not a dynamic executable"; then
    echo "SUCCESS: Weightless Native Framework Generated."
    echo "Final OS Size: $(du -h zenith_os_core | cut -f1)"
    echo "Model Weight Size: $(du -h model.gguf | cut -f1)"
else
    echo "ERROR: Dependencies detected. Manifold is not weightless."
    exit 1
fi

echo "--- Synthesis Complete: Move zenith_os_core and model.gguf to your boot drive ---"

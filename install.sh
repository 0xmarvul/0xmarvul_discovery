#!/bin/bash

# 0xMarvul Discovery - Dependency Installer
# This script installs subfinder and httpx

echo "=============================================="
echo "   🚀 0xMarvul Discovery - Installation"
echo "=============================================="
echo ""

# Check if Go is installed
if ! command -v go &> /dev/null; then
    echo "❌ Go is not installed. Please install Go first:"
    echo "   https://golang.org/doc/install"
    exit 1
fi

echo "✅ Go is installed: $(go version)"
echo ""

# Install subfinder
echo "📦 Installing subfinder..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

if command -v subfinder &> /dev/null; then
    echo "✅ subfinder installed successfully"
else
    echo "⚠️  subfinder installation may have failed. Check your Go installation."
fi

echo ""

# Install httpx
echo "📦 Installing httpx..."
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

if command -v httpx &> /dev/null; then
    echo "✅ httpx installed successfully"
else
    echo "⚠️  httpx installation may have failed. Check your Go installation."
fi

echo ""
echo "=============================================="
echo "   ✅ Installation Complete!"
echo "=============================================="
echo ""
echo "Make sure $(go env GOPATH)/bin is in your PATH:"
echo "export PATH=\$PATH:\$(go env GOPATH)/bin"
echo ""
echo "You can now run: ./0xmarvul_discovery.sh <domain>"
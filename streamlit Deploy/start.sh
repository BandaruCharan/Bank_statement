#!/bin/bash

# Update the package list and install Tesseract OCR with language data
apt-get update && apt-get install -y tesseract-ocr libtesseract-dev

# Set TESSDATA_PREFIX for Tesseract language files
export TESSDATA_PREFIX="/usr/share/tesseract-ocr/"

# Add Tesseract to PATH explicitly
export PATH="$PATH:/usr/bin"

# Verify Tesseract installation and PATH (for debugging purposes)
echo "Tesseract version:"
tesseract --version

echo "Tesseract data path content:"
ls $TESSDATA_PREFIX/tessdata/

echo "PATH is set to: $PATH"

# Run your Streamlit application
streamlit run Bank_Statements_Streamlit.py




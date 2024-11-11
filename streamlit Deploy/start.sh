#!/bin/bash

# Exit immediately if a command fails
set -e

# Update package list and install Tesseract OCR with English language support
apt-get update && apt-get install -y tesseract-ocr tesseract-ocr-eng

# Verify Tesseract installation
tesseract --version

# Check the tessdata directory and list its contents
ls -l /usr/share/tesseract-ocr/tessdata/

# Explicitly set the TESSDATA_PREFIX environment variable
export TESSDATA_PREFIX="/usr/share/tesseract-ocr/tessdata"
echo "TESSDATA_PREFIX is set to: $TESSDATA_PREFIX"

# Start Streamlit application
streamlit run Bank_Statements_Streamlit.py





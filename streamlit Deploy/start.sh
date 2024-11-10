#!/bin/bash

# Update package lists
apt-get update

# Install Tesseract and Leptonica
apt-get install -y tesseract-ocr libtesseract-dev libleptonica-dev

# Export necessary environment variables
export TESSDATA_PREFIX="/usr/share/tesseract-ocr/"
export PATH="$PATH:/usr/bin"

# Verify Tesseract installation (Optional but useful for debugging)
tesseract --version
echo "Tesseract path: $(which tesseract)"
ls $TESSDATA_PREFIX/tessdata/

# Run your Streamlit application
streamlit run Bank_Statements_Streamlit.py

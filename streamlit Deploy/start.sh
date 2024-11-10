#!/bin/bash

# Install Tesseract OCR and language data files
apt-get update && apt-get install -y tesseract-ocr libtesseract-dev

# Set Tesseract data path
export TESSDATA_PREFIX="/usr/share/tesseract-ocr/"

# Verify Tesseract installation (Optional but useful for debugging)
tesseract --version
ls $TESSDATA_PREFIX/tessdata/

# Run your Streamlit application
streamlit run Bank_Statements_Streamlit.py




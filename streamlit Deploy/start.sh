#!/bin/bash

# Install Tesseract OCR and set up tessdata
apt-get update && apt-get install -y tesseract-ocr tesseract-ocr-eng

# Verify installation
tesseract --version
ls /usr/share/tesseract-ocr/tessdata/

# Explicitly set the environment variable
export TESSDATA_PREFIX="/usr/share/tesseract-ocr/tessdata"

# Start Streamlit
streamlit run Bank_Statements_Streamlit.py




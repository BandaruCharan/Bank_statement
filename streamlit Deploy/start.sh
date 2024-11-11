#!/bin/bash

# Update and install Tesseract
apt-get update && apt-get install -y tesseract-ocr

# Verify Tesseract installation
tesseract --version

# Export the path for Tesseract data
export TESSDATA_PREFIX=/usr/share/tesseract-ocr/4.00/tessdata

# Start Streamlit
streamlit run Bank_Statements_Streamlit.py



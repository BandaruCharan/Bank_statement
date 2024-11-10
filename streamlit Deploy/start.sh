#!/bin/bash

# Update packages and install Tesseract
apt-get update && apt-get install -y tesseract-ocr libtesseract-dev

# Verify Tesseract installation
tesseract -v

# Print the PATH for debugging
echo "Current PATH: $PATH"

# List Tesseract binary location
which tesseract

# Run the Streamlit app
streamlit run Bank_Statements_Streamlit.py



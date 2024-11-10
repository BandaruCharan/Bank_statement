#!/bin/bash

# Install Tesseract OCR
apt-get update && apt-get install -y tesseract-ocr libtesseract-dev

# Verify Tesseract installation
tesseract -v

# Run the Streamlit app
streamlit run Bank_Statements_Streamlit.py


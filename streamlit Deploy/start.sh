#!/bin/bash

# Update package list and install Tesseract OCR
apt-get update && apt-get install -y tesseract-ocr

# Ensure Python dependencies are installed
pip install -r requirements.txt

# Start the Streamlit app
streamlit run Bank_Statements_Streamlit.py


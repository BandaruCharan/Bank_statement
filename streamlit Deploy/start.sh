#!/bin/bash

# Install Tesseract OCR and set up tessdata
apt-get update && apt-get install -y tesseract-ocr
wget https://github.com/tesseract-ocr/tessdata/raw/main/eng.traineddata -P /usr/share/tesseract-ocr/tessdata/


# Verify installation
tesseract --version
ls /usr/share/tesseract-ocr/tessdata/

# Explicitly set the environment variable
export TESSDATA_PREFIX="/usr/share/tesseract-ocr/tessdata"

# Start Streamlit
streamlit run Bank_Statements_Streamlit.py




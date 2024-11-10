# start.sh
#!/bin/bash

# Install Tesseract
sudo apt-get update && sudo apt-get install -y tesseract-ocr

# Run the Streamlit app
streamlit run Bank_Statements_Streamlit.py


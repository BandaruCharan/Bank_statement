import streamlit as st
import pandas as pd
from nanonets import NANONETSOCR
from requests.exceptions import RequestException

# Function to extract tables and save as CSV
def extract_tables_and_save(input_file_path, output_file_path):
    model = NANONETSOCR()
    model.set_token('aa246456-fbf3-11ee-8c42-52317942933f')
    try:
        model.convert_to_csv(file_path=input_file_path, output_file_name=output_file_path)
    except RequestException as e:
        st.error(f"Error occurred during table extraction: {e}")

# Function to display CSV file as table
def display_csv_as_table(csv_file_path):
    df = pd.read_csv(csv_file_path)
    st.write(df)

#def display_csv_as_table(csv_file_path):
    # Read CSV file into DataFrame
    #df = pd.read_csv(csv_file_path, skip_blank_lines=True, header=2)
    
    # Drop rows where the first column is "Unnamed"
    #df = df.loc[:, ~df.columns.str.contains('^Unnamed')]
    
    # Drop any completely empty rows
    #df = df.dropna(axis=0, how='all')
    
    # Replace NaN values with empty space
    #df.fillna('', inplace=True)
    
    #st.write(df)


def main():
    st.title("OCR - Table Extraction")

    # Custom CSS for styling
    st.markdown(
        """
        <style>
        .stApp {
            background-color: #f0f0ff; /* Set background color */
        }
        </style>
        """,
        unsafe_allow_html=True
    )
    
    # File upload section
    st.header("Upload Bank Statement PDF or Image file")
    uploaded_file = st.file_uploader("Choose a file", type=["pdf", "jpg", "jpeg", "png"])

    # Extract button
    if st.button("Extract"):
        if uploaded_file is not None:
            # Extract tables and save as CSV
            extract_tables_and_save(uploaded_file.name, "output.csv")
            
            # Display the extracted tables
            st.header("Extracted Tables \n from uploaded files")
            display_csv_as_table("output.csv")


if __name__ == "__main__":
    main()

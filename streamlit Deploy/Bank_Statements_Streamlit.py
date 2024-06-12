import streamlit as st
import pandas as pd
from nanonets import NANONETSOCR
from requests.exceptions import RequestException

# Function to extract tables from PDF/Image and return JSON object
def extract_tables(input_file_path):
    model = NANONETSOCR()
    model.set_token('aa246456-fbf3-11ee-8c42-52317942933f')
    try:
        tables_json = model.convert_to_tables(file_path=input_file_path)
        return tables_json
    except RequestException as e:
        st.error(f"Error occurred during table extraction: {e}")

# Function to extract tabular data from JSON and convert to DataFrame
def extract_tabular_data(json_data):
    # Initialize an empty list to store DataFrames for each table
    dfs = []

    # Iterate over each table in the JSON data
    for table in json_data:
        # Extract table cells
        table_data = table['prediction'][-1]['cells']

        # Determine the maximum number of columns in the table
        max_col = max(cell['col'] for cell in table_data)

        # Initialize a DataFrame to store the tabular data with the determined number of columns
        df = pd.DataFrame(columns=range(1, max_col + 1))

        # Iterate over each cell and insert data into DataFrame
        for cell in table_data:
            row, col = cell['row'], cell['col']
            text = cell['text']
            df.loc[row, col] = text

        # Append the DataFrame to the list of DataFrames
        dfs.append(df)

    return dfs


def main():
    st.title("Bank Transactions Extraction")

    # Custom CSS for styling
    st.markdown(
        """
        <style>
        .stApp {
            background-color: #f0f0f0; /* Set background color */
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
            st.write(f"Uploaded file: {uploaded_file.name}")
            try:
                # Save the uploaded file to a temporary file
                with tempfile.NamedTemporaryFile(delete=False) as tmp_file:
                    tmp_file.write(uploaded_file.read())
                    tmp_file_path = tmp_file.name
                
                # Extract tables from the temporary file
                tables_json = extract_tables(tmp_file_path)
                st.write("Extraction successful")

                # Clean up the temporary file
                os.remove(tmp_file_path)

                # Extract tabular data from JSON and display as DataFrame
                if tables_json:
                    st.header("Transaction Details : ")
                    tabular_data = extract_tabular_data(tables_json)
                    for idx, df in enumerate(tabular_data, start=1):
                        st.write(df)
            except Exception as e:
                st.error(f"Error during extraction: {e}")

if __name__ == "__main__":
    main()

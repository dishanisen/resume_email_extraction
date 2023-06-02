#!/bin/bash

# Specify the folder containing the PDF files
pdf_folder="/path/to/pdf/folder"

# Specify the Google Sheet details
spreadsheet_id="YOUR_SPREADSHEET_ID"
sheet_name="YOUR_SHEET_NAME"

# Authenticate with Google Sheets API
python3 << EOF
import gspread
from oauth2client.service_account import ServiceAccountCredentials

# Define the path to the credentials JSON file
credentials_path = '/path/to/credentials.json'

# Define the email address extraction regex
regex = r'\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b'

# Initialize the Google Sheets API credentials
scope = ['https://www.googleapis.com/auth/spreadsheets']
creds = ServiceAccountCredentials.from_json_keyfile_name(credentials_path, scope)
client = gspread.authorize(creds)

# Open the specified spreadsheet and sheet
spreadsheet = client.open_by_key('$spreadsheet_id')
sheet = spreadsheet.worksheet('$sheet_name')

# Loop over the PDF files in the folder
for file in glob.glob('$pdf_folder/*.pdf'):
    # Extract the file name without the extension
    filename = os.path.basename(file).replace('.pdf', '')

    # Convert the PDF to text and extract email addresses using grep
    email_addresses = subprocess.check_output(['pdftotext', file, '-']).decode('utf-8')
    extracted_emails = re.findall(regex, email_addresses)

    # Write the extracted email addresses to the Google Sheet
    for email in extracted_emails:
        sheet.append_row([filename, email])

    print(f"Extracted email addresses from {file}")

EOF

# Extract email ids from CV and store them in a text file
## Replace the following in the script "extact_emails.sh":
-  /path/to/pdf/folder with the actual path to your folder containing the PDF files
-  /path/to/output.txt with the desired path and filename for the output file

All the extracted email addresses are appended to a single output file specified by output_file. Each run of the script will append the new email addresses to the existing contents of the file.

After saving the updated script, make it executable (chmod +x extract_emails.sh), and run it (./extract_emails.sh). 

The email addresses extracted from all the PDF files will be stored in the specified output file.

# Extract email ids from CV and store them in a google sheet
Before running 
## Replace the following in the script "extact_emails_google_sheet.sh":

- /path/to/pdf/folder: Specify the path to the folder containing the PDF files.
- YOUR_SPREADSHEET_ID: Replace it with the actual ID of your Google Sheet. You can find it in the URL of the Google Sheet between the /d/ and /edit.
- YOUR_SHEET_NAME: Replace it with the name of the sheet within your Google Sheet where you want to store the email addresses.
- /path/to/credentials.json: Specify the path to the credentials.json file generated during the setup process.

**Setup process**: 
Enable the Google Sheets API and create credentials by following the steps in the "Python Quickstart" guide provided by Google here: https://developers.google.com/sheets/api/quickstart/python. This will generate a credentials.json file that contains your API credentials.


Save the script to a file (e.g., extract_emails_google_sheets.sh), make it executable (chmod +x extract_emails_google_sheets.sh), and execute it (./extract_emails_google_sheets.sh). The script will convert the PDF files to text, extract email addresses, and store them in the specified Google Sheet.
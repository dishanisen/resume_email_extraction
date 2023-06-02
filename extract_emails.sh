#!/bin/bash

# Specify the folder containing the PDF files
pdf_folder="/path/to/pdf/folder"

# Specify the output file for all email addresses
output_file="/path/to/output.txt"

# Loop over the PDF files in the folder
for file in "$pdf_folder"/*.pdf; do
  # Convert the PDF to text and extract email addresses using grep
  email_addresses=$(pdftotext "$file" - | grep -E -o "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b")

  # Append the email addresses to the output file
  echo "$email_addresses" >> "$output_file"

  echo "Extracted email addresses from $file"
done

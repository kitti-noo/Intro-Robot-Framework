*** Settings ***
Library  RPA.PDF
Library  String
Library  OperatingSystem

*** Tasks ***
RPA_PDF_001 - Open PDF
  Open Pdf  files/Robot Framework for test cases with dependency.pdf
  ${text}  Get Text From Pdf  files/Robot Framework for test cases with dependency.pdf
  Log  ${text[1]}
  Create File  ${EXECDIR}/files/text.docx  ${text[1]}
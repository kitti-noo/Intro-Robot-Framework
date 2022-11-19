*** Settings ***
Library  SeleniumLibrary
Library  DependencyLibrary
Library  ../utill.py
Variables  ../data.yaml
Suite Teardown  Close Browser

*** Test Cases ***
TC_001 - Open Google
  [Tags]  demo
  Open web google
  Sleep  1s
  Capture Page Screenshot

TC_002 - Search Google
  [Tags]  demo
  Require test case  TC_001 - Open Google
  # Open web google
  Click search text  ${search_robot}
  Click and verify robot page

*** Keywords ***
Open web google
  Open Browser  ${url.google}  ${browser}  
  Capture Page Screenshot
  Set Window Size  1920  1080
  Maximize Browser Window

Click search text
  [Arguments]  ${search_text}
  Wait Until Element Is Visible  ${search_title}  10s
  Input Text  ${search_title}  ${search_text}
  Wait Until Element Is Visible  ${search_button}  10s
  Sleep  2s
  Click Element  ${search_button}

Click and verify robot page
  Wait Until Element Is Visible  ${robot_title}  10s
  Click Element  ${robot_title}
  Wait Until Element Is Visible  ${robot_text}  10s
  ${fe_robot_text}  get text  ${robot_text}
  Should Be Equal As Strings  ${fe_robot_text}  ROBOT\nFRAME\nWORK🇺🇦
  # log to console  ${fe_robot_text}
  log  ${fe_robot_text}
  Capture Page Screenshot

Require test case
  [Arguments]  ${test_case_name}
  ${msg}  Run Keyword And Ignore Error  Depends on test  ${test_case_name}
  IF  '${msg}[0]' == 'FAIL'
    IF  '${rerun}' == 'true'
      check test case status from xunit  ${test_case_name}  ${xunit_file}
    ELSE
      Fail  ${msg}[1]
    END
  END

*** Variables ***
${search_title}  //input[@title="ค้นหา" or @title="Search"]
${search_button}  //input[@aria-label="Google Search" or @aria-label="ค้นหาด้วย Google"]
${search_robot}  robot framework
${robot_text}  //h1[@class="title"]
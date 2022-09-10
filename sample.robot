*** Settings ***
Library  SeleniumLibrary
Task Teardown  Close Browser

*** Test Cases ***
TC_001 - Open Google
  [Tags]  demo
  Open web google
  Sleep  1s
  Capture Page Screenshot

TC_002 - Search
  [Tags]  demo
  Open web google
  Wait Until Element Is Visible  ${search_title}  5s
  Input Text  ${search_title}  ${search_text}
  Wait Until Element Is Visible  ${search_button}  5s
  Click Element  ${search_button}
  Wait Until Element Is Visible  ${robot_title}  5s
  Click Element  ${robot_title}
  Wait Until Element Is Visible  ${robot_text}  5s
  ${fe_robot_text}  get text  ${robot_text}
  Should Be Equal As Strings  ${fe_robot_text}  ROBOT\nFRAME\nWORK🇺🇦
  log to console  ${fe_robot_text}
  log  ${fe_robot_text}

*** Keywords ***
Open web google
  Open Browser  https://www.google.co.th/  ${browser}
  Capture Page Screenshot
  Set Window Size  1920  1080

*** Variables ***
${search_title}  //*[@title="ค้นหา"]
${search_button}  //div[@jsname="VlcLAe"]//input[@value="ค้นหาด้วย Google"]
${search_text}  robot framework
${robot_title}  //h3[text()='Robot Framework']
${robot_text}  //h1[@class="title"]
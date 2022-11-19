*** Settings ***
Library    PuppeteerLibrary
Test Teardown    Close Browser

*** Test Cases ***
POC_PUPPETEER_001 - POC Puppeteer
    ${HEADLESS}     Get variable value    ${HEADLESS}    ${False}
    &{options} =    create dictionary   headless=${HEADLESS}
    Open browser    https://pypi.org/project/robotframework-PuppeteerLibrary/   browser=chrome  options=${options}
    Start Tracing
    Wait Until Element Is Visible   xpath://*[@href="https://github.com/microsoft/playwright-python"]
    Click Element    xpath://*[@href="https://github.com/microsoft/playwright-python"]
    Sleep  2s
    Stop Tracing
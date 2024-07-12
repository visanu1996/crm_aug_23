*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
Library    DateTime
Resource    ../keywords/banner-resources/banner_master_resources.robot
*** Test Cases ***
COPY001
    Open
    ${Date}    Get Current Date
    Set Global Variable  ${Path}  /Users/7n100350/Desktop/CRM ROBOT/screen-capture/Master/Copy/${Date}    
    sleep    5s
    Open Master Banner Page
    First List Copy
    Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Master_Test_${runningNumber}.png
    Submit Master
COPY002
    First List Copy
    Set BannerHeader Empty    COPY_TEST    COPY_TEST
    Capture Page Screenshot    Master_Test_${runningNumber}.png
    Submit Master
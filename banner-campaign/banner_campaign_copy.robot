*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
Resource    ../keywords/banner-resources/banner_campaign_resources.robot

*** Test Cases ***
COPY_001
    Open
    ${Date}    Get Current Date
    ${normalize_path}    Normalize Path    ${CURDIR}../screen-capture/Campaign/Edit/${Date}
    Set Global Variable  ${Path}  ${normalize_path}
    sleep    5s
    Date    2    7
    Open Campaign Banner
    First List Copy
    Insert Campaign Date
    Set Target
    Insert Test Date    ${True}        #To prevent error from defect (DF that still validate campaign test date even flag = false at the first time)
    Insert Test Date    ${False}
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Campaign_TesT_${runningNumber}.png
    Increment
    Submit Campaign
    Sleep    10s
COPY_002
    First List Copy
    Set BannerHeader Empty    CopyTest    CopyTest
    Date    1    3
    Insert Campaign Date
    Set Target
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Campaign_TesT_${runningNumber}.png
    Increment
    Submit Campaign
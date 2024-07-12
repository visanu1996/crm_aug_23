*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
Resource    ../keywords/banner-resources/banner_campaign_resources.robot

*** Test Cases ***

CREATE_POS_001
    Open
    ${Date}    Get Current Date
    ${normalize_path}    Normalize Path    ${CURDIR}/CRM ROBOT/screen-capture/Campaign/Edit/${Date}
    Set Global Variable  ${Path}  ${normalize_path}
    sleep    5s
    Date    2    5
    Create Campaign Banner
    Set BannerHeader
    Set Campaign Page
    Set Choose Banner
    Insert Campaign Date
    Insert Test Date    ${True}
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Campaign_TesT_${runningNumber}.png
    Increment
    Submit Campaign

CREATE_POS_002
    Create Campaign Banner
    Set BannerHeader
    Set Campaign Page
    Set Choose Banner
    Set OS    2
    Insert Campaign Date
    Insert Test Date    ${True}
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Campaign_TesT_${runningNumber}.png
    Increment
    Submit Campaign
CREATE_POS_003
    Create Campaign Banner
    Set Banner Header
    Set Campaign Page
    Set Choose Banner
    Insert Campaign Date
    Insert Test Date    ${False}
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Campaign_TesT_${runningNumber}.png
    Increment
    Submit Campaign

CREATE_POS_004
    Create Campaign Banner
    Set BannerHeader
    Set Campaign Page
    Set Choose Banner
    Set Target    2    1
    Insert Campaign Date
    Insert Test Date    ${True}
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Campaign_TesT_${runningNumber}.png
    Set Transaction Amount    2500
    Increment
    Submit Campaign

CREATE_POS_005
    Create Campaign Banner
    Set BannerHeader
    Set Campaign Page
    Set Choose Banner
    Insert Campaign Date    6/9/2566    9/9/2566
    Insert Test Date    ${True}    5/9/2566    10/9/2566    
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Campaign_TesT_${runningNumber}.png
    Increment
    Submit Campaign

CREATE_POS_006
    Create Campaign Banner
    Set BannerHeader
    Set Campaign Page
    Set Choose Banner
    Insert Campaign Date    6/9/2566    9/9/2566
    Insert Test Date    ${True}    7/9/2566    8/9/2566    
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Campaign_TesT_${runningNumber}.png
    Increment
    Submit Campaign

CREATE_POS_007
    Create Campaign Banner
    Set BannerHeader
    Set Campaign Page
    Set Choose Banner
    Insert Campaign Date    6/9/2566    9/9/2566
    Insert Test Date    ${True}    10/9/2566    11/9/2566    
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Campaign_TesT_${runningNumber}.png
    Increment
    Submit Campaign

############################################ Negative Test Cases ############################################

CREATE_NEG_001
    Reset Running Number
    Open
    sleep    5s
    Date    2    5
    Create Campaign Banner
    Set BannerHeader Empty    Hello@#$    Hi@#$
    Set Campaign Page
    Set Choose Banner
    Insert Campaign Date
    Insert Test Date    ${True}
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Submit
    Capture Page Screenshot    Campaign_TesT_Negative${runningNumber}.png
    Increment
CREATE_NEG_002
    Date    2    5
    Create Campaign Banner
    Set BannerHeader Empty    ${EMPTY}    ${EMPTY}
    Set Campaign Page
    Set Choose Banner
    Insert Campaign Date
    Insert Test Date    ${True}
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Submit
    Capture Page Screenshot    Campaign_TesT_Negative${runningNumber}.png
    Increment
    
CREATE_NEG_003
    Date    5    2
    Create Campaign Banner
    Set BannerHeader Empty    endDate    beforeStart
    Set Campaign Page
    Set Choose Banner
    Insert Campaign Date
    Insert Test Date    ${True}
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Submit
    Capture Page Screenshot    Campaign_TesT_Negative${runningNumber}.png
    Increment

CREATE_NEG_003
    Date
    Create Campaign Banner
    Set BannerHeader Empty    samedatetime    endstart
    Set Campaign Page
    Set Choose Banner
    Insert Campaign Date
    Insert Test Date    ${True}
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Submit
    Capture Page Screenshot    Campaign_TesT_Negative${runningNumber}.png
    Increment
CREATE_NEG_004
    Create Campaign Banner
    Set BannerHeader Empty    nullDate    nullDate
    Set Campaign Page
    Set Choose Banner
    Insert Test Date    ${True}
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Submit
    Capture Page Screenshot    Campaign_TesT_Negative${runningNumber}.png
    Increment
# CREATE_NEG_005
#     Create Campaign Banner
#     Set BannerHeader Empty    alphabetTransAmt    Trans_Neg
#     Set Campaign Page
#     Set Choose Banner
#     Date    1    2
#     Insert Test Date    ${False}
#     Set Transaction Amount    "text"    #Can't save with this type nor error are shown

# Create_POS_CID    #Can't run with cid yet
#     Open
#     Sleep    5s
#     Create Campaign Banner
#     Set BannerHeader
#     Set Campaign Page
#     Set Choose Banner
#     Set Target    3
#     Upload cid
#     Sleep    10s 

# CREATE_NEG_006
#     Create Campaign Banner
#     Set BannerHeader Empty    float_Trans    Amount
#     Set Campaign Page
#     Set Choose Banner
#     Date    1    2
#     Set Transaction Amount    10.1235435
#     SeleniumLibrary.Set Screenshot Directory    ${Path}
#     Submit
#     Capture Page Screenshot    Campaign_TesT_Negative${runningNumber}.png    #Can't save with this type nor error are shown


CREATE_NEG_007
    Create Campaign Banner
    Set BannerHeader Empty    Exist code    POS_Test_7
    Set Campaign Page
    Set Choose Banner
    Date    1    2
    Insert Test Date
    Insert Campaign Date
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Submit
    Capture Page Screenshot    Campaign_TesT_Negative${runningNumber}.png
    Increment
CREATE_NEG_008
    Create Campaign Banner
    Set BannerHeader Empty    ภาษาไทย    ทดสอบ
    Set Campaign Page
    Set Choose Banner
    Date    1    2
    Insert Test Date
    Insert Campaign Date
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Submit
    Capture Page Screenshot    Campaign_TesT_Negative${runningNumber}.png
    Increment

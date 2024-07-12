*** Settings ***

Resource    ../import-campaign.robot
*** Test Cases ***
EDIT_POS_001
    banner_campaign_resources.Open
    ${Date}    Get Current Date
    ${normalize_path}    Normalize Path    ${CURDIR}../screen-capture/Campaign/Edit/${Date}
    Set Global Variable  ${Path}  ${normalize_path}
    sleep    5s
    banner_campaign_resources.Date    2    5
    banner_campaign_resources.Open Campaign Banner
    banner_campaign_resources.First List Edit
    banner_campaign_resources.Edit BannerHeader Empty    TestHi
    banner_campaign_resources.Set Campaign Page
    banner_campaign_resources.Set Choose Banner
    banner_campaign_resources.Insert Campaign Date
    banner_campaign_resources.Insert Test Date    ${False}
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Campaign_Edit_${runningNumber}.png
    banner_campaign_resources.Increment
    banner_campaign_resources.Submit Campaign

EDIT_POS_002
    banner_campaign_resources.Date    2    5
    banner_campaign_resources.First List Edit
    banner_campaign_resources.Edit BannerHeader Empty    MassSegment
    banner_campaign_resources.Set Campaign Page
    banner_campaign_resources.Set Choose Banner
    banner_campaign_resources.Set Target    2    0
    banner_campaign_resources.Insert Campaign Date
    banner_campaign_resources.Insert Test Date    ${False}
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Campaign_Edit_${runningNumber}.png
    banner_campaign_resources.Increment
    banner_campaign_resources.Submit Campaign

EDIT_POS_003
    banner_campaign_resources.Date    1    2
    banner_campaign_resources.First List Edit
    banner_campaign_resources.Edit BannerHeader Empty    AddTransAmt
    banner_campaign_resources.Set Campaign Page
    banner_campaign_resources.Set Choose Banner
    banner_campaign_resources.Set Transaction Amount    10000
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Campaign_Edit_${runningNumber}.png
    banner_campaign_resources.Increment
    banner_campaign_resources.Clear Transaction Amount
    banner_campaign_resources.Submit Campaign
EDIT_POS_004

    banner_campaign_resources.Date    2    5
    banner_campaign_resources.First List Edit
    banner_campaign_resources.Edit BannerHeader Empty    TestFlagY
    banner_campaign_resources.Set Campaign Page
    banner_campaign_resources.Set Choose Banner
    banner_campaign_resources.Insert Campaign Date
    banner_campaign_resources.Insert Test Date    ${True}
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Campaign_Edit_${runningNumber}.png
    banner_campaign_resources.Increment
    banner_campaign_resources.Submit Campaign
    
EDIT_POS_005
    banner_campaign_resources.Date    1    2
    banner_campaign_resources.First List Edit
    banner_campaign_resources.Edit BannerHeader Empty    TestBeforeCampStart
    banner_campaign_resources.Insert Campaign Date    10/9/2566    12/9/2566    
    banner_campaign_resources.Insert Test Date    ${True}
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Campaign_Edit_${runningNumber}.png
    banner_campaign_resources.Increment
    banner_campaign_resources.Submit Campaign

EDIT_POS_006
    banner_campaign_resources.First List Edit
    banner_campaign_resources.Edit BannerHeader Empty    endDate    # Exist Campaign Name
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Campaign_Edit_${runningNumber}.png
    banner_campaign_resources.Increment
    banner_campaign_resources.Submit Campaign

EDIT_NEG_001
    banner_campaign_resources.First List Edit
    banner_campaign_resources.Edit BannerHeader Empty    Test#$%@#    # Exist Campaign Name
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    banner_campaign_resources.Submit
    Capture Page Screenshot    Campaign_Edit_${runningNumber}.png
    banner_campaign_resources.Increment
EDIT_NEG_002
    banner_campaign_resources.Edit BannerHeader Empty    # Null Campaign Name
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    banner_campaign_resources.Submit
    Capture Page Screenshot    Campaign_Edit_${runningNumber}.png
    banner_campaign_resources.Increment

EDIT_NEG_003
    banner_campaign_resources.Edit BannerHeader Empty    EndDateBeforeStart
    banner_campaign_resources.Date    3    1
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    banner_campaign_resources.Insert Campaign Date
    banner_campaign_resources.Submit
    Capture Page Screenshot    Campaign_Edit_${runningNumber}.png
    banner_campaign_resources.Increment
EDIT_NEG_004
    banner_campaign_resources.Edit BannerHeader Empty    ทดสอบภาษาไทย
    banner_campaign_resources.Date    3    7
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    banner_campaign_resources.Insert Campaign Date
    banner_campaign_resources.Submit
    Capture Page Screenshot    Campaign_Edit_${runningNumber}.png

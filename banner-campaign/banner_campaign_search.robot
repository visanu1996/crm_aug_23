*** Settings ***
Resource    ../import-campaign.robot
*** Test Cases ***
Search_001
    banner_campaign_resources.Open
    ${Date}    Get Current Date
    ${normalize_path}    Normalize Path    ${CURDIR}../screen-capture/Campaign/Edit/${Date}
    Set Global Variable  ${Path}  ${normalize_path}
    sleep    5s
    banner_campaign_resources.Open Campaign Banner
    banner_campaign_resources.Set Search Campaign
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    banner_campaign_resources.Search Button
    Capture Page Screenshot    Campaign_Search_${runningNumber}.png
    banner_campaign_resources.Increment
Search_002
    banner_campaign_resources.Set Search Campaign    Special@#$
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    banner_campaign_resources.Search Button
    Handle Alert    ACCEPT
    Capture Page Screenshot    Campaign_Search_${runningNumber}.png
    Sleep    2s
    banner_campaign_resources.Increment
Search_003
    banner_campaign_resources.Set Search Campaign    ${EMPTY}    Special@#$
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    banner_campaign_resources.Search Button
    Handle Alert    ACCEPT
    Capture Page Screenshot    Campaign_Search_${runningNumber}.png 
    Sleep    2s
    banner_campaign_resources.Increment
Search_004
    banner_campaign_resources.Set Search Campaign    TESTCAMP    TESTCAMP
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    banner_campaign_resources.Search Button
    Capture Page Screenshot    Campaign_Search_${runningNumber}.png
    banner_campaign_resources.Increment

Search_005
    banner_campaign_resources.Set Search Campaign    NonExistName    NonExistCode
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    banner_campaign_resources.Search Button
    Capture Page Screenshot    Campaign_Search_${runningNumber}.png
    banner_campaign_resources.Increment

Search_006
    banner_campaign_resources.Date    1    2
    banner_campaign_resources.Insert Search Campaign Date
    banner_campaign_resources.Set Search Campaign    ${EMPTY}    ${EMPTY}    1
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    banner_campaign_resources.Search Button
    Capture Page Screenshot    Campaign_Search_${runningNumber}.png 
    banner_campaign_resources.Clear Date value   
    banner_campaign_resources.Increment

Search_007
    banner_campaign_resources.Set Search Campaign    ${EMPTY}    ${EMPTY}    -1    1
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    banner_campaign_resources.Search Button
    Capture Page Screenshot    Campaign_Search_${runningNumber}.png  
    banner_campaign_resources.Increment
Search_008
    banner_campaign_resources.Set Search Campaign
    banner_campaign_resources.Date    -5    2
    banner_campaign_resources.Insert Search Campaign Date    ${addDateStart}    ${EMPTY}
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    banner_campaign_resources.Search Button
    Capture Page Screenshot    Campaign_Search_${runningNumber}.png   
    banner_campaign_resources.Increment
Search_009
    banner_campaign_resources.Set Search Campaign
    banner_campaign_resources.Date    1    -5
    banner_campaign_resources.Insert Search Campaign Date    ${EMPTY}
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    banner_campaign_resources.Search Button
    Capture Page Screenshot    Campaign_Search_${runningNumber}.png   
    banner_campaign_resources.Increment
Search_010
    banner_campaign_resources.Set Search Campaign
    banner_campaign_resources.Date    -1    1    
    banner_campaign_resources.Insert Search Campaign Date
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    banner_campaign_resources.Search Button
    Capture Page Screenshot    Campaign_Search_${runningNumber}.png    
    banner_campaign_resources.Clear Date value
    banner_campaign_resources.Increment

Search_011
    banner_campaign_resources.Set Search Campaign
    banner_campaign_resources.Date    1    -1    
    banner_campaign_resources.Insert Search Campaign Date
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    banner_campaign_resources.Search Button
    Capture Page Screenshot    Campaign_Search_${runningNumber}.png    
    banner_campaign_resources.Clear Button
Search_012
    banner_campaign_resources.Set Search Campaign    Hello    Hi
    SeleniumLibrary.Set Screenshot Directory    ${Path}
    Capture Page Screenshot    campaign_search_clear1.png   
    banner_campaign_resources.Clear Button
    Capture Page Screenshot    campaign_search_clear2.png   
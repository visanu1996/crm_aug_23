*** Settings ***
Documentation    This file use for only Campaign Banner Create, Delete or Edit.
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    DateTime

*** Variables ***
${addDateEnd}
${addDateStart}
${leadUpload}    document.querySelector('input[id="ctl00_cphDataContent_imgPopupLead"]').click()
${runningNumber}    ${1}
&{bannerNumber}    code=""    name=""
${loginPage}    ${LOGIN_PAGE}
&{bannerFields_path}    code=xpath=//tr/td/input[@id="ctl00_cphDataContent_txtCampainCode"]    name=xpath=//tr/td/input[@id="ctl00_cphDataContent_txtCampaignName"]
&{campaign_os}    ios=document.querySelector('input[id="ctl00_cphDataContent_rbtOperatingIOS"]').click()    android=document.querySelector('input[id="ctl00_cphDataContent_rbtOperatingAndroid"]').click()    all=document.querySelector('input[id="ctl00_cphDataContent_rbtOperatingAll"]').click()
&{campaign_target}    all=document.querySelector('input[id="ctl00_cphDataContent_RadioAll"]').click()    segment=document.querySelector('input[id="ctl00_cphDataContent_RadioSegment"]').click()    cid=document.querySelector('input[id="ctl00_cphDataContent_RadioCitizenID"]').click() 
${chooseBanner_path}    xpath=//select[@name="ctl00$cphDataContent$BannerUserControl$bannerNameList"]
${campaignPage_path}    xpath=//select[@name="ctl00$cphDataContent$ddCampaignPage"]
&{campaignDate_path}    dStart=xpath=//input[@name="ctl00$cphDataContent$txtDisplay1DateBegin"]    tStart=xpath=//input[@name="ctl00$cphDataContent$txtDisplay1TimeBegin"]    dEnd=xpath=//input[@name="ctl00$cphDataContent$txtDisplay1DateEnd"]   tEnd=xpath=//input[@name="ctl00$cphDataContent$txtDisplay1TimeEnd"]
&{campaignTestDate_path}    dStart=xpath=//input[@name="ctl00$cphDataContent$txtDisplay1DateBegin"]    tStart=xpath=//input[@name="ctl00$cphDataContent$txtDisplay1TimeBegin"]    dEnd=xpath=//input[@name="ctl00$cphDataContent$txtDisplay1DateEnd"]   tEnd=xpath=//input[@name="ctl00$cphDataContent$txtDisplay1TimeEnd"]
&{targetlead_cid}    campaign_code=document.querySelector('span[id="ctl00_cphCriteriaOrSummaryError_lblTitle"]').parentElement.innerText.split(':').slice(1)[0].trim()
&{searchFields}    campaign_code=xpath=//input[@name="ctl00$cphCriteriaOrSummaryError$txtBannerCampaignCode"]    campaign_name=xpath=//input[@name="ctl00$cphCriteriaOrSummaryError$txtBannerCampaignName"]    status=xpath=//select[@name="ctl00$cphCriteriaOrSummaryError$ddlBannerCampaignStatus"]    cate=xpath=//select[@name="ctl00$cphCriteriaOrSummaryError$ddlCategory"]
${search_btn_path}    xpath=//input[@name="ctl00$cphCriteriaOrSummaryError$btnSearch"]
${clear_btn_path}    xpath=//input[@name="ctl00$cphCriteriaOrSummaryError$btnClear"]
*** Keywords ***
Open
    [Documentation]    open browser
    Open browser    ${loginPage}    chrome
    Maximize Browser Window
    ${curPage}    Get Location
    IF    '${curPage}' == '${loginPage}'
        Login
    END
Login
    Wait Until Element Is Visible    xpath=//input[@name="btnLogin"]
    Click Element    xpath=//input[@name="btnLogin"]
Create Campaign Banner
    Go To    ${SEARCH_CAMPAIGN_PAGE}
    Wait Until Element Is Visible    xpath=//input[@value="Create New"]    10s 
    Click Element    xpath=//input[@value="Create New"]
    Sleep    3s

Open Campaign Banner
    Go To    ${SEARCH_CAMPAIGN_PAGE}
    Wait Until Element Is Visible    xpath=//input[@value="Create New"]    10s 
Set BannerHeader Empty
    [Documentation]    Use this to test with customize banner master name and code
    [Arguments]    ${bannerName}=${EMPTY}    ${bannerCode}=${EMPTY}
    Wait Until Element Is Visible    ${bannerFields_path}[name]    5s
    Input Text    ${bannerFields_path}[name]    ${bannerName}
    Input Text    ${bannerFields_path}[code]    ${bannerCode}

Set BannerHeader    
    ${concateCode}    Catenate    create_${runningNumber}
    ${concatName}    Catenate    POS_Test_${runningNumber}
    Set To Dictionary    ${bannerNumber}    code=${concateCode}    name=${concatName}
    Wait Until Element Is Visible    ${bannerFields_path}[code]    10
    Input Text    ${bannerFields_path}[code]    ${bannerNumber}[code]
    Input Text    ${bannerFields_path}[name]    ${bannerNumber}[name]
Edit BannerHeader Empty
    [Arguments]    ${bannerName}=${EMPTY}
    Wait Until Element Is Visible    ${bannerFields_path}[code]    10
    Input Text    ${bannerFields_path}[name]    ${bannerName}
Increment
    [Documentation]    increment Banner Running Number 
    ...    Ex. before Increment Running Number = 1 After = 2 
    ...    (BAN_1 =>> BAN_2 , Test_1 =>> Test_2)
    Set Global Variable    ${runningNumber}    ${runningNumber+1}

Reset Running Number
    Set Global Variable    ${runningNumber}    ${1}

Set Choose Banner
    [Documentation]    select by label BE1 , IMG7
    [Arguments]    ${param1}=IMG7
    Wait Until Element Is Visible    ${chooseBanner_path} 
    Select From List By Label    ${chooseBanner_path}    ${param1}

Set Campaign Page
    [Documentation]    campaign page need to be "Pay Slip"
    Select From List By Label    ${campaignPage_path}    Pay Slip
Date
    [Documentation]    you can add the date to current date if you want by adding it with params defaule is 0
    [Arguments]    ${dateStart}=${0}    ${dateEnd}=${0}
    ${dateEnd}    Convert To Integer    ${dateEnd}
    ${dateStart}    Convert To Integer    ${dateStart}
    ${curDate}    Get Current Date
    ${addDateEnd}    Add Time To Date    ${curDate}    ${dateEnd} days
    ${addDateStart}    Add Time To Date    ${curDate}    ${dateStart} days
    ${year}    Get Current Date    local    0    %Y
    ${year}    Convert To Integer    ${year}
    Set Global Variable    ${year}    ${year+543}    
    ${addDateStart}    Convert Date    ${addDateStart}    %d/%m/
    ${addDateEnd}    Convert Date    ${addDateEnd}    %d/%m/
    ${addDateStart}    Catenate    ${addDateStart}${year}
    ${addDateEnd}    Catenate    ${addDateEnd}${year}
    Convert To String    ${addDateEnd}
    Convert To String    ${curDate}
    Set Global Variable    ${addDateEnd}    ${addDateEnd}
    Set Global Variable    ${addDateStart}    ${addDateStart}
    
Set OS
    [Documentation]    use this to select banner campaign OS by value 1 eq IOS , 2 eq Android , 3 eq all
    [Arguments]    ${os}=3
    ${os}    Convert To String    ${os}
    IF    ${os} == 3
        Execute Javascript    ${campaign_os}[all]
    ELSE IF    ${os} == 2
        Execute Javascript    ${campaign_os}[android]
    ELSE IF    ${os} == 1
        Execute Javascript    ${campaign_os}[ios]
    ELSE    
        Execute Javascript    ${campaign_os}[all]
    END
Insert Campaign Date
    [Documentation]    date format ex. 30/09/2566 [d/m/y]
    [Arguments]    ${startDate}=${addDateStart}    ${endDate}=${addDateEnd}
    Execute Javascript    document.querySelector('input[name*="txtDisplay1DateBegin"]').value = "${startDate}"
    Execute JavaScript    document.querySelector('input[name*="txtDisplay1DateEnd"]').value = "${endDate}"
    Execute JavaScript    document.querySelector('input[name="ctl00$cphDataContent$txtDisplay1TimeBegin"]').value = "00:00"
    Execute JavaScript    document.querySelector('input[name="ctl00$cphDataContent$txtDisplay1TimeEnd"]').value = "00:00"
    Sleep    5s

Insert Search Campaign Date
    [Documentation]    date format ex. 30/09/2566 [d/m/y]
    [Arguments]    ${startDate}=${addDateStart}    ${endDate}=${addDateEnd}
    Execute Javascript    document.querySelector('input[name="ctl00$cphCriteriaOrSummaryError$txtDisplayStart"]').value = "${startDate}"
    Execute JavaScript    document.querySelector('input[name="ctl00$cphCriteriaOrSummaryError$txtDisplayEnd"]').value = "${endDate}"
    Sleep    5s
Insert Test Date
    [Documentation]    default Test Flag = ${False} date format ex. 30/09/2566 [d/m/y]
    [Arguments]    ${testFlag}=${False}    ${startDate}=${addDateStart}    ${endDate}=${addDateEnd}
    IF    ${testFlag} == ${False}
        Execute Javascript    document.querySelector('input[id="ctl00_cphDataContent_rbtTestFlagNo"]').click()
    ELSE IF    ${testFlag} == ${True}
        Execute Javascript    document.querySelector('input[id="ctl00_cphDataContent_rbtTestFlagYes"]').click()
        Execute JavaScript    document.querySelector('input[name="ctl00$cphDataContent$txtTestFlagDateBegin"]').value = "${startDate}"
        Execute JavaScript    document.querySelector('input[name="ctl00$cphDataContent$txtTestFlagDateEnd"]').value = "${endDate}"
        Execute JavaScript    document.querySelector('input[name="ctl00$cphDataContent$txtTestFlagTimeBegin"]').value = "00:00"
        Execute JavaScript    document.querySelector('input[name="ctl00$cphDataContent$txtTestFlagTimeEnd"]').value = "00:00"
    END

Submit Campaign
    [Documentation]    Use this to save and submit Campaign Banner
    Wait Until Element Is Visible    xpath=//a[@id="ctl00_cphDataContent_btnSubmit"]
    Execute Javascript    document.querySelector('a[id="ctl00_cphDataContent_btnSubmit"]').click()
    Sleep    3s
    Run Keyword And Ignore Error    Alert Should Be Present

Submit
    Execute Javascript    document.querySelector('a[id="ctl00_cphDataContent_btnSubmit"]').click()
    Sleep    3s
Set Target
    [Documentation]    Use this to set target [All=1, Segment=2]
    ...    set segment type [Mass=0, KSE=1, PRIME=2, Privatebanking=3]
    [Arguments]    ${target}=1    ${segType}=1
    Convert To Integer    ${segType}
    IF    ${target} == 1
        Execute Javascript    ${campaign_target}[all]
    ELSE IF    ${target} == 2
        Execute Javascript    ${campaign_target}[segment]
        Wait Until Element Is Visible    xpath=//select[@name="ctl00$cphDataContent$ddSegmentType"]
        IF    ${segType} <= ${3} and ${segType} >= ${0}
            Convert To String    ${segType}
            Select From List By Value    xpath=//select[@name="ctl00$cphDataContent$ddSegmentType"]    ${segType}
        ELSE    
            Select From List By Value    xpath=//select[@name="ctl00$cphDataContent$ddSegmentType"]    1
        END
    ELSE IF    ${target} == 3
        Execute Javascript    ${campaign_target}[cid]
        Execute Javascript    ${leadUpload}
        Sleep    3s
        # @{bid}    Get Browser Ids
        # FOR    ${id}    IN    @{bid}
        #     @{wid}    Get Window Titles
        #     Log To Console    Browser id ${id} and windows title ${wid}
        # END
        # @{windowsHandles}    Get Window Handles
        # FOR    ${id}    IN    @{windowsHandles}
        #     Log To Console    ${id}
        # END
        # comment from July 2024 can't remember of what i'm trying to do at the above comment.
        Upload cid
    END

Set Transaction Amount
    [Documentation]    Input only numeric
    [Arguments]    ${amt}
    Execute Javascript    document.querySelector('input[name="ctl00$cphDataContent$txtTxnAmount"]').value = ${amt}
Clear Transaction Amount
    Execute Javascript    document.querySelector('input[name="ctl00$cphDataContent$txtTxnAmount"]').value = null
Upload cid
    Sleep    5s
    Choose File    xpath=//input[@name="ctl00$cphCriteriaOrSummaryError$flUpload"]    ./Book2.csv
    Sleep    2s
    Execute Javascript    document.querySelector('input[name="ctl00$cphCriteriaOrSummaryError$btnUpload"]').click()
    Wait Until Element Is Visible    xpath=//input[@id="ctl00_cphDataContent_gvTargetLead_ctl03_imgEdit"]
    Execute Javascript    document.querySelector('input[id="ctl00_cphDataContent_gvTargetLead_ctl03_imgEdit"]').click()
    Sleep    2s
    Execute Javascript    document.querySelector('input[id="ctl00_cphDataContent_gvTargetLead_ctl03_txtLeadRef"]').value = "000001"
    Execute Javascript    document.querySelector('input[id="ctl00_cphDataContent_gvTargetLead_ctl03_txtCampaignCode"]').value = ${targetlead_cid}[campaign_code]
    Execute Javascript    document.querySelector('input[id="ctl00_cphDataContent_gvTargetLead_ctl03_txtTargetLeadId"]').value = 15x92x55x2x5
    Execute Javascript    document.querySelector('input[id="ctl00_cphDataContent_gvTargetLead_ctl03_imgUpdate"]')
    Handle Alert
    Sleep    2s
    Execute Javascript    document.querySelector('a[id="ctl00_cphDataContent_lnkSave"]').click()
    Sleep    2s
    Handle Alert

First List Edit
    [Documentation]    Use this to edit the first item on List {from web browser}
    Execute Javascript    document.querySelector('input[name="ctl00$cphDataContent$gvContent$ctl03$imgEdit"]').click()
    Sleep    3s    
First List Copy
    [Documentation]    Use this to copy the first item on List {from web browser}
    Execute Javascript    document.querySelector('input[name="ctl00$cphDataContent$gvContent$ctl03$imgDup"]').click()
Save Campaign
    Sleep    3s
    Execute Javascript    document.querySelector('a[id="ctl00_cphDataContent_btnSave"]').click();    #Save Button

Set Search Campaign
    [Documentation]    use this to search something status value -1 = all 1 = inactive 2 = active , cate value -1 = all
    [Arguments]    ${name}=${EMPTY}    ${code}=${EMPTY}    ${status}=${-1}    ${cate}=${-1}
    Wait Until Element Is Visible    ${searchFields}[campaign_name]
    Sleep    1s
    Input Text    ${searchFields}[campaign_code]    ${code}
    Sleep    1s
    Input Text    ${searchFields}[campaign_name]    ${name}
    Sleep    1s
    Select From List By Value    ${searchFields}[status]    ${status}
    Sleep    1s
    Select From List By Value    ${searchFields}[cate]    ${cate}
    Log To Console    Name${name}
    Log To Console    Code${code}

Search Button
    Click Element    ${search_btn_path}
    Sleep    5s
Clear Button
    Click Element    ${clear_btn_path} 
    Sleep    5s
Clear Date value
    Execute Javascript    document.querySelector('input[name="ctl00$cphCriteriaOrSummaryError$txtDisplayStart"]').value = ""
    Execute JavaScript    document.querySelector('input[name="ctl00$cphCriteriaOrSummaryError$txtDisplayEnd"]').value = ""
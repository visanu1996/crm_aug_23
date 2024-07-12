*** Settings ***
Documentation    This file use for only Master Banner Create, Delete or Edit.
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String

*** Variables ***
${detailTH_path}    xpath=//td[@id="ctl00_cphDataContent_setUpCkeDetailTH"]/span/span/span//td[@id="cke_contents_ctl00_cphDataContent_ckeDetailThai"]
${loginPage}    ${LOGIN_PAGE}
${testPage}    https://google.co.th/

&{bannerFields_path}    code=xpath=//tr/td/input[@id="ctl00_cphDataContent_txtBannerCode"]    name=xpath=//tr/td/input[@id="ctl00_cphDataContent_txtBannerName"]
${runningNumber}    ${1}
&{bannerNumber}    code=""    name=""
&{CalltoAction1}    none=1    ltc=2    url=3    ltp=4    locator=xpath=//select[@name="ctl00$cphDataContent$ddlAction1"]
&{CalltoAction2}    none=1    url=3    ltp=4    locator=xpath=//select[@name="ctl00$cphDataContent$ddlAction2"]
&{CalltoAction3}    none=1    url=3    ltp=4    locator=xpath=//select[@name="ctl00$cphDataContent$ddlAction3"]
${ltcDetailTH}    xpath=//td[@id="cke_contents_ctl00_cphDataContent_ckeDetailThai"]//iframe    
${ltcDetailEN}    xpath=//td[@id="cke_contents_ctl00_cphDataContent_ckeDetailEng"]//iframe   
&{linktocontent}    d_th=Hello    d_en=Hi There!    img_th=""    img_en=""
&{action2_detail}    btn_th=สวัสดี    btn_en=Hello    url_th=https://www.google.co.th   url_en=https://www.google.co.th
&{action3_detail}    btn_th=สวัสดี    btn_en=Hello    url_th=https://www.google.co.th   url_en=https://www.google.co.th
${editFisrtBanner}    xpath=//input[@name="ctl00$cphDataContent$gvContent$ctl03$imgEdit"]    #document.querySelector('input[name="ctl00$cphDataContent$gvContent$ctl03$imgEdit"]')
&{searchFields}    name=xpath=//input[@name="ctl00$cphCriteriaOrSummaryError$txtBannerName"]    templateID=xpath=//input[@name="ctl00$cphCriteriaOrSummaryError$txtBannerTemplateID"]    status=xpath=//select[@name="ctl00$cphCriteriaOrSummaryError$ddlBannerStatus"]

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


# /*****************************   CREATE ZONE   ****************************/
Open Master Banner Page
    Go To    ${SEARCH_BANNER_PAGE}
    Sleep    3s
Create Master Banner
    Go To    ${SEARCH_BANNER_PAGE}
    Wait Until Element Is Visible    xpath=//input[@value="Create New "]    10s 
    Click Element    xpath=//input[@value="Create New "]
    Sleep    3s
Set DetailTH
    [Arguments]    ${TH}
    Click Element    ${detailTH_path}
    Input Text    ${detailTH_path}    ${TH}

Set BannerHeader Empty
    [Documentation]    Use this to test with customize banner master name and code
    [Arguments]    ${bannerName}=${EMPTY}    ${bannerCode}=${EMPTY}
    Wait Until Element Is Visible    ${bannerFields_path}[name]    5s
    Input Text    ${bannerFields_path}[name]    ${bannerName}
    Input Text    ${bannerFields_path}[code]    ${bannerCode}

Set BannerHeader    
    ${concateCode}    Catenate    Auto_${runningNumber}
    ${concatName}    Catenate    Test_${runningNumber}
    Set To Dictionary    ${bannerNumber}    code=${concateCode}    name=${concatName}
    Wait Until Element Is Visible    ${bannerFields_path}[code]    10
    Input Text    ${bannerFields_path}[code]    ${bannerNumber}[code]
    Input Text    ${bannerFields_path}[name]    ${bannerNumber}[name]

Set BannerHeader Negative
    ${concateCode}    Catenate    Neg_${runningNumber}
    ${concatName}    Catenate    Neg_${runningNumber}
    Set To Dictionary    ${bannerNumber}    code=${concateCode}    name=${concatName}
    Wait Until Element Is Visible    ${bannerFields_path}[code]    10
    Input Text    ${bannerFields_path}[code]    ${bannerNumber}[code]
    Input Text    ${bannerFields_path}[name]    ${bannerNumber}[name]

Edit BannerHeader
    ${concatName}    Catenate    Edit_${runningNumber}
    Set To Dictionary    ${bannerNumber}    name=${concatName}
    Wait Until Element Is Visible    ${bannerFields_path}[code]    10
    Input Text    ${bannerFields_path}[name]    ${bannerNumber}[name]
Edit BannerHeader Empty
    [Documentation]    Use this to test with customize banner master name and code
    [Arguments]    ${bannerName}=${EMPTY}
    Wait Until Element Is Visible    ${bannerFields_path}[name]    5s
    Input Text    ${bannerFields_path}[name]    ${bannerName}
Increment
    [Documentation]    increment Banner Running Number 
    ...    Ex. before Increment Running Number = 1 After = 2 
    ...    (BAN_1 =>> BAN_2 , Test_1 =>> Test_2)
    Set Global Variable    ${runningNumber}    ${runningNumber+1}

Reset Running Number
    Set Global Variable    ${runningNumber}    ${1}
Clear Pictures
    Execute Javascript    document.querySelector('input[name="ctl00$cphDataContent$btnRemoveFileIconTH"]').click()
    Execute Javascript    document.querySelector('input[name="ctl00$cphDataContent$btnRemoveFileIconEN"]').click()
Add Pictures
    [Arguments]    ${pic1}=../pictures/normalsize1.png    ${pic2}=../pictures/normalsize3.png
    Execute Javascript    document.querySelectorAll("button.yui3-button")[0].nextElementSibling.style.visibility='visible'
    Choose File    xpath=//table[@id="ctl00_cphDataContent_iconTH"]/tbody/tr/td[2]/div/div/div/input   ${pic1}
    Sleep    2s
    Execute Javascript    document.querySelectorAll("button.yui3-button")[1].nextElementSibling.style.visibility='visible'
    Choose File    xpath=//table[@id="ctl00_cphDataContent_iconEN"]/tbody/tr/td[2]/div/div/div/input    ${pic2}
    Sleep    2s
Submit Master
    [Documentation]    Use this to save and submit Master Banner
    Wait Until Element Is Visible    xpath=//a[@id="ctl00_cphDataContent_btnSubmit"]
    Click Element    xpath=//a[@id="ctl00_cphDataContent_btnSubmit"]
    Sleep    5s
    # Run Keyword And Ignore Error    Press Keys    /html/body    ENTER
    Run Keyword And Ignore Error    Alert Should Be Present
    Sleep    5s
Submit
    [Documentation]    Use this to save and submit Master Banner
    Click Element    xpath=//a[@id="ctl00_cphDataContent_btnSubmit"]
    Sleep    2s
Set Detail
    [Documentation]    to set Detail into dict type variable before using in Set Call To Action
    [Arguments]    ${c1d_th}    ${c1d_en}
    Set To Dictionary    ${linktocontent}    d_th=${c1d_th}    d_en=${c1d_en}
Set Link to Content
        Wait Until Element Is Visible    ${ltcDetailTH}    5s
        Select Frame    ${ltcDetailTH}
        Execute Javascript    document.querySelector('[class="cke_show_borders"]').innerHTML=${linktocontent}[d_th]
        Unselect Frame
        Scroll Element Into View    xpath=//a[@id="ctl00_cphDataContent_btnSubmit"]
        Select Frame    ${ltcDetailEN}
        Execute Javascript    document.querySelector('[class="cke_show_borders"]').innerHTML=${linktocontent}[d_en]
        Unselect Frame

Set Action2 Detail
    [Documentation]    Use this to set customize button text , Url link.
    ...    Use url only when action2 = url
    [Arguments]    ${txt_th}    ${txt_en}    ${url_th}=${action2_detail}[url_th]    ${url_en}=${action2_detail}[url_en]    
    Set To Dictionary    ${action2_detail}    btn_th=${txt_th}    btn_en=${txt_en}    url_th=${url_th}    url_en=${url_en}

Set Action3 Detail
    [Documentation]    Use this to set customize button text , Url link.
    ...    Use url only when action3 = url
    [Arguments]    ${txt_th}    ${txt_en}    ${url_th}=${action3_detail}[url_th]    ${url_en}=${action3_detail}[url_en]    
    Set To Dictionary    ${action3_detail}    btn_th=${txt_th}    btn_en=${txt_en}    url_th=${url_th}    url_en=${url_en}

Reset Call to Action
    Select From List By Value    ${CalltoAction1}[locator]    ${CalltoAction1}[none]
    Sleep    3s
Set URL 2
        Sleep    2s
        Input Text    //input[@id="ctl00_cphDataContent_txtActionURL2"]    ${action2_detail}[url_th]
        Input Text    //input[@id="ctl00_cphDataContent_txtActionURL2EN"]    ${action2_detail}[url_en]
        Input Text    //input[@id="ctl00_cphDataContent_txtButtonTH2"]    ${action2_detail}[btn_th]
        Input Text    //input[@id="ctl00_cphDataContent_txtButtonEN2"]    ${action2_detail}[btn_en]

Set URL 3
        Sleep    2s
        Input Text    //input[@id="ctl00_cphDataContent_txtActionURL3"]    ${action3_detail}[url_en]
        Input Text    //input[@id="ctl00_cphDataContent_txtActionURL3EN"]    ${action3_detail}[url_en]
        Input Text    //input[@id="ctl00_cphDataContent_txtButtonTH3"]    ${action3_detail}[btn_th]
        Input Text    //input[@id="ctl00_cphDataContent_txtButtonEN3"]    ${action3_detail}[btn_en]
Set KMA Page 2
        Sleep    2s
        Select From List By Value    //select[@id="ctl00_cphDataContent_ddlGoToPage2"]    5
        Input Text    //input[@id="ctl00_cphDataContent_txtButtonTH2"]    ${action2_detail}[btn_th]
        Input Text    //input[@id="ctl00_cphDataContent_txtButtonEN2"]    ${action2_detail}[btn_en]

Set KMA Page 3
        Sleep    2s
        Input Text    //input[@id="ctl00_cphDataContent_txtButtonTH3"]    ${action3_detail}[btn_th]
        Input Text    //input[@id="ctl00_cphDataContent_txtButtonEN3"]    ${action3_detail}[btn_en]
        Select From List By Value    //select[@id="ctl00_cphDataContent_ddlGoToPage3"]    5    # 5 = Pay Bill
Set Call to Action
    [Documentation]    3 Arguments can pass in this keyword action1 , 2 and 3.
    ...    Action1 can pass 1 = none , 2 = link to conten , 3 = url landing and 4 = link to kma page
    ...    Action 2 and can only pass with 1 = none , 3 = url landing and 4 = link to kma page
    ...    all action can be "EMPTY"
    [Arguments]    ${action1}=1    ${action2}=1    ${action3}=1
    IF    '${action1}' != '${EMPTY}'
        Convert To String    ${action1}
    ELSE IF    '${action2}' != '${EMPTY}'
        Convert To String    ${action2}  
    ELSE IF    '${action3}' != '${EMPTY}'
        Convert To String    ${action3}
    END
# ///////////////////////////////////////////////////////////
    IF    '${action1}' == "2" and '${action2}' == "4" and '${action3}' == "3"     # Call to Action 1 = Link to Content , Call to Action 2 = Link to KMA Page ,Call to Action 3 = URL Landing
        Select From List By Value    ${CalltoAction1}[locator]    ${CalltoAction1}[ltc]
        Set Link to Content
        Select From List By Value    ${CalltoAction2}[locator]    ${CalltoAction2}[ltp]
        Set KMA Page 2
        Select From List By Value    ${CalltoAction3}[locator]    ${CalltoAction3}[url]
        Set URL 3
    ELSE IF    '${action1}' == "2" and '${action2}' == "4" and '${action3}' == "4"    # Call to Action 1 = Link to Content , Call to Action 2 = Link to KMA Page ,Call to Action 3 = Link to KMA Page
        Select From List By Value    ${CalltoAction1}[locator]    ${CalltoAction1}[ltc]
        Set Link to Content
        Select From List By Value    ${CalltoAction2}[locator]    ${CalltoAction2}[ltp]
        Set KMA Page 2
        Select From List By Value    ${CalltoAction3}[locator]    ${CalltoAction3}[ltp]
        Set KMA Page 3
    ELSE IF    '${action1}' == "2" and '${action2}' == "3" and '${action3}' == "4"    # Call to Action 1 = Link to Content , Call to Action 2 = URL Landing ,Call to Action 3 = Link to KMA Page
        Select From List By Value    ${CalltoAction1}[locator]    ${CalltoAction1}[ltc]
        Set Link to Content    
        Select From List By Value    ${CalltoAction2}[locator]    ${CalltoAction2}[url]
        Set URL 2
        Select From List By Value    ${CalltoAction3}[locator]    ${CalltoAction3}[ltp]
        Set KMA Page 3
    ELSE IF    '${action1}' == "2" and '${action2}' == "3" and '${action3}' == "3"    # Call to Action 1 = Link to Content , Call to Action 2 = URL Landing ,Call to Action 3 = URL Landing
        Select From List By Value    ${CalltoAction1}[locator]    ${CalltoAction1}[ltc]
        Set Link to Content
        Select From List By Value    ${CalltoAction2}[locator]    ${CalltoAction2}[url]
        Set URL 2
        Select From List By Value    ${CalltoAction3}[locator]    ${CalltoAction3}[url]
        Set URL 3
    ELSE IF    '${action1}' == "2" and '${action2}' == "3" and '${action3}'    # Call to Action 1 = Link to Content , Call to Action 2 = URL Landing ,Call to Action 3 = none
        Select From List By Value    ${CalltoAction1}[locator]    ${CalltoAction1}[ltc]
        Set Link to Content
        Select From List By Value    ${CalltoAction2}[locator]    ${CalltoAction1}[url]
        Set URL 2
    ELSE IF    '${action1}' == "2" and '${action2}' == "4" and '${action3}'     # Call to Action 1 = Link to Content , Call to Action 2 = Link to KMA Page ,Call to Action 3 = none
        Select From List By Value    ${CalltoAction1}[locator]    ${CalltoAction1}[ltc]
        Set Link to Content
        Select From List By Value    ${CalltoAction2}[locator]    ${CalltoAction1}[ltp]
        Set KMA Page 2
    ELSE IF    '${action1}' == "2"    # Call to Action 1 = Link to Conten , Call to Action 2,3 none
        Select From List By Value    ${CalltoAction1}[locator]    ${CalltoAction1}[ltc]
        Set Link to Content    
    ELSE IF    '${action1}' == "3"    # Call to Action 1 = URL Landing , Call to Action 2,3 none
        Select From List By Value    ${CalltoAction1}[locator]    ${CalltoAction1}[url]
        Input Text    //input[@id="ctl00_cphDataContent_txtActionURL1"]    https://www.google.co.th
        Input Text    //input[@id="ctl00_cphDataContent_txtActionURL1EN"]    https://www.google.co.th
    ELSE IF    '${action1}' == "4"    # Call to Action 1 = Link to KMA Page , Call to Action 2,3 none
        Select From List By Value    ${CalltoAction1}[locator]    ${CalltoAction1}[ltp]
        Select From List By Value    //select[@id="ctl00_cphDataContent_ddlGoToPage1"]    5    # 5 = Pay Bill
    END

# /*****************************   EDIT ZONE   ****************************/

First List Edit
    #ctl00_cphDataContent_gvContent_ctl03_imgEdit
    Execute Javascript    document.querySelector('input[name="ctl00$cphDataContent$gvContent$ctl03$imgEdit"]').click()
First List Copy
    Execute Javascript    document.querySelector('input[name="ctl00$cphDataContent$gvContent$ctl03$imgDup"]').click()

Set Search Master
    [Documentation]    use this to search something status value -1 = all 1 = inactive 2 = active
    [Arguments]    ${name}=${EMPTY}    ${template}=${EMPTY}    ${status}=${-1}
    Wait Until Element Is Visible    ${searchFields}[name]
    Sleep    1s
    Input Text    ${searchFields}[name]    ${name}
    Sleep    1s
    Input Text    ${searchFields}[templateID]    ${template}
    Sleep    1s
    Select From List By Value    ${searchFields}[status]    ${status}
Click Search Master
    Execute Javascript    document.querySelector('input[name="ctl00$cphCriteriaOrSummaryError$btnSearch"]').click()
    Sleep    3s

Popup Handle
    Handle Alert    ACCEPT
Clear Search Master
    Execute Javascript    document.querySelector('input[name="ctl00$cphCriteriaOrSummaryError$btnClear"]').click()
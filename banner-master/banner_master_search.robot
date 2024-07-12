*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
Library    DateTime
Resource    ../keywords/banner-resources/banner_master_resources.robot

*** Test Cases ***

SEARCH001
    Open    
    ${Date}    Get Current Date
    Set Global Variable  ${Path}  /Users/7n100350/Desktop/CRM ROBOT/screen-capture/Search/${Date}
    sleep    5s
    Open Master Banner Page
    Set Search Master
    Click Search Master
    Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Master_Test_${runningNumber}.png
SEARCH002
    Set Search Master    $#$%
    Click Search Master
    Popup Handle
    Capture Page Screenshot    Master_Test_${runningNumber}.png
SEARCH004
    Set Search Master    ${EMPTY}    @#$  
    Click Search Master  
    Popup Handle
    Capture Page Screenshot    Master_Test_${runningNumber}.png
SEARCH005
    Set Search Master    IMG7        
    Click Search Master
    Capture Page Screenshot    Master_Test_${runningNumber}.png
SEARCH006
    Set Search Master    ${EMPTY}    2023082913430002
    Click Search Master
    Capture Page Screenshot    Master_Test_${runningNumber}.png
SEARCH007
    Set Search Master    ergesvgresrbg
    Click Search Master
    Capture Page Screenshot    Master_Test_${runningNumber}.png
SEARCH008
    Set Search Master    ${EMPTY}    ergwgwergewrg
    Click Search Master
    Capture Page Screenshot    Master_Test_${runningNumber}.png
SEARCH009
    Set Search Master    ${EMPTY}    ${EMPTY}    ${1}
    Click Search Master
    Capture Page Screenshot    Master_Test_${runningNumber}.png
SEARCH010
    Set Search Master   WGEGWEg    WEGWEG     ${2}
    Capture Page Screenshot    Master_Test_${runningNumber}_1.png
    Clear Search Master
    Capture Page Screenshot    Master_Test_${runningNumber}_2.png
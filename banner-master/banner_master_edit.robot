*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
Library    DateTime
Resource    ../keywords/banner-resources/banner_master_resources.robot
*** Test Cases ***

Edit 01
    Open
    ${Date}    Get Current Date
    Set Global Variable  ${Path}  /Users/7n100350/Desktop/CRM ROBOT/screen-capture/Master/Edit/${Date}    
    sleep    5s
    Open Master Banner Page
    First List Edit
    Edit BannerHeader
    Clear Pictures
    Add Pictures    /Users/7n100350/Desktop/Test Robot/Pictures/normalsize3.png    /Users/7n100350/Desktop/Test Robot/Pictures/normalsize3.png
    Reset Call to Action
    Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Master_Test_${runningNumber}.png
    Increment
    Submit Master

Edit 02
    First List Edit
    Edit BannerHeader
    Clear Pictures
    Add Pictures
    Set Detail    "Hello My Friends"    "Sup Bro!"
    Set Call to Action   2   
    Capture Page Screenshot    Master_Test_${runningNumber}.png     
    Increment
    Submit Master

Edit 03
    First List Edit
    Edit BannerHeader
    Set Detail    "สวัสดีครับผม"    "ดีจ้าาทดสอบ Robot นะ"
    Set Call to Action   2  
    Capture Page Screenshot    Master_Test_${runningNumber}.png      
    Increment
    Submit Master

Edit 04
    First List Edit
    Edit BannerHeader
    Set Call to Action    3
    Capture Page Screenshot    Master_Test_${runningNumber}.png      
    Increment
    Submit Master

Edit 05
    First List Edit
    Edit BannerHeader
    Set Call to Action    4
    Capture Page Screenshot    Master_Test_${runningNumber}.png      
    Increment
    Submit Master

Edit 06
    First List Edit
    Edit BannerHeader
    Set Detail    "ทดสอบ Link to Content + URL + KMA Page"    "Robot Framework"
    Set Call to Action    2    3    4
    Capture Page Screenshot    Master_Test_${runningNumber}.png      
    Increment
    Submit Master

Edit 07
    First List Edit
    Edit BannerHeader
    Set Detail    "ทดสอบ Link to Content + KMA Page + KMA Page"    "Robot Framework"
    Set Call to Action    2    4    4
    Capture Page Screenshot    Master_Test_${runningNumber}.png      
    Increment
    Submit Master

Edit 08
    First List Edit
    Edit BannerHeader
    Set Detail    "ทดสอบ Link to Content + URL + URL"    "Robot Framework"
    Set Call to Action    2    3    3
    Capture Page Screenshot    Master_Test_${runningNumber}.png      
    Increment
    Submit Master

Edit 09
    First List Edit
    Edit BannerHeader
    Set Detail    "ทดสอบ Link to Content + KMA Page + URL"    "Robot Framework"
    Set Call to Action    2    4    3    
    Capture Page Screenshot    Master_Test_${runningNumber}.png      
    Increment
    Submit Master
Edit 10
    First List Edit
    Edit BannerHeader
    Set Detail    "ทดสอบ Link to Content + URL"    "Robot Framework"
    Set Call to Action    2    3
    Capture Page Screenshot    Master_Test_${runningNumber}.png      
    Increment
    Submit Master
Edit 11
    First List Edit
    Edit BannerHeader
    Set Detail    "ทดสอบ Link to Content + KMA Page"    "Robot Framework"
    Set Call to Action    2    4
    Capture Page Screenshot    Master_Test_${runningNumber}.png      
    Increment
    Submit Master    

Edit 12
    First List Edit
    Edit BannerHeader Empty    Test_100_Characters_For_Banner_Name_Test_100_Characters_For_Banner_Name_Test_100_Characters_For_Bann
    Capture Page Screenshot    Master_Test_${runningNumber}.png      
    Submit Master
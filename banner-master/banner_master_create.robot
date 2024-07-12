*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
Library    DateTime
Resource    ../keywords/banner-resources/banner_master_resources.robot


*** Test Cases ***

TC_Positive_01    
    Open    
    ${Date}    Get Current Date
    Set Global Variable  ${Path}  /Users/7n100350/Desktop/CRM ROBOT/screen-capture/Master/Create/${Date}
    sleep    5s
    Create Master Banner
    Set BannerHeader
    Add Pictures
    Set Screenshot Directory    ${Path}
    Capture Page Screenshot    Master_Test_${runningNumber}.png
    Increment
    Submit Master

TC_Positive_02
    Create Master Banner
    Set BannerHeader
    Add Pictures
    Set Detail    "Hello My Friends"    "Sup Bro!"
    Set Call to Action   2      
    Capture Page Screenshot    Master_Test_${runningNumber}.png 
    Increment
    Submit Master

TC_Positive_03
    Create Master Banner
    Set BannerHeader
    Add Pictures
    Set Detail    "สวัสดีครับผม"    "ดีจ้าาทดสอบ Robot นะ"
    Set Call to Action   2        
    Capture Page Screenshot    Master_Test_${runningNumber}.png
    Increment
    Submit Master

TC_Positive_04
    Create Master Banner
    Set BannerHeader
    Add Pictures
    Set Call to Action    3
    Capture Page Screenshot    Master_Test_${runningNumber}.png
    Increment
    Submit Master

TC_Positive_05
    Create Master Banner
    Set BannerHeader
    Add Pictures
    Set Call to Action    4
    Capture Page Screenshot    Master_Test_${runningNumber}.png
    Increment
    Submit Master

TC_Positive_06
    Create Master Banner
    Set BannerHeader
    Add Pictures
    Set Detail    "ทดสอบ Link to Content + URL + KMA Page"    "Robot Framework"
    Set Call to Action    2    3    4
    Capture Page Screenshot    Master_Test_${runningNumber}.png
    Increment
    Submit Master

TC_Positive_07
    Create Master Banner
    Set BannerHeader
    Add Pictures
    Set Detail    "ทดสอบ Link to Content + KMA Page + KMA Page"    "Robot Framework"
    Set Call to Action    2    4    4
    Capture Page Screenshot    Master_Test_${runningNumber}.png
    Increment
    Submit Master

TC_Positive_08
    Create Master Banner
    Set BannerHeader
    Add Pictures
    Set Detail    "ทดสอบ Link to Content + URL + URL"    "Robot Framework"
    Set Call to Action    2    3    3
    Capture Page Screenshot    Master_Test_${runningNumber}.png
    Increment
    Submit Master

TC_Positive_09
    Create Master Banner
    Set BannerHeader
    Add Pictures
    Set Detail    "ทดสอบ Link to Content + KMA Page + URL"    "Robot Framework"
    Set Call to Action    2    4    3    
    Capture Page Screenshot    Master_Test_${runningNumber}.png
    Increment
    Submit Master
TC_Positive_10
    Create Master Banner
    Set BannerHeader
    Add Pictures
    Set Detail    "ทดสอบ Link to Content + URL"    "Robot Framework"
    Set Call to Action    2    3
    Capture Page Screenshot    Master_Test_${runningNumber}.png
    Increment
    Submit Master
TC_Positive_11
    Create Master Banner
    Set BannerHeader
    Add Pictures
    Set Detail    "ทดสอบ Link to Content + KMA Page"    "Robot Framework"
    Set Call to Action    2    4
    Capture Page Screenshot    Master_Test_${runningNumber}.png
    Increment
    Submit Master    

TC_Positive_12
    Create Master Banner
    Set BannerHeader Empty    Test_100_Characters_For_Banner_Name_Test_100_Characters_For_Banner_Name_Test_100_Characters_For_Bann    20_Characters_Tested
    Add Pictures
    Capture Page Screenshot    Master_Test_${runningNumber}.png
    Submit Master



# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Test Cases 000
#     Open    
#     sleep    5s
#     Create Master Banner
#     Set BannerHeader Empty    Testing_Set_Action_Detail2url    test_0000
#     Add Pictures
#     Set Detail    "ทดสอบเฉย ๆ"    "Robot"
#     Set Action2 Detail    ปุ่มไทย    EngBtn    https://www.youtube.com    https://www.youtube.com
#     Set Call to Action    2    3
#     Submit Master
# Test Cases 001
#     Create Master Banner
#     Set BannerHeader Empty    Testing_Set_Action_Detail2kma    test_0001
#     Add Pictures
#     Set Detail    "ทดสอบเฉย ๆ"    "Robot"
#     Set Action2 Detail    ปุ่มไทย    EngBtn
#     Set Call to Action    2    4
#     Submit Master

# Test Cases 002
#     Create Master Banner
#     Set BannerHeader Empty    Testing_Set_Action_Detail2kma3url    test_0002
#     Add Pictures
#     Set Detail    "ทดสอบเฉย ๆ"    "Robot"
#     Set Action2 Detail    ปุ่มไทย    EngBtn
#     Set Action3 Detail    กูเกิ้ล    google    https://www.google.co.th    https://www.google.co.th
#     Set Call to Action    2    4    3
#     Submit Master

TC_Negative_01    #Special Chars Name
    Open
    # ${Date}    Get Current Date
    # Set Global Variable  ${Path}  /Users/7n100350/Desktop/Test Robot/Screen Captures/${Date}
    Reset Running Number
    Create Master Banner
    Set BannerHeader Empty    Test002@#$    Test002@#$
    Add Pictures
    Submit
    Set Screenshot Directory    ${Path}
    Capture Page Screenshot    TC_Neg_1.png
    Increment

TC_Negative_02    #No Pics
    Reload Page
    Sleep    3s
    Set BannerHeader Negative
    Submit
    Set Screenshot Directory    ${Path}
    Capture Page Screenshot    TC_Neg_2.png
    Increment  

TC_Negative_03    #Non Pics type file
    Reload Page
    Sleep    3s
    Set BannerHeader Negative
    Run Keyword And Ignore Error    Add Pictures    /Users/7n100350/Desktop/Test Robot/log.html
    Set Screenshot Directory    ${Path}
    Capture Page Screenshot    TC_Neg_3.png
    Increment

TC_Negative_04    #Over size Pic
    Reload Page
    Sleep    3s
    Set BannerHeader Negative
    Run Keyword And Ignore Error    Add Pictures    /Users/7n100350/Desktop/Test Robot/Pictures/oversize1.jpg
    Set Screenshot Directory    ${Path}
    Capture Page Screenshot    TC_Neg_4.png
    Increment
TC_Negative_05    #Null Details
    Reload Page
    Sleep    3s
    Set BannerHeader Negative
    Add Pictures
    # Select From List By Value    ${CalltoAction1}[locator]    ${CalltoAction1}[ltc]    #Call to Action 1 = Link to Content
    Set Detail    "${EMPTY}"    "${EMPTY}"    
    Set Call to Action    2
    Submit      
    Set Screenshot Directory    ${Path}
    Capture Page Screenshot    TC_Neg_5.png
    Increment

TC_Negative_06    #Over 4000 Chars in Detail
    Reload Page
    Sleep    3s
    Set BannerHeader Negative
    Add Pictures
    Set Detail    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"    "Hi"
    Set Call to Action    2
    Submit      
    Set Screenshot Directory    ${Path}
    Capture Page Screenshot    TC_Neg_6.png
    Increment

TC_Negative_07    #Null Banner Code and Name
    Reload Page
    Sleep    3s
    Add Pictures
    Submit
    Set Screenshot Directory    ${Path}
    Capture Page Screenshot    TC_Neg_7.png
    Increment

TC_Negative_08    #Call to Action 1 = URL with Null URL
    Reload Page    
    Sleep    3s
    Set BannerHeader Negative
    Add Pictures
    Set Call to Action    3
    Submit
    Set Screenshot Directory    ${Path}
    Capture Page Screenshot    TC_Neg_8.png
    Increment
TC_Negative_09    #Call to Action 2 = URL wrong lang btn and non web format for url
    Reload Page    
    Sleep    3s
    Set BannerHeader Negative
    Add Pictures
    Set Detail    "ดี"    "Hi"
    Set Action2 Detail    Hi    ดี    hello@    dwedwedf
    Set Call to Action    2    3
    Submit
    Set Screenshot Directory    ${Path}
    Capture Page Screenshot    TC_Neg_9.png
    Increment

TC_Negative_10    #Exist Banner Name
    Reload Page
    Sleep    3s
    Set BannerHeader Empty    Auto_Test_1    HelloWorld
    Add Pictures
    Submit
    Set Screenshot Directory    ${Path}
    Capture Page Screenshot    TC_Neg_10.png
    Increment   
    
TC_Negative_11    #Exist Banner Code
    Reload Page
    Sleep    3s
    Set BannerHeader Empty    HelloWorld    Auto_BAN_1
    Add Pictures
    Submit
    Set Screenshot Directory    ${Path}
    Capture Page Screenshot    TC_Neg_11.png
    Increment   

TC_Negative_12    #Thai Lang Banner Code and Name
    Reload Page
    Sleep    3s
    Set BannerHeader Empty    ดีครับ    ดีค้า
    Add Pictures
    Submit
    Set Screenshot Directory    ${Path}
    Capture Page Screenshot    TC_Neg_12.png
    Increment   
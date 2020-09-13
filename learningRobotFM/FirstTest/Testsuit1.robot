*** Settings ***
Library    SeleniumLibrary   
#Suite Setup    Log Title  
#Test Setup    Set Browser Implicit Wait    5
#Test Teardown    Log To Console    Testcase completed    
#Suite Teardown    Log Source    
# Default Tags    

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
${username}     admin    #userid
${password}    admin123    #password
@{credentials}    admin    admin123    tushar    kusmude    #list valiriables

&{logindetails}    username=admin    password=admin123    #dictionary validable

*** Keywords ***

LoginApplicationwithScaler
    # click    name=txtUsername
    Input Text    name=txtUsername    ${username}
    Input Password    name=txtPassword    ${password}    
    Click Button    id=btnLogin   
    

LoginApplicationwithList
    # click    name=txtUsername
    Input Text    name=txtUsername    ${credentials}[0]
    Input Password    name=txtPassword    ${credentials}[1]    
    Click Button    id=btnLogin     

LoginApplicationwithDictionary
    # click    name=txtUsername
    Input Text    name=txtUsername    &{logindetails} username
    Input Password    name=txtPassword    &{logindetails} password 
    Click Button    id=btnLogin

*** Test Cases ***
MyFirstTest
    Log   hello world... 
    
MyFirstSeleniumTestCase
    Open Browser                https://www.google.com        gc 
    Set Selenium Implicit Wait    5    
    #Click Button                name=q
    Input Text    name=q           seleniumhq 
    Press Keys    name=q    ESC    
    Sleep    2       
    Click Button         name=btnK   
    Set Selenium Implicit Wait  5     
    Log      This is working fine
    Close Browser


SimpleLogin application
    [Tags]     scalerlogin
    Open Browser    ${URL}     gc
    Set Browser Implicit Wait    3
    LoginApplicationwithScaler
    Element Should Be Visible    id=welcome
    Element Should Be Visible    link=Assign Leave 
    Element Should Be Visible    link=Leave List    
    Click Link    id=welcome
    Click Link    link=Logout    
    Close Browser   
    
SimpleListLoginApplication
    [Tags]     scalerlogin
    Open Browser    ${URL}     gc
    Set Browser Implicit Wait    3
    LoginApplicationwithList
    Element Should Be Visible    id=welcome
    Element Should Be Visible    link=Assign Leave 
    Element Should Be Visible    link=Leave List    
    Click Link    id=welcome
    Click Link    link=Logout    
    Close Browser   
        
*** Settings ***
Test Setup        GoToHome
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${URL}            http://opensource.demo.orangehrmlive.com/index.php/auth/login
@{Credentials}    Admin    admin
&{Creds}          Uname=Admin    Pass=admin

*** Test Cases ***
Test1
    [Tags]    t1
    Input Text    txtUsername    @{Credentials}[0]
    Input Password    txtPassword    @{Credentials}[1]
    Click Button    btnLogin

Test2
    [Tags]    t2
    Login
    Log To Console    Ravi1 have run the job on this Linux OS

Test3
    [Tags]    t3
    Input Text    txtUsername    @{Credentials}[0]
    Input Password    txtPassword    @{Credentials}[1]
    Click Button    btnLogin

Test4
    [Tags]    t4
    Login
    ${OS}    Get Environment Variable    DESKTOP_SESSION
    ${UName}    Get Environment Variable    USER
    Log To Console    ${UName} have run the command on ${OS} OS

*** Keywords ***
Login
    Input Text    txtUsername    &{Creds}[Uname]
    Input Password    txtPassword    &{Creds}[Pass]
    Click Button    btnLogin

GoToHome
    Open Browser    ${URL}    headlessfirefox

*** Settings ***
Library     Browser
Resource    ${EXECDIR}/Tests/Test_2/Resources/Login_Locator.resource
Variables   ${EXECDIR}/Tests/Test_2/Resources/Configure.yml


*** Variables ***
# Test Data
${USERNAME}                           tomholland
${PASSWORD}                           Password!
# Expected Values
${LABEL_ALERT_LOGIN_FAILED}          Your username is invalid!


*** Test Cases ***
TEST3 Login failed - Username not found
    [Documentation]    Owner : Tawan Duangchit
    ...    |    ***| Objective |***
    ...    |    To verify that users can login unsuccessfully when they input a username that did not exist.
    ...    ==>
    Browser.Open Browser    url=${URL}    browser=${BROWSER}    headless=${True}    pause_on_failure=${False}
    Login Page - Verify Login Page
    Login Page - Input Username And Password    username=${USERNAME}    password=${PASSWORD}
    Login Page - Click Login Button
    Login Page - Validate Alert Login Failed
    Browser.Close Browser


*** Keywords ***
Login Page - Verify Login Page
    Browser.Wait For Elements State    selector=${LABEL_LOGINPAGE_HEADER}       state=stable    timeout=${TIMEOUT}
    ...                                message=❌ Not found 'Login header label' in Login Page within ${TIMEOUT}
    Browser.Wait For Elements State    selector=${LABEL_LOGINPAGE_SUBHEADER}    state=stable    timeout=${TIMEOUT}
    ...                                message=❌ Not found 'Login subheader label' in Login Page within ${TIMEOUT}

Login Page - Input Username And Password
    [Arguments]    ${username}    ${password}
    Browser.Wait For Elements State    selector=${LABEL_LOGINPAGE_USERNAME}    state=stable    timeout=${TIMEOUT}
    ...                                message=❌ Not found 'username label' in Login Page within ${TIMEOUT}
    Browser.Wait For Elements State    selector=${FIELD_LOGINPAGE_USERNAME}    state=stable    timeout=${TIMEOUT}
    ...                                message=❌ Not found 'username input field' in Login Page within ${TIMEOUT}
    Browser.Type Text                  selector=${FIELD_LOGINPAGE_USERNAME}    txt=${username}
    Browser.Wait For Elements State    selector=${LABEL_LOGINPAGE_PASSWORD}    state=stable    timeout=${TIMEOUT}
    ...                                message=❌ Not found 'password label' in Login Page within ${TIMEOUT}
    Browser.Wait For Elements State    selector=${FIELD_LOGINPAGE_PASSWORD}    state=stable    timeout=${TIMEOUT}
    ...                                message=❌ Not found 'password input field' in Login Page within ${TIMEOUT}
    Browser.Type Text                  selector=${FIELD_LOGINPAGE_PASSWORD}    txt=${password}

Login Page - Click Login Button
    Browser.Wait For Elements State    selector=${BUTTON_LOGINPAGE_LOGIN}      state=stable    timeout=${TIMEOUT}
    ...                                message=❌ Not found 'login button' in Login Page within ${TIMEOUT}
    TRY
        Browser.Click                  selector=${BUTTON_LOGINPAGE_LOGIN}      button=left
    EXCEPT
        BuiltIn.Fail                   msg=❌ Not found 'login button' in Login Page within ${TIMEOUT}
    END

Login Page - Validate Alert Login Failed
    Browser.Wait For Elements State             selector=${LABEL_LOGINPAGE_ALERT_FAILED}
    ${Result_Actual_Text}    Browser.Get Text   selector=${LABEL_LOGINPAGE_ALERT_FAILED}
    ...                                         message=❌ Cannot get text from 'alert logout success label' in Login Page
    ${Actual_Alert_Text}    BuiltIn.Evaluate    expression="""${Result_Actual_Text}""".strip().split('\\n')[0].replace('×', '').strip()
    BuiltIn.Should Be Equal As Strings          first=${Actual_Alert_Text}    second=${LABEL_ALERT_LOGIN_FAILED}
    ...                                         msg=❌ Alert text did not match\nExpected text: ${LABEL_ALERT_LOGIN_FAILED}\nActual text: ${Actual_Alert_Text}\n

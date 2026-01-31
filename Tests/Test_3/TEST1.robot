*** Settings ***
Library      RequestsLibrary


*** Variables ***
# Api
${URL_API}               https://reqres.in
${END_POINT}             /api/users/12
# Expected
${Expected_Status}       200
${Expected_Id}           12
${Expected_Email}        rachel.howell@reqres.in
${Expected_Firstname}    Rachel
${Expected_Lastname}     Howell
${Expected_Avatar}       https://reqres.in/img/faces/12-image.jpg


*** Test Cases ***
Test1 Get User Profile Success
    [Documentation]    Owner : Tawan Duangchit
    ...    |    ***| Objective |***
    ...    |    To verify get user profile api will return correct data when trying to get profile of existing user
    ...    ==>
    # Get Values
    RequestsLibrary.Create Session                   alias=GET
    ...                                              url=${URL_API}
    ${Headers}     BuiltIn.Create Dictionary         x-api-key=reqres_b115aaa93cff4447b784a792553a8945
    ${Response}    RequestsLibrary.GET On Session    alias=GET
    ...                                              url=${END_POINT}
    ...                                              expected_status=${Expected_Status}
    ...                                              headers=${Headers}

    # Validate Values
    BuiltIn.Should Be Equal As Integers              first=${Expected_Id}           second=${Response.json()}[data][id]
    ...                                              msg=❌ Id did not match ==> Expected ID: ${Expected_Id} != Actual ID: ${Response.json()}[data][id]
    BuiltIn.Should Be Equal As Strings               first=${Expected_Email}        second=${Response.json()}[data][email]
    ...                                              msg=❌ Email did not match ==> Expected ID: ${Expected_Id} != Actual ID: ${Response.json()}[data][email]
    BuiltIn.Should Be Equal As Strings               first=${Expected_Firstname}    second=${Response.json()}[data][first_name]
    ...                                              msg=❌ Firstname did not match ==> Expected ID: ${Expected_Id} != Actual ID: ${Response.json()}[data][first_name]
    BuiltIn.Should Be Equal As Strings               first=${Expected_Lastname}     second=${Response.json()}[data][last_name]
    ...                                              msg=❌ Lastname did not match ==> Expected ID: ${Expected_Id} != Actual ID: ${Response.json()}[data][last_name]
    BuiltIn.Should Be Equal As Strings               first=${Expected_Avatar}       second=${Response.json()}[data][avatar]
    ...                                              msg=❌ Avatar did not match ==> Expected ID: ${Expected_Id} != Actual ID: ${Response.json()}[data][avatar]

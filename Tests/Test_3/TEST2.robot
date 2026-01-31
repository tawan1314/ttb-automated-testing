*** Settings ***
Library      RequestsLibrary


*** Variables ***
# Api
${URL_API}               https://reqres.in
${END_POINT}             /api/users/1234
# Expected
${Expected_Status}       404
${Expected_Value}        {}


*** Test Cases ***
Test2 Get User Profile But User Not Found
    [Documentation]    Owner : Tawan Duangchit
    ...    |    ***| Objective |***
    ...    |    To verify get user profile api will return 404 not found when trying to get exist profile of not existing user
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
    BuiltIn.Should Be Equal As Strings               first=${Expected_Value}    second=${Response.json()}
    ...                                              msg=❌ Result value did not match ==> Expected ID: ${Expected_Value} != Actual ID: ${Response.json()}

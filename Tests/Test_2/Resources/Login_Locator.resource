*** Variables ***
# Login Page
${LABEL_LOGINPAGE_HEADER}             css=h2:has-text('Login Page')
${LABEL_LOGINPAGE_SUBHEADER}          css=h4.subheader
${LABEL_LOGINPAGE_USERNAME}           css=label[for='username']:has-text('Username')
${FIELD_LOGINPAGE_USERNAME}           css=input[id='username']
${LABEL_LOGINPAGE_PASSWORD}           css=label[for='password']:has-text('Password')
${FIELD_LOGINPAGE_PASSWORD}           css=input[id='password']
${BUTTON_LOGINPAGE_LOGIN}             css=button.radius:has-text(' Login')
${LABEL_LOGINPAGE_ALERT_SUCCESS}      css=div[class='flash success']
${LABEL_LOGINPAGE_ALERT_FAILED}       css=div[class='flash error']

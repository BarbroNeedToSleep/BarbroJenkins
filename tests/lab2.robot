*** Settings ***
Documentation    Global documentation
Resource         ../resources/keywords.robot
Library          SeleniumLibrary
Test Setup       Begin Web Test
Test Teardown    End Web Test

*** Variables ***
${BROWSER} =    chrome
${URL} =    http://rental20.infotiv.net/
${SEARCH_TERM} =    ""
${EMAIL} =     needtsleep@gmail.com
${PASSWORD} =  murre123
${BAD_EMAIL} =	wrong@as.can.be
${BAD_PASSWORD} =	ClearlyWrong

*** Test Cases ***

Log in with the wrong credentials
	[Documentation]		User logging in with the wrong credentials
	[Tags]			Testfall 1: Negative
	Go To Web Page
	Verify Page Loaded
	Enter Email  ${BAD_EMAIL}
	Enter Password  ${BAD_PASSWORD}
	Click Button Login
	Verify Login Failed

Test MyPage Gherkin
	[Documentation]		Given that user is registered, the user logs in and clicks the My Page button expecting to see their personal page.
	[Tags]			    Testfall 2: Gherkin Test MyPage
	Given That User Already Registered
	When User Logs In And Clicks My Page
	Then The User Expects To See Page

Input No Value
	[Documentation]		Submit field with no value
	[Tags]			    Testfall 3: Submit no value
	Go To Web Page
	Verify Page Loaded
	Click Button Login
    Verify Login Page Warning

Reset button on Date Selection
	[Documentation]		Reset button on date selection should go back to a correct date after entering 0 in the date.
	[Tags]			    Testfall 4: Reset Button
	Go To Web Page
	Verify Page Loaded
    	Delete Date
    	Click reset button and go to the next page

Long test
    [Documentation]	Extended test
    [Tags]  		Testfall 5: try buy
    Go To Web Page
    Verify Page Loaded
    Enter Email  ${EMAIL}
    Enter Password  ${PASSWORD}
    Click Button Login
    Click Link And Verify Page		about.php	about
    Click Element And Verify Page	index.php	logo
    Click Button And Verify Page	myPage.php	mypage
    Click Selected Button     show
#    Set Selenium Speed    1 seconds
    Check Page Contains		Order
    Click Selected Button     hide
#    Check Page Not Contains		Order
    Click Element And Verify Page	index.php	logo
    Book Car
    Log Out


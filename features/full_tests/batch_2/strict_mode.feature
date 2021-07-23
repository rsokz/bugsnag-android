Feature: Reporting Strict Mode Exceptions

# These scenarios are being skipped on Android 9 until ROAD-757 is resolved
@skip_above_android_8
Scenario: StrictMode DiscWrite violation
    When I run "StrictModeDiscScenario" and relaunch the app
    And I configure Bugsnag for "StrictModeDiscScenario"
    And I wait to receive an error
    Then the error is valid for the error reporting API version "4.0" for the "Android Bugsnag Notifier" notifier
    And the exception "errorClass" equals "android.os.StrictMode$StrictModeViolation"
    And the event "metaData.StrictMode.Violation" equals "DiskWrite"

@skip_above_android_8
Scenario: StrictMode Network on Main Thread violation
    When I run "StrictModeNetworkScenario" and relaunch the app
    And I configure Bugsnag for "StrictModeNetworkScenario"
    And I wait to receive an error
    Then the error is valid for the error reporting API version "4.0" for the "Android Bugsnag Notifier" notifier
    And the exception "errorClass" equals "android.os.StrictMode$StrictModeViolation"
    And the event "metaData.StrictMode.Violation" equals "NetworkOperation"

# In Android <9 StrictMode kills VM policy violations with SIGKILL, so no requests are received.
@skip_above_android_8
Scenario: StrictMode Activity leak violation
    When I run "StrictModeFileUriExposeScenario" and relaunch the app
    And I configure Bugsnag for "StrictModeFileUriExposeScenario"
    Then I should receive no requests

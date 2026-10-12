Feature: Script Performance Report
  As a professor responsible for a class
  I want to see the performance of my class in a script compared to past classes
  so that I can evaluate if the class is better or worse than previous ones and adjust my teaching

  # GUI scenarios

  Scenario: view the comparison with the average of several past classes web
    Given I am logged in as "Professor" with login "pcosv" and password "1234"
    And I am responsible for the class "ESS - 2026.2"
    And the system has the performance of the class "ESS - 2026.2" in the script "Requirements" with average correct answers "70%", average errors "30%" and average time "40 min"
    And the system has the performance of the class "ESS - 2025.2" in the script "Requirements" with average correct answers "65%", average errors "35%" and average time "45 min"
    And the script "Requirements" of the class "ESS - 2025.2" is linked to the script "Requirements" of the class "ESS - 2026.2"
    And the system has the performance of the class "ESS - 2025.1" in the script "Requirements" with average correct answers "80%", average errors "20%" and average time "30 min"
    And the script "Requirements" of the class "ESS - 2025.1" is linked to the script "Requirements" of the class "ESS - 2026.2"
    When I open the page "Script performance report" of the class "ESS - 2026.2" for the script "Requirements"
    Then I am on the page "Script performance report"
    And I see in the row "ESS - 2026.2" average correct answers "70%", average errors "30%" and average time "40 min"
    And I see in the row "Average of past classes" average correct answers "72.5%", average errors "27.5%" and average time "37.5 min"
    And I see in the row "Difference" average correct answers "-2.5 pp", average errors "+2.5 pp" and average time "+2.5 min"

  Scenario: view only the class performance when there are no linked past classes web
    Given I am logged in as "Professor" with login "pcosv" and password "1234"
    And I am responsible for the class "ESS - 2026.2"
    And the system has the performance of the class "ESS - 2026.2" in the script "Requirements" with average correct answers "70%", average errors "30%" and average time "40 min"
    And no script of a past class is linked to the script "Requirements" of the class "ESS - 2026.2"
    When I open the page "Script performance report" of the class "ESS - 2026.2" for the script "Requirements"
    Then I am on the page "Script performance report"
    And I see the message "There are no past classes linked to the script Requirements"
    And I see in the row "ESS - 2026.2" average correct answers "70%", average errors "30%" and average time "40 min"
    And I do not see the rows "Average of past classes" and "Difference"

  Scenario: view only the average of past classes when the current class has no answers web
    Given I am logged in as "Professor" with login "pcosv" and password "1234"
    And I am responsible for the class "ESS - 2026.2"
    And the class "ESS - 2026.2" has applied the script "Requirements" but has no registered answers
    And the system has the performance of the class "ESS - 2025.2" in the script "Requirements" with average correct answers "65%", average errors "35%" and average time "45 min"
    And the script "Requirements" of the class "ESS - 2025.2" is linked to the script "Requirements" of the class "ESS - 2026.2"
    When I open the page "Script performance report" of the class "ESS - 2026.2" for the script "Requirements"
    Then I am on the page "Script performance report"
    And I see in the row "Average of past classes" average correct answers "65%", average errors "35%" and average time "45 min"
    And I do not see the rows "ESS - 2026.2" and "Difference"

  Scenario: past class without answers is not included in the average web
    Given I am logged in as "Professor" with login "pcosv" and password "1234"
    And I am responsible for the class "ESS - 2026.2"
    And the system has the performance of the class "ESS - 2026.2" in the script "Requirements" with average correct answers "70%", average errors "30%" and average time "40 min"
    And the system has the performance of the class "ESS - 2025.1" in the script "Requirements" with average correct answers "80%", average errors "20%" and average time "30 min"
    And the script "Requirements" of the class "ESS - 2025.1" is linked to the script "Requirements" of the class "ESS - 2026.2"
    And the class "ESS - 2025.2" has applied the script "Requirements" but has no registered answers
    And the script "Requirements" of the class "ESS - 2025.2" is linked to the script "Requirements" of the class "ESS - 2026.2"
    When I open the page "Script performance report" of the class "ESS - 2026.2" for the script "Requirements"
    Then I am on the page "Script performance report"
    And I see in the row "Average of past classes" average correct answers "80%", average errors "20%" and average time "30 min"
    And I see in the row "Difference" average correct answers "-10 pp", average errors "+10 pp" and average time "+10 min"

  Scenario: script of a past class that is not linked is not included in the average web
    Given I am logged in as "Professor" with login "pcosv" and password "1234"
    And I am responsible for the class "ESS - 2026.2"
    And the system has the performance of the class "ESS - 2026.2" in the script "Requirements" with average correct answers "70%", average errors "30%" and average time "40 min"
    And the system has the performance of the class "ESS - 2025.2" in the script "Requirements" with average correct answers "65%", average errors "35%" and average time "45 min"
    And the script "Requirements" of the class "ESS - 2025.2" is linked to the script "Requirements" of the class "ESS - 2026.2"
    And the system has the performance of the class "ESS - 2025.1" in the script "Requirements" with average correct answers "80%", average errors "20%" and average time "30 min"
    And the script "Requirements" of the class "ESS - 2025.1" is not linked to the script "Requirements" of the class "ESS - 2026.2"
    When I open the page "Script performance report" of the class "ESS - 2026.2" for the script "Requirements"
    Then I am on the page "Script performance report"
    And I see in the row "Average of past classes" average correct answers "65%", average errors "35%" and average time "45 min"
    And I see in the row "Difference" average correct answers "+5 pp", average errors "-5 pp" and average time "-5 min"

  Scenario: link the script of a past class to the current script web
    Given I am logged in as "Professor" with login "pcosv" and password "1234"
    And I am responsible for the class "ESS - 2026.2"
    And the system has the performance of the class "ESS - 2026.2" in the script "Requirements" with average correct answers "70%", average errors "30%" and average time "40 min"
    And the system has the performance of the class "ESS - 2025.2" in the script "Requirements" with average correct answers "65%", average errors "35%" and average time "45 min"
    And the script "Requirements" of the class "ESS - 2025.2" is not linked to the script "Requirements" of the class "ESS - 2026.2"
    When I inform that the script "Requirements" of the class "ESS - 2025.2" matches the script "Requirements" of the class "ESS - 2026.2"
    Then I am on the page "Script performance report"
    And I see in the row "Average of past classes" average correct answers "65%", average errors "35%" and average time "45 min"
    And I see in the row "Difference" average correct answers "+5 pp", average errors "-5 pp" and average time "-5 min"

  Scenario: import the performance of a past class from a spreadsheet web
    Given I am logged in as "Professor" with login "pcosv" and password "1234"
    And I am responsible for the class "ESS - 2026.2"
    And the system has no performance of the class "ESS - 2025.2" in the script "Requirements"
    And I have the spreadsheet "ESS 2025.2 performance" with the class "ESS - 2025.2", the script "Requirements", average correct answers "65%", average errors "35%" and average time "45 min"
    And I am on the page "Past class performance import"
    When I import the spreadsheet "ESS 2025.2 performance"
    Then I see the message "Performance imported successfully"
    And the system has the performance of the class "ESS - 2025.2" in the script "Requirements" with average correct answers "65%", average errors "35%" and average time "45 min"

  Scenario: import a spreadsheet without a required column web
    Given I am logged in as "Professor" with login "pcosv" and password "1234"
    And I am responsible for the class "ESS - 2026.2"
    And the system has no performance of the class "ESS - 2025.2" in the script "Requirements"
    And I have the spreadsheet "ESS 2025.2 performance" without the column "Average correct answers"
    And I am on the page "Past class performance import"
    When I import the spreadsheet "ESS 2025.2 performance"
    Then I see the message "Invalid spreadsheet: missing column Average correct answers"
    And the system still has no performance of the class "ESS - 2025.2" in the script "Requirements"

  @optional
  Scenario: export the report as PDF web
    Given I am logged in as "Professor" with login "pcosv" and password "1234"
    And I am responsible for the class "ESS - 2026.2"
    And the system has the performance of the class "ESS - 2026.2" in the script "Requirements" with average correct answers "70%", average errors "30%" and average time "40 min"
    And the system has the performance of the class "ESS - 2025.2" in the script "Requirements" with average correct answers "65%", average errors "35%" and average time "45 min"
    And the script "Requirements" of the class "ESS - 2025.2" is linked to the script "Requirements" of the class "ESS - 2026.2"
    And I am on the page "Script performance report" of the class "ESS - 2026.2" for the script "Requirements"
    When I request to export the report as PDF
    Then I receive a PDF file with the report
    And the PDF has in the row "ESS - 2026.2" average correct answers "70%", average errors "30%" and average time "40 min"
    And the PDF has in the row "Average of past classes" average correct answers "65%", average errors "35%" and average time "45 min"
    And the PDF has in the row "Difference" average correct answers "+5 pp", average errors "-5 pp" and average time "-5 min"

  Scenario: student cannot see the report web
    Given I am logged in as "Student" with login "mariana" and password "1234"
    And I am enrolled in the class "ESS - 2026.2"
    And the system has the performance of the class "ESS - 2026.2" in the script "Requirements" with average correct answers "70%", average errors "30%" and average time "40 min"
    When I try to open the page "Script performance report" of the class "ESS - 2026.2" for the script "Requirements"
    Then I see the message "Access denied"
    And I do not see the performance of any class

  # Service scenarios

  Scenario: get the report with the average of several past classes
    Given I access the system as "professor" with login "pcosv"
    And I am responsible for the class "ESS - 2026.2"
    And the system has the performance of the class "ESS - 2026.2" in the script "Requirements" with average correct answers "70%", average errors "30%" and average time "40 min"
    And the system has the performance of the class "ESS - 2025.2" in the script "Requirements" with average correct answers "65%", average errors "35%" and average time "45 min"
    And the script "Requirements" of the class "ESS - 2025.2" is linked to the script "Requirements" of the class "ESS - 2026.2"
    And the system has the performance of the class "ESS - 2025.1" in the script "Requirements" with average correct answers "80%", average errors "20%" and average time "30 min"
    And the script "Requirements" of the class "ESS - 2025.1" is linked to the script "Requirements" of the class "ESS - 2026.2"
    When I ask the system for the performance report of the class "ESS - 2026.2" in the script "Requirements"
    Then the system returns for "ESS - 2026.2" average correct answers "70%", average errors "30%" and average time "40 min"
    And the system returns for "Average of past classes" average correct answers "72.5%", average errors "27.5%" and average time "37.5 min"
    And the system returns for "Difference" average correct answers "-2.5 pp", average errors "+2.5 pp" and average time "+2.5 min"
    And the system still has the performance of the class "ESS - 2026.2" in the script "Requirements" with average correct answers "70%", average errors "30%" and average time "40 min"

  Scenario: link the script of a past class to the current script
    Given I access the system as "professor" with login "pcosv"
    And I am responsible for the class "ESS - 2026.2"
    And the system has the performance of the class "ESS - 2026.2" in the script "Requirements" with average correct answers "70%", average errors "30%" and average time "40 min"
    And the system has the performance of the class "ESS - 2025.2" in the script "Requirements" with average correct answers "65%", average errors "35%" and average time "45 min"
    And the script "Requirements" of the class "ESS - 2025.2" is not linked to the script "Requirements" of the class "ESS - 2026.2"
    When I ask the system to link the script "Requirements" of the class "ESS - 2025.2" to the script "Requirements" of the class "ESS - 2026.2"
    Then the system returns the link confirmation
    And the script "Requirements" of the class "ESS - 2025.2" is linked to the script "Requirements" of the class "ESS - 2026.2"
    And the system still has the performance of the class "ESS - 2026.2" in the script "Requirements" with average correct answers "70%", average errors "30%" and average time "40 min"
    And the system still has the performance of the class "ESS - 2025.2" in the script "Requirements" with average correct answers "65%", average errors "35%" and average time "45 min"

  Scenario: import the performance of a past class from a spreadsheet
    Given I access the system as "professor" with login "pcosv"
    And I am responsible for the class "ESS - 2026.2"
    And the system has no performance of the class "ESS - 2025.2" in the script "Requirements"
    And I have the spreadsheet "ESS 2025.2 performance" with the class "ESS - 2025.2", the script "Requirements", average correct answers "65%", average errors "35%" and average time "45 min"
    When I send the spreadsheet "ESS 2025.2 performance" to the system
    Then the system returns the import confirmation
    And the system has the performance of the class "ESS - 2025.2" in the script "Requirements" with average correct answers "65%", average errors "35%" and average time "45 min"

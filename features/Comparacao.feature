Feature: Script Performance Report
  As a professor
  I want to generate a report comparing current class performance with past classes in scripts
  So that I can analyze learning trends across terms

  Scenario: Compare class performance in a specific script
    Given data exists for past classes and the current class
    When I request the script performance report
    Then the system should display average grades of current vs past classes

  Scenario: Identify response time discrepancies between classes
    Given the current class finished the script
    When I compare the average completion time with past classes
    Then the system should highlight if the current class took longer  to complete
    Then the report summary should be updated
  
  Scenario: Export raw experimental data
    Given experimental data is ready
    When I request raw data export
    Then raw files should be downloaded
  
  Scenario: Experimental ana lytics metric
    Given the report dashboard is loaded
    When I process experimental metrics
    Then the system should generate real-time charts
  
    Then the system sho uld generate real-time charts

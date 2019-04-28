Feature: Offers

Scenario: Display an offer
    Given an offer
    When I go to the offer url
    Then then the offer is displayed


Scenario: Edit an offer
    Given an offer is displayed
    When I click on "Editer"
    Then I can edit the offer

Scenario: Customize an offer
    Given an offer is displayed
    When I click on "Paramètres"
    Then a menu with several actions is displayed

Scenario: Multiple Actions
    Given an offer with several candidates
    When I click on "Actions Multiples"
    Then I can select several candidates
    And the number of candidates selected is displayed

Scenario: Multiple Actions - Update status
    Given an offer with several candidates
    When I click on "Actions Multiples"
    Then I can select several candidates
    And I can update the status of candidates

Scenario: Multiple Actions - Send an email
    Given an offer with several candidates
    When I click on "Actions Multiples"
    Then I can select several candidates
    And I can send an email to each selected candidates

Scenario: Multiple Actions - Archive
    Given an offer with several candidates
    When I click on "Actions Multiples"
    Then I can select several candidates
    And I can archives selected candidates

Scenario: Multiple Actions - Comment
    Given an offer with several candidates
    When I click on "Actions Multiples"
    Then I can select several candidates
    And I can add a comment to each selected candidates

Scenario: Multiple Actions - Move candiates
    Given an offer with several candidates
    When I click on "Actions Multiples"
    Then I can select several candidates
    And I can move each selected candidates to another offer

Scenario: Display menu - Activity
    Given an offer
    When I click on "Menu"
    Then I can see all activity linked to the offer

Scenario: Display menu - Filter by members
    Given an offer
    When I click on "Menu"
    And Select "filters" tab
    Then I filter by members

Scenario: Display menu - Filter by tags
    Given an offer
    And candidates with tags "QA"
    When I click on "Menu"
    And Select "filters" tab
    Then I filter by tags "QA"
    And candidates with tags "QA" are displayed

Scenario: Display menu - Notify recruiters
    Given an offer
    When I click on "Menu"
    Then I can add recruiters to be notified

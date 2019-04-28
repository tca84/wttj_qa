Feature: Display candidate

Scenario: Display a candidate
    Given a candidate 
    When I click on the candidate card
    Then I can see all his informations

Scenario: Add one tag
    Given a candidate 
    When I click on the candidate card
    Then I add a tag 

Scenario: Add several tag
    Given a candidate 
    When I click on the candidate card
    Then I add several tag

Scenario: Contact the candidate - email tab
    Given a candidate 
    When I click on the candidate card
    And I select "Email" tab
    Then I can send an email to the candidate

Scenario: Contact the candidate - contact button
    Given a candidate 
    When I click on the candidate card
    And I click on button "contacter"
    Then the "email" tab is displayed

Scenario: Evaluate the candidate
    Given a candidate 
    When I click on the candidate card
    And I select "Evalutions" tab
    Then I can evaluate the candidate

Scenario: Remove the evaluation
    Given a candidate with evalution
    When I click on the candidate card
    And I select "Evalutions" tab
    Then I can remove the evalution

Scenario: Add a remark to the evaluation
    Given a candidate
    When I click on the candidate card
    And I select "Evalutions" tab
    Then I can add a remark to the evalution

Scenario: Average evaluations
    Given a candidate
    When I click on the candidate card
    And I select "Evalutions" tab
    And set "3" to "Quality A" criteria
    And set "5" to "Quality B" criteria
    And set "2" to "Quality C" criteria
    Then average is equal to "3.5 / 5"

Scenario: Add a document
    Given a candidate
    When I click on the candidate card
    And I select "Fichiers" tab
    Then I can import a document

Scenario: List all document
    Given a candidate with imported documents
    When I click on the candidate card
    And I select "Fichiers" tab
    Then I can see all documents imported

Scenario: Update status
    Given a new candidate
    When I click "nouveau" listbox
    Then I can update status to "A rencontrer"

Scenario: Move candidate
    Given a new candidate
    When I click "..." button
    And select "Déplacer"
    Then I can move the candidate to anoter offer
    And I can update the status

Scenario: Archive candidate
    Given a new candidate
    When I click "..." button
    And select "Archiver"
    Then a confirmation message is displayed
    And I can archive the candidate

Scenario: Like candidate
    Given a new candidate
    When I click on "heart" button
    Then like counter is increased

Scenario: Vote up candidate
    Given a new candidate
    When I click on "up" button
    Then up counter is increased

Scenario: Vote down candidate
    Given a new candidate
    When I click on "down" button
    Then down counter is increased

Scenario: Add a comment
    Given a new candidate
    When I add a comment 
    Then the comment is displayed in comments list

Scenario: Update a comment
    Given a new candidate
    When I add a comment 
    Then the comment is displayed in comments list
    When I click on "Modifier"
    Then I can update the comment
    And I can save it 

Scenario: Delete a comment
    Given a new candidate
    When I add a comment 
    Then the comment is displayed in comments list
    When I click on "Supprimer"
    Then a confirmation message is displayed
    And I delete it
    
Scenario: Anonymize 
    Given a candidate
    When I click on "Anonymiser cette candidature"
    Then a confirmation message is displayed
    When i confirm
    Then all informations are deleted

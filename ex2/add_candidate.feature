Feature: Add Candidate

Scenario: Add Candidate
    Given I go to url "https://www.welcomekit.co/dashboard/o/dkxzma3/jobs/2XMOI_yq66e6b/new-candidate/392777"
    When I fill all fields
    Then candidate is created

Scenario: Add Candidate - Mandatory fields
    Given I go to url "https://www.welcomekit.co/dashboard/o/dkxzma3/jobs/2XMOI_yq66e6b/new-candidate/392777"
    When I fill firstname with "Jean"
    And I fill lastname with "Dupont"
    And I fill email with "jean.dupont@gmail.com"
    Then candidate is created  

Scenario: Add Candidate - Mandatory fields missing email
    Given I go to url "https://www.welcomekit.co/dashboard/o/dkxzma3/jobs/2XMOI_yq66e6b/new-candidate/392777"
    When I fill firstname with "Jean"
    And I fill lastname with "Dupont"
    Then button "enregistrer" is disabled 

Scenario: Add Candidate - Mandatory fields missing firstname
    Given I go to url "https://www.welcomekit.co/dashboard/o/dkxzma3/jobs/2XMOI_yq66e6b/new-candidate/392777"
    When I fill lastname with "Dupont"
    And I fill email with "jean.dupont@gmail.com"
    Then button "enregistrer" is disabled 

Scenario: Add Candidate - Mandatory fields missing lastname
    Given I go to url "https://www.welcomekit.co/dashboard/o/dkxzma3/jobs/2XMOI_yq66e6b/new-candidate/392777"
    When I fill firstname with "Jean"
    And I fill email with "jean.dupont@gmail.com"
    Then button "enregistrer" is disabled 



    

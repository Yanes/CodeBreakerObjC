Feature: code-breaker starts game
  As a code-breaker 
  I want to start a game 
  So that I can break the code

Scenario: 
  Given I launch the app
  When I start a new game 
  Then I should see Welcome to Codebreaker!
  And I should see Enter guess:
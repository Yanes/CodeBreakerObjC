Feature: code-breaker submits guess
  The code-breaker submits a guess of four numbers. The game marks the guess with + and - signs.
  For each number in the guess that matches the number and position of a number in the secret code, the mark includes one +. For each number in the guess that matches the number but not the position of a number in the secret code, a - is added to the mark.

Scenario Outline: submit guess
  Given <appState>
  Given the secret code is "<code>" 
  When I guess "<guess>"
  Then the mark should be "<mark>"

Scenarios: no matches 
  | code | guess | mark | appState         |
  |1234  |5555   |	    | I launch the app |

Scenarios: 1 number correct 
  | code | guess | mark |  appState         |
  |1234  |1555   |+     |the app is running |
  |1234  |2555   |-     |the app is running |

Scenarios: 2 numbers correct 
  | code | guess | mark |  appState         |
  |1234  |5254   |++    |the app is running |
  |1234  |5154   |+-    |the app is running |
  |1234  |2545   |--    |the app is running |

Scenarios: 3 numbers correct 
  | code | guess | mark |  appState         |
  |1234  |5234   |+++   |the app is running |
  |1234  |5134   |++-   |the app is running |
  |1234  |5124   |+--   |the app is running |
  |1234  |5123   |---   |the app is running |

Scenarios: all numbers correct 
  | code | guess | mark | appState          |
  |1234  |1234   |++++  |the app is running |
  |1234  |1243   |++--  |the app is running |
  |1234  |1423   |+---  |the app is running |
  |1234  |4321   |----  |the app is running |

Scenarios: matches with duplicates 
  | code | guess | mark | appState          |
  |1234  |1155   |+     |the app is running |
  |1234  |5115   |-     |the app is running |
  |1134  |1155   |++    |the app is running |
  |1134  |5115   |+-    |the app is running |
  |1134  |5511   |--    |the app is running |
  |1134  |1115   |++    |the app is running |
  |1134  |5111   |+-    |the app is running |

#Scenario: all exact matches 
#  Given I launch the app
#  Given the secret code is "1234" 
#  When I guess "1234"
#  Then the mark should be "++++"

#Scenario: 2 exact matches and 2 number matches 
#  Given I launch the app
#  Given the secret code is "1234" 
#  When I guess "1243"
#  Then the mark should be "++--"

#Scenario: 1 exact match and 3 number matches 
#  Given I launch the app
#  Given the secret code is "1234" 
#  When I guess "1342"
#  Then the mark should be "+---"

#Scenario: 4 number matches 
#  Given I launch the app
#  Given the secret code is "1234" 
#  When I guess "4321"
#  Then the mark should be "----"

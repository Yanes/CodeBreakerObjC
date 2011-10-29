Given /^the secret code is "([^"]*)"$/ do |secretCode|
    text_field_selector =  "view marked:'SecretCode'" 
    frankly_map( text_field_selector, 'becomeFirstResponder' ) 
    frankly_map( text_field_selector, 'setText:', secretCode ) 
    frankly_map( text_field_selector, 'endEditing:', true )
end

When /^I guess "([^"]*)"$/ do |guess|
    text_field_selector =  "view marked:'txtGuess'" 
    frankly_map( text_field_selector, 'becomeFirstResponder' ) 
    frankly_map( text_field_selector, 'setText:', guess ) 
    frankly_map( text_field_selector, 'endEditing:', true )
    touch( "view marked:'Guess'" )
end
                 
Then /^the mark should be "([^"]*)"$/ do |mark|
    frankly_map( "view marked:'Action message'", 'text' ).first.should == mark
end

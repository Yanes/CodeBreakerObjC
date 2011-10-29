When /^I start a new game$/ do
end

Then /^I should see Welcome to Codebreaker!$/ do
    frankly_map( "view marked:'Game message'", 'text' ).first.should == "Welcome to Codebreaker!"
end

Then /^I should see Enter guess:$/ do
    frankly_map( "view marked:'Action message'", 'text' ).first.should == "Enter guess:"
end
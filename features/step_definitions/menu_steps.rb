Then /^I should see the following menu entries:$/ do |table|
    # table is a Cucumber::Ast::Table
   table.hashes.each do |item|
     text = item["Menu item"]
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
   end
end

Feature: As user I want to be able to see the correct products listed when I have chosen a category so that I can easily filter the product list by category.

  Scenario: Check that the "Cat food"-category shows the right products.
    Given that I am on the product page
    When I choose the category "Cat food"
    Then I should see the product "Chicken & Rice Cat Food"
    And I should see the product "Salmon Flavored Cat Food"
    And I should see the product "Senior Cat Formula"
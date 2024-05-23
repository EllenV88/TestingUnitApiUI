Feature: As user I want to be able to see the correct products listed when I have chosen a category so that I can easily filter the product list by category.

  Scenario: Check that the "Alla"-category shows the right products.
    Given that I am on the product page
    When I choose the category "Alla"
    Then I should see the product "Ägg"
    And I should see the product "Gul lök"
    And I should see the product "Potatis"
    And I should see the product "Havregryn"
    And I should see the product "Wagyu-biff"
    And I should see the product "Mango Chutney"
    And I should see the product "Jasminris"
    And I should see the product "Kokosmjölk"
    And I should see the product "Gravad lax"
    And I should see the product "Knäckebröd"
    And I should see the product "Äppelmust"
    And I should see the product "Mjöliga makaroner"
    And I should see the product "Rysk kaviar"
    And I should see the product "Basic tomatsås"
    And I should see the product "Champagne"

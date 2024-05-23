Feature: As user I want to be able to see the correct products listed with correct price  and description whether filtered by category or not.

  Scenario Outline: Check that the category <category> shows the correct product <product> with price <price> and <description>
    Given that I am on the product page
    When I choose the category "<category>"
    Then I should see the product "<product>"
    Then I should see the price "<price>" for the product "<product>"
    Then I should see the description "<description>" for the product "<product>"

    Examples:
      | category    | product           | price | description |
      | Prisvänligt | Basic tomatsås    | 10    | En enkel men god tomatsås |
      | Prisvänligt | Mjöliga makaroner | 15    | Ganska mjöliga men energirika makaroner |
      | Prisvänligt | Havregryn         | 15    | Näringsrikt val för en hälsosam start på dagen |
      | Vardag      | Potatis           | 20 | Fina knölar |
      | Vardag      | Gul lök           | 30 | En sak som garanterat får dig att gråta. |
      | Vardag      | Ägg               | 30 | Kläcka ut din inre kock |
      | Lyx         | Wagyu-biff        | 850 | Premium kött |
      | Lyx         | Champagne         | 999 | Husets egen blandning. |
      | Lyx         | Rysk kaviar       | 500 | Den finaste kaviaren, fast inte från Ryssland egentligen. |
      | Exotisk     | Mango Chutney     | 40 | Söt och Kryddig |
      | Exotisk     | Jasminris         | 35 | Doftande Njutning från Fjärran Österns Risfält |
      | Exotisk     | Kokosmjölk        | 20 | Krämig och mångsidig |
      | Svensk      | Gravad lax        | 150 | Från Svenska hav |
      | Svensk      | Knäckebröd        | 25 | Klassiskt svensk hantverk från bondgård till bord |
      | Svensk      | Äppelmust         | 35 | Friskt plockad svensk frukt i varje droppe |
      | Alla      | Basic tomatsås    | 10 | En enkel men god tomatsås |
      | Alla      | Mjöliga makaroner | 15 | Ganska mjöliga men energirika makaroner |
      | Alla      | Havregryn         | 15 | Näringsrikt val för en hälsosam start på dagen |
      | Alla      | Potatis           | 20 | Fina knölar |
      | Alla      | Gul lök           | 30 | En sak som garanterat får dig att gråta. |
      | Alla      | Ägg               | 30| Kläcka ut din inre kock |
      | Alla      | Wagyu-biff        | 850 | Premium kött |
      | Alla      | Champagne         | 999 | Husets egen blandning. |
      | Alla      | Rysk kaviar       | 500 | Den finaste kaviaren, fast inte från Ryssland egentligen. |
      | Alla      | Mango Chutney     | 40 | Söt och Kryddig |
      | Alla      | Jasminris         | 35 | Doftande Njutning från Fjärran Österns Risfält |
      | Alla      | Kokosmjölk        | 20 | Krämig och mångsidig |
      | Alla      | Gravad lax        | 150 | Från Svenska hav |
      | Alla      | Knäckebröd        | 25 | Klassiskt svensk hantverk från bondgård till bord |
      | Alla      | Äppelmust         | 35 | Friskt plockad svensk frukt i varje droppe |


  Scenario Outline: Check that the category <category> does not show the product <product>.
    Given that I am on the product page
    When I choose the category "<category>"
    Then I should not see the product "<product>"

    Examples:
      | category    | product           |
      | Vardag      | Basic tomatsås    |
      | Vardag      | Mjöliga makaroner |
      | Vardag      | Champagne         |
      | Vardag      | Rysk kaviar       |
      | Vardag      | Wagyu-biff        |
      | Vardag      | Gravad lax        |
      | Vardag      | Havregryn         |
      | Vardag      | Äppelmust         |
      | Vardag      | Knäckebröd        |
      | Vardag      | Mango Chutney     |
      | Vardag      | Jasminris         |
      | Vardag      | Kokosmjölk        |
      | Lyx         | Basic tomatsås    |
      | Lyx         | Mjöliga makaroner |
      | Lyx         | Potatis           |
      | Lyx         | Gul lök           |
      | Lyx         | Mango Chutney     |
      | Lyx         | Havregryn         |
      | Lyx         | Jasminris         |
      | Lyx         | Knäckebröd        |
      | Lyx         | Äppelmust         |
      | Lyx         | Gravad lax        |
      | Lyx         | Kokosmjölk        |
      | Lyx         | Ägg               |
      | Prisvänligt | Champagne         |
      | Prisvänligt | Rysk kaviar       |
      | Prisvänligt | Potatis           |
      | Prisvänligt | Gul lök           |
      | Prisvänligt | Gravad lax        |
      | Prisvänligt | Knäckebröd        |
      | Prisvänligt | Ägg               |
      | Prisvänligt | Kokosmölk         |
      | Prisvänligt | Äppelmust         |
      | Prisvänligt | Jasminris         |
      | Prisvänligt | Mango Chutney     |
      | Prisvänligt | Wagyu-biff        |
      | Exotisk     | Champagne         |
      | Exotisk     | Rysk kaviar       |
      | Exotisk     | Potatis           |
      | Exotisk     | Gul lök           |
      | Exotisk     | Wagyu-biff        |
      | Exotisk     | Ägg               |
      | Exotisk     | Havregryn         |
      | Exotisk     | Knäckebröd        |
      | Exotisk     | Äppelmust         |
      | Exotisk     | Gravad lax        |
      | Exotisk     | Basic tomatsås    |
      | Exotisk     | Mjöliga makaroner |
      | Svensk       | Mjöliga makaroner|
      | Svensk       | Basic tomatsås   |
      | Svensk       | Havregryn        |
      | Svensk       | Ägg           |
      | Svensk       | Wagyu-biff           |
      | Svensk       | Gul lök          |
      | Svensk       | Champagne          |
      | Svensk       | Potatis           |
      | Svensk       | Rysk kaviar           |
      | Svensk       | Mango Chutney           |
      | Svensk       | Jasminris          |
      | Svensk       | Kokosmjölk           |
     

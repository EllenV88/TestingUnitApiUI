namespace WebApp;

public class UtilsTest(Xlog Console)
{
    // Read all mock users from file
    private static readonly Arr mockUsers = JSON.Parse(
        File.ReadAllText(FilePath("json", "mock-users.json"))
    );

    [Theory]
    [InlineData("abC9#fgh", true)]  // ok
    [InlineData("stU5/xyz", true)]  // ok too
    [InlineData("abC9#fg", false)]  // too short
    [InlineData("abCd#fgh", false)] // no digit
    [InlineData("abc9#fgh", false)] // no capital letter
    [InlineData("abC9efgh", false)] // no special character
    public void TestIsPasswordGoodEnough(string password, bool expected)
    {
        Assert.Equal(expected, Utils.IsPasswordGoodEnough(password));
    }

    [Theory]
    [InlineData("abC9#fgh", true)]  // ok
    [InlineData("stU5/xyz", true)]  // ok too
    [InlineData("abC9#fg", false)]  // too short
    [InlineData("abCd#fgh", false)] // no digit
    [InlineData("abc9#fgh", false)] // no capital letter
    [InlineData("abC9efgh", false)] // no special character
    public void TestIsPasswordGoodEnoughRegexVersion(string password, bool expected)
    {
        Assert.Equal(expected, Utils.IsPasswordGoodEnoughRegexVersion(password));
    }

    [Theory]
    [InlineData(
        "---",
        "Hello, I am going through hell. Hell is a real fucking place " +
            "outside your goddamn comfy tortoiseshell!",
        "Hello, I am going through ---. --- is a real --- place " +
            "outside your --- comfy tortoiseshell!"
    )]
    [InlineData(
        "---",
        "Rhinos have a horny knob? (or what should I call it) on " +
            "their heads. And doorknobs are damn round.",
        "Rhinos have a --- ---? (or what should I call it) on " +
            "their heads. And doorknobs are --- round."
    )]
    public void TestRemoveBadWords(string replaceWith, string original, string expected)
    {
        Assert.Equal(expected, Utils.RemoveBadWords(original, replaceWith));
    }

    [Fact]
    public void TestCreateMockUsers()
    {
        // Get all users from the database
        Arr usersInDb = SQLQuery("SELECT email FROM users");
        Arr emailsInDb = usersInDb.Map(user => user.email);
        // Only keep the mock users not already in db
        Arr mockUsersNotInDb = mockUsers.Filter(
            mockUser => !emailsInDb.Contains(mockUser.email)
        );
        // Get the result of running the method in our code
        var result = Utils.CreateMockUsers();
        // Assert that the CreateMockUsers only return
        // newly created users in the db
        Console.WriteLine($"The test expected that {mockUsersNotInDb.Length} users should be added.");
        Console.WriteLine($"And {result.Length} users were added.");
        Console.WriteLine("The test also asserts that the users added " +
            "are equivalent (the same) as the expected users!");
        Assert.Equivalent(mockUsersNotInDb, result);
        Console.WriteLine("The test passed!");
    }
    // Uppgift 4
    [Fact]
    public void TestRemoveMockUsers()
    {
        // Get all users from the database
        Arr usersInDb = SQLQuery("SELECT id, email FROM users");
        Arr mockEmails = mockUsers.Map(user => user.email);
        Arr mockUsersInDb = usersInDb.Filter(user => mockEmails.Contains(user.email));
        
        // Get the result of running the method in our code
        var result = Utils.RemoveMockUsers();
        
        // Assert that the RemoveMockUsers only returned
        // removed mock users from the db
        Console.WriteLine($"The test expected that {mockUsersInDb.Length} users should be removed.");
        Console.WriteLine($"And {result.Length} users were removed.");
        Console.WriteLine("The test also asserts that the users removed " +
                        "are equivalent (the same) as the expected users!");
        Assert.Equivalent(mockUsersInDb, result);
        Console.WriteLine("The test passed!");
    }

     //Uppgift 5
    [Fact]
    public void TestCountDomainsFromUserEmails()
    {
        Obj actualCounts = Utils.CountDomainsFromUserEmails();

        //known expected count
        Obj expectedCounts = Obj();
        expectedCounts["nodehill.com"] = 3;

       Assert.Equal(expectedCounts.ToString(), actualCounts.ToString());
       
    }
}
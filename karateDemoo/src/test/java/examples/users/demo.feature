Feature: Demo

  Background: 
    #* for any given then or when
    #in karate we use url to pass endpoint url or base url
    * def DataGenerator = Java.type('examples.users.DataGenerator')
    * def nameValue = DataGenerator.getName()
    * def userNameValue = DataGenerator.getUserName()
    * url 'https://jsonplaceholder.typicode.com'
    #this line of  the code will call the java class which generator fake data for testing
    #in karate we use Java.type(path of java file)to read data from java class)
    

  Scenario: getAll users
    #we use path to pass service name
    #method to write what method we watn
    #satus for code
    #print is use to print as println and use response to store jason response
    Given path 'users'
    When method get
    Then status 200
    * print response
@test
  Scenario: create a user
    #we send body is """
    # match keyword i equal to assert keyword
    Given path 'users'
    When request
      """
        {
          "name": "#(nameValue)",
          "username":"(userNameValue)",
          "email": "Ahmad@user.com",
          "address": {
            "street": "none",
            "suite": "Apt. 123",
            "city": "Paris",
            "zipcode": "54321-6789"
          }
        }
      """
   And method post
   Then status 201 
   * print response
   * match response.name == '#(nameValue)'
   * match response.address.city == 'Paris'
   # for not equal * match response.address.city != 'Paris'
   # for email contain value * match response.email.contains == '.com'
   #* def idvalue = response[0].id
   #* print idvalue
   
   #* def name = response .name
   ##* match name =='#string'
   #* def zipcode = response.address.zipcode
   #* match zipcode == '#number'
   
   
   Scenario Outline:
     #we send body is """
    # match keyword i equal to assert keyword
    Given path 'users'
    When request
      """
        {
          "name": "<name>",
          "username": "<username>",
          "email": "<email>",
          "address": {
            "street": "<street>",
            "suite": "<suite>",
            "city": "<city>",
            "zipcode": "<zipcode>"
          }
        }
      """
   And method post
   Then status 201 
   * print response 
   * match response.name == '<name>'
   * match response.address.city == '<city>'
   # for not equal * match response.address.city != 'Paris'
   # for email contain value * match response.email.contains == '.com'
   #* def idvalue = response[0].id
   #* print idvalue
   
   #* def name = response .name
   #* match name =='#string'
   ##* def zipcode = response.address.zipcode
   ###* match zipcode == '#number'
   
   Examples:
   |name|username|email|street|suite|city|zipcode|
   |ali|ali01|ali@gmail.com|none|london|54321|
   |alii|ali02|ali2@gmail.com|none|londonn|543218|
   |aliii|ali03|ali3@gmail.com|none|londonnn|543213|
   
   
   
   
   
   
   
   
   
   
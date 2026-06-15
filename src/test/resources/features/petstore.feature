Feature: CRUD de usuarios PetStore

Background:

    * url baseUrl

    * def data = read('classpath:data/user.json')

    * def random = java.util.UUID.randomUUID() + ''

    * def username = 'qa' + random

    * def email = username + '@test.com'

    * def user =

    """
    {
      "id": 1001,
      "username": "#(username)",
      "firstName": "#(data.firstName)",
      "lastName": "#(data.lastName)",
      "email": "#(email)",
      "password": "#(data.password)",
      "phone": "#(data.phone)",
      "userStatus": 1
    }
    """

Scenario: CRUD completo usuario

    Given path 'user'
    And request user
    When method POST
    Then status 200

    Given path 'user', username
    When method GET
    Then status 200
    And match response.username == username

    * set user.firstName = 'Carlos'
    * set user.email = 'carlos@test.com'

    Given path 'user', username
    And request user
    When method PUT
    Then status 200

    Given path 'user', username
    When method GET
    Then status 200
    And match response.firstName == 'Carlos'

    Given path 'user', username
    When method DELETE
    Then status 200
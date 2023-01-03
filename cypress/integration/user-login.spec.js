describe('log in', () => {
 
  it('errors when email does not exist', () => {
    cy.visit('/login')
    cy.get('#email').type('sakon@gmail.com')
    cy.get('#password').type('1234')
    cy.get('.btn').click({force: true})
    cy.contains("Incorrect email or password, try again.")
  });

  it('errors when password is missing', () => {
    cy.visit('/login')
    cy.get('#email').type('sako@gmail.com')
    cy.get('.btn').click({force: true})
    cy.contains("Incorrect email or password, try again.")
  });

  it('can log in with valid email and password', () => {
    cy.visit('/login')
    cy.get('#email').type('sako@gmail.com')
    cy.get('#password').type('1234')
    cy.get('.btn').click({force: true})
    cy.contains('Signed in as: sako@gmail.com')
  });

  
})
describe('sign up', () => {
  beforeEach(() => {
    cy.request('/cypress_rails_reset_state')
  })

  it('errors when email already exists', () => {
    cy.visit('/users/new')
    cy.get('#user_first_name').type('Eduardo')
    cy.get('#user_last_name').type('Vega')
    cy.get('#user_email').type('sako@gmail.com')
    cy.get('#user_password').type('1234')
    cy.get('#user_password_confirmation').type('1234')
    cy.get('.btn').click({force: true})
    cy.contains("Oops, couldn't create account. Please make sure you are using a valid email and password and try again.")
  });

  it('errors when password confirmation is missing', () => {
    cy.visit('/users/new')
    cy.get('#user_first_name').type('Eduardo')
    cy.get('#user_last_name').type('Vega')
    cy.get('#user_email').type('edu@example.com')
    cy.get('#user_password').type('1234')
    cy.get('.btn').click({force: true})
    cy.contains("Oops, couldn't create account. Please make sure you are using a valid email and password and try again.")
  });
  
  it('can sign up when all the fields are filled in', () => {
    cy.visit('/users/new')
    cy.get('#user_first_name').type('Eduardo')
    cy.get('#user_last_name').type('Vega')
    cy.get('#user_email').type('edu@example.com')
    cy.get('#user_password').type('1234')
    cy.get('#user_password_confirmation').type('1234')
    cy.get('.btn').click({force: true})
    cy.contains('Signed in as: edu@example.com')
  });

})
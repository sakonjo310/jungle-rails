describe('add to cart', () => {
  
  it('can visit the homepage', () => {
    cy.visit('/')
  });

  it('can add the product to cart in homepage', () => {
    cy.contains('My Cart (0)')
    
    cy.get('.button_to button').first().click({force: true})

    cy.contains('My Cart (1)')
  });

  it('can add the product to cart in the detail page', () => {
    cy.get(".products article").first().click()
    
    cy.contains('My Cart (0)')
    
    cy.get('.button_to button').first().click({force: true})

    cy.contains('My Cart (1)')
  });

})
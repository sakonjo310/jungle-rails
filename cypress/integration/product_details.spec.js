describe('product details', () => {
  
  it('can visit the homepage', () => {
    cy.visit('/')
  });

  it('can visit the selected product detail page', () => {
    cy.get(".products article").first().click()
    cy.get(".product-detail h1").should('have.text', 'Scented Blade')
  })

})
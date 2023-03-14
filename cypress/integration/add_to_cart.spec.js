it("There is a home page", () => {
  cy.visit("/");
});
it("Check that the cart is empty", () => {
  cy.get(".end-0 > .nav-link").click();
  cy.get(".cart-show > h3").contains("Oh, you forgot to fill this cart!");
});
it("Returns to the home page", () => {
  cy.get(".navbar-brand").click();
});
it("Clicks on the Add button of a product", () => {
  cy.get(":nth-child(1) > div > .button_to > .btn").click({ force: true });
  cy.get(".end-0 > .nav-link").click();
  cy.contains("Pay with Card");
  cy.contains("My Cart (1)");
});

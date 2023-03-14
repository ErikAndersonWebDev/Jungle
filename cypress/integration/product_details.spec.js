it("There is a home page", () => {
  cy.visit("/");
});
it("Clicks on a product to show the product's detail page", () => {
  cy.get(":nth-child(1) > a > img").click();
  cy.get(".product-detail").should("exist");
});

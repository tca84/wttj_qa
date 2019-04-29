describe("Add a candidate", () => {

  beforeEach(() => {
    // Login to welcomekit as an admin

    // NOTE : I've tried to login as an admin using credentials
    // But I can't succeed to bypass recaptcha 
    // So I've tried to set cookies with values after manualy login
    // cy
    //   .get('#user_email')
    //   .type(Cypress.env('admin_email'))

    // cy
    //   .get('#user_password')
    //   .type(Cypress.env('admin_password'))

    // cy.get("form").submit();

    cy.setCookie('user.id', Cypress.env('user.id'))
    cy.setCookie('_wk_session', Cypress.env('_wk_session'))
    cy.setCookie('activity', Cypress.env('activity'))
    cy.setCookie('user.expires_at', Cypress.env('user.expires_at') )
    cy.visit("/dashboard/o/dkxzma3/jobs/2XMOI_yq66e6b/new-candidate/392777")

  });

  it("Create candidate", () => {

    cy
      .get('input[name="firstname"]')
      .type('Jon')

    cy
      .get('input[name="lastname"]')
      .type('Snow')

    cy
      .get('input[name="subtitle"]')
      .type('QA Engineer')

    cy
      .get('input[name="email"]')
      .type('john.snow@gmail.com')

    cy
      .get('input[name="phone"]')
      .type('0665656565')

    cy
      .get('input[name="address"]')
      .type('Au delà du mur')

    cy
      .get('input[name="city"]')
      .type('Winterfell')

    cy
      .get('input[name="zip_code"]')
      .type('75002')


    cy.get("form").submit();

    cy.wait(5000)
  });

  it("Candidate is listed in new column", () => {

    cy.visit("/dashboard/o/dkxzma3/jobs/2XMOI_yq66e6b")

    cy
      .get('.card-thumbnail')
      .find('.card-thumbnail-content')
      .find('.card-thumbnail-infos')
      .find('.card-thumbnail-name')
      .should(function($span) {
        var text = $span.text();
        expect(text).contains('Jon Snow');
      });
  });
});

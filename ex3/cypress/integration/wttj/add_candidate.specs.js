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

    cy.fixture("admin/candidate").as("candidate");
  });

  it("Should create a candidate", function() {
    
    cy
      .get('input[name="firstname"]')
      .type(this.candidate.firstname)

    cy
      .get('input[name="lastname"]')
      .type(this.candidate.lastname)

    cy
      .get('input[name="subtitle"]')
      .type(this.candidate.subtitle)

    cy
      .get('input[name="email"]')
      .type(this.candidate.email)

    cy
      .get('input[name="phone"]')
      .type(this.candidate.phone)

    cy
      .get('input[name="address"]')
      .type(this.candidate.address)

    cy
      .get('input[name="city"]')
      .type(this.candidate.city)

    cy
      .get('input[name="zip_code"]')
      .type(this.candidate.zip_code)


    cy.get("form").submit();

    cy.wait(5000)
  });

  it("Should be listed", function() {

    cy.visit("/dashboard/o/dkxzma3/jobs/2XMOI_yq66e6b")

    cy
      .get('.card-thumbnail')
      .find('.card-thumbnail-content')
      .find('.card-thumbnail-infos')
      .find('.card-thumbnail-name')
      .should(function($span) {
        var text = $span.text();
        expect(text).contains(this.candidate.name);
      });
  });
});

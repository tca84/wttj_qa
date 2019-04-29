### 1. Install Cypress

[Follow these instructions to install Cypress.](https://on.cypress.io/guides/installing-and-running#section-installing)

### 2. Setup cypress.json

```bash
cd ex3

## copy cypress.json sample file
cp cypress.json.sample cypress.json

## update following env vars. theses vars can be retrieved in cookies after manual login
## "user.id" : "",
## "_wk_session": "",
## "activity": "",
## "user.expires_at": ""
vi cypress.json
```


### 3. Run tests

Now, you can run tests using command line: 

```bash
node_modules/cypress/bin/cypress run
```


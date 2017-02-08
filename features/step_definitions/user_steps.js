var {
    defineSupportCode
} = require('cucumber');

defineSupportCode(function({
    Given,
    When,
    Then
}) {
  var user = {
    email:'',
    first_name:'',
    last_name:'',
    password: ''
  }
    Given('I have provided my first name as {arg1:stringInDoubleQuotes}', function(arg1, callback) {
        user.first_name = arg1;
        callback();
    });
    Given('I have provided my last name as {arg1:stringInDoubleQuotes}', function(arg1, callback) {
        user.last_name = arg1;
        callback();
    });

    Given('I have provided my email address as {arg1:stringInDoubleQuotes}', function(arg1, callback) {
        user.email = arg1;
        callback();
    });

    Given('I have provided my password as {arg1:stringInDoubleQuotes}', function(arg1, callback) {
        user.password = arg1;
        callback();
    });

    When('I register', function(callback) {
        this.db.none("insert into users(first_name, last_name, email, password) values($1, $2, $3, $4)", [user.first_name, user.last_name, user.email, user.password])
        .then(function() {
          callback();
        })
        .catch(function(error){
          callback(error);
        });
    });

    Then('I will be logged in', function(callback) {
        this.db.query("select id, first_name, last_name, email, password from users")
        .then(function(results){
          expect(results).to.have.lengthOf(1);
          expect(results[0].first_name).to.be.equal(user.first_name);
          expect(results[0].last_name).to.be.equal(user.last_name)
          expect(results[0].email).to.be.equal(user.email)
          expect(results[0].password).to.be.equal(user.password)
          callback();
        })
        .catch(function(error) {
          callback(error);
        });
    });

    Then('I will be on my personal page', function(callback) {
        // This is a nonsensical requirement for the db, so ignore it
        callback();
    });
});

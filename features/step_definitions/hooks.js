// features/step_definitions/hooks.js
var {defineSupportCode} = require('cucumber');

defineSupportCode(function({Before, After}) {
  Before(function(){
    this.db.none("delete from users");
  })
  After(function() {
    this.pg.end();
  });
});

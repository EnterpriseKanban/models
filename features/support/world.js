// features/support/world.js
require('pg');

var pg = require('pg-promise')();

var client = pg({
    host: 'localhost',
    database: 'EnterpriseKanban',
    user: 'EnterpriseKanban',
    password: 'EnterpriseKanban'
});

var {defineSupportCode} = require('cucumber');

function CustomWorld() {
  this.pg = pg;
  this.db = client;
}

defineSupportCode(function({setWorldConstructor}) {
  setWorldConstructor(CustomWorld)
})

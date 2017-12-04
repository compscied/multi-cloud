'use strict'

/*
 * This example demonstates nested boolean logic - e.g. (x OR y) AND (a OR b).
 *
 * Usage:
 *   node ./examples/02-nested-boolean-logic.js
 *
 * For detailed output:
 *   DEBUG=json-rules-engine node ./examples/02-nested-boolean-logic.js
 */

require('colors')
let Engine = require('dist').Engine

/**
 * Setup a new engine
 */
let engine = new Engine()


engine.addRule({
  conditions: {
    any: [{
      all: [{
        fact: 'cpuUtilizaiton',
        operator: 'greaterThanInclusive',
        value: 80
      }, {
        fact: 'memoryUtilizaiton',
        operator: 'greaterThanInclusive',
        value: 80
      }]
    }]
    }]
  },
  event: {  // define the event to fire when the conditions evaluate truthy
    type: 'spinUpNewNode',
    params: {
      message: 'Need to Spin Up a New Node!'
    }
  }
})

/**
 * define the facts
 * note: facts may be loaded asynchronously at runtime; see the advanced example below
 */
let facts = {
  personalFoulCount: 6,
  gameDuration: 40
}

// run the engine
engine
  .run(facts)
  .then(events => { // run() return events with truthy conditions
    events.map(event => console.log(event.params.message.red))
  })
  .catch(console.log)

/*
 * OUTPUT:
 *
 * Player has fouled out!
 */
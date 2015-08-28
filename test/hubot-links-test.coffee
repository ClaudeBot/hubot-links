chai = require "chai"
sinon = require "sinon"
chai.use require "sinon-chai"

expect = chai.expect

describe "hubot-links", ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require("../src/hubot-links")(@robot)

  it "registers a respond listener", ->
    expect(@robot.respond).to.have.been.calledWith(/links clear/i)
    expect(@robot.respond).to.have.been.calledWith(/links list\s?(\d*)/i)

  it "registers a hear listener", ->
    expect(@robot.hear).to.have.been.calledWith(/((https?|ftp):\/\/|www\.)[^\s\/$.?#].[^\s]*/i)
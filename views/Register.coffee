React     = require 'react'
Page      = require '../components/Page.coffee'
Router    = require 'react-router'
Bootstrap = require 'react-bootstrap'

{ Link }               = Router
{ Input, ButtonInput } = Bootstrap

module.exports = React.createClass
  render: ->
    <Page>
      <form role="form" className="form-horizontal" method="post" action="/register">
        <h3>Register</h3>
        <Input type="text" name="username" label="Username" placeholder="Enter Username..." labelClassName="col-xs-2" wrapperClassName="col-xs-10"/>
        <Input type="password" name="password" label="Password" placeholder="Enter Password..." labelClassName="col-xs-2" wrapperClassName="col-xs-10"/>
        <ButtonInput type='submit' value='Register an account' className="col-xs-12" bsStyle="success"/>
      </form>
    </Page>

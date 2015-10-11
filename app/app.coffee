
'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngRoute'
  'ngMaterial'
  'ngMdIcons'
  'app.controllers'
  'app.directives'
  'app.filters'
  'app.services'
  'app.templates'
  'app.todo.controllers'
  'app.view1.controllers'
  'app.view2.controllers'
])

App.config([
  '$routeProvider'

  ($routeProvider) ->
    $routeProvider
      .when('/todo', {templateUrl: 'app/sections/todo/partials/todo.jade'})
      .when('/view1', {templateUrl: 'app/sections/view1/partials/partial1.jade'})
      .when('/view2', {templateUrl: 'app/sections/view2/partials/partial2.jade'})
      # Catch all
      .otherwise({redirectTo: '/todo'})
])

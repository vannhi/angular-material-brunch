angular.module('app.todo.controllers', [])

.controller('TodoCtrl', [
  '$scope'

($scope) ->

  $scope.todos = [
    text: "learn angular"
    done: true
  ,
    text: "build an angular app"
    done: false
  ]

  $scope.addTodo = ->
    $scope.todos.push
      text: $scope.todoText
      done: false

    $scope.todoText = ""

  $scope.remaining = ->
    $scope.todos.filter (todo) -> not todo.done
      .length

  $scope.archive = ->
    oldTodos = $scope.todos
    $scope.todos = $scope.todos.filter (todo) -> not todo.done
])


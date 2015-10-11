expect = chai.expect

describe "Todo Controller", ->

  scope = ctrl = null

  beforeEach(module "app.todo.controllers")

  beforeEach inject ($rootScope, $controller)->
    scope = $rootScope.$new()
    ctrl = $controller "TodoCtrl", $scope: scope

  it "Todo list should be initialized with 2 todos", ->
    expect(scope.todos).to.have.length(2)
  
  it "addTodo should create new Todo from todoText at the end of the list and reset todoText", ->
    scope.todoText = "newTodo"
    scope.addTodo()
    expect(scope.todos).to.have.length(3)
    expect(scope.todos[2]).to.eql
      text: "newTodo"
      done: false
    expect(scope.todoText).to.be.empty

  it "remaining should return the number of undone todo", ->
    scope.todos = [
      text: "learn angular"
      done: true
    ,
      text: "build an angular app"
      done: false
    ,
      text: "test app"
      done: false
    ]
    expect(scope.remaining()).to.equal 2

    scope.todos.pop()
    expect(scope.remaining()).to.equal 1

  it "archive should remove all done todos", ->
    scope.todos = [
      text: "learn angular"
      done: true
    ,
      text: "build an angular app"
      done: false
    ,
      text: "test app"
      done: false
    ]

    scope.archive()
    expect(scope.todos).to.eql [
      text: "build an angular app"
      done: false
    ,
      text: "test app"
      done: false
    ]
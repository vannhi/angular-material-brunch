chai = require "chai"
expect = chai.expect
chai.use require "chai-as-promised"

class TodoPage
  constructor: ->
    @allTodos = element.all By.repeater('todo in todos')
    @doneTodos = @allTodos.filter (elem)->
      elem.$("md-checkbox").getAttribute("aria-checked").then (x)->x is "true"

    @notDoneTodos = @allTodos.filter (elem)->
      elem.$("md-checkbox").getAttribute("aria-checked").then (x)->x is "false"

    @archiveButton = $("[ng-view] a[ng-click='archive()']")
    @newTodoText = element By.model('todoText')
    @navTodoButton = $("[href='#/todo']")
    @navView1Button = $("[href='#/view1']")
    @navView2Button = $("[href='#/view2']")
    @form = $("form")

  get: ->
    browser.get("")

describe "my app", ->
  todoPage = null
  beforeEach ->
    todoPage = new TodoPage
    todoPage.get()

  NEW_ITEM_LABEL = "test newly added item"

  switchToToDo = ->
    todoPage.navTodoButton.click()
    expect(browser.getCurrentUrl()).to.eventually.equal "#{browser.baseUrl}/#/todo"

  switchToView1 = ->
    todoPage.navView1Button.click()
    expect(browser.getCurrentUrl()).to.eventually.equal "#{browser.baseUrl}/#/view1"

  it "should automatically redirect to /todo when location hash/fragment is empty", ->
    expect(browser.getCurrentUrl()).to.eventually.equal "#{browser.baseUrl}/#/todo"

  describe "todo", ->

    addToDoItem = ()->
      todoPage.newTodoText.sendKeys NEW_ITEM_LABEL
      todoPage.form.submit()
      expect(todoPage.allTodos.count()).to.eventually.equal 3
      expect(todoPage.allTodos.last().element(By.binding("todo.text")).getText()).to.eventually.equal NEW_ITEM_LABEL
      expect(todoPage.newTodoText.getText()).to.eventually.equal ""

    it "should list 2 items", ->
      expect(todoPage.allTodos.count()).to.eventually.equal 2

    it "should display checked items with a line-through", ->
      todoPage.doneTodos.each (elem)->
        expect(elem.$(".todo-text").getCssValue("text-decoration")).to.eventually.equal "line-through"

    it "should sync done status with checkbox state", ()->
      todoPage.notDoneTodos.each (elem)-> elem.click()
      todoPage.allTodos.$$(".todo-text").each (elm) ->
        expect(elm.getAttribute("class")).to.eventually.have.string "done"

      todoPage.doneTodos.each (elem)-> elem.click()
      todoPage.allTodos.$$(".todo-text").each (elm) ->
        expect(elm.getAttribute("class")).to.eventually.not.have.string "done"

    it "should remove checked items when the archive link is clicked", ->
      todoPage.archiveButton.click()
      expect(todoPage.allTodos.count()).to.eventually.equal 1

    it "should add a newly submitted item to the end of the list and empty the text input", addToDoItem

    it "should reset after switching views", ->
      this.timeout 5000
      addToDoItem()
      switchToView1()
      switchToToDo()
      expect(todoPage.allTodos.count()).to.eventually.equal 2

    it "should navigate to /view1 when the View 1 link in nav is clicked", ->
      switchToView1()

  describe "view1", ->
    beforeEach ->
      browser.get "#/view1"

    it "should render view1 when user navigates to /view1", ->
      expect($$("p").first().getText()).to.eventually.match /partial for view 1/

  describe "view2", ->
    beforeEach ->
      browser.get "#/view2"

    it "should render view2 when user navigates to /view2", ->
      expect($$("p").first().getText()).to.eventually.match /partial for view 2/
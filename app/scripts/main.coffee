`'use strict'`
#alert "allo"

app = angular.module 'infoolio', []

class BookController
  @$inject: ['$scope']
  constructor: (@scope) ->
    @scope.greeting = 'demo value'
    @createBook()
    
    @stages = [new StartStage()]
    
    @scope.bookPages = @book.getTotalPageCount()
    @scope.bookPagesEmpty = @book.getEmptyPageCount()
    @scope.stagesLeft = @stages.length
    @scope.stages = @stages

  clearText: =>
    @scope.demo = ""
   
  createBook: ->
    @book = new Book()
    @scope.book = @book;

app.controller 'bookController', BookController
 
  
     
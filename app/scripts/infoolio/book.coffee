###
   @scope.bookPages = @book.getTotalPageCount()
    @scope.bookPagesEmpty = @book.getEmptyPageCount()
    @scope.stagesLeft = @stages.length
    @scope.stages = @stages
###

class Book
  title : "Buchtitel"
  purpose : ""
  constructor: ()->
    firstPage = new Page()
    @pages = [1:firstPage]
  getTotalPageCount: () ->
    100
  getEmptyPageCount: () ->
    20 
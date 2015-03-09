###
   @scope.bookPages = @book.getTotalPageCount()
    @scope.bookPagesEmpty = @book.getEmptyPageCount()
    @scope.stagesLeft = @stages.length
    @scope.stages = @stages
###

class FontElement
  text : ''
  family : 'sans-serif'
  size : 12
  bold : false
  italic : false
  capital : false
  align : 'left'

class Book
  workingTitle : ''
  title : {font: new FontElement() }
  subtitle : {font: new FontElement() }
  purpose : ''
  totalPages : 100
  emptyPages : 20
  constructor: ()->
    firstPage = new Page()
    @pages = [firstPage]
    @totalPages = @getTotalPageCount()
    
  getTotalPageCount: () ->
    return @pages.length
  getEmptyPageCount: () ->
    @emptyPages
    
  getOddPages: () ->
    returnArr = []
    for page, key in @pages
      if key % 2 > 0
        returnArr.push( page )
    return returnArr

  getEvenPages: () ->
    returnArr = []
    for page, key in @pages
      if key % 2 == 0
        returnArr.push( page )
    return returnArr
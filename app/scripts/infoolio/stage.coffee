`'use strict'`

PAGES = 
  cover: 0

class Stage
  @$inject: ['$scope']
  isActive : false
  isCompleted : false
  ### bookview
    page: which pages should be desplayed (page number)
      from: starting with page 
      length: display pages till
    view: how many Pages should be seen at once (1 or 2)
  ###
  bookView: { displayPages: {from: PAGES.cover, length: 1}, view: 1 }

  constructor: (@scope) ->
    @scope.test = "JUHUU"
  
  checkIfStageComplete: ()->
    return true
    
  activate: ()->
    @isActive = true

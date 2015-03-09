class LayoutStage extends Stage
  @$inject: ['$scope']
  constructor: (@scope) ->
    @scope.test = "JUHUU"
  checkIfStageComplete: ()->
    #return @book.title? is not '' and @book.purpose? is not ''
    return true
  getInputTemplate: () ->
    'partials/layoutStageInput.html'
  
app.controller 'layoutStageController', LayoutStage 
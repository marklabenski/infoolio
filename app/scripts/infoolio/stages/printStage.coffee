class PrintStage extends Stage
  @$inject: ['$scope']
  constructor: (@scope) ->
    @scope.test = "JUHUU"
  checkIfStageComplete: ()->
    #return @book.title? is not '' and @book.purpose? is not ''
    return true
  getInputTemplate: () ->
    'partials/printStageInput.html'

app.controller 'printStageController', PrintStage 
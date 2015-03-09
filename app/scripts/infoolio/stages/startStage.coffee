
class StartStage extends Stage
  @$inject: ['$scope']
  constructor: (@rootScope) ->
    @rootScope.test = "JUHUU"
  checkIfStageComplete: ()->
    #return @book.title? is not '' and @book.purpose? is not ''
    return true
  getInputTemplate: () ->
    'partials/startStageInput.html'
    
app.controller 'startStageController', StartStage 
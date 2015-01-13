
class StartStage extends Stage
  @$inject: ['$scope']
  constructor: (@scope) ->
    @scope.test = "JUHUU"
  checkIfStageComplete: ()->
    #return @book.title? is not '' and @book.purpose? is not ''
    return true

    
app.controller 'startStageController', StartStage 
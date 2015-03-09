class ContentStage extends Stage
  @$inject: ['$scope']
  constructor: (@rootScope) ->

    @rootScope.test = "JUHUU"
  checkIfStageComplete: ()->
    #return @book.title? is not '' and @book.purpose? is not ''
    return true
  getInputTemplate: () ->
    'partials/contentStageInput.html'

app.controller 'contentStageController', ContentStage 
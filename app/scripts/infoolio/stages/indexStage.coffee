class IndexStage extends Stage
  
  checkIfStageComplete: ()->
    #return @book.title? is not '' and @book.purpose? is not ''
    return true
  getInputTemplate: () ->
    'partials/indexStageInput.html'

app.controller 'indexStageController', IndexStage 
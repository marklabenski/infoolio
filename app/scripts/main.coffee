`'use strict'`
#alert "allo"


###
  Controller for the whole Application
###
class BookController
  @$inject: ['$scope']
  
  constructor: (@scope) ->
    @currentStep = 1
    @createBook()   
    @initStages()
    @fillScope()
    
    @stepClasses = ['step-one', 'step-two', 'step-three', 'step-four', 'step-five', 'step-six', 'step-seven']
    @changeStepClass()
    
  
  ###
    Fill the app scope
    add methods here to let them be present in controller scope   
  ###
  fillScope: () ->
    @scope.greeting = 'demo value'
    @scope.bookPages = @book.getTotalPageCount()
    @scope.bookPagesEmpty = @book.getEmptyPageCount()
    @scope.stagesLeft = @stages.length
    @scope.stages = @stages
    @scope.continueToNextStage = @continueToNextStage
    @scope.activateStage = @activateStage
    @scope.bookViewTemplate = 'partials/bookView.html'
   
  
  ###
    fill stages Array
  ###
  initStages: () =>
    startStage = new StartStage(@scope)
    envelopeStage = new EnvelopeStage(@scope)
    titleStage = new TitleStage(@scope)
    indexStage = new IndexStage(@scope) 
    contentStage = new ContentStage(@scope)
    layoutStage = new LayoutStage(@scope)
    printStage = new PrintStage(@scope)
    
    @stages = [startStage, envelopeStage, titleStage, indexStage, contentStage, layoutStage, printStage]
    @currentStageNumber = 0
    @activateStage(0)
    
  ###
    check if all changes made and then go to the next stage in Array
  ###
  continueToNextStage: () =>
    @activateStage(@currentStageNumber+1, true)
        
  activateStage: (newStageNumber, addOneToStep = false) =>
    if addOneToStep or @currentStep-1 >= newStageNumber
      @currentStage = @stages[@currentStageNumber]
      
      if(@currentStage.checkIfStageComplete())
        if @stages.length-1 >= newStageNumber
          @currentStage.isActive = false
          
          @currentStageNumber = newStageNumber
          if addOneToStep
            @currentStep++
            @changeStepClass()
          @currentStage = @stages[@currentStageNumber]
          @scope.inputTemplate = @currentStage.getInputTemplate()
          @currentStage.isActive = true
  
  changeStepClass: () =>
    @scope.stepClass = @stepClasses[@currentStageNumber]
        
  createBook: =>
    @book = new Book()
    @scope.book = @book;


app.controller 'bookController', BookController
 
  
     
`'use strict'`
#alert "allo"


###
  Controller for the whole Application
###
class BookController
  @$inject: ['$scope']
  
  constructor: (@scope) ->
    @createBook()   
    @initStages()
    @fillScope()
    @currentStep = 1
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
  
  ###
    fill stages Array
  ###
  initStages: () =>
    startStage = new StartStage(@scope)
    startStage.activate()
    envelopeStage = new EnvelopeStage(@scope)
    titleStage = new TitleStage(@scope)
    
    @stages = [startStage, envelopeStage, titleStage]
    @currentStageNumber = 0
  
    
  ###
    check if all changes made and then go to the next stage in Array
  ###
  continueToNextStage: () =>
    @activateStage(@currentStageNumber+1, true)
        
  activateStage: (newStageNumber, changeStep = false) =>
    if changeStep or @currentStep-1 >= newStageNumber
      currentStage = @stages[@currentStageNumber]
      
      if(currentStage.checkIfStageComplete())
        if @stages.length-1 >= newStageNumber
          currentStage.isActive = false
          
          @currentStageNumber = newStageNumber
          if changeStep
            @currentStep++
            @changeStepClass()
          currentStage = @stages[@currentStageNumber]
          currentStage.isActive = true
  
  changeStepClass: () =>
    @scope.stepClass = @stepClasses[@currentStageNumber]
        
  createBook: =>
    @book = new Book()
    @scope.book = @book;

app.controller 'bookController', BookController
 
  
     
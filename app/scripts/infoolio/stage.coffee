`'use strict'`
class Stage
  isActive : false
  isCompleted : false
  checkIfStageComplete: ()->
    return true
    
  activate: ()->
    @isActive = true
  
   
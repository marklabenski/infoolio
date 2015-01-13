(function() {
  'use strict';
  var Book, BookController, EnvelopeStage, Page, Stage, StartStage, TitleStage, app,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  app = angular.module('infoolio', []);

  'use strict';

  Stage = (function() {
    function Stage() {}

    Stage.prototype.isActive = false;

    Stage.prototype.isCompleted = false;

    Stage.prototype.checkIfStageComplete = function() {
      return true;
    };

    Stage.prototype.activate = function() {
      return this.isActive = true;
    };

    return Stage;

  })();

  StartStage = (function(_super) {
    __extends(StartStage, _super);

    StartStage.$inject = ['$scope'];

    function StartStage(scope) {
      this.scope = scope;
      this.scope.test = "JUHUU";
    }

    StartStage.prototype.checkIfStageComplete = function() {
      return true;
    };

    return StartStage;

  })(Stage);

  app.controller('startStageController', StartStage);

  'use strict';

  EnvelopeStage = (function(_super) {
    __extends(EnvelopeStage, _super);

    function EnvelopeStage() {
      return EnvelopeStage.__super__.constructor.apply(this, arguments);
    }

    EnvelopeStage.prototype.checkIfStageComplete = function() {
      return true;
    };

    return EnvelopeStage;

  })(Stage);

  'use strict';

  TitleStage = (function(_super) {
    __extends(TitleStage, _super);

    function TitleStage() {
      return TitleStage.__super__.constructor.apply(this, arguments);
    }

    TitleStage.prototype.checkIfStageComplete = function() {
      return true;
    };

    return TitleStage;

  })(Stage);

  Page = (function() {
    function Page() {}

    return Page;

  })();


  /*
     @scope.bookPages = @book.getTotalPageCount()
      @scope.bookPagesEmpty = @book.getEmptyPageCount()
      @scope.stagesLeft = @stages.length
      @scope.stages = @stages
   */

  Book = (function() {
    Book.prototype.title = '';

    Book.prototype.purpose = '';

    function Book() {
      var firstPage;
      firstPage = new Page();
      this.pages = [
        {
          1: firstPage
        }
      ];
    }

    Book.prototype.getTotalPageCount = function() {
      return 100;
    };

    Book.prototype.getEmptyPageCount = function() {
      return 20;
    };

    return Book;

  })();

  'use strict';


  /*
    Controller for the whole Application
   */

  BookController = (function() {
    BookController.$inject = ['$scope'];

    function BookController(scope) {
      this.scope = scope;
      this.createBook = __bind(this.createBook, this);
      this.changeStepClass = __bind(this.changeStepClass, this);
      this.activateStage = __bind(this.activateStage, this);
      this.continueToNextStage = __bind(this.continueToNextStage, this);
      this.initStages = __bind(this.initStages, this);
      this.createBook();
      this.initStages();
      this.fillScope();
      this.currentStep = 1;
      this.stepClasses = ['step-one', 'step-two', 'step-three', 'step-four', 'step-five', 'step-six', 'step-seven'];
      this.changeStepClass();
    }


    /*
      Fill the app scope
      add methods here to let them be present in controller scope
     */

    BookController.prototype.fillScope = function() {
      this.scope.greeting = 'demo value';
      this.scope.bookPages = this.book.getTotalPageCount();
      this.scope.bookPagesEmpty = this.book.getEmptyPageCount();
      this.scope.stagesLeft = this.stages.length;
      this.scope.stages = this.stages;
      this.scope.continueToNextStage = this.continueToNextStage;
      return this.scope.activateStage = this.activateStage;
    };


    /*
      fill stages Array
     */

    BookController.prototype.initStages = function() {
      var envelopeStage, startStage, titleStage;
      startStage = new StartStage(this.scope);
      startStage.activate();
      envelopeStage = new EnvelopeStage(this.scope);
      titleStage = new TitleStage(this.scope);
      this.stages = [startStage, envelopeStage, titleStage];
      return this.currentStageNumber = 0;
    };


    /*
      check if all changes made and then go to the next stage in Array
     */

    BookController.prototype.continueToNextStage = function() {
      return this.activateStage(this.currentStageNumber + 1, true);
    };

    BookController.prototype.activateStage = function(newStageNumber, changeStep) {
      var currentStage;
      if (changeStep == null) {
        changeStep = false;
      }
      if (changeStep || this.currentStep - 1 >= newStageNumber) {
        currentStage = this.stages[this.currentStageNumber];
        if (currentStage.checkIfStageComplete()) {
          if (this.stages.length - 1 >= newStageNumber) {
            currentStage.isActive = false;
            this.currentStageNumber = newStageNumber;
            if (changeStep) {
              this.currentStep++;
              this.changeStepClass();
            }
            currentStage = this.stages[this.currentStageNumber];
            return currentStage.isActive = true;
          }
        }
      }
    };

    BookController.prototype.changeStepClass = function() {
      return this.scope.stepClass = this.stepClasses[this.currentStageNumber];
    };

    BookController.prototype.createBook = function() {
      this.book = new Book();
      return this.scope.book = this.book;
    };

    return BookController;

  })();

  app.controller('bookController', BookController);

}).call(this);

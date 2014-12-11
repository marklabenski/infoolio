(function() {
  'use strict';
  var Book, BookController, Page, Stage, StartStage, app,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Stage = (function() {
    Stage.prototype.isActive = false;

    function Stage() {}

    return Stage;

  })();

  'use strict';

  StartStage = (function(_super) {
    __extends(StartStage, _super);

    function StartStage() {
      return StartStage.__super__.constructor.apply(this, arguments);
    }

    StartStage.prototype.isActive = true;

    return StartStage;

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
    Book.prototype.title = "Buchtitel";

    Book.prototype.purpose = "";

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

  app = angular.module('infoolio', []);

  BookController = (function() {
    BookController.$inject = ['$scope'];

    function BookController(scope) {
      this.scope = scope;
      this.clearText = __bind(this.clearText, this);
      this.scope.greeting = 'demo value';
      this.createBook();
      this.stages = [new StartStage()];
      this.scope.bookPages = this.book.getTotalPageCount();
      this.scope.bookPagesEmpty = this.book.getEmptyPageCount();
      this.scope.stagesLeft = this.stages.length;
      this.scope.stages = this.stages;
    }

    BookController.prototype.clearText = function() {
      return this.scope.demo = "";
    };

    BookController.prototype.createBook = function() {
      this.book = new Book();
      return this.scope.book = this.book;
    };

    return BookController;

  })();

  app.controller('bookController', BookController);

}).call(this);

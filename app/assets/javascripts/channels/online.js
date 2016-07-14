// App.cable.subscriptions.create "OnlineChannel",
//   # Called when the subscription is ready for use on the server
//   connected: ->
//     @install()
//     @appear()

//   # Called when the WebSocket connection is closed
//   disconnected: ->
//     @uninstall()

//   # Called when the subscription is rejected by the server
//   rejected: ->
//     @uninstall()

//   appear: ->
//     # Calls `OnlineChannel#appear(data)` on the server
//     @perform("appear", appearing_on: $("main").data("appearing-on"))

//   away: ->
//     # Calls `OnlineChannel#away` on the server
//     @perform("away")


//   buttonSelector = "[data-behavior~=appear_away]"

//   install: ->
//     $(document).on "page:change.appearance", =>
//       @appear()

//     $(document).on "click.appearance", buttonSelector, =>
//       @away()
//       false

//     $(buttonSelector).show()

//   uninstall: ->
//     $(document).off(".appearance")
//     $(buttonSelector).hide()

(function() {
  var buttonSelector;

  App.cable.subscriptions.create("OnlineChannel", {
    connected: function() {
      this.install();
      return this.appear();
    },
    disconnected: function() {
      return this.uninstall();
    },
    rejected: function() {
      return this.uninstall();
    },
    appear: function() {
      return this.perform("appear", {
        appearing_on: $("main").data("appearing-on")
      });
    },
    away: function() {
      return this.perform("away");
    }
  }, buttonSelector = "[data-behavior~=appear_away]", {
    install: function() {
      $(document).on("page:change.appearance", (function(_this) {
        return function() {
          return _this.appear();
        };
      })(this));
      $(document).on("click.appearance", buttonSelector, (function(_this) {
        return function() {
          _this.away();
          return false;
        };
      })(this));
      return $(buttonSelector).show();
    },
    uninstall: function() {
      $(document).off(".appearance");
      return $(buttonSelector).hide();
    }
  });

}).call(this);
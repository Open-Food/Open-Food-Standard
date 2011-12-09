$(document).ready(function() {
  var app = Sammy("#main", function() {
    this.use('Template');

    this.get("#/", function(context) {
      $("#show_thing").hide();
      $("#things").text("");
      this.load("things.json").then(function(items) {
        $.each(items, function(i, item) {
          context.render("templates/thing.template", {thing:item}).appendTo("#things");
        });
      });
      $("#things").show();
    });

    this.get("#/things/:id", function(context) {
      $("#things").hide();
      this.load("things/"+ this.params["id"] + ".json").then(function(thing){
        context.render("templates/show_thing.template", {thing:thing}).replace("#show_thing");
      })
      $("#show_thing").show();
    });

    this.get("#/search", function(context) {
      $("#things").text("");
      console.log(this.params["name"]);
      this.load("things.json?name="+this.params["name"], {}).then(function(things){
        $.each(things, function(i, thing) {
          context.render("templates/thing.template", {thing:thing}).appendTo("#things");
        });
      });
      $("#things").show();
    });
  });

  app.run("#/");
});

var HomeView = Backbone.View.extend({
	el: 'body',

	initialize: function() {
		if (window.location.pathname == "/beer_types/new") {
			this.$("footer").hide();
		}
	}
});

var homeView = new HomeView();
var HomeView = Backbone.View.extend({
	el: 'body',

	initialize: function() {
		if (window.location.pathname == "/beers/new") {
			this.$("footer").hide();
		}
		// $("#search_beer").autocomplete({
		// 	source: "/search_suggestions"
		// });
	}
});

var homeView = new HomeView();
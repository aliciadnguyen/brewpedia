var BeerTypeView = Backbone.View.extend({
	el: '.form-container',

	events: {
		'click .btn-submit' : 'formValidate'
	},

	initialize: function() {
		this.formValidate();
	},

	formValidate: function() {
		$("#beer-form").validate({
			debug: true,
			rules: {
				"beer_type[name]": {
					required: true,
					url: false
				},

				"beer_type[beer_id]": {
					required: true,
					url: false
				},

				"beer_type[brewery]": {
					required: true,
					url: false
				},

				"beer_type[location]": {
					required: true,
					url: false
				},

				"beer_type[review]": {
					required: true,
					url: false
				},

				"beer_type[appearance]": {
					required: true,
					url: false
				},

				"beer_type[smell]": {
					required: true,
					url: false
				},

				"beer_type[taste]": {
					required: true,
					url: false
				},

				"beer_type[overall]": {
					required: true,
					url: false,
					number: true
				}
			}
		});
	}
});

var beerTypeView = new BeerTypeView();
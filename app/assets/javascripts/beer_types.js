var BeerTypeView = Backbone.View.extend({
	el: '.form-container',

	initialize: function() {
		this.formValidate();
	},

	formValidate: function() {
		$("#new_beer_type").validate({
			debug: true,
			rules: {
				"beer_type[name]": {
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
			},
			submitHandler: function(form) {
				form.submit();
			}
		});
	}
});

var beerTypeView = new BeerTypeView();
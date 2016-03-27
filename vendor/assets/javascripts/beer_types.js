var BeerTypeView = Backbone.View.extend({
	el: '.form-container',

	initialize: function() {
		this.formValidate();
	},

	formValidate: function() {
		$("#new_beer").validate({
			debug: true,
			rules: {
				"beer[name]": {
					required: true,
					url: false
				},

				"beer[brewery]": {
					required: true,
					url: false
				},

				"beer[location]": {
					required: true,
					url: false
				},

				"beer[review]": {
					required: true,
					url: false
				},

				"beer[appearance]": {
					required: true,
					url: false
				},

				"beer[smell]": {
					required: true,
					url: false
				},

				"beer[taste]": {
					required: true,
					url: false
				},

				"beer[overall]": {
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
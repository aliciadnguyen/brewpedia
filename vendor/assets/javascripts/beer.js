var BeerView = Backbone.View.extend({
	el: '.row.content.beer',

	events: {
		'click .button' : 'flipBox'
	},

	initialize: function() {
		this.flipBox();
	},

	flipBox: function() {
		var box = this.$('.boxed');
		box.flip();
	}
});

var beerView = new BeerView();
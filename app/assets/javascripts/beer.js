var BeerView = Backbone.View.extend({
	el: '.beer',

	events: {
		'click .button' : 'flipBox',
		'mouseenter .boxed' : 'addOverlay'
	},

	initialize: function() {
		this.flipBox();
	},

	flipBox: function() {
		var box = $('.boxed');
		box.flip().removeClass('.hover');
	},

	addOverlay: function() {
		var box = $('.boxed');
		box.addClass('overlay');
	}
});

var beerView = new BeerView();
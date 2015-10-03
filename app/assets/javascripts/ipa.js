var IpaView = Backbone.View.extend({
	el: '.ipa',

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

var ipaView = new IpaView();
describe "BeerView", ->
	beer = null
	beforeEach ->
		beer = new BeerView()

	it "should be define", ->
		expect(BeerView).toBeDefined()

	it "can be instantiated", ->
		expect(beer).not.toBeNull()

	describe "#initialize", ->
		it "should defined initialize func", ->
			expect(beer.initialize).toBeDefined()

	describe "#flipBox", ->
		it "should defined flipBox func", ->
			expect(beer.flipBox).toBeDefined()

		it "should flip the box when clicked", ->	
			spyOn(BeerView.prototype, 'flipBox')
			new BeerView()
			expect(BeerView.prototype.flipBox).toHaveBeenCalled()
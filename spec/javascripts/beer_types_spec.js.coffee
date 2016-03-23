describe "BeerTypeView", ->
	beerType = null
	beforeEach ->
		beerType = new BeerTypeView()

	it "should be define", ->
		expect(BeerTypeView).toBeDefined()

	it "can be instantiated", ->
		expect(beerType).not.toBeNull()

	describe "#initialize", ->
		it "should defined initialize func", ->
			expect(beerType.initialize).toBeDefined()

	describe "#formValidate", ->
		it "should defined formValidate func", ->
			expect(beerType.formValidate).toBeDefined()


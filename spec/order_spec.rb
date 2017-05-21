require "order"

describe Order do
subject(:order) { described_class.new }

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number
# of several available dishes

  describe "#selection_of_dish" do
    it "should raise an error if the dish a user has chosen is not on the menu" do
      expect{ order.selection_of_dish("pork", 2) }.to raise_error "Dish not in menu: please select a dish from the menu"
    end

    it "should raise an error if the number of dishes inputted is not an integer" do
      expect{ order.selection_of_dish("chicken", "not a number") }.to raise_error "That is not a number, please enter a valid number"
    end

    it "should select the dish and the amount of that dish a user wants" do
      expect(order.selection_of_dish("chicken", 2)).to eq([{dish: "chicken", price: 9.98}])
    end
  end

#As a customer
# So that I can verify that my order is correct
# I would like to check that the total
# I have been given matches the sum of the various dishes in my order

  describe "#user_order" do
    # let(:order) { double('order', selection_of_dish: 'chicken', 2 ) }
    # allow(:order).to receive(:selection_of_dish 'chicken', 2)
    it "should print the user's order" do
      order.stub(:selection_of_dish).with('chicken', 2)
      expect(order).to respond_to(show_order)
      # .to eq("You have selected 3 dishes: chicken at £9.98
      # [nil, nil, nil].This gives you a total price of £25.97=> nil")
    end
  describe "#delete_order" do
    it "should delete the dish and quantity of that dish if it is included in the order" do
      order.stub(:selection_of_dish).with('chicken', 2)
      order.stub(:delete_order).with('chicken')
      expect(order.meal).not_to include("chicken")
    end
  end
  end
end

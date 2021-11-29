require '../sandwitch_primitive.rb'

#describe, it, expect are part of rspec core api
#rspec command in terminal, started from projects paret dir
#will search and run every *_spec.rb file in spec folder

#RSpec hooks
#Helper methods
#RSpec's let

RSpec.describe 'An ideal sandwich' do #example group 

    before { @sandwich = Sandwich.new('delicious', []) } #it's a hook
   
    it 'is delicious' do  #an example 
    
        taste = @sandwich.taste
    
        expect(taste).to eq('delicious') #an assertion
    end

    it 'sandwitch with toppings' do

        @sandwich.toppings << 'cheese'

        toppings = @sandwich.toppings

        expect(toppings).not_to be_empty #check
    end

end
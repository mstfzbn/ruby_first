Sandwich = Struct.new(:taste, :toppings)

#describe, it, expect are part of rspec sore api
#rspec command in terminal, started from projects paret dir
#will search and run every *_spec.rb file in spec folder

RSpec.describe 'An ideal sandwich' do #example group 
    it 'is delicious' do  #an example 
     sandwich = Sandwich.new('delicious', [])
    
     taste = sandwich.taste
    
     expect(taste).to eq('delicious') #an assertion
    end
end

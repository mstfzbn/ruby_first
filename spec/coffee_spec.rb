require '../coffee_primitive.rb'

RSpec.describe 'A cup of coffee' do
    
    let( :coffee ) { Coffee.new }

    it 'costs $1' do
        expect(coffee.price).to eq(1.00)
    end

    #context groups set of examples and setup code in
    #common description 
    context 'with milk' do 
        before {coffee.add :milk}

        it 'have a milk' do
            expect(coffee.have_a_milk).to eq(true)
        end

        it 'costs $1.25' do
            expect(coffee.price).to eq(1.25)
        end
    end

    #some example at an idea level
    it 'some pending example, status - todo'

    #some incompleted example with missing implementation
    it 'coffee light color' do
        pending( 'Coffee color not implemented yet' )
        expect(coffee.color).to eq('light')
    end
end


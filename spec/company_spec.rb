require 'company'

RSpec.describe Company do

  context "with no startup information" do
    
    it "raise an error as you cannot start a company" do
        expect { Company.new }.to raise_error CompanyErrors::Formation
    end
    it 'tells you to run print setup basics for more info' do
         STDOUT.should_receive(:puts).with("Run print_setup_basics as Company class method")
         Company.need_to_start?
    end
    it 'prints setups basics' do
        STDOUT.should_receive(:puts).at_least(6)
        Company.print_setup_basics
    end
    it 'tells you to run next steps' do
        STDOUT.should_receive(:puts).with("Run how_to_start with true or false for using model articles as an argument")
        Company.first_steps_to_formation?
    end
    it 'details basics of how to start using model articles of assocation' do
        expect(Company.how_to_start?).to eq Help::Formation.starting_steps
    end
    it 'details starting steps for non model' do
        expect(Company.how_to_start?(false)).to eq Help::Formation.starting_steps_non_model
    end
    it 'runs open command' do
        Company.should { respond_to :example_formation_basics }
    end
    it 'basics are ready? method user YES returns excellent' do
        Company.stub(:gets).and_return("YES")
        STDOUT.should_receive(:puts).with("Excellent")
        Company.basics_ready?
    end
    it 'BAR? method user NO returns Keeping going' do
        Company.stub(:gets).and_return("NO")
        STDOUT.should_receive(:puts).with("Keeping going, you'll get there")
        Company.basics_ready?
    end

  end#end of startup no info context  

end

RSpec.describe CompanyErrors do 
    context "StartUp" do
        it "need formation docs to start" do
            error = CompanyErrors::Formation.new('Need Docs')
            expect( error.message ).to eq "FormationError: Need Docs"
        end
    end
end

RSpec.describe Help do 
    context "Formation" do
        it "returns name commentary" do
            comms = Help::Formation.name
            expect( comms ).to eq "Rules on what can and can't be included"
        end
    end
end
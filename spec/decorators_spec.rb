require_relative '../app/people/nameable'
require_relative '../app/people/person'
require_relative '../app/decorators/base_decorator'
require_relative '../app/decorators/capitalize_decorator'
require_relative '../app/decorators/trimmer_decorator'

describe Decorator do
  before :all do
    @person = Person.new(20, name: 'Fabrizio Microverse')
  end

  context "#Without decorator" do
    it "should return the same person's name" do
      expect(@person.correct_name).to eql "Fabrizio Microverse"
    end
  end

  context "#Capitalize" do
    it "should be an instance of CapitalizeDecorator" do
      capDecorName = CapitalizeDecorator.new(@person)
      expect(capDecorName).to be_an_instance_of CapitalizeDecorator
    end

    it "should return the capitalize person's name" do
      capDecorName = CapitalizeDecorator.new(@person)
      expect(capDecorName.correct_name).to eql "FABRIZIO MICROVERSE"
    end
  end
  
  context "#Trimmer" do
    it "should be an instance of TrimmerDecorator" do
      trimDecorName = TrimmerDecorator.new(@person)
      puts trimDecorName
      expect(trimDecorName).to be_an_instance_of TrimmerDecorator
    end

    it "should return the trimmed person's name of max 10 characters" do
      trimDecorName = TrimmerDecorator.new(@person)
      expect(trimDecorName.correct_name).to eql "Fabrizio M"
    end
  end

  context "#Capitalize&Trimmer" do
    it "should return the capitalize and trimmed person's name of max 10 characters" do
      capDecorName = CapitalizeDecorator.new(@person)
      expect(capDecorName.correct_name).to eql "FABRIZIO MICROVERSE"
      trimDecorName = TrimmerDecorator.new(capDecorName)
      expect(trimDecorName.correct_name).to eql "FABRIZIO M"
    end
  end
end
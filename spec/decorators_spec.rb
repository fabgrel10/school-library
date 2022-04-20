require_relative '../app/people/nameable'
require_relative '../app/people/person'
require_relative '../app/decorators/base_decorator'
require_relative '../app/decorators/capitalize_decorator'
require_relative '../app/decorators/trimmer_decorator'

describe Decorator do
  before :all do
    @person = Person.new(20, name: 'Fabrizio Microverse')
  end

  context '#Without decorator' do
    it 'should return the same person&apos; name' do
      expect(@person.correct_name).to eql 'Fabrizio Microverse'
    end
  end

  context '#Capitalize' do
    it 'should be an instance of CapitalizeDecorator' do
      cap_decor_name = CapitalizeDecorator.new(@person)
      expect(cap_decor_name).to be_an_instance_of CapitalizeDecorator
    end

    it 'should return the capitalize person&apos; name' do
      cap_decor_name = CapitalizeDecorator.new(@person)
      expect(cap_decor_name.correct_name).to eql 'FABRIZIO MICROVERSE'
    end
  end

  context '#Trimmer' do
    it 'should be an instance of TrimmerDecorator' do
      trim_decor_name = TrimmerDecorator.new(@person)
      puts trim_decor_name
      expect(trim_decor_name).to be_an_instance_of TrimmerDecorator
    end

    it 'should return the trimmed person&apos; name of max 10 characters' do
      trim_decor_name = TrimmerDecorator.new(@person)
      expect(trim_decor_name.correct_name).to eql 'Fabrizio M'
    end
  end

  context '#Capitalize&Trimmer' do
    it 'should return the capitalize and trimmed person&apos; name of max 10 characters' do
      cap_decor_name = CapitalizeDecorator.new(@person)
      expect(cap_decor_name.correct_name).to eql 'FABRIZIO MICROVERSE'
      trim_decor_name = TrimmerDecorator.new(cap_decor_name)
      expect(trim_decor_name.correct_name).to eql 'FABRIZIO M'
    end
  end
end

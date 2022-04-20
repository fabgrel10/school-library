require_relative '../app/people/teacher'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new('30', 'Algorithms', name: 'Melanie')
  end

  context 'When testing the Teacher class it' do

    it 'is an instance of Teacher' do
      expect(@teacher).to be_an_instance_of Teacher
    end

    it 'can use services' do
      expect(@teacher.can_use_services?).to be true
    end

    it 'has the assigned specialization' do
      expect(@teacher.specialization).to eq('Algorithms')
    end

    it 'has the assigned age' do
      expect(@teacher.age).to eq('30')
    end

    it 'has the assigned name' do
      expect(@teacher.name).to eq('Melanie')
    end

    it 'has parent permission' do
      expect(@teacher.parent_permission).to be true
    end

    it 'should have a method called "to_json"' do
      expect(@teacher.methods.include?(:to_json)).to eq true
    end
  end
end
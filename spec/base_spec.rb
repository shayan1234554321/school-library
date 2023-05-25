require_relative '../decorator/base_decorater'
require_relative '../classes/person'

describe BaseDecorater do
  context 'Create instance of BaseDecorater class' do
    it 'should return instance of Book class' do
      nameable = double('nameable')
      base = BaseDecorater.new(nameable)
      expect(base).to be_instance_of(BaseDecorater)
    end
  end
end

describe CapitalizeDecorator do
  context 'create instance of CapitalizeDecorator class' do
    person = Person.new('student', 22, 'john')
    capitalize = CapitalizeDecorator.new(person)
    it 'should return Capitalized name' do
      expect(capitalize.correct_name).to eql('John')
    end
  end
end

describe TrimmerDecorator do
  context 'create instance of TrimmerDecorator class' do
    person = Person.new('student', 22, 'MohammadIqbalElham')
    trim = TrimmerDecorator.new(person)
    it 'should return trimmed name' do
      expect(trim.correct_name).to eql('MohammadIq...')
    end
  end
end

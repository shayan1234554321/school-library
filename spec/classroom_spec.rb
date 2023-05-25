require_relative '../classes/classroom'
require_relative '../classes/student'

describe Classroom do
    context "Create instance of Classroom class" do
        classroom = Classroom.new('C1')
        student = Student.new(22 , classroom)
        
        it "should return instance of Classroom class" do
            expect(classroom).to be_instance_of(Classroom)
        end

        it "returns the correct class" do
            classroom.label.should eql "C1"
        end
        
        it "Adds a student" do
            classroom.add_students(student)
            expect(classroom.students).to include(student)
        end

    end
end
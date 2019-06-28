class StudentsController < ApplicationController
    def index 
        @students = Student.all
    end

    def show 
        @student = Student.find(params[:id])
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        if @student.save 
            #render plain: "Student has been saved to database"
            redirect_to students_path
        end
    end
    
    def edit
        @student = Student.find(params[:id])
    end

    def update
        #render plain: "Hello"
        #render plain: params.inspect
        @student = Student.find(params[:id])
        @student.update(student_params)
        redirect_to student_path
    end

    private
    def student_params
        params.require(:student).permit(:fname, :lname)
    end

    #Other way to implement this
    #You would have to precise what arg* to choose
    # @student = Student.new(student_params(:fname, :lname))
    # @student.update(student_params(:fname))
    #def student_params(*args)
        #params.require(:student).permit(*args)
    #end


end

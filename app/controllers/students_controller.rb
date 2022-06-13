class StudentsController < ApplicationController
    def index
        @students = Student.all
        end
        def new
            @student =  Student.new
        end
        def edit

            @student=Student.find(params[:id])
        
          end
          def create

            @student = Student.new(students_params)
        
            if @student.save
        
              flash[:notice] ="added new student successfully"
        
              redirect_to action:"index"
        
            else
        
              flash[:notice]="failed adding new student"
        
              render action: "new"
        
            end
        
          end
        
          def update
        
            @student = Student.find(params[:id])
        
           if @student.update(students_params)
        
            
        
              flash[:notice] = "Updated record Succesfully"
        
              redirect_to action: "index"
        
            else
        
              flash[:notice] = "failled to update the record"
        
              render action: "edit"
        
            end
        
          end
          def show

            @student = Student.find(params[:id])
        
          end

          def destroy

            @student =Student.find(params[:id])
      
            @student.destroy
            flash[:note] = "delete record succesfully"

            redirect_to  "/"
      
          end
            
        
          
        
        
        private
        def students_params
            params.require(:student ).permit(:name, :email, :studentid)
        end
end

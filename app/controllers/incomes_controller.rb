class IncomesController < ApplicationController
    def index
        @incomes = Income.all
        end
        def new
            @income =  Income.new
        end
        def edit

            @income =Income.find(params[:id])
        
          end
          def create

            @income  = Income.new(incomes_params)
        
            if @income .save
        
              flash[:notice] ="added new student successfully"
        
              redirect_to action:"index"
        
            else
        
              flash[:notice]="failed adding new student"
        
              render action: "new"
        
            end
        
          end
        
          def update
        
            @income  = Income.find(params[:id])
        
           if @income .update(incomes_params)
        
            
        
              flash[:notice] = "Updated record Succesfully"
        
              redirect_to action: "index"
        
            else
        
              flash[:notice] = "failled to update the record"
        
              render action: "edit"
        
            end
        
          end
        
        
        
          def destroy
        
            @income  =Income.find(params[:id])
        
            @income .destroy
        
            flash[:note] = "delete record succesfully"
        
            redirect_to action: "index"
        
            redirect_to incomes_path
        
          end
        
        
        
        private
        def incomes_params
            params.require(:income).permit(:avg, :totalincome, :percentage)
        end
end

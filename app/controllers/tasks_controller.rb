class TasksController < ApplicationController

    def create 
        @task = Task.create(name: params[:name], important: params[:important], urgent: params[:urgent], user_id: params[:user_id])
        render json: @task
    end

    def show
        @task = Task.find(params[:id])
        render json: @task
    end

    def edit 
        @task = Task.find(params[:id])
        @task.update(name: params[:name], important: params[:important], urgent: params[:urgent])
        render json: @task
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy()
    end

end

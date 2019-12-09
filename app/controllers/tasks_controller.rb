class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: "タスクを作成しました！"
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
        redirect_to @task, notice: 'タスクを更新しました！'
    else
          render :edit
    end
  end

  def destroy
    @task.destroy
      redirect_to tasks_url, notice: 'タスクを削除しました！'
  end

  private

  def task_params
      params.require(:task).permit(:name)
  end
end

class HomeController < ApplicationController
  def index
      
  end
  
  def trip_memo
      # @every_memo=Memo.all.order("id desc")
       @plan_id = params[:id]
       @plans =  Plan.where(id: @plan_id)
       @memos = Memo.where(plan_id: @plan_id)
  
    
  end
  
  def trip_plan
        @every_plan = Plan.all
        # @my_plan= Plan.where(user_id: current_user.id)

        ## .where(user_id: current_user.id)
    
  end
  
  def plan_write
        @plans = Plan.all.order("id desc") 
        plan = Plan.new
        plan.title = params[:nameoftrip]
        plan.day = params[:dayoftrip]
        # plan.user_id = current_user.id
        plan.save
       redirect_to "/home/trip_plan"
  end
    

  def plan_destroy
       @temp = Plan.find(params[:plan_id])
       @temp.destroy
       redirect_to "/home/trip_plan"
  end
  
  
  def plan_update
       @updated_plan = Plan.find(params[:plan_id])
       @updated_plan.title = params[:nameoftrip]
       @updated_plan.day = params[:dayoftrip]
       @updated_plan.save
       
      # @plan_id = @updated_plan.id
       redirect_to "/home/trip_plan"
  end
  
  
      
  def memo_write
       memo = Memo.new
       memo.memotitle = params[:nameofmemo]
       memo.memocontent = params[:contentofmemo]
       memo.plan_id = params[:plan_id]
      # memo.object = params[:object]
       memo.save
       redirect_to "/trip_memo/#{memo.plan_id}"
  end
  
  
   
end

class Admin::OrderDetailsController < ApplicationController
  
  def update
  end
  
  enum making_status: {
    impossible: 0,
    waiting: 1,
    production: 2,
    complete: 3
  }  
end

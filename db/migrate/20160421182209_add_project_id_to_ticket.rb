class AddProjectIdToTicket < ActiveRecord::Migration
  def change
    add_reference :tickets, :project, index: true, foreign_key: true
  end
end

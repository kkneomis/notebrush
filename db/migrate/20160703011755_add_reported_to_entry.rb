class AddReportedToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :report_flag, :boolean
  end
end

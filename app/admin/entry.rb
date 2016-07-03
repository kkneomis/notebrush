ActiveAdmin.register Entry do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
#actions :all
#permit_params :id, :title, :description
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do
  id_column
  column :title
  column ('User') { |b| b.user.username }
  column ('Votes') { |b| b.votes_for.size }
  column ('Reported') { |b| b.report_flag }
  actions
end

end

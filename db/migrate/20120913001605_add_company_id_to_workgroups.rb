class AddCompanyIdToWorkgroups < ActiveRecord::Migration
  def change
    add_column :workgroups, :company_id, :string
  end
end

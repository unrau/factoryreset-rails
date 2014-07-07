class AddAddressTitleToEvents < ActiveRecord::Migration
  def change
    add_column :events, :address_title, :string
  end
end

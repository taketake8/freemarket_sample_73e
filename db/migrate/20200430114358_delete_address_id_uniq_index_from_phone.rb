class DeleteAddressIdUniqIndexFromPhone < ActiveRecord::Migration[5.0]
  def change
    remove_index :addresses, :phone_number
  end
end

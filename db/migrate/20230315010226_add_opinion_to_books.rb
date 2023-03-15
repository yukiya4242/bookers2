class AddOpinionToBooks < ActiveRecord::Migration[6.1]
  def up
    add_column :books, :opinion, :string
  end

   def down
    remove_column :books, :opinion, :string
   end

end

class AddOwnerFkToDog < ActiveRecord::Migration[5.2]
  def change
  	add_reference :dogs, :owner, foreign_key: { to_table: :users }
  	# Should we add null: false ? For discussion.
  end
end

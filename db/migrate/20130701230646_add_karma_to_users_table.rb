class AddKarmaToUsersTable < ActiveRecord::Migration

  def up
    add_column :users, :karma, :integer, :default => 0

    User.reset_column_information
    User.all.each do |user|
      user.update_attribute :karma, user.total_karma
    end


  end

  def down
    remove_column :users, :karma
  end

end

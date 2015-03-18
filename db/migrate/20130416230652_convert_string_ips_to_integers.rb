class ConvertStringIpsToIntegers < ActiveRecord::Migration

def up

  #User.all.each do |user|
    #user.convert_ips
    #user.save
  #end

  change_column :users, :current_sign_in_ip, :integer
  change_column :users, :last_sign_in_ip,    :integer
end

def down
  change_column :users, :current_sign_in_ip, :string
  change_column :users, :last_sign_in_ip,    :string
end

end


class ConvertStringIpsToIntegers < ActiveRecord::Migration

=begin
 this will work in postgresql but not in sqlite
 because in sqlite there is no alter command
  def up
    connection.execute(%q{
      alter table users
      alter column current_sign_in_ip type integer
      using cast(current_sign_in_ip as integer)
    })
  end

  def down
    connection.execute(%q{
      alter table users
      alter column current_sign_in_ip type varchar
      using cast(current_sign_in_ip as varchar)
    })
  end
=end
end


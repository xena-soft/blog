class AddAuthorIpToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :author_ip, :string
  end
end

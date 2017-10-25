class RemoveAuthorIpFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :author_ip, :integer
  end
end

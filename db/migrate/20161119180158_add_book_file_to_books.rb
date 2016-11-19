class AddBookFileToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :book_file, :string
  end
end

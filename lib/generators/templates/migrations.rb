class ResorcerCoreMigration < ActiveRecord::Migration
  
  def self.up
    # Resource table
    create_table :resources do |t|
      t.string :title
      t.text :description
      t.string :url, :null => false
      t.string :content_type
      t.text :notes
      t.string :author
      t.string :language

      t.timestamps
    end
    add_index :resources, :url, :unique => true

    # Category table
    create_table :categories do |t|
      t.string :name, :null => false
      t.string :description
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt

      t.timestamps
    end
    add_index :categories, :name
    add_index :categories, :parent_id
    add_index :categories, :lft
    add_index :categories, :rgt

    # Post table
    create_table :posts do |t|
      t.string :title, :null => false
      t.string :subtitle
      t.text :body, :null => false
      t.references :postable, :polymorphic => true

      t.timestamps
    end
    add_index :posts, :title
    add_index :posts, :postable_id
    add_index :posts, :postable_type

    # Comment table
    create_table :comments do |t|
      t.text :body, :null => false
      t.string  :name
      t.string  :title
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.references :commentable, :polymorphic => true

      t.timestamps
    end
    add_index :comments, :parent_id
    add_index :comments, :lft
    add_index :comments, :rgt
    add_index :comments, :commentable_id
    add_index :comments, :commentable_type

    # User table
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :login, :null => false
      t.string :email, :null => false
      t.string :website
      t.string :facebook_account
      t.string :twitter_account

      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      t.timestamps
    end
    add_index :users, :login, :unique => true
    add_index :users, :email, :unique => true
    add_index :users, :reset_password_token, :unique => true

  end

  def self.down
    drop_table :users
    drop_table :comments
    drop_table :posts
    drop_table :categories
    drop_table :resources
  end
end

class InitSchema < ActiveRecord::Migration[7.1]
  def up
    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"
    create_table "blog_posts" do |t|
      t.string "title"
      t.text "body"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "forum_thread_comments" do |t|
      t.text "body"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "user_id", null: false
      t.bigint "forum_thread_id", null: false
      t.string "author"
      t.index ["forum_thread_id"], name: "index_forum_thread_comments_on_forum_thread_id"
      t.index ["user_id"], name: "index_forum_thread_comments_on_user_id"
    end
    create_table "forum_threads" do |t|
      t.string "title", null: false
      t.text "body", null: false
      t.string "category", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "user_id", null: false
      t.string "author"
      t.index ["user_id"], name: "index_forum_threads_on_user_id"
    end
    create_table "users" do |t|
      t.string "username"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    add_foreign_key "forum_thread_comments", "forum_threads"
    add_foreign_key "forum_thread_comments", "users"
    add_foreign_key "forum_threads", "users"
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end

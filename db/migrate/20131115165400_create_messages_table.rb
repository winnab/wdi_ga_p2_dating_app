class CreateMessagesTable < ActiveRecord::Migration
  def change
    create_table(:messages) do |t|
      t.integer   :sender_id
      t.integer   :recipient_id
      t.text      :content
      t.boolean   :is_read
      t.boolean   :is_archived
      t.datetime  :created_at
    end
  end
end

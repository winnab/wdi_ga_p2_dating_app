class CreateEventsTable < ActiveRecord::Migration
  def change
    create_table(:events) do |t|
      t.integer   :user_id
      t.integer   :target_user_id
      t.string    :type
      t.datetime  :created_at
    end
  end
end

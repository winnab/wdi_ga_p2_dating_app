class CreateQualitiesTable < ActiveRecord::Migration
  def change
    create_table(:qualities) do |t|
      t.integer   :user_id
      t.string    :scope
      t.string    :type
      t.string    :value
      t.datetime  :created_at
    end
  end
end

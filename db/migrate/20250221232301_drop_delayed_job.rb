class DropDelayedJob < ActiveRecord::Migration[8.0]
  def up
    drop_table :delayed_jobs
  end
end

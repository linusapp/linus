class CreateBetaInvites < ActiveRecord::Migration
  def change
    create_table :beta_invites do |t|
      t.string :email, null: false
      t.boolean :invite_sent, default: false
      t.timestamps
    end
  end
end

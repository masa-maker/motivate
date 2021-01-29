class CreateMotivateCredentials < ActiveRecord::Migration[6.0]
  def change
    create_table :motivate_credentials do |t|
      t.string :provider
      t.string :uid
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end

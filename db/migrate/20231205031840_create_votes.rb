class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      # rails g model vote votable:references{polymorphic}
      # con polymorphic le decimos a rails que tendra una relacion polimórficas
      t.references :votable, polymorphic: true, null: false

      t.timestamps
    end
  end
end

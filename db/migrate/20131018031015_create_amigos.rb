class CreateAmigos < ActiveRecord::Migration
  def change
    create_table :amigos do |t|
		t.integer :fk_usuario1
		t.integer :fk_usuario2
		t.string  :status
		t.date    :fecha
		t.string  :leido
      t.timestamps
    end
  end
end

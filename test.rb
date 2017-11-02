require_relative('./lib/activerecord');

class CreateCharacters < ActiveRecord::Migration

	def change
		create_table :characters do |t|
			t.string :name
			t.string :class
			t.string :race
			t.string :gender

			t.timestamps
		end
	end

end

migr = CreateCharacters.new

migr.run

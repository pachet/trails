require_relative('./migration/table-change');
require_relative('./migration/table-creation');
require_relative('./query');

module ActiveRecord

	class Migration

		def initialize
			@actions = Array.new
			@query = ActiveRecord::Query.new
		end

		def run
			change
			apply
		end

		def change
			raise 'Must override change() on ActiveRecord::Migration subclass'
		end

		def apply
			@actions.each do|action|
				apply_action action
			end

			@query.execute
		end

		def apply_action action
			@query.add_sql action.to_sql
		end

		def change_table(table_name)
			yield add_table_change(table_name)
		end

		def create_table(table_name)
			yield add_table_creation(table_name)
		end

		def add_table_change(table_name)
			table_change = ActiveRecord::Migration::TableChange.new
			table_change.table_name = table_name

			add_action table_change
		end

		def add_table_creation(table_name)
			table_creation = ActiveRecord::Migration::TableCreation.new
			table_creation.table_name = table_name

			add_action table_creation
		end

		def add_action action
			@actions << action
			action
		end

		def reversible
		end

	end

end

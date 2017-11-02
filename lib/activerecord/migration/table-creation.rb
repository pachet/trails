require_relative('./action')
require_relative('./column-definition')

module ActiveRecord

	class Migration

		class TableCreation < Migration::Action

			def initialize
				@column_definitions = Array.new
			end

			def change(*args)
				puts args
			end

			def string column_name
				add_column_definition column_name, Migration::ColumnDefinition::TYPE_STRING
			end

			def add_column_definition name, type
				column_definition = Migration::ColumnDefinition.new
				column_definition.name = name
				column_definition.type = type

				@column_definitions << column_definition

				column_definition
			end

			def timestamps
				created_at = add_column_definition :created_at, Migration::ColumnDefinition::TYPE_DATETIME
				created_at.default = Migration::ColumnDefinition::DEFAULT_CURRENT_TIMESTAMP

				updated_at = add_column_definition :updated_at, Migration::ColumnDefinition::TYPE_DATETIME
				updated_at.default = Migration::ColumnDefinition::DEFAULT_NULL
			end

			def to_sql
				<<-eos
				CREATE TABLE `#{@table_name}` (
					#{column_sql}
				);
				eos
			end

			def column_sql
				result = @column_definitions.map do |column_definition|
					column_definition.to_sql
				end

				result.join(",\n")
			end

		end

	end

end

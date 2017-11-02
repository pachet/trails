
module ActiveRecord

	class Migration

		class ColumnDefinition

			TYPE_STRING   = :string
			TYPE_DATETIME = :datetime

			DEFAULT_NULL              = :default_null
			DEFAULT_CURRENT_TIMESTAMP = :default_current_timestamp

			def initialize
				@allow_null = false
			end

			def name=(name)
				@name = name
			end

			def type=(type)
				@type = type
			end

			def default=(default)
				@default = default

				@allow_null = true if default == DEFAULT_NULL
			end

			def to_sql
				case @type
				when TYPE_STRING
					to_string_sql
				when TYPE_DATETIME
					to_datetime_sql
				else
					raise "Invalid type #{@type}"
				end
			end

			def to_string_sql
				"`#{@name}` VARCHAR(255)"
			end

			def to_datetime_sql
				"`#{@name}` DATETIME"
			end

		end

	end

end

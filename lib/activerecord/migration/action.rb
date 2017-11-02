
module ActiveRecord

	class Migration

		class Action

			def table_name=(table_name)
				@table_name = table_name
			end

			def to_sql
				raise 'Must override to_sql in Action subclass'
			end

		end

	end

end

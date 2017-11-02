
require_relative('./action');

module ActiveRecord

	class Migration

		class TableChange < Migration::Action

			def change(*args)
				puts args
			end

		end

	end

end

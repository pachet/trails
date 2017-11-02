
module ActiveRecord

	class Query

		def initialize
			@sql = ""
			@using_transaction = true
		end

		def add_sql sql
			@sql += sql
		end

		def start_transaction
			write_sql <<-END_SQL
				DELIMITER ;;
				CREATE PROCEDURE `migration`()
				BEGIN

				DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;

				START TRANSACTION;
			END_SQL
		end

		def end_transaction
			write_sql <<-END_SQL
				COMMIT;
				END;;
				DELIMITER ;
			END_SQL
		end

		def execute
			start_transaction if using_transaction?
			write_sql @sql
			end_transaction if using_transaction?
		end

		def write_sql sql
			puts sql
		end

		def using_transaction?
			@using_transaction
		end

		def using_transaction=(using_transaction = true)
			@using_transaction = using_transaction
		end

	end

end

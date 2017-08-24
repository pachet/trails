
require_relative "connection/handler"
require_relative "connection/adapters"
require_relative "connection/pool_list"

module ActiveRecord

  class Connection

    def quote_column_name(name)
      name
    end

    def adapter_name
      "sqlite3"
    end

    def create_table(*splat)
    end

    def disable_referential_integrity
      yield
    end

    def transaction(*splat)
    end

  end

end

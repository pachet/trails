
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

  end

end
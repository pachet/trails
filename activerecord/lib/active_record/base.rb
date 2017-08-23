
require_relative "connection"

module ActiveRecord

  class Base

    def Base.abstract_class=(abstract_class)
      @@abstract_class = abstract_class
    end

    def Base.table_name=(table_name)
      @@table_name = table_name
    end

    def Base.logger=(logger)
      @@logger = logger
    end

    def Base.configurations=(configurations)
      @@configurations = configurations
    end

    def Base.establish_connection(*splat)
      @@connection = ActiveRecord::Connection.new
    end

    def Base.connection
      @@connection
    end

    def Base.has_many(symbol, callback = nil, mapping = nil)
    end

    def Base.belongs_to(symbol)
    end

    def Base.has_and_belongs_to_many(symbol)
    end

  end

end

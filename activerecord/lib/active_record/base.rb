
require_relative "connection"

module ActiveRecord

  class Base

    def Base.abstract_class=(abstract_class)
      @@abstract_class = abstract_class
    end


    def Base.table_name=(table_name)
      @@table_name = table_name
    end

    def Base.table_name
      @@table_name
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


    def Base.inheritance_column=(inheritance_column)
      @@inheritance_column = inheritance_column
    end




    def Base.default_scope
      # ?
    end

    def Base.serialize(symbol)
    end




    # Hooks:

    def Base.after_create
    end

    def Base.after_save
    end


    # Associations:

    def Base.has_many(identifier, callback = nil, mapping = nil)
    end

    def Base.belongs_to(*splat)
    end

    def Base.has_and_belongs_to_many(*splat)
    end

    def Base.scope(identifier, block)
    end

    def Base.has_one(*splat)
    end


  end

end

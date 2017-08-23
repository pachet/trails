
module ActiveRecord

  class Base

    def Base.abstract_class=(abstract_class)
      @@abstract_class = abstract_class
    end

    def Base.table_name=(table_name)
      @@table_name = table_name
    end

    def Base.has_many(symbol, callback = nil, mapping = nil)
    end

    def Base.belongs_to(symbol)
    end

    def Base.has_and_belongs_to_many(symbol)
    end

  end

end

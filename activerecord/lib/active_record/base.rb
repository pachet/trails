
require_relative "connection"

module ActiveRecord

  class Base

    @@belongs_to_required_by_default = false

    def Base.abstract_class=(abstract_class)
      @@abstract_class = abstract_class
    end


    def Base.table_name=(table_name)
      @@table_name = table_name
    end

    def Base.table_name
      @@table_name
    end


    def Base.sequence_name=(sequence_name)
      @@sequence_name = sequence_name
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

    def Base.ignored_columns=(ignored_columns)
      @@ignored_columns = ignored_columns
    end

    def Base.cache_timestamp_format=(cache_timestamp_format)
      @@cache_timestamp_format = cache_timestamp_format
    end

    def Base.belongs_to_required_by_default=(belongs_to_required_by_default)
      @@belongs_to_required_by_default = belongs_to_required_by_default
    end

    def Base.belongs_to_required_by_default
      @@belongs_to_required_by_default
    end

    def Base.primary_key=(primary_key)
      @@primary_key = primary_key
    end




    def Base.default_scope(*splat)
      # ?
    end

    def Base.serialize(*splat)
    end

    def Base.to_param(symbol)
    end

    def Base.define_attribute_method(string)
    end

    def Base.where(*splat)
    end

    def Base.includes(*splat)
    end

    def Base.attribute(*splat)
    end

    def Base.attr_readonly(*splat)
    end



    # Validation:

    def Base.validate(*splat)
    end

    def Base.validates_presence_of(symbol)
    end

    def Base.validates_uniqueness_of(*splat)
    end

    def Base.validates_inclusion_of(*splat)
    end

    def Base.validates_length_of(*splat)
    end




    # Hooks:

    def Base.after_initialize(*splat)
    end

    def Base.before_create(*splat)
    end

    def Base.after_create(*splat)
    end

    def Base.before_validation(*splat)
    end

    def Base.after_find(*splat)
    end

    def Base.before_update(*splat)
    end

    def Base.before_save(*splat)
    end

    def Base.after_save(*splat)
    end

    def Base.before_destroy(*splat)
    end


    # Associations:

    def Base.has_many(identifier, callback = nil, mapping = nil)
    end

    def Base.belongs_to(*splat)
    end

    def Base.has_and_belongs_to_many(*splat)
    end

    def Base.has_one(*splat)
    end


    def Base.scope(identifier, block)
    end

    def Base.composed_of(*splat)
    end

    def Base.accepts_nested_attributes_for(*splat)
    end






    def Base.clear_active_connections!
    end


  end

end

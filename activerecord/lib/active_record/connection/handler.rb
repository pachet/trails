
module ActiveRecord

  class ConnectionHandler

    def connection_pool_list
      @connection_pool_list ||= ConnectionPoolList.new
    end

  end

end

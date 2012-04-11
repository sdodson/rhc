module Rhc
  module Rest
    class Key
      include Rest
      attr_reader :name, :type, :content
      def initialize(args)
        @name = args[:name] || args["name"]
        @type = args[:type] || args["type"]
        @content = args[:content] || args["content"]
        @links = args[:links] || args["links"]
      end

      # Update Key
      def update(type, content)
        logger.debug "Updating key #{self.name}" if @mydebug
        url = @links['UPDATE']['href']
        method =  @links['UPDATE']['method']
        payload = {:type => type, :content => content}
        request = RestClient::Request.new(:url => url, :method => method, :headers => @@headers, :payload => payload)
        return send(request)
      end

      #Delete Key
      def destroy
        logger.debug "Deleting key #{self.name}" if @mydebug
        url = @links['DELETE']['href']
        method =  @links['DELETE']['method']
        request = RestClient::Request.new(:url => url, :method => method, :headers => @@headers)
        return send(request)
      end
      alias :delete :destroy
    end
  end
end

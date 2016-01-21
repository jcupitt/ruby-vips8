
module Vips

    class Error < RuntimeError
        # The ruby-vips8 error class. 
        #
        # @param msg [String] The error message. If this is not supplied, grab
        #   and clear the vips error buffer and use that. 
        def initialize(msg = nil)
            if msg
                @details = msg
            elsif Vips::error_buffer != ""
                @details = Vips::error_buffer
                Vips::error_clear
            else 
                @details = nil
            end
        end

        def to_s
            if @details != nil
                @details
            else
                super.to_s
            end
        end
    end

end

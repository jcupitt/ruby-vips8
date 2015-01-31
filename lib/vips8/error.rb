
module Vips

    # If +msg+ is not supplied, grab and clear the vips error buffer instead. 
    class Error < RuntimeError
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

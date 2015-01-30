require 'gobject-introspection'

# about as crude as you could get
$debug = true
#$debug = false

def log str # :nodoc:
    if $debug
        puts str
    end
end

require 'vips8/vips_loader'

at_exit {
        Vips::shutdown
}



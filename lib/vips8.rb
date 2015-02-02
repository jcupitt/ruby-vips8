require 'gobject-introspection'

# about as crude as you could get
#$debug = true
$debug = false

def log str # :nodoc:
    if $debug
        puts str
    end
end

# copied from ruby-gnome2/gstreamer/lib/gst.rb without much understanding

# pick up a local girepository/lib in preference to the system one 
base_dir = Pathname.new(__FILE__).dirname.dirname.expand_path
vendor_dir = base_dir + "vendor" + "local"
vendor_bin_dir = vendor_dir + "bin"
GLib.prepend_dll_path(vendor_bin_dir)
vendor_girepository_dir = vendor_dir + "lib" + "girepository-1.0"
GObjectIntrospection.prepend_typelib_path(vendor_girepository_dir)

module Vips
    LOG_DOMAIN = "VIPS"
    GLib::Log.set_log_domain(LOG_DOMAIN)

    class << self
        def const_missing(name)
            log "Vips::const_missing: #{name}"
        
            init()
            if const_defined?(name)
                const_get(name)
            else
              super
            end
        end

        def method_missing(name, *args, &block)
            log "Vips::method_missing: #{name}, #{args}, #{block}"

            init()
            if respond_to?(name)
                __send__(name, *args, &block)
            else
                super
            end
        end

        def init(*argv)
            log "Vips::init: #{argv}"

            class << self
                remove_method(:init)
                remove_method(:const_missing)
                remove_method(:method_missing)
            end

            loader = Loader.new(self, argv)
            loader.load("Vips")

            require 'vips8/error'
            require 'vips8/argument'
            require 'vips8/operation'
            require 'vips8/call'
            require 'vips8/image'
        end
    end

    class Loader < GObjectIntrospection::Loader
        def initialize(base_module, init_arguments)
            log "Vips::Loader.initialize: #{base_module}, #{init_arguments}"

            super(base_module)
            @init_arguments = init_arguments
        end

        private
        def pre_load(repository, namespace)
            log "Vips::Loader.pre_load: #{repository}, #{namespace}"

            call_init_function(repository, namespace)
            define_value_modules
        end

        def call_init_function(repository, namespace)
            log "Vips::Loader.call_init_function: #{repository}, #{namespace}"

            # call Vips::init
            init = repository.find(namespace, "init")
            succeeded, argv, error = init.invoke(:arguments => [$PROGRAM_NAME])

            # TODO get the vips error buffer
            raise error unless succeeded
        end

        def define_value_modules
            @value_functions_module = Module.new
            @value_methods_module = Module.new
            @base_module.const_set("ValueFunctions", @value_functions_module)
            @base_module.const_set("ValueMethods",   @value_methods_module)
        end

        def post_load(repository, namespace)
            log "Vips::Loader.post_load:"
        end

    end
end

at_exit {
        Vips::shutdown
}



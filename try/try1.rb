#!/usr/bin/ruby

# open vips gir ... prove we can find it

require 'gobject-introspection'

repository = GObjectIntrospection::Repository.default
repository.require("Vips")

image = repository.find("Vips", "Image")


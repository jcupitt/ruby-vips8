# ruby-vips8

This gem provides a Ruby binding for the [vips image processing
library](http://www.vips.ecs.soton.ac.uk). It wraps version 8 of the API.

The older vips7-based 
[ruby-vips](https://github.com/jcupitt/ruby-vips) gem is still being
maintained. 

`ruby-vips8` is fast and it can work without needing the 
entire image to be loaded into memory. For example, the benchmark at 
[vips-benchmarks](https://github.com/stanislaw/vips-benchmarks) loads a large
image, crops, shrinks, sharpens and saves again:

```text
real time in seconds, fastest of three runs
benchmark	tiff	jpeg
ruby-vips.rb	0.25	0.33	
ruby-vips8.rb	0.45	0.52	
image-magick	0.86	1.03	
rmagick.rb	0.92	1.01	
image_sci.rb	1.11	0.88	

peak memory use in bytes
benchmark	peak RSS
ruby-vips.rb	52828
ruby-vips8.rb	60464
image_sci.rb	146228
rmagick.rb	350136
```

See also [benchmarks at the official libvips
website](http://www.vips.ecs.soton.ac.uk/index.php?title=Speed_and_Memory_Use).
There's a handy blog post explaining [how libvips opens
files](http://libvips.blogspot.co.uk/2012/06/how-libvips-opens-file.html)
which gives some more background.

ruby-vips allows you to set up pipelines that don't get executed until you
output the image to disk or to a string. This means you can create,
manipulate, and pass around Image objects without incurring any memory or CPU
costs. The image is not actually processed until you write the image to memory
or to disk.

## Requirements

  * OS X or Linux
  * libvips 8.2 and later

## Installation prerequisites

### OS X 

Install [homebrew](http://mxcl.github.com/homebrew) and enter:

```bash
$ brew install homebrew/science/vips
```

To verify that your vips install is working, try:

```bash
$ vips --version
vips-8.2.1
```

Make sure you have `Vips-8.0.typelib` on your `GI_TYPELIB_PATH`. Enter
something like:

```bash
$ export GI_TYPELIB_PATH=/usr/local/lib/girepository-1.0
```

### Other platforms

You need to install libvips from source since 8.2 has not been packaged yet. 

## Installing the gem.

```bash
$ gem install ruby-vips8
```

or include it in Gemfile:

```ruby
gem 'ruby-vips8'
```

And take a look in `examples/`. There is full yard documentation, take a look
there too.

# Example

```ruby
require 'vips8'

im = Vips::Image.new_from_file filename

# put im at position (100, 100) in a 3000 x 3000 pixel image, 
# make the other pixels in the image by mirroring im up / down / 
# left / right, see
# http://www.vips.ecs.soton.ac.uk/supported/current/doc/html/libvips/libvips-conversion.html#vips-embed
im = im.embed 100, 100, 3000, 3000, :extend => :mirror
im.write_to_file output_filename

# multiply the green (middle) band by 2, leave the other two alone
im *= [1, 2, 1]

# make an image from an array constant, convolve with it
mask = Vips::Image.new_from_array [
    [-1, -1, -1],
    [-1, 16, -1],
    [-1, -1, -1]], 8
im = im.conv mask
```

# What's wrong with ruby-vips?

There's an existing Ruby binding for vips
[here](https://github.com/jcupitt/ruby-vips). It was written by a Ruby
expert, it works well, it includes a test-suite, and has pretty full
documentation. Why do another?

ruby-vips is based on the old vips7 API. There's now vips8, which adds several
very useful new features:

* [GObject](https://developer.gnome.org/gobject/stable/)-based API with full
  introspection. You can discover the vips8 API at runtime. This means that if
  libvips gets a new operator, any binding that goes via vips8 will 
  get the new thing immediately. With vips7, whenever libvips was changed, all
  the bindings needed to be changed too.

* No C required. Thanks to
  [gobject-introspection](https://wiki.gnome.org/Projects/GObjectIntrospection)
  you can write the binding in Ruby itself, there's no need for any C. This
  makes it a lot smaller and more portable. 

* vips7 probably won't get new features. vips7 doesn't really exist any more:
  the API is still there, but now just a thin compatibility layer over vips8.
  New features may well not get added to the vips7 API.

There are some more minor pluses as well:

* Named and optional arguments. vips8 lets you have optional and required
  arguments, both input and output, and optional arguments can have default
  values. 

* Operation cache. vips8 keeps track of the last 1,000 or so operations and
  will automatically reuse results when it can. This can give a huge speedup
  in some cases.

* vips8 is much simpler and more regular. For example, 
  ruby-vips had to work hard to offer a nice loader system, but that's all
  built into vips8. It can do things like load and save formatted images to 
  and from memory buffers as well, which just wasn't possible before. 

This binding adds some extra useful features over the old `ruby-vips` binding.

* Full set of arithmetic operator overloads.

* Automatic constant expansion. You can write things like
  `image.bandjoin(255)` and the 255 will be automatically expanded to an image 
  and attached as an extra band. You can mix int, float, scalar, vector and
  image constants freely.


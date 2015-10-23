require 'spec_helper.rb'

RSpec.describe Vips::Image do
    describe '#new' do
        it 'can make an empty image' do
            image = Vips::Image.new

            expect(image.width).to eq(1)
            expect(image.height).to eq(1)
            expect(image.bands).to eq(1)
        end

        it 'can save an image to a file' do
            filename = "/tmp/test.v"

            image = Vips::Image.black(16, 16) + 128
            image.write_to_file filename

            expect(File.exist?(filename)).to be true
        end

        it 'can load an image from a file' do
            filename = "/tmp/test.v"

            image = Vips::Image.black(16, 16) + 128
            image.write_to_file(filename)

            x = Vips::Image.new_from_file filename
            expect(x.width).to eq(16)
            expect(x.height).to eq(16)
            expect(x.bands).to eq(1)
            expect(x.avg).to eq(128)
        end

        it 'can save an image to a buffer' do
            image = Vips::Image.black(16, 16) + 128
            buffer = image.write_to_buffer ".jpg"
            expect(buffer.length).to be > 100
        end

        it 'can load an image from a buffer' do
            image = Vips::Image.black(16, 16) + 128
            buffer = image.write_to_buffer ".jpg"
            puts "buffer.length = #{buffer.length}"
            x = Vips::Image.new_from_buffer buffer, ""
            expect(x.width).to eq(16)
            expect(x.height).to eq(16)
        end

    end

end


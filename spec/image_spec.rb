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
            x = Vips::Image.new_from_buffer buffer, ""
            expect(x.width).to eq(16)
            expect(x.height).to eq(16)
        end

        it 'can make an image from a 2d array' do
            image = Vips::Image.new_from_array [[1, 2], [3, 4]]
            expect(image.width).to eq(2)
            expect(image.height).to eq(2)
            expect(image.bands).to eq(1)
            expect(image.avg).to eq(2.5)
        end

        it 'can make an image from a 1d array' do
            image = Vips::Image.new_from_array [1, 2]
            expect(image.width).to eq(2)
            expect(image.height).to eq(1)
            expect(image.bands).to eq(1)
            expect(image.avg).to eq(1.5)
        end

        it 'can set scale and offset on a convolution mask' do
            image = Vips::Image.new_from_array [1, 2], 8, 2
            expect(image.width).to eq(2)
            expect(image.height).to eq(1)
            expect(image.bands).to eq(1)
            expect(image.scale).to eq(8)
            expect(image.offset).to eq(2)
            expect(image.avg).to eq(1.5)
        end

        it 'can load a sample jpg image' do
            filename = simg("wagon.jpg")
            x = Vips::Image.new_from_file filename
            expect(x.width).to eq(685)
            expect(x.height).to eq(478)
            expect(x.bands).to eq(3)
            expect(x.avg).to be_within(0.001).of(109.789)
        end

        it 'can extract an ICC profile from a jpg image' do
            filename = simg("icc.jpg")
            x = Vips::Image.new_from_file filename
            expect(x.width).to eq(2800)
            expect(x.height).to eq(2100)
            expect(x.bands).to eq(3)
            expect(x.avg).to be_within(0.001).of(109.189)

            profile = x.get_value "icc-profile-data"
            expect(profile.class).to eq(String)
            expect(profile.length).to eq(2360)
        end

        it 'can set an ICC profile on a jpg image' do
            x = Vips::Image.new_from_file simg("icc.jpg")
            profile = File.open(simg("lcd.icc"), "rb").read
            x.set_value "icc-profile-data", profile
            x.write_to_file(timg("x.jpg"))

            x = Vips::Image.new_from_file timg("x.jpg")
            expect(x.width).to eq(2800)
            expect(x.height).to eq(2100)
            expect(x.bands).to eq(3)
            expect(x.avg).to be_within(0.1).of(109.189)

            profile = x.get_value "icc-profile-data"
            expect(profile.class).to eq(String)
            expect(profile.length).to eq(3048)
        end

    end

end


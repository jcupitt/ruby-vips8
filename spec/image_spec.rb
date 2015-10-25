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
            filename = timg "x.v"

            image = Vips::Image.black(16, 16) + 128
            image.write_to_file filename

            expect(File.exist?(filename)).to be true
        end

        it 'can load an image from a file' do
            filename = timg "x.v"

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
            x = Vips::Image.new_from_file simg("wagon.jpg")
            expect(x.width).to eq(685)
            expect(x.height).to eq(478)
            expect(x.bands).to eq(3)
            expect(x.avg).to be_within(0.001).of(109.789)
        end

        it 'can extract an ICC profile from a jpg image' do
            x = Vips::Image.new_from_file simg("icc.jpg")
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

        it 'can load a sample jpg image' do
            x = Vips::Image.new_from_file simg("wagon.jpg")
            expect(x.width).to eq(685)
            expect(x.height).to eq(478)
            expect(x.bands).to eq(3)
            expect(x.avg).to be_within(0.001).of(109.789)
        end

        it 'has binary arithmetic operator overloads with constants' do
            image = Vips::Image.black(16, 16) + 128

            image += 128
            image -= 128
            image *= 2
            image /= 2
            image %= 100
            image += 100
            image **= 2
            image **= 0.5
            image <<= 1
            image >>= 1
            image |= 64
            image &= 32
            image ^= 128

            expect(image.avg).to eq(128) 
        end

        it 'has binary arithmetic operator overloads with array constants' do
            image = Vips::Image.black(16, 16, :bands => 3) + 128

            image += [128, 0, 0]
            image -= [128, 0, 0]
            image *= [2, 1, 1]
            image /= [2, 1, 1]
            image %= [100, 99, 98]
            image += [100, 99, 98]
            image **= [2, 3, 4]
            image **= [1.0 / 2.0, 1.0 / 3.0, 1.0 / 4.0]
            image <<= [1, 2, 3]
            image >>= [1, 2, 3]
            image |= [64, 128, 256]
            image &= [64, 128, 256]
            image ^= [64 + 128, 0, 256 + 128]

            expect(image.avg).to eq(128) 
        end

        it 'has binary arithmetic operator overloads with image args' do
            image = Vips::Image.black(16, 16) + 128
            x = image

            x += image
            x -= image
            x *= image
            x /= image
            x %= image
            x += image
            x |= image
            x &= image
            x ^= image

            expect(image.avg).to eq(128) 
        end

        it 'has relational operator overloads with constants' do
            image = Vips::Image.black(16, 16) + 128

            expect((image > 128).avg).to eq(0) 
            expect((image >= 128).avg).to eq(255) 
            expect((image < 128).avg).to eq(0) 
            expect((image <= 128).avg).to eq(255) 
            expect((image == 128).avg).to eq(255) 
            expect((image != 128).avg).to eq(0) 
        end

        it 'has relational operator overloads with array constants' do
            image = Vips::Image.black(16, 16, :bands => 3) + [100, 128, 130]

            expect((image > [100, 128, 130]).avg).to eq(0) 
            expect((image >= [100, 128, 130]).avg).to eq(255) 
            expect((image < [100, 128, 130]).avg).to eq(0) 
            expect((image <= [100, 128, 130]).avg).to eq(255) 
            expect((image == [100, 128, 130]).avg).to eq(255) 
            expect((image != [100, 128, 130]).avg).to eq(0) 
        end

        it 'has relational operator overloads with image args' do
            image = Vips::Image.black(16, 16) + 128

            expect((image > image).avg).to eq(0) 
            expect((image >= image).avg).to eq(255) 
            expect((image < image).avg).to eq(0) 
            expect((image <= image).avg).to eq(255) 
            expect((image == image).avg).to eq(255) 
            expect((image != image).avg).to eq(0) 
        end

        it 'has band extract with numeric arg' do
            image = Vips::Image.black(16, 16, :bands => 3) + [100, 128, 130]
            x = image[1]

            expect(x.width).to eq(16)
            expect(x.height).to eq(16)
            expect(x.bands).to eq(1)
            expect(x.avg).to eq(128)
        end

        it 'has band extract with range arg' do
            image = Vips::Image.black(16, 16, :bands => 3) + [100, 128, 130]
            x = image[1..2]

            expect(x.width).to eq(16)
            expect(x.height).to eq(16)
            expect(x.bands).to eq(2)
            expect(x.avg).to eq(129)
        end

        it 'has rounding members' do
            image = Vips::Image.black(16, 16) + 0.5

            expect(image.floor.avg).to eq(0)
            expect(image.ceil.avg).to eq(1)
            expect(image.rint.avg).to eq(1)
        end

        it 'has bandsplit and bandjoin' do
            image = Vips::Image.black(16, 16, :bands => 3) + [100, 128, 130]

            split = image.bandsplit
            x = split[0].bandjoin split[1..2]

            expect(x[0].avg).to eq(100)
            expect(x[1].avg).to eq(128)
            expect(x[2].avg).to eq(130)
        end

        it 'can bandjoin constants' do
            image = Vips::Image.black(16, 16, :bands => 3) + [100, 128, 130]

            x = image.bandjoin 255

            expect(x[0].avg).to eq(100)
            expect(x[1].avg).to eq(128)
            expect(x[2].avg).to eq(130)
            expect(x[3].avg).to eq(255)
            expect(x.bands).to eq(4)

            x = image.bandjoin [1, 2]

            expect(x[0].avg).to eq(100)
            expect(x[1].avg).to eq(128)
            expect(x[2].avg).to eq(130)
            expect(x[3].avg).to eq(1)
            expect(x[4].avg).to eq(2)
            expect(x.bands).to eq(5)

        end

        it 'has minpos/maxpos' do
            image = Vips::Image.black(16, 16) + 128
            image = image.draw_rect 255, 10, 12, 1, 1
            v, x, y = image.maxpos

            expect(v).to eq(255)
            expect(x).to eq(10)
            expect(y).to eq(12)

            image = Vips::Image.black(16, 16) + 128
            image = image.draw_rect 12, 10, 12, 1, 1
            v, x, y = image.minpos

            expect(v).to eq(12)
            expect(x).to eq(10)
            expect(y).to eq(12)

        end

    end

end


require 'rubygems'
require 'sinatra'
require 'open-uri'
require 'json'

# rubocop:disable Style/StringLiterals
cars = {
  "Ferrari 308" => "https://live.staticflickr.com/6106/6256100889_4d1c317cb8_n.jpg",
  "SEAT Ibiza" => "https://live.staticflickr.com/4850/32028447147_06bded235b_n.jpg",
  "Tesla Model Y" => "https://live.staticflickr.com/65535/50117086542_d9dbb708b5_m.jpg",
  "Toyota RAV4" => "https://live.staticflickr.com/7806/47335082881_0b6c124bfe_n.jpg",
  "Honda CR-V" => "https://live.staticflickr.com/2736/4406111760_472be01a66_m.jpg",
  "Toyota Corolla Sedan" => "https://live.staticflickr.com/7825/44726137220_cb5e22157f_m.jpg",
  "Toyota Corolla Cross" => "https://live.staticflickr.com/65535/52569908080_817c935a7d_n.jpg",
  "Toyota Camry" => "https://live.staticflickr.com/65535/48060302071_9043c9da44_n.jpg",
  "Ford F-150" => "https://live.staticflickr.com/65535/52824795228_7921579f96_n.jpg",
  "Toyota Hilux" => "https://live.staticflickr.com/4661/39033803374_833a2f04a6_n.jpg",
  "Nissan Sentra" => "https://live.staticflickr.com/65535/52702140117_7db38216b6_w.jpg",
  "Honda Civic" => "https://live.staticflickr.com/1586/23874533733_b494873d06_n.jpg",
  "Renault 11" => "https://live.staticflickr.com/65535/52582185959_4ded82e297_m.jpg",
  "Nissan X-Trail" => "https://live.staticflickr.com/4048/4624784004_bd74bd7d15_n.jpg",
  "Honda Accord" => "https://live.staticflickr.com/4405/35738641313_b7aac2260c_n.jpg",
  "Hyundai Tucson" => "https://live.staticflickr.com/65535/50350092923_0d80800f18_m.jpg",
  "Chevrolet Silverado 1500" => "https://live.staticflickr.com/65535/53681848966_35f9c60e7a_w.jpg",
  "Hyundai Elantra" => "https://live.staticflickr.com/65535/49670965973_c92ca4538d_m.jpg",
  "Volkswagen Polo" => "https://live.staticflickr.com/65535/52290430017_a2d06e3b27_n.jpg",
  "Volkswagen Jetta" => "https://live.staticflickr.com/8021/7304339366_07d5461f46_n.jpg",
  "Mazda CX-5" => "https://live.staticflickr.com/8152/7197499718_a5803774bf_n.jpg",
  "Suzuki Swift" => "https://live.staticflickr.com/65535/51033459876_a2ce7a039f_m.jpg",
  "Suzuki Alto" => "https://live.staticflickr.com/7568/15654184841_4319305a0b_w.jpg",
  "Honda HR-V" => "https://live.staticflickr.com/1581/24752498866_89173ac7dc_n.jpg",
  "Toyota Highlander" => "https://live.staticflickr.com/1636/25692209362_aabee42b8a_m.jpg",
  "Ford Ranger" => "https://live.staticflickr.com/5538/30348003612_c30f87b847_n.jpg",
  "Kia Seltos" => "https://live.staticflickr.com/65535/53856964700_203016aeb3_m.jpg",
  "Ford Escape" => "https://live.staticflickr.com/1591/25824584604_52dab335c5_n.jpg",
  "Nissan Qashqai" => "https://live.staticflickr.com/4473/36741900933_a6bf8d23b5.jpg"
}

get '/:keyword' do
  keywords = params[:keyword].downcase.split(',')

  matching_car = cars.keys.find do |car|
    keywords.all? { |word| car.downcase.include?(word.strip) }
  end

  if matching_car
    redirect cars[matching_car]
  else
    redirect cars.values.sample
  end
end

get '/' do
  "Add a keyword at the end of the url like /cat"
end
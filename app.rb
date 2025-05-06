require 'rubygems'
require 'sinatra'
require 'open-uri'
require 'json'

# rubocop:disable Style/StringLiterals
cars = {
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
  # "BYD Qin" => 474_000,
  # "Nissan X-Trail" => 462_000,
  "Honda Accord" => "https://live.staticflickr.com/4405/35738641313_b7aac2260c_n.jpg",
  # "Hyundai Tucson" => 423_000,
  # "Chevrolet Silverado 1500" => 412_000,
  # "Hyundai Elantra" => 399_000,
  # "RAM 1500" => 374_000,
  # "BYD Song Plus" => 370_000,
  "Volkswagen Polo" => "https://live.staticflickr.com/65535/52290430017_a2d06e3b27_n.jpg",
  # "Volkswagen Jetta" => 362_000,
  "Mazda CX-5" => "https://live.staticflickr.com/8152/7197499718_a5803774bf_n.jpg",
  # "BYD Yuan Plus" => 356_000,
  # "Suzuki Swift" => 354_000,
  # "Honda HR-V" => 336_000,
  # "Toyota Highlander" => 334_000,
  # "Ford Ranger" => 333_000,
  # "Kia Seltos" => 332_000,
  # "Ford Escape" => 331_000,
  # "Nissan Qashqai" => 315_000
}

get '/:keyword' do
  # url = "https://loremflickr.com/json/g/320/240/#{params[:keyword].downcase}/all"
  # serialized_data = URI.parse(url).read
  # data = JSON.parse(serialized_data)
  # redirect data["rawFileUrl"]

  keyword = params[:keyword].downcase
  matching_car = cars.keys.find { |car| car.downcase.include?(keyword) }
  if matching_car
    redirect cars[matching_car]
  else
    # Select a random URL from the cars hash
    redirect cars.values.sample
  end
end

get '/' do
  "Add a keyword at the end of the url like /cat"
end
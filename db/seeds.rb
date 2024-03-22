# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveStorage::AnalyzeJob.queue_adapter = :inline
ActiveStorage::PurgeJob.queue_adapter = :inline

TEST_GMAIL_ACCOUNT_NAME = ENV["TEST_GMAIL_ACCOUNT_NAME"]
TEST_PASSWORD = ENV["TEST_PASSWORD"]
TEST_POSTAL_CODE = ENV["TEST_POSTAL_CODE"]
TEST_ADDRESS = ENV["TEST_ADDRESS"]
TEST_TELEPHONE_NUMBER = ENV["TEST_TELEPHONE_NUMBER"]


initial_customers = [
  {
    last_name: "一ノ瀬",
    first_name: "洋子",
    last_name_kana: "イチノセ",
    first_name_kana: "ヨウコ",
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    telephone_number: TEST_TELEPHONE_NUMBER,
    is_active: true
  },
  {
    last_name: "二階堂",
    first_name: "啓介",
    last_name_kana: "ニカイドウ",
    first_name_kana: "ケイスケ",
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    telephone_number: TEST_TELEPHONE_NUMBER,
    is_active: true
  },
  {
    last_name: "三浦",
    first_name: "健太",
    last_name_kana: "ミウラ",
    first_name_kana: "ケンタ",
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    telephone_number: TEST_TELEPHONE_NUMBER,
    is_active: false
  }
]

initial_customers.each.with_index(1) do |customer, i|
  customer["email"] = "#{TEST_GMAIL_ACCOUNT_NAME}+test#{i}@gmail.com"
  customer["password"] = TEST_PASSWORD
  customer["password_confirmation"] = TEST_PASSWORD
  Customer.create!(customer)
end

initial_genres = [
  {name: "ケーキ"},
  {name: "プリン"},
  {name: "焼き菓子"},
  {name: "キャンディ"}
]
Genre.create(initial_genres)

initial_items = initial_items = [
  {
    genre_id: 1,
    name: "いちごのデコレーションケーキ（ホール）",
    introduction: "栃木県産のとちおとめを贅沢に使用しています。",
    price: 2500,
    is_active: true
  },
  {
    genre_id: 1,
    name: "レアチーズケーキ",
    introduction: "口の中でとろけるような濃厚な味わいが特徴のレアチーズケーキです。贅沢なひとときを味わえます。",
    price: 450,
    is_active: true
  },
  {
    genre_id: 2,
    name: "カスタードプリン",
    introduction: "なめらかなカスタードクリームがたっぷりと入ったプリンです。ほどよい甘さが心地よい一品です。",
    price: 280,
    is_active: true
  },
  {
    genre_id: 2,
    name: "オレンジプリン",
    introduction: "オレンジの爽やかな風味が香るプリンです。一口食べると幸せな気分になれます。",
    price: 300,
    is_active: true
  },
  {
    genre_id: 3,
    name: "ブルーベリーマフィン",
    introduction: "ジューシーなブルーベリーがたっぷり入ったふわふわのマフィンです。朝食やおやつにぴったりです。",
    price: 230,
    is_active: true
  },
  {
    genre_id: 3,
    name: "カボチャマフィン",
    introduction: "カボチャの自然な甘さとほんのりスパイシーな風味が楽しめるマフィンです。ヘルシーな一品です。",
    price: 220,
    is_active: true
  },
  {
    genre_id: 4,
    name: "マシュマロ",
    introduction: "ふんわりとした食感が特徴のマシュマロです。甘さとふわふわ感を楽しめる一品です。",
    price: 100,
    is_active: true
  },
  {
    genre_id: 4,
    name: "グミベア",
    introduction: "ぷるぷるとした食感が楽しいフルーティーな味わいのグミベアです。子供から大人まで楽しめるお菓子です。",
    price: 150,
    is_active: true
  },
  {
    genre_id: 1,
    name: "【季節限定】濃厚チョコレートケーキ（ホール）",
    introduction: "濃厚なチョコレートケーキです。口の中で溶けるような美味しさが特徴です。",
    price: 2500,
    is_active: false
  },
]
initial_items.each.with_index(1) do |item, i|
  new_item = Item.create!(item)
  new_item.image.attach(
    io: File.open(Rails.root.join("./app/assets/images/seeds/item_#{sprintf("%02d",i)}.jpg")),
    filename: "#{sprintf("%02d",i)}.jpg"
  )
end

initial_orders = [
  {
    customer_id: 1,
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    name: "一ノ瀬洋子",
    shipping_cost: 800,
    total_payment: 3550,
    payment_method: 0,
    status: 0
  },
  {
    customer_id: 2,
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    name: "二階堂啓介",
    shipping_cost: 800,
    total_payment: 2406,
    payment_method: 1,
    status: 1
  }
]
Order.create(initial_orders)

initial_order_details = [
  {
    order_id: 1,
    item_id: 1,
    price: 2750,
    amount: 1,
    making_status: 0
  },
  {
    order_id: 2,
    item_id: 2,
    price: 495,
    amount: 2,
    making_status: 1
  },
  {
    order_id: 2,
    item_id: 3,
    price: 308,
    amount: 2,
    making_status: 2
  }
]
OrderDetail.create(initial_order_details)

initial_addresses = [
  {
    customer_id: 1,
    name: "職場",
    postal_code: 1310045,
    address: "東京都墨田区押上1丁目1-2",
  }
]
Address.create(initial_addresses)

Admin.create!(
   email: 'nagano@gmail',
   password: 'nagano',
   password_confirmation: "nagano"
)
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
<<<<<<< HEAD
=======
  },
  {
    last_name: "四谷",
    first_name: "葵",
    last_name_kana: "ヨツヤ",
    first_name_kana: "アオイ",
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    telephone_number: TEST_TELEPHONE_NUMBER,
    is_active: false
  },
  {
    last_name: "五条",
    first_name: "咲夜",
    last_name_kana: "ゴジョウ",
    first_name_kana: "サクヤ",
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    telephone_number: TEST_TELEPHONE_NUMBER,
    is_active: false
  },
  {
    last_name: "六本木",
    first_name: "裕太",
    last_name_kana: "ロッポンギ",
    first_name_kana: "ユウタ",
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    telephone_number: TEST_TELEPHONE_NUMBER,
    is_active: true
  },
  {
    last_name: "七海",
    first_name: "美咲",
    last_name_kana: "ナナミ",
    first_name_kana: "ミサキ",
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    telephone_number: TEST_TELEPHONE_NUMBER,
    is_active: true
  },
  {
    last_name: "八幡",
    first_name: "哲也",
    last_name_kana: "ヤハタ",
    first_name_kana: "テツヤ",
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    telephone_number: TEST_TELEPHONE_NUMBER,
    is_active: true
  },
  {
    last_name: "九条",
    first_name: "華",
    last_name_kana: "クジョウ",
    first_name_kana: "ハナ",
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    telephone_number: TEST_TELEPHONE_NUMBER,
    is_active: true
  },
  {
    last_name: "十森",
    first_name: "蓮",
    last_name_kana: "トモリ",
    first_name_kana: "レン",
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    telephone_number: TEST_TELEPHONE_NUMBER,
    is_active: true
  },
  {
    last_name: "五十嵐",
    first_name: "奈緒美",
    last_name_kana: "イガラシ",
    first_name_kana: "ナオミ",
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    telephone_number: TEST_TELEPHONE_NUMBER,
    is_active: true
>>>>>>> a83c027 ([Add]kaminariをビューに反映)
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
    status: 1,
    created_at: "2024/03/13 12:14:51"
  },
  {
    customer_id: 3,
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    name: "三浦健太",
    shipping_cost: 800,
    total_payment: 3550,
    payment_method: 0,
    status: 0,
    created_at: "2024/03/14 14:21:34"
  },
  {
    customer_id: 4,
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    name: "四谷葵",
    shipping_cost: 800,
    total_payment: 1295,
    payment_method: 0,
    status: 1,
    created_at: "2024/03/15 16:35:15"
  },
  {
    customer_id: 5,
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    name: "五条咲夜",
    shipping_cost: 800,
    total_payment: 2285,
    payment_method: 0,
    status: 1,
    created_at: "2024/03/16 18:13:00"
  },
  {
    customer_id: 6,
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    name: "六本木裕太",
    shipping_cost: 800,
    total_payment: 3110,
    payment_method: 0,
    status: 0,
    created_at: "2024/03/17 10:18:08"
  },
  {
    customer_id: 7,
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    name: "七海美咲",
    shipping_cost: 800,
    total_payment: 3550,
    payment_method: 0,
    status: 0,
    created_at: "2024/03/18 12:19:08"
  },
  {
    customer_id: 8,
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    name: "八幡哲也",
    shipping_cost: 800,
    total_payment: 3550,
    payment_method: 0,
    status: 0,
    created_at: "2024/03/19 10:10:03"
  },
  {
    customer_id: 9,
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    name: "九条華",
    shipping_cost: 800,
    total_payment: 3550,
    payment_method: 0,
    status: 1,
    created_at: "2024/03/20 17:14:08"
  },
  {
    customer_id: 10,
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    name: "十森蓮",
    shipping_cost: 800,
    total_payment: 3550,
    payment_method: 0,
    status: 1,
    created_at: "2024/03/21 16:43:00"
  },
  {
    customer_id: 11,
    postal_code: TEST_POSTAL_CODE,
    address: TEST_ADDRESS,
    name: "五十嵐奈緒美",
    shipping_cost: 800,
    total_payment: 3110,
    payment_method: 0,
    status: 1,
    created_at: "2024/03/22 15:33:38"
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
  },
  {
    order_id: 3,
    item_id: 1,
    price: 2750,
    amount: 1,
    making_status: 0
  },
  {
    order_id: 4,
    item_id: 1,
    price: 2750,
    amount: 1,
    making_status: 0
  },
  {
    order_id: 5,
    item_id: 8,
    price: 495,
    amount: 3,
    making_status: 0
  },
  {
    order_id: 6,
    item_id: 2,
    price: 495,
    amount: 2,
    making_status: 1
  },
  {
    order_id: 6,
    item_id: 3,
    price: 308,
    amount: 1,
    making_status: 2
  },
  {
    order_id: 6,
    item_id: 5,
    price: 253,
    amount: 4,
    making_status: 1
  },
  {
    order_id: 7,
    item_id: 1,
    price: 2750,
    amount: 1,
    making_status: 0
  },
  {
    order_id: 8,
    item_id: 1,
    price: 2750,
    amount: 1,
    making_status: 0
  },
  {
    order_id: 9,
    item_id: 1,
    price: 2750,
    amount: 1,
    making_status: 0
  },
  {
    order_id: 10,
    item_id: 1,
    price: 2750,
    amount: 1,
    making_status: 0
  },
  {
    order_id: 11,
    item_id: 2,
    price: 495,
    amount: 2,
    making_status: 1
  },
  {
    order_id: 11,
    item_id: 3,
    price: 308,
    amount: 1,
    making_status: 2
  },
  {
    order_id: 11,
    item_id: 5,
    price: 253,
    amount: 4,
    making_status: 1
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
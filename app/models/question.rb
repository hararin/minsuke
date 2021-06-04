class Question < ApplicationRecord

  belongs_to :user
  belongs_to :request

  enum evaluation: {未回答:0, 回答済:1, 追加質問:2, 解決済:3}

  validates :content, presence: true

end

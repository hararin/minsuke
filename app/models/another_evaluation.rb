class AnotherEvaluation < ApplicationRecord

  belongs_to :user
  belongs_to :request

  enum evaluation: {不満:1, やや不満:2, 普通:3, やや満足:4, 満足:5}

  attachment :image

end

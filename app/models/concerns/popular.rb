require 'ostruct'

class Popular < OpenStruct
  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Conversion 
end
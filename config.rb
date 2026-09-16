require 'dry-struct'

module Types
  include Dry.Types()

  BaseUrl = String.constructor { |value, type| type.call(value).chomp('/') }
end

class Config < Dry::Struct
  attribute :gateways do
    attribute :poker do
      attribute :username, Types::String
      attribute :password, Types::String
      attribute :host, Types::BaseUrl
    end
    attribute :jira do
      attribute :username,             Types::String
      attribute :password,             Types::String
      attribute :host,                 Types::BaseUrl
      attribute :issues_search_filter, Types::String
    end
  end
end

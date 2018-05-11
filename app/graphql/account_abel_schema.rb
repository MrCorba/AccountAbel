# frozen_string_literal: true

AccountAbelSchema = GraphQL::Schema.define do
  mutation(Types::MutationType)
  query(Types::QueryType)
end

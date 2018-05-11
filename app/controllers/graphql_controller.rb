# frozen_string_literal: true

# Controller to handle and distribute all graphql calls
class GraphqlController < ApplicationController
  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {}
    result = execute_schema(query, variables, context, operation_name)

    render json: result
  end

  private

  def execute_schema(query, variables, context, operation_name)
    AccountAbelSchema.execute(query,
                              variables: variables,
                              context: context,
                              operation_name: operation_name)
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      ambiguous_param.present? ? ensure_hash(JSON.parse(ambiguous_param)) : {}
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end
end

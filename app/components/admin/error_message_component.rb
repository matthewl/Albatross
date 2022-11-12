# frozen_string_literal: true

class Admin::ErrorMessageComponent < ViewComponent::Base
  def initialize(resource:, attributes:)
    @resource = resource
    @attributes = attributes
    @errors = []

    match_errors
  end

  def render?
    @resource.present? && @errors.present?
  end

  private

  def match_errors
    if @attributes.present?
      @attributes.each do |attribute|
        attribute_error_messages = @resource.errors.full_messages_for(attribute)
        if attribute_error_messages.present?
          attribute_error_messages.each { |message| @errors << message }
        end
      end
    else
      @errors = @resource.errors.full_messages
    end
  end
end

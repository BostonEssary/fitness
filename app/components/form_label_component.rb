# frozen_string_literal: true

class FormLabelComponent < ViewComponent::Base
  def initialize(form:, field:, label:, model:)
    @form = form
    @field = field
    @label = label
    @model = model
  end

  private

  attr_reader :form, :field, :label, :model

  def errors_present?
    model.errors[field].present?
  end

  def error_messages
    model.errors[field].join(", ").capitalize
  end
end


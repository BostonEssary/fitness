# frozen_string_literal: true

class TabsComponent < ViewComponent::Base
    renders_many :tabs, "TabComponent"

    class TabComponent < ViewComponent::Base
        attr_reader :name

        def initialize(name:)
            @name = name
        end

        def call
            content
        end
    end
end

module OneUpApp
  module Contexts
    module Crud
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def crud_element_list
          @@crud_element_list ||= []
        end

        def crud_element_list=(new_list)
          @@crud_element_list = new_list
        end

        def create(args)
          self.crud_element_list << (element = self.new(args))
          element
        end

        def all
          self.crud_element_list
        end

        def clear_all
          self.crud_element_list.clear
        end
      end

    end
  end
end
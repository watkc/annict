# frozen_string_literal: true

module Api
  module V1
    class WorksIndexParams
      include ActiveParameter

      param :fields
      param :filter_ids
      param :filter_season
      param :filter_title
      param :page, default: 1
      param :per_page, default: 25
      param :sort

      validates :fields,
        allow_blank: true,
        fields_params: true
      validates :filter_ids,
        allow_blank: true,
        filter_ids_params: true
      validates :filter_season,
        allow_blank: true,
        filter_season_params: true
      validates :per_page,
        allow_blank: true,
        numericality: {
          only_integer: true,
          greater_than_or_equal_to: 1,
          less_than_or_equal_to: 50
        }
      validates :page,
        allow_blank: true,
        numericality: {
          only_integer: true,
          greater_than_or_equal_to: 1
        }

      def fields_contain?(field)
        fields.blank? || fields.split(",").include?(field)
      end
    end
  end
end

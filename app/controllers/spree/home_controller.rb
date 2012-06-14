module Spree
  class HomeController < BaseController
    helper 'spree/products'
    respond_to :html

    def index
      @taxon_f = Taxon.find_by_permalink!('categories/featured')
      @searcher_f = Spree::Config.searcher_class.new(params.merge(:taxon => @taxon_f.id))
      @products_f = @searcher_f.retrieve_products
      @taxon_h = Taxon.find_by_permalink!('categories/hero')
      @searcher_h = Spree::Config.searcher_class.new(params.merge(:taxon => @taxon_h.id))
      @products_h = @searcher_h.retrieve_products
      respond_with(@products_f, @products_h)
    end
  end
end

class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
        return self.products.order(star_rating: :desc).first
    end 
    def remove_reviews(product)
        self.reviews.where(product_id: product.id).delete_all
    end 
end


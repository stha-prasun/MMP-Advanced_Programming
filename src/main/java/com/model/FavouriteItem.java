package com.model;

public class FavouriteItem {
    private Long favouriteItemId;
    private Long favouriteId;
    private Long customerId;
    private Long productId;

    public FavouriteItem(Long favouriteItemId, Long customerId,Long favouriteId, Long productId) {
        this.favouriteItemId = favouriteItemId;
        this.favouriteId = favouriteId;
        this.customerId=customerId;
        this.productId = productId;
    }

    public FavouriteItem() {
    }

    public Long getFavouriteItemId() {
        return favouriteItemId;
    }

    public void setFavouriteItemId(Long favouriteItemId) {
        this.favouriteItemId = favouriteItemId;
    }

    public Long getFavouriteId() {
        return favouriteId;
    }

    public void setFavouriteId(Long favouriteId) {
        this.favouriteId = favouriteId;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }
}

package com.model;

public class FavouriteProductModel {
    private Long favouriteId;
    private Long favouriteItemId;
    private int totalFavourites;

    private Long productId;
    private String productName;
    private int productPrice;
    private String productImageUrl;
    private Boolean productIsSold;

    private String categoryName;

    public FavouriteProductModel(Long favouriteId, Long favouriteItemId, int totalFavourites, Long productId, String productName, int productPrice, String productImageUrl,Boolean productIsSold, String categoryName) {
        this.favouriteId = favouriteId;
        this.favouriteItemId = favouriteItemId;
        this.totalFavourites = totalFavourites;
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productImageUrl = productImageUrl;
        this.productIsSold=productIsSold;
        this.categoryName = categoryName;
    }

    public Long getFavouriteId() {
        return favouriteId;
    }

    public void setFavouriteId(Long favouriteId) {
        this.favouriteId = favouriteId;
    }

    public Long getFavouriteItemId() {
        return favouriteItemId;
    }

    public void setFavouriteItemId(Long favouriteItemId) {
        this.favouriteItemId = favouriteItemId;
    }

    public int getTotalFavourites() {
        return totalFavourites;
    }

    public void setTotalFavourites(int totalFavourites) {
        this.totalFavourites = totalFavourites;
    }

    public Boolean getProductIsSold() {
        return productIsSold;
    }

    public void setProductIsSold(Boolean productIsSold) {
        this.productIsSold = productIsSold;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductImageUrl() {
        return productImageUrl;
    }

    public void setProductImageUrl(String productImageUrl) {
        this.productImageUrl = productImageUrl;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}

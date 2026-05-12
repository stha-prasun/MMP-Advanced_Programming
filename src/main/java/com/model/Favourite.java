package com.model;

public class Favourite {
    private Long favouriteId;
    private int totalFavourites;
    private Long customerId;

    public Favourite(Long favouriteId, int totalFavourites, Long customerId) {
        this.favouriteId = favouriteId;
        this.totalFavourites = totalFavourites;
        this.customerId = customerId;
    }

    public Favourite() {
    }

    public Long getFavouriteId() {
        return favouriteId;
    }

    public void setFavouriteId(Long favouriteId) {
        this.favouriteId = favouriteId;
    }

    public int getTotalFavourites() {
        return totalFavourites;
    }

    public void setTotalFavourites(int totalFavourites) {
        this.totalFavourites = totalFavourites;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }
}

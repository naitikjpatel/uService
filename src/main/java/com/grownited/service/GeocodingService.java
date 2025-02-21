package com.grownited.service;

import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import com.grownited.entity.Location;
import com.grownited.entity.UserAddressEntity;

import reactor.core.publisher.Mono;

@Service
public class GeocodingService {

    private final WebClient webClient;

    public GeocodingService(WebClient.Builder webClientBuilder) {
        this.webClient = webClientBuilder.baseUrl("https://nominatim.openstreetmap.org").build();
    }

    public Mono<Location> getLatLong(String address) {
        return webClient.get()
                .uri(uriBuilder -> uriBuilder
                        .path("/search")
                        .queryParam("q", address)
                        .queryParam("format", "json")
                        .build())
                .retrieve()
                .bodyToMono(Location[].class)
                .map(locations -> locations.length > 0 ? locations[0] : null);
    }

    public void setLatLong(UserAddressEntity userAddressEntity) {
        getLatLong(userAddressEntity.getAddressLine()).subscribe(location -> {
        	
            if (location != null) {
                userAddressEntity.setLatitude(Double.parseDouble(location.getLat()));
                userAddressEntity.setLongtitude(Double.parseDouble(location.getLon()));
            }
        });
    }
}

//
//  PromoEntity.swift
//  PromoBNI
//
//  Created by Kurniawan Gigih Lutfi Umam on 10/05/23.
//

import Foundation

struct PromoEntity {
    let id: Int
    let title: String
    let nama: String
    let desc: String
    let lokasi: String
    let images: PromoImageEntity
    
    init(id: Int,title: String, nama: String, desc: String, lokasi: String, images: PromoImageEntity) {
        self.id = id
        self.nama = nama
        self.title = title
        self.desc = desc
        self.lokasi = lokasi
        self.images = images
    }
}

struct PromoImageEntity {
    let name: String
    let url: String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

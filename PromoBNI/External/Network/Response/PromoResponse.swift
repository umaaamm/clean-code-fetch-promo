//
//  PromoResponse.swift
//  PromoBNI
//
//  Created by Kurniawan Gigih Lutfi Umam on 10/05/23.
//

import Foundation

// MARK: - PromoResponseElement
struct PromoResponse: Codable {
    let id: Int?
    let title: String?
    let publishedAt, promoResponseCreatedAt, updatedAt: String?
    let namePromo, descPromo: String?
    let nama, desc: String?
    let latitude, longitude, alt: String?
    let createdAt, lokasi: String?
    let count: Int?
    let img: Img?

    enum CodingKeys: String, CodingKey {
        case id
        case title = "Title"
        case publishedAt = "published_at"
        case promoResponseCreatedAt = "created_at"
        case updatedAt = "updated_at"
        case namePromo = "name_promo"
        case descPromo = "desc_promo"
        case nama, desc, latitude, longitude, alt, createdAt, lokasi, count, img
    }
}

// MARK: - Img
struct Img: Codable {
    let id: Int?
    let name, alternativeText, caption: String?
    let width, height: Int?
    let formats: Formats?
    let hash: String?
    let ext: EXT?
    let mime: MIME?
    let size: Double?
    let url: String?
    let previewURL: String?
    let provider: String?
    let providerMetadata: String?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name, alternativeText, caption, width, height, formats, hash, ext, mime, size, url
        case previewURL = "previewUrl"
        case provider
        case providerMetadata = "provider_metadata"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

enum EXT: String, Codable {
    case jpg = ".jpg"
}

// MARK: - Formats
struct Formats: Codable {
    let small, medium, thumbnail, large: Large?
}

// MARK: - Large
struct Large: Codable {
    let ext: EXT?
    let url: String?
    let hash: String?
    let mime: MIME?
    let name: String?
    let path: String?
    let size: Double?
    let width, height: Int?
}

enum MIME: String, Codable {
    case imageJPEG = "image/jpeg"
}

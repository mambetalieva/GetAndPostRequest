//
//  Model.swift
//  GetAndPostRequest
//
//  Created by Каира on 27.05.2023.
//

import Foundation
// MARK: - GadgetModel
struct GadgetModel: Codable {
    let products: [Product]?
    let total, skip, limit: Int?
}

// MARK: - Product
struct Product: Codable {
    let id: Int?
    let title, description: String?
    let thumbnail: String?
    init(id: Int?, title: String?, description: String? = nil, thumbnail: String? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
    }
//    let price: Int?
//    let discountPercentage, rating: Double?
//    let stock: Int?
//    let brand, category: String?
//    let images: [String]?
}

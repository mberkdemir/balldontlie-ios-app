//
//  Meta.swift
//  NBA-Application
//
//  Created by Berk on 1.07.2023.
//

import Foundation

// MARK: - Meta
struct Meta: Codable {
    let totalPages, currentPage, nextPage, perPage: Int
    let totalCount: Int

    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case currentPage = "current_page"
        case nextPage = "next_page"
        case perPage = "per_page"
        case totalCount = "total_count"
    }
}

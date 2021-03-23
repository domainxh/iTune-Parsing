//
//  File.swift
//  
//
//  Created by Xiaoheng Pan on 2/22/20.
//

import Foundation

public struct AlbumCollection: Decodable {
    public let resultCount: Int
    public let results: [Album]
}

public struct Album: Decodable {
    public let wrapperType: String
    public let artistType: String?
    public let collectionName: String?
    public let artistName: String
    public let artistLinkUrl: String?
    public let artistId: Int
    public let collectionPrice: Double?
    public let trackCount: Int?
}

public enum NetworkError: Error {
    case domainError
    case decodingError
}

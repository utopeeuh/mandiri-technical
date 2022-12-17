// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let genreResult = try? newJSONDecoder().decode(GenreResult.self, from: jsonData)

import Foundation

// MARK: - GenreResult
struct GenreResult: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

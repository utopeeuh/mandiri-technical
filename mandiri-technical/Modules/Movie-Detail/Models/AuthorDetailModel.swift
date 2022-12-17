//
//  AuthorDetailModel.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 17/12/22.
//

import Foundation

// MARK: - AuthorDetails
struct AuthorDetails: Codable {
    let name, username: String
    let avatarPath: String?
    let rating: Int?

    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}

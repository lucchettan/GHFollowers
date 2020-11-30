//
//  GFError.swift
//  GitHub Followers
//
//  Created by mac on 21/09/2020.
//  Copyright © 2020 NLCompany. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check internet connexion"
    case invalidResponse    = "Invalid response from the server. Please try again"
    case dataInvalid        = "The data receivde from the server is invalid. Please try again."
    case unableToFavorite   = "There was an error favoriting this user. Please try again."
    case alreadyFavorited   = "You have already favorited this user. You must really like them."
}

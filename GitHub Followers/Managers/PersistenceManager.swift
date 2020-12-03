//
//  PersistenceManager.swift
//  GitHub Followers
//
//  Created by mac on 22/09/2020.
//  Copyright © 2020 NLCompany. All rights reserved.
//

import Foundation
enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func retrieveFavorites() -> [Follower]? {
        guard let favoritesDatas = defaults.object(forKey: Keys.favorites) as? Data else { return nil }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase //pass from snakecase to CamelCase to fit our model variables
            let favorites = try decoder.decode([Follower].self, from: favoritesDatas)
            return favorites
        } catch {
            return nil
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType) {
        if var retrievedFavorites = retrieveFavorites() {
            switch actionType {
                case .add:
                    if !retrievedFavorites.contains(favorite) {
                        retrievedFavorites.append(favorite)
                        save(favorites: retrievedFavorites)
                    }
                case .remove:
                    //  remove any instance.login that is equal to favorite.login
                    print(retrievedFavorites)
                    retrievedFavorites.removeAll { $0.login == favorite.login }
                    save(favorites: retrievedFavorites)
                    print(retrievedFavorites)
                }
        }
    }
}

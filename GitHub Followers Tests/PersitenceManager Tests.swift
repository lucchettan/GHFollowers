//
//  PersitenceManager Tests.swift
//  GitHub Followers Tests
//
//  Created by mac on 30/11/2020.
//  Copyright © 2020 NLCompany. All rights reserved.
//
@testable import GitHub_Followers
import XCTest

class PersitenceManager_Tests: XCTestCase {
    
    func test_retrieveFavorites() throws {
        let expectation1 = expectation(description: "retrieving favorites")

        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let favorites):
                if let favoritesArray = favorites as? [Follower]{
                    expectation1.fulfill()
                }
            case .failure(let error):
                if error == GFError.unableToFavorite {
                    XCTAssertEqual(error, GFError.unableToFavorite)
                    expectation1.fulfill()
                }
            }
        }
        self.waitForExpectations(timeout: 2)
    }
    
    func test_save() throws {
        let expectation1 = expectation(description: "adding Favorites")

        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(var favorites):
                let numberOfFavorites = favorites.count
                
                favorites.append(Follower(login: "lucchettan", avatarUrl: "https://avatars3.githubusercontent.com/u/45241293?v=4"))
                PersistenceManager.save(favorites: favorites)
                
                PersistenceManager.retrieveFavorites { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case .success(let favorites):
                        let newNumberOfFavorites = favorites.count
                        if numberOfFavorites < newNumberOfFavorites {
                            XCTAssertLessThan(numberOfFavorites, newNumberOfFavorites)
                            expectation1.fulfill()
                        }
                    case .failure(let error):
                        if error == GFError.unableToFavorite {
                            XCTAssertEqual(error, GFError.unableToFavorite)
                            expectation1.fulfill()
                        }
                    }
                }
            case .failure(let error):
                if error == GFError.unableToFavorite {
                    XCTAssertEqual(error, GFError.unableToFavorite)
                    expectation1.fulfill()
                }
            }
        }
        self.waitForExpectations(timeout: 3)
    }
}

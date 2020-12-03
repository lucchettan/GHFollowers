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
    let testUser = Follower(login: "lucchettan", avatarUrl: "https://avatars3.githubusercontent.com/u/45241293?v=4")
    
    func test_retrieveFavorites() {
        if let favorites = PersistenceManager.retrieveFavorites() as [Follower]? {
//            XCTAssert(favorites != nil)
            XCTAssertNotNil(favorites)
        }
    }
    
    func test_save() {
        let beforeSavingFavorites = PersistenceManager.retrieveFavorites()
        var newFavoritesArray = beforeSavingFavorites
        newFavoritesArray!.append(testUser)
        // This line helps me test with at least one follower in the array
        PersistenceManager.save(favorites: newFavoritesArray!)
        XCTAssertLessThan(beforeSavingFavorites!.count, newFavoritesArray!.count)
    }
    
    func test_Add_Update() {
        let beforeSavingFavorites = PersistenceManager.retrieveFavorites()?.count
        PersistenceManager.updateWith(favorite: testUser, actionType: .add)
        let newFavoritesArray = PersistenceManager.retrieveFavorites()?.count
        XCTAssertLessThan(beforeSavingFavorites!, newFavoritesArray!)
    }
    
    func test_remove_Update() {
        // This line helps me test with at least one follower in the array
        PersistenceManager.save(favorites: [testUser])
        let beforeSavingFavorites = PersistenceManager.retrieveFavorites()?.count
        PersistenceManager.updateWith(favorite: testUser, actionType: .remove)
        let newFavoritesArray = PersistenceManager.retrieveFavorites()?.count
        XCTAssertLessThan(newFavoritesArray!, beforeSavingFavorites!)
    }
}
//        let expectation1 = expectation(description: "adding Favorites")
//
//        PersistenceManager.retrieveFavorites { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success(var favorites):
//                let numberOfFavorites = favorites.count
//
//                favorites.append(Follower(login: "lucchettan", avatarUrl: "https://avatars3.githubusercontent.com/u/45241293?v=4"))
//                PersistenceManager.save(favorites: favorites)
//
//                PersistenceManager.retrieveFavorites { [weak self] result in
//                    guard let self = self else { return }
//                    switch result {
//                    case .success(let favorites):
//                        let newNumberOfFavorites = favorites.count
//                        if numberOfFavorites < newNumberOfFavorites {
//                            XCTAssertLessThan(numberOfFavorites, newNumberOfFavorites)
//                            expectation1.fulfill()
//                        }
//                    case .failure(let error):
//                        if error == GFError.unableToFavorite {
//                            XCTAssertEqual(error, GFError.unableToFavorite)
//                            expectation1.fulfill()
//                        }
//                    }
//                }
//            case .failure(let error):
//                if error == GFError.unableToFavorite {
//                    XCTAssertEqual(error, GFError.unableToFavorite)
//                    expectation1.fulfill()
//                }
//            }
//        }
//        self.waitForExpectations(timeout: 3)


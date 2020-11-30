//
//  NetworkManager Tests.swift
//  GitHub Followers Tests
//
//  Created by mac on 30/11/2020.
//  Copyright © 2020 NLCompany. All rights reserved.
//
@testable import GitHub_Followers
import XCTest

class NetworkManager_Tests: XCTestCase {
    
    var validationNetworkManager: NetworkManager!
    
    override func setUp() {
        super.setUp()
        validationNetworkManager = NetworkManager.shared
    }
    
    override func tearDown() {
        validationNetworkManager = nil
        super.tearDown()
    }
    
    func test_getFollowers_with_valid_username() throws {
        XCTAssertNoThrow(try validationNetworkManager.getFollowers(for: "lucchettan", page: 100){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let followers):
                print("test on getfollowers returns")
                print(followers)
            case .failure(let error):
                print("test on getfollowers is failling")
            }
        })
    }
    
    func test_getFollowers_with_Invalid_Username() throws {
        let expectedError = GFError.invalidResponse
//        var error : GFError?
        
        let expectation1 = expectation(description: "loading invalid User's followers")

        validationNetworkManager.getFollowers(for: "jfkdjf", page: 100){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let followers):
                print("test on getfollowers returns")
                print(followers)
                XCTFail("Error loading invalid followers")
            case .failure(let thrownError):
                print(" test_getFollowers_with_Invalid_Username Returns error")
                XCTAssertEqual(expectedError, thrownError)
                expectation1.fulfill()
            }
        }
        self.waitForExpectations(timeout: 3)

    }
    
    func test_GetUserInfo_lucchettan() throws {
        let lucchettan = User(login: "lucchettan", avatarUrl: "https://avatars3.githubusercontent.com/u/45241293?v=4", name: nil, location: nil, bio: nil, publicRepos: 19, publicGists: 0, htmlUrl: "https://github.com/lucchettan", following: 17, followers: 9, createdAt: Date())
        let expectation1 = expectation(description: "loading lucchettan User")
        
        validationNetworkManager.getUserInfo(for: "lucchettan"){ [weak self]result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                if user.avatarUrl == lucchettan.avatarUrl {
                    XCTAssertEqual(user.avatarUrl, lucchettan.avatarUrl)
                    expectation1.fulfill()
                }
            case .failure(let error):
                XCTFail("Error loading lucchettan profile")
            }
        }
        self.waitForExpectations(timeout: 3)
    }
    
    func test_downloadImage() throws {
        let lucchettan = User(login: "lucchettan", avatarUrl: "https://avatars3.githubusercontent.com/u/45241293?v=4", name: nil, location: nil, bio: nil, publicRepos: 19, publicGists: 0, htmlUrl: "https://github.com/lucchettan", following: 17, followers: 9, createdAt: Date())
        let expectation1 = expectation(description: "loading lucchettan avatarUrl")
        
        validationNetworkManager.dowloadImage(from: lucchettan.avatarUrl){ image in
            XCTAssertNotNil(image)
            expectation1.fulfill()
        }
        self.waitForExpectations(timeout: 3)
    }
    

    
}

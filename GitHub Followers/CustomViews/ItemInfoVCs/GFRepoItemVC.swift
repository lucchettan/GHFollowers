//
//  GFRepoItemVC.swift
//  GitHub Followers
//
//  Created by mac on 21/09/2020.
//  Copyright © 2020 NLCompany. All rights reserved.
//

import UIKit
// inherit all the methods of GFItemInfoVC

class GFRepoItemVC : GFItemInfoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGithubProfile(for: user)
    }
}

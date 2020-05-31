//
//  MainFeedVC.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 31.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit

class MainFeedVC: UIViewController {
    lazy var tableView = UITableView()
    var userArray:[ProfileModel] = [ProfileModel(profileType: .myProfile, imageName: "profileIcon", postCount: "2", followerCount: "100", followingCount: "54", name: "Tolga İskender", username: "tiskender2", bio: "iOS Developer\nToronto"),ProfileModel(profileType: .followingProfile, imageName: "followingProfile", postCount: "21", followerCount: "34K", followingCount: "10", name: "Gökhan Akbaba", username: "akbaba59", bio: "V.I.P. Account\n█║▌│█│║▌║││█║▌\n★✌★》ProuD tO be a garG bOy😎\n★✌★》📷ⓗⓞⓛⓘⓒ BøY👦\n★✌★》ɱQSɩC 🎧 LoVɘʀ💑\n★✌★》LIF乇 LIɴ乇 ℜ𝕚𝕋𝕫😘\n★✌★》GuNs🔫 FiRe Øn\n⚫📷Photography📷\n⚫😘Music lover🎶\n⚫⚽Sports lover⛳\n⚫😍Sports bike lover\n⚫💰ßig Dreamer"),ProfileModel(profileType: .othersProfile, imageName: "otherProfile", postCount: "129", followerCount: "5.4M", followingCount: "988", name: "ADEC", username: "adec115", bio:"Artist 👨‍🎤\nDrama 👸\nDreamer 🙈\nActor🎭\nDancer💃\nLearner🤔🤓\nFitness lover💪"),ProfileModel(profileType: .othersProfile, imageName: "otherProfile", postCount: "129", followerCount: "5.4M", followingCount: "988", name: "ADEC", username: "adec115", bio:"Artist 👨‍🎤\nDrama 👸\nDreamer 🙈\nActor🎭\nDancer💃\nLearner🤔🤓\nFitness lover💪"),ProfileModel(profileType: .othersProfile, imageName: "otherProfile", postCount: "129", followerCount: "5.4M", followingCount: "988", name: "ADEC", username: "adec115", bio:"Artist 👨‍🎤\nDrama 👸\nDreamer 🙈\nActor🎭\nDancer💃\nLearner🤔🤓\nFitness lover💪"),ProfileModel(profileType: .othersProfile, imageName: "otherProfile", postCount: "129", followerCount: "5.4M", followingCount: "988", name: "ADEC", username: "adec115", bio:"Artist 👨‍🎤\nDrama 👸\nDreamer 🙈\nActor🎭\nDancer💃\nLearner🤔🤓\nFitness lover💪"),ProfileModel(profileType: .othersProfile, imageName: "otherProfile", postCount: "129", followerCount: "5.4M", followingCount: "988", name: "ADEC", username: "adec115", bio:"Artist 👨‍🎤\nDrama 👸\nDreamer 🙈\nActor🎭\nDancer💃\nLearner🤔🤓\nFitness lover💪")]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainFeed()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTitleView()
    }
}

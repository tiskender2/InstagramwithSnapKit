//
//  HomeUIVC.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 24.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import EasyTipView
enum cellType : Int {
    case profileCell = 0
    case collectionCell
}
extension HomeVC {
    func setupUI()  {
        showTip()
        setUser(profile: .myProfile, imageName: "profileIcon", postCount: "2", followerCount: "100", followingCount: "54", name: "Tolga İskender", username: "tiskender2", bio: "iOS Developer\nToronto")
        setupNavBar(title: model.username ?? "tiskender2", imageName: "down-arrow", lockImageName: "lock", rightButton: "menu")
        setupTableView()
    }
    fileprivate func showTip(){
        var preferences = EasyTipView.Preferences()
        preferences.drawing.backgroundColor = UIColor(hue:0.58, saturation:0.1, brightness:1, alpha:1)
        preferences.drawing.foregroundColor = UIColor.darkGray
        preferences.drawing.textAlignment = NSTextAlignment.center
        preferences.animating.showInitialAlpha = 0
        preferences.animating.showDuration = 1
        preferences.animating.dismissDuration = 1
        self.easyTipView = EasyTipView(text: "You can change Profile View by tapping here",
                                       preferences: preferences)
        self.easyTipView.show(animated: true, forView: self.navigationController!.navigationBar, withinSuperview: self.navigationController?.view)
    }
    fileprivate func setupNavBar(title:String,imageName:String?,lockImageName:String?,rightButton:String){
        
        setupNavTitle(title: model.username ?? "tiskender2", imageName: imageName, lockImageName:lockImageName)
        navigationController?.navigationBar.isTranslucent = false
        let button = UIButton(type: .custom)
        let origImage = UIImage(named: rightButton)!
        let tintedImage = origImage.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.contentMode = .scaleAspectFit
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let barButton = UIBarButtonItem(customView: button)
        if traitCollection.userInterfaceStyle == .dark {
            button.tintColor = .white
        } else {
            button.tintColor = .black
        }
        navigationItem.rightBarButtonItem = barButton
        navigationItem.leftBarButtonItems = nil
        if model.profileType != .myProfile{
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "back"), for: .normal)
            button.contentMode = .scaleAspectFit
            if traitCollection.userInterfaceStyle == .dark {
                button.tintColor = .white
            } else {
                button.tintColor = .black
            }
            button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            let barButton = UIBarButtonItem(customView: button)
            navigationItem.leftBarButtonItem = barButton
        }
        
    }
    fileprivate func setupNavTitle(title:String,imageName:String?,lockImageName:String?){
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.isUserInteractionEnabled = true
        let userType = UITapGestureRecognizer(target: self, action: #selector(changeUserType))
        stackView.addGestureRecognizer(userType)
        let privateView = UIView()
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        if let lockImage = lockImageName {
            imageView.image = UIImage(named: lockImage)
            if traitCollection.userInterfaceStyle == .dark{
                imageView.tintColor = .white
                }else {
                imageView.tintColor = .black
            }
           
        }
        privateView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.height.equalTo(10)
        }
        
        let userNameView = UIView()
        let label = UILabel()
        label.text = title
        label.numberOfLines = 1
        userNameView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        let downView = UIView()
        let downImageView = UIImageView()
        downImageView.contentMode = .scaleAspectFit
        downImageView.clipsToBounds = true
        downView.addSubview(downImageView)
        downImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.height.equalTo(10)
        }
        if let rightImage = imageName {
            downImageView.image = UIImage(named: rightImage)
            if traitCollection.userInterfaceStyle == .dark {
                downImageView.tintColor = .white
            } else {
                downImageView.tintColor = .black
            }
            if model.profileType == .othersProfile {
                downImageView.tintColor = UIColor(red: 0/255, green: 150/255, blue: 255/255, alpha: 1.0)
                downImageView.snp.updateConstraints { (make) in
                    make.width.height.equalTo(12)
                }
            }
        }
        stackView.addArrangedSubview(privateView)
        stackView.addArrangedSubview(userNameView)
        stackView.addArrangedSubview(downView)
        navigationItem.titleView = stackView
        stackView.snp.makeConstraints { (make) in
            //make.width.equalTo(250)
            make.height.equalTo(30)
        }
    }
    fileprivate func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(ProfileCell.self, forCellReuseIdentifier: "ProfileCell")
        tableView.register(CollectionCell.self, forCellReuseIdentifier: "CollectionCell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    func setUser(profile:profileEnum,imageName:String,postCount:String,followerCount:String,followingCount:String,name:String,username:String,bio:String){
        model.profileType = profile
        model.imageName = imageName
        model.postCount = postCount
        model.followerCount = followerCount
        model.followingCount = followingCount
        model.name = name
        model.username = username
        model.bio = bio
    }
    @objc func changeUserType(){
        self.easyTipView.dismiss()
        var actions: [(String, UIAlertAction.Style)] = []
        actions.append(("My Profile", UIAlertAction.Style.default))
        actions.append(("Following Profile", UIAlertAction.Style.default))
        actions.append(("Other Profile", UIAlertAction.Style.default))
        actions.append(("Cancel", UIAlertAction.Style.cancel))
        AlertManager.showActionsheet(viewController: self, title: "Choose Profile", message: "You can change to view to see Profile Types", actions: actions) { (index) in
            switch index {
            case profileEnum.myProfile.rawValue:
                self.setUser(profile: .myProfile, imageName: "profileIcon", postCount: "2", followerCount: "100", followingCount: "54", name: "Tolga İskender", username: "tiskender2", bio: "iOS Developer\nToronto")
                self.setupNavBar(title: self.model.username ?? "tiskender2", imageName: "down-arrow", lockImageName: "lock", rightButton: "menu")
            case profileEnum.followingProfile.rawValue:
                self.setUser(profile: .followingProfile, imageName: "followingProfile", postCount: "21", followerCount: "34K", followingCount: "10", name: "Gökhan Akbaba", username: "akbaba59", bio: "V.I.P. Account\n█║▌│█│║▌║││█║▌\n★✌★》ProuD tO be a garG bOy😎\n★✌★》📷ⓗⓞⓛⓘⓒ BøY👦\n★✌★》ɱQSɩC 🎧 LoVɘʀ💑\n★✌★》LIF乇 LIɴ乇 ℜ𝕚𝕋𝕫😘\n★✌★》GuNs🔫 FiRe Øn\n⚫📷Photography📷\n⚫😘Music lover🎶\n⚫⚽Sports lover⛳\n⚫😍Sports bike lover\n⚫💰ßig Dreamer\n⚫😭Cry the 1 st time in my life #25/11/99#")
                self.setupNavBar(title: self.model.username ?? "tiskender2", imageName: nil, lockImageName: nil, rightButton: "more")
            case profileEnum.othersProfile.rawValue:
                self.setUser(profile: .othersProfile, imageName: "otherProfile", postCount: "129", followerCount: "5.4M", followingCount: "988", name: "ADEC", username: "adec115", bio:"Artist 👨‍🎤\nDrama 👸\nDreamer 🙈\nActor🎭\nDancer💃\nLearner🤔🤓\nFitness lover💪")
                self.setupNavBar(title: self.model.username ?? "tiskender2", imageName: "approved", lockImageName: nil, rightButton: "more")
            default:
                return
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == cellType.profileCell.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.setupStackView(model: model)
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
            cell.collectionReloadData(model: model)
            return cell
        }
    }
}
extension HomeVC: UITableViewDelegate {
    
}


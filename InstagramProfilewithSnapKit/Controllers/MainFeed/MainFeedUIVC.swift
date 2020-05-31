//
//  MainFeedUIVC.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 30.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
enum MaincellType:Int{
    case storyCell = 0
    case feedCell
    case suggestCell
}
extension MainFeedVC {
    func setupMainFeed(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(FeedCell.self, forCellReuseIdentifier: FeedCell.identifier)
        tableView.register(CollectionCell.self, forCellReuseIdentifier: "CollectionCell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    func setupTitleView(){
        let image = UIImage(named: "title")
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        tabBarController?.navigationItem.titleView = imageView
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(100)
            //make.bottom.equalTo(4)
        }
       setupButtons()
    }
    fileprivate func setupButtons(){
        let button = UIButton(type: .custom)
        let origImage = UIImage(named: "send")!
        let tintedImage = origImage.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.contentMode = .center
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let barButton = UIBarButtonItem(customView: button)
        button.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
        }
        button.tintColor = .black
        
        let buttonIG = UIButton(type: .custom)
        let origImageIG = UIImage(named: "igtv")!
        let tintedImageIG = origImageIG.withRenderingMode(.alwaysTemplate)
        buttonIG.setImage(tintedImageIG, for: .normal)
        buttonIG.contentMode = .center
        buttonIG.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let barButtonIG = UIBarButtonItem(customView: buttonIG)
        buttonIG.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
        }
        buttonIG.tintColor = .black
        let cameraButton = UIButton(type: .custom)
        let origImageCa = UIImage(named: "camera")!
        let tintedImageCa = origImageCa.withRenderingMode(.alwaysTemplate)
        cameraButton.setImage(tintedImageCa, for: .normal)
        cameraButton.contentMode = .center
        cameraButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let barButtonCA = UIBarButtonItem(customView: cameraButton)
        cameraButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
        }
        cameraButton.tintColor = .black
        tabBarController?.navigationItem.leftBarButtonItem = barButtonCA
        tabBarController?.navigationItem.rightBarButtonItems = [barButton,barButtonIG]
    }
}
extension MainFeedVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == MaincellType.storyCell.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
            cell.userArray = userArray
            //cell.collectionReloadData(model: ProfileModel(profileType: .myProfile))
            return cell
        } else /*if indexPath.row == MaincellType.feedCell.rawValue */{
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.identifier, for: indexPath) as! FeedCell
            return cell
        }
    }
}
extension MainFeedVC : UITableViewDelegate {
    
}


//
//  HomeVC.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 24.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit
import SnapKit
import EasyTipView
class HomeVC: UIViewController {
    var tableView = UITableView()
    var easyTipView : EasyTipView!
    var model = ProfileModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}

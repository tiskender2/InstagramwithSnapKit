//
//  ProfileModel.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 25.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
struct ProfileModel {
    var profileType:profileEnum?
    var imageName:String?
    var postCount:String?
    var followerCount:String?
    var followingCount:String?
    var name:String?
    var username:String?
    var bio:String?
}
enum profileEnum : Int {
    case myProfile = 0
    case followingProfile
    case othersProfile
}

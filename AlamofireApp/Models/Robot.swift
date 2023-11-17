//
//  Robots.swift
//  AlamofireApp
//
//  Created by Татьяна Дубова on 17.11.2023.
//

import Foundation

struct Robot {
    let firstName: String
    let lastName: String
    let avatar: String
    let title: Title
    
    init(firstName: String, lastName: String, avatar: String, title: Title) {
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
        self.title = title
    }
    
    init(robotData: [String: Any]) {
        firstName = robotData["first_name"] as? String ?? ""
        lastName = robotData["last_name"] as? String ?? ""
        avatar = robotData["avatar"] as? String ?? ""
        
        let titleForRobot = robotData["employment"] as? [String: String]
        title = Title(robotData: titleForRobot ?? [:])
    }
    
    static func getRobots(from value: Any) -> [Robot] {
        guard let robotsData = value as? [[String: Any]] else { return [] }
        return robotsData.compactMap { Robot(robotData: $0) }
    }
}

struct Title {
    var title: String
    
    init(robotData: [String: String]) {
        title = robotData["title"] ?? ""
    }
}



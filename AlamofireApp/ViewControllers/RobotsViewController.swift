//
//  RobotsViewController.swift
//  AlamofireApp
//
//  Created by Татьяна Дубова on 17.11.2023.
//

import UIKit
import Alamofire

final class RobotsViewController: UITableViewController {

    private var robots: [Robot] = []
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        fetchRobots()
    }
    
    private func fetchRobots() {
        networkManager.fetchRobots(form: Link.robotURL.url) { result in
            switch result {
            case .success(let robots):
                self.robots = robots
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension RobotsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        robots.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? RobotCell else { return UITableViewCell() }
        let robot = robots[indexPath.row]
        cell.configure(with: robot)
        return cell
    }
}



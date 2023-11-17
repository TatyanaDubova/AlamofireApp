//
//  NetworkManager.swift
//  AlamofireApp
//
//  Created by Татьяна Дубова on 17.11.2023.
//

import Foundation
import Alamofire

enum Link {
    case robotURL
    
    var url: URL {
        switch self {
        case .robotURL:
            return URL(string: "https://random-data-api.com/api/v2/users?size=100&is_xml=true")!
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchRobots(form url: URL, completion: @escaping(Result<[Robot], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let robots = Robot.getRobots(from: value)
                    completion(.success(robots))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchData(from url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let imageData):
                    completion(.success(imageData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}


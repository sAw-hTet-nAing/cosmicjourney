//
//  Api_service.swift
//  planets
//
//  Created by Saw Htet Naing on 05/10/2023.
//

import Foundation
import Alamofire


class ApiService{
    

func fetchPlanets(completion: @escaping (Result<PlanetModel, Error>) -> Void) {
   

      AF.request(ApiRoutes.base_url,method: HTTPMethod(rawValue: "GET")).validate().responseDecodable(of: PlanetModel.self) { response in
            switch response.result {
            case .success(let planets):
                completion(.success(planets))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    
}

//
//  NetworkManager.swift
//  MusicSearch
//
//  Created by ANSAR DAULETBAYEV on 08.07.2023.
//

import Foundation

class NetworkManager {
    private let baseURL = "https://itunes.apple.com/search"
    
    func fetchMusic(for term: String, completion: @escaping ([ItunesMusic]?) -> Void) {
        guard let url = URL(string: "\(baseURL)?term=\(term)&limit=25") else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil)
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(ItunesResponse.self, from: data)
                completion(decodedResponse.results)
            } catch {
                print("Failed to decode: \(error)")
                completion(nil)
            }
        }
        
        task.resume()
    }
}

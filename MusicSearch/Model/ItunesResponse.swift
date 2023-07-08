//
//  ItunesResponse.swift
//  MusicSearch
//
//  Created by ANSAR DAULETBAYEV on 08.07.2023.
//

import Foundation

struct ItunesResponse: Codable {
    let resultCount: Int
    let results: [ItunesMusic]
}

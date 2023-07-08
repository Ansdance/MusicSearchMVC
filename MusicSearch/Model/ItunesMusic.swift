//
//  ItunesMusic.swift
//  MusicSearch
//
//  Created by ANSAR DAULETBAYEV on 08.07.2023.
//

import Foundation

struct ItunesMusic: Codable {
    let artistName: String
    let trackName: String?
    let artworkUrl100: String
    let previewUrl: String?
}

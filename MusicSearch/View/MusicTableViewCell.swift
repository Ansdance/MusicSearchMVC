//
//  MusicTableViewCell.swift
//  MusicSearch
//
//  Created by ANSAR DAULETBAYEV on 08.07.2023.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    @IBOutlet weak var artistNameLabel: UILabel!
    
    @IBOutlet weak var songNameLabel: UILabel!
    
    @IBOutlet weak var albomImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(music: ItunesMusic) {
        artistNameLabel.text = music.artistName
        songNameLabel.text = music.trackName
        
        if let imageUrl = URL(string: music.artworkUrl100) {
            URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.albomImage.image = UIImage(data: data)
                }
            }.resume()
        }
    }
}

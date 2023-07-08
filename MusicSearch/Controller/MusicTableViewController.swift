//
//  MusicTableViewController.swift
//  MusicSearch
//
//  Created by ANSAR DAULETBAYEV on 08.07.2023.
//

import UIKit

class MusicTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var musicSearchBar: UISearchBar!
    
    
    var networkManager = NetworkManager()
    var musicData: [ItunesMusic] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicSearchBar.delegate = self
        musicSearchBar.placeholder = "Search artist"
        
        fetchMusic(term: "eminem")
    }
    
    func fetchMusic(term: String) {
        networkManager.fetchMusic(for: term) { [weak self] (music) in
            guard let music = music else { return }
            DispatchQueue.main.async {
                self?.musicData = music
                self?.tableView.reloadData()
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        fetchMusic(term: searchTerm)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicTableViewCell", for: indexPath) as! MusicTableViewCell
        
        cell.setData(music: musicData[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 162.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        vc.music = musicData[indexPath.row]
        
        navigationController?.show(vc, sender: self)
    }
    
}

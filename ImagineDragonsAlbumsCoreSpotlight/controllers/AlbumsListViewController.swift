//
//  AlbumsListViewController.swift
//  ImagineDragonsAlbumsCoreSpotlight

import UIKit

class AlbumsListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let nib = UINib(nibName: String(describing: AlbumViewCell.self), bundle: Bundle.main)
            tableView.register(nib, forCellReuseIdentifier: String(describing: AlbumViewCell.self))
            
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    private var selectedIndex: Int!
    
    let model = AlbumsListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Albums"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        if identifier == "ShowAlbumDetails" {
            guard let vc = segue.destination as?  AlbumDetailViewController else { return }
            
            let album = model.albums[selectedIndex]
            let dataiModel = AlbumDetailModel(with: album)
            
            vc.model = dataiModel
        }
    }
}

extension AlbumsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AlbumViewCell.self), for: indexPath) as! AlbumViewCell
        
        let index = indexPath.row
        let album = model.albums[index]
        cell.setup(with: album)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.selectedIndex = indexPath.row
        
        self.performSegue(withIdentifier: "ShowAlbumDetails", sender: "nil")
    }
}

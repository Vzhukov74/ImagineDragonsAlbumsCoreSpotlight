//
//  AlbumDetailViewController.swift
//  ImagineDragonsAlbumsCoreSpotlight
import UIKit

class AlbumDetailViewController: UIViewController {
    @IBOutlet private weak var coverImageView: UIImageView! {
        didSet {
            coverImageView.layer.cornerRadius = 4
            coverImageView.clipsToBounds = true
        }
    }
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var datailLabel: UILabel!
    
    var model: AlbumDetailModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Album"
        
        setup()
    }
    
    private func setup() {
        coverImageView.image = model.album.image
        titleLabel.text = model.album.name
        releaseDateLabel.text = model.album.releaseDate
        datailLabel.text = model.album.description
    }
}

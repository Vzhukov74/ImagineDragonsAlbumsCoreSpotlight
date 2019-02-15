//
//  AlbumViewCell.swift
//  ImagineDragonsAlbumsCoreSpotlight

import UIKit

class AlbumViewCell: UITableViewCell {
    @IBOutlet private weak var coverImageView: UIImageView! {
        didSet {
            coverImageView.layer.cornerRadius = 4
            coverImageView.clipsToBounds = true
        }
    }
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    
    func setup(with album: IDAlbum) {
        coverImageView.image = album.image
        titleLabel.text = album.name
        releaseDateLabel.text = album.releaseDate
    }
}

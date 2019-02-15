//
//  AlbumsListModel.swift
//  ImagineDragonsAlbumsCoreSpotlight

import Foundation

class AlbumsListModel {
    let albums: [IDAlbum]
    
    init() {
        self.albums = IDAlbums.biuld()
    }
}

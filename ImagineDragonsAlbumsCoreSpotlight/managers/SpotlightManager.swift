//
//  SpotlightManager.swift
//  ImagineDragonsAlbumsCoreSpotlight

import Foundation
import CoreSpotlight
import MobileCoreServices

class SpotlightManager {
    class func setupSpotlight(with albums: [IDAlbum], and domainIdentifier: String) {
        var searchableItems = [CSSearchableItem]()
        
        CSSearchableIndex.default().deleteSearchableItems(withDomainIdentifiers: [domainIdentifier], completionHandler: nil)
        
        albums.forEach {
            let searchableItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            searchableItemAttributeSet.title = $0.name
            searchableItemAttributeSet.contentDescription = $0.releaseDate
            searchableItemAttributeSet.thumbnailURL = $0.cover
            
            let keywords = [$0.name]
            searchableItemAttributeSet.keywords = keywords
            
            let id = $0.id
            let item = CSSearchableItem(uniqueIdentifier: "imagineDragonsAlbumsCoreSpotlight.\(id)", domainIdentifier: domainIdentifier, attributeSet: searchableItemAttributeSet)
            searchableItems.append(item)
        }
        
        CSSearchableIndex.default().indexSearchableItems(searchableItems, completionHandler: { print($0?.localizedDescription ?? "") })
    }
}

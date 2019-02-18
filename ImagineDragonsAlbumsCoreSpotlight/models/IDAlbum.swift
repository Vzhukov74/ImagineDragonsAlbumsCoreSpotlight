//
//  IDAlbum.swift
//  ImagineDragonsAlbumsCoreSpotlight

import UIKit

class IDAlbums {
    static func biuld() -> [IDAlbum] {
        return [
            IDAlbum(id: 1, name: "Night Visions", cover: Bundle.main.url(forResource: "NightVisions", withExtension: "jpeg")!, releaseDate: "September 4, 2012", description: "Night Visions is the debut studio album by American rock band Imagine Dragons. It was released on September 4, 2012, through Kidinakorner and Interscope Records. The extended track was released on February 12, 2013, adding three more songs and the UK release of the album was on March 26, 2013. Recorded between 2010 and 2012, the album was primarily produced by the band themselves, as well as English hip-hop producer Alex da Kid and Brandon Darner from the American indie rock group The Envy Corps. It was mastered by Joe LaPorta. According to frontman Dan Reynolds, the album took three years to finish,[6] with six of the album's tracks being previously released on multiple EPs. Musically, Night Visions exhibits influences of folk, hip hop and pop"),
            IDAlbum(id: 2, name: "Smoke + Mirrors", cover: Bundle.main.url(forResource: "Smoke+Mirrors", withExtension: "png")!, releaseDate: "February 17, 2015", description: "Smoke + Mirrors is the second studio album by American rock band Imagine Dragons. The album was recorded during 2014 at the band's home studio in Las Vegas, Nevada. Self-produced by members of the band along with English hip-hop producer Alexander Grant, known by his moniker Alex da Kid, the album was released by Interscope Records and Grant's KIDinaKORNER label on February 17, 2015, in the United States."),
            IDAlbum(id: 3, name: "Evolve", cover: Bundle.main.url(forResource: "Evolve", withExtension: "jpg")!, releaseDate: "June 23, 2017", description: "Evolve (stylized as ƎVOLVE) is the third studio album by American rock band Imagine Dragons, released on June 23, 2017 by Kidinakorner and Interscope Records. After the release of their previous album Smoke + Mirrors (2015) and its respective world tour, a self-imposed hiatus for 2016 and cryptic messages from the band through their social media gained anticipation for their third album; it was finally announced on May 9, 2017, along with the initiation of its pre-order. In comparison to Smoke + Mirrors and their 2012 debut Night Visions, frontman Dan Reynolds called the album an \"evolution\" for the band."),
            IDAlbum(id: 4, name: "Origins ", cover: Bundle.main.url(forResource: "Origins", withExtension: "png")!, releaseDate: "November 9, 2018", description: """
            Origins is the fourth studio album by the American pop rock band Imagine Dragons, released on November 9, 2018 by Kidinakorner, Polydor Records[1] and Interscope Records.
            
            The album was produced by the band members themselves, frequent collaborator Alex da Kid, Mattman & Robin, John Hill, Joel Little, Tim Randolph, and Jayson DeZuzio, who produced a majority of the band's previous effort, Evolve (2017), as well as Jorgen Odegard. Frontman Dan Reynolds described Origins as a "sister album" to Evolve, and that it would complete a cycle of their music.
            
            Origins has received generally mixed reviews from critics, but many claimed that the album is an improvement from their previous work Evolve. The album was preceded by four singles: "Natural", "Zero", "Machine", and "Bad Liar".
            """)
        ]
    }
}

struct IDAlbum {
    let id: Int
    let name: String
    let cover: URL
    let releaseDate: String
    let description: String
}

extension IDAlbum {
    var image: UIImage {
        // использовать Implicitly Unwrap нехорошо, но закроем на это глаза
        let data = try! Data(contentsOf: self.cover)
        return UIImage(data: data)!
    }
}

//
//  NeswableViewCellViewModel.swift
//  POC-MovieApp
//
//  Created by Auropriya Sinha on 20/09/22.
//

import Foundation


class NewsTableViewCellViewModel {
    let title : String
    let subtitle : String
    let imageURL : URL?
    var imageData : Data? = nil
    var publishedAt : String
    
    init(title : String, subtitle : String, imageURL : URL?, publishedAt : String) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
        self.publishedAt = publishedAt
    }
}

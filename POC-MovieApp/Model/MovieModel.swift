//
//  MovieModel.swift
//  POC-MovieApp
//
//  Created by Auropriya Sinha on 20/09/22.
//

import Foundation

struct APIResponse : Decodable {
    let articles : [Article]
}

struct Article : Decodable {
    let source : Source
    let title : String
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String
}

struct Source : Decodable {
    let name : String
}

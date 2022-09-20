//
//  NewsViewModel.swift
//  POC-MovieApp
//
//  Created by Auropriya Sinha on 20/09/22.
//

import Foundation
import UIKit

class NewsViewModel : NSObject {
    
    public var apiHandler : APIHandler?
    var bindNewsViewModelToController : (() -> ()) = {}
    var bindImageToController : (() -> ()) = {}
    private (set) var articles : [Article]! {
        didSet {
            self.bindNewsViewModelToController()
        }
    }
    
    override init() {
        super.init()
        apiHandler = APIHandler()
        callToGetNews()
    }
    
    func callToGetNews() {
        self.apiHandler?.getTopStories(completion: { result in
            switch result {
            case .success(let articles) :
                self.articles = articles
            case .failure(_) :
                fatalError()
            }
        })
    }
    
    func searchedNews(query : String) {
        self.apiHandler?.search(query: query, completion: { result in
            switch result {
            case .success(let articles) :
                self.articles = articles
            case .failure(_) :
                fatalError()
            }
        })
    }
    
    func cancelSearch(bufferArray : [Article]) {
        self.articles = bufferArray
    }
}

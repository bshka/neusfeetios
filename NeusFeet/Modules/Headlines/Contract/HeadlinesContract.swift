//
//  HeadlinesContract.swift
//  NeusFeet
//
//  Created by Dzmitry Halauko on 8/1/19.
//  Copyright © 2019 Dzmitry Halauko. All rights reserved.
//

import UIKit

protocol HeadlinesView {
    var presenter: HeadlinesPresentation! { get set }
    
    func showNoContentScreen()
    func showHeadlinesData()
}

protocol HeadlinesPresentation: class {
    var view: HeadlinesView? { get set }
    var interactor: HeadlinesInteractor! { get set }
    var router: HeadlinesWireframe! { get set }
    
    func viewDidLoad()
    func didSelectArticle(_ article: Article)
}

protocol HeadlinesInteractor {
    var output: HeadlinesInteractorOutput! { get set }
    
    func fetchHeadlines()
}

protocol HeadlinesInteractorOutput: class {
    func headlinesFetched(_ articles: [Article])
    func headlinesFetchFailed()
}

protocol HeadlinesWireframe: class {
    var viewController: UIViewController? { get set }
    
    func presentDetails(forArticle article: Article)
    
    static func assembleModule() -> UIViewController
}

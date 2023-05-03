//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by eun-ji on 2023/05/03.
//

import UIKit

class RMEpisodeDetailViewController: UIViewController {

    private let url: URL?
    
    
    init(url: URL?) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Episode"
        view.backgroundColor = .systemGreen
    }
    


}

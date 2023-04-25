//
//  SearchTableViewCell.swift
//  SearchBook
//
//  Created by eun-ji on 2023/04/24.
//

import UIKit
import Kingfisher

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var searchTitleLabel: UILabel!
    @IBOutlet weak var searchAuthorLabel: UILabel!
    
    
    func configure(with item: Item) {
        let imageURL = URL(string: item.image ?? "")
        searchImageView.kf.setImage(with: imageURL)
        searchTitleLabel.text = item.title ?? "No title"
        searchAuthorLabel.text = item.author ?? "No author"
    }
}

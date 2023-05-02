//
//  Extensions.swift
//  RickAndMorty
//
//  Created by eun-ji on 2023/05/01.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

//
//  HistoryTableViewCell.swift
//  SearchBook
//
//  Created by eun-ji on 2023/04/24.
//

import UIKit

protocol HistoryTableViewCellDelegate: AnyObject {
    func didTapdeleteButton(with indexPath: Int)
}

//protocol HistoryViewControllerDelegate: AnyObject {
//    func request(from keyword: String?)
//}

class HistoryTableViewCell: UITableViewCell {
    
    private var removeIndex: Int = 1
    weak var delegate: HistoryTableViewCellDelegate?
//    weak var delegate2: HistoryViewControllerDelegate?
    @IBOutlet weak var historyLabel: UILabel!
    
//
//    func requestSearch() {
//        delegate2?.request(from: historyLabel.text)
//    }
//

    func configure(with index: Int) {
        removeIndex = index
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        delegate?.didTapdeleteButton(with: removeIndex)
    }
    

}

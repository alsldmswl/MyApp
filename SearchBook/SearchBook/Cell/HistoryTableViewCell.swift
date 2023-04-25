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

class HistoryTableViewCell: UITableViewCell {
    
    private var removeIndex: Int = 1
    weak var delegate: HistoryTableViewCellDelegate?
    @IBOutlet weak var historyLabel: UILabel!
    

    func configure(with index: Int) {
        removeIndex = index
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        delegate?.didTapdeleteButton(with: removeIndex)
    }
    

}

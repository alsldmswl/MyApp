//
//  HistoryViewController.swift
//  SearchBook
//
//  Created by eun-ji on 2023/04/24.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController {
   
   
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var searchBook = [SearchBook]()
    
    @IBOutlet weak var HistoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        HistoryTableView.dataSource = self
        HistoryTableView.delegate = self
    }

}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

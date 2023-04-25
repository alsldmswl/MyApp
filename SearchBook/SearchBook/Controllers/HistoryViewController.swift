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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchTerm()
        HistoryTableView.reloadData()
        
    }
    
    func fetchTerm() {
        let fetchRequest: NSFetchRequest<SearchBook> = SearchBook.fetchRequest()
        do {
            self.searchBook = try context.fetch(fetchRequest)
            searchBook.sorted(by: {$0.date?.compare($1.date ?? Date()) == .orderedDescending})
//            HistoryTableView.reloadData()
        } catch {
            print(error)
        }
    }

}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchBook.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell") as! HistoryTableViewCell
        cell.historyLabel.text = searchBook[indexPath.row].term
        cell.configure(with: indexPath.row)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

extension HistoryViewController: HistoryTableViewCellDelegate {
    func didTapdeleteButton(with indexPath: Int) {
        context.delete(searchBook[indexPath])
        
        do {
            try context.save()
        } catch {
            print("delete error")
        }
        fetchTerm()
        HistoryTableView.reloadData()
    }
    
    
}

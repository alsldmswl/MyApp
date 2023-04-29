//
//  HistoryViewController.swift
//  SearchBook
//
//  Created by eun-ji on 2023/04/24.
//

import UIKit
import CoreData
import Alamofire

class HistoryViewController: UIViewController {
   
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var searchBook = [SearchBook]()
//    var book: Book?

    
    
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
    
//    func request(from keyword: String?) {
//        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json")
//        else {return}
//
//        let parameters = ["query" : keyword]
//        let headers: HTTPHeaders = [
//            "X-Naver-Client-Id" : "VCgI64Ba084th1VwaY3r",
//            "X-Naver-Client-Secret" : "N2Tq4LxJdq"
//        ]
//
//        AF.request(url, method: .get, parameters: parameters, headers: headers)
//            .responseJSON { response in
//                switch response.result {
//                case .success(let res):
//                    do {
//                        let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
//                        self.book = try JSONDecoder().decode(Book.self, from: jsonData)
//                        DispatchQueue.main.async {
//                            self.HistoryTableView.reloadData()
//                        }
//                    } catch(let error) {
//                        print("error:", error)
//                    }
//                case .failure(let error):
//                    print("---> \(error.localizedDescription)")
//                }
//            }
//            .resume()
//    }

    
    func fetchTerm() {
        let fetchRequest: NSFetchRequest<SearchBook> = SearchBook.fetchRequest()
        do {
            
            let sort = NSSortDescriptor(key: "date", ascending: false)
                    fetchRequest.sortDescriptors = [sort]
            self.searchBook = try context.fetch(fetchRequest)
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
        let searchVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchViewController") as! SearchViewController
        self.present(searchVC, animated: true)
        searchVC.request(from: searchBook[indexPath.row].term)
        searchVC.searchBar.text = searchBook[indexPath.row].term
        
    
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

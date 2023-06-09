//
//  ViewController.swift
//  SearchBook
//
//  Created by eun-ji on 2023/04/24.
//

import UIKit
import Alamofire
import CoreData

class SearchViewController: UIViewController {

    var searchBook: SearchBook?
    var book: Book?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
    }
    
    func saveTerm(with term: String) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "SearchBook", in: context) else { return }
        guard let object = NSManagedObject(entity: entityDescription, insertInto: context) as? SearchBook else { return }
            object.setValue(term, forKey: "term")
            object.setValue(Date(), forKey: "date")
            appDelegate.saveContext()     
    }
    
 
    
    func request(from keyword: String?) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json")
        else {return}
        
        let parameters = ["query" : keyword, "display" : "100"]
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id" : "VCgI64Ba084th1VwaY3r",
            "X-Naver-Client-Secret" : "N2Tq4LxJdq"
        ]
        
        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .responseJSON {response in
                switch response.result {
                case .success(let res):
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
                        self.book = try JSONDecoder().decode(Book.self, from: jsonData)
                        DispatchQueue.main.async {
                            self.searchTableView.reloadData()
                        }
                    } catch(let error) {
                        print("error:", error)
                    }
                case .failure(let error):
                    print("---> \(error.localizedDescription)")
                }
            }
            .resume()
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return book?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        if let item = book?.items[indexPath.row] {
            cell.configure(with: item)
        }
       return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "WebViewController") as! WebViewController
        self.present(detailVC, animated: true)
        
        let bookLink = URLComponents(string: book?.items[indexPath.row].link ?? "")
        guard let url = bookLink?.url else {return}
        let request = URLRequest(url: url)
        detailVC.webView.loadRequest(request)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            if searchText == "" {
                self.view.endEditing(true)
            }else {
                self.request(from: searchText)
                self.saveTerm(with: searchText)
            }
        }
        self.view.endEditing(true)
    }
}

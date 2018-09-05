//
//  ViewController.swift
//  KindleAppRemake
//
//  Created by Anthony Aoun on 2018-04-14.
//  Copyright © 2018 Anthony Aoun. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var books: [Book]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellId")
        tableView.tableFooterView = UIView()
        
        navigationItem.title = "Kindle Remake"
        
        setupBooks()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let unwrappedBookCount = books?.count else {
            return 0
        }
        return unwrappedBookCount
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        let book = books?[indexPath.row]
        
        cell.textLabel?.text = book?.title
        cell.imageView?.image = book?.image
        
        return cell
    }
    
    func setupBooks(){
        
        let page1 = Page(number: 1, text: "this is the first page text")
        let page2 = Page(number: 2, text: "this is the second page text")
        
        let pages1 = [page1, page2]
        let book = Book(title: "Steve Jobs", author: "Waler Thomas", image: #imageLiteral(resourceName: "steve_jobs"), pages: pages1)
        
        let book2 = Book(title: "Bill Gates: A Biography", author: "Michael Becraft", image: #imageLiteral(resourceName: "bill_gates"), pages: [
            Page(number: 1, text: "Text for page 1"),
            Page(number: 2, text: "Text for page 2"),
            Page(number: 3, text: "Text for page 3"),
            Page(number: 4, text: "Text for page 4"),
            Page(number: 5, text: "Text for page 4"),
            Page(number: 6, text: "Text for page 5")
            ])
        
        self.books = [book, book2]
        
      
    }
}


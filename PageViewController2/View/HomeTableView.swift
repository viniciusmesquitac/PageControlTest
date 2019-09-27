//
//  HomeTableView.swift
//  PageViewController2
//
//  Created by aluno on 18/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit

struct Book: Decodable{
    
    let results: [BookResult]?
    
    enum BukKeys: String, CodingKey {
        case results = "results"
    }
}


struct BookResult: Decodable {
    let title: String
    let description: String?
    let author: String
}


enum Route {
    static var inferno: String {
        return "https://api.nytimes.com/svc/books/v3/reviews.json?title=Inferno&api-key=Zb1nP6AQFHLwVFSutOFSSpOxZCTp8QkJ"
    }
    
    static var best_sellers: String{
        return "https://api.nytimes.com/svc/books/v3/lists/best-sellers.json?&api-key=Zb1nP6AQFHLwVFSutOFSSpOxZCTp8QkJ"
    }
    
    static var romance: String{
        return "https://api.nytimes.com/svc/books/v3/lists/current/romance.json?&api-key=Zb1nP6AQFHLwVFSutOFSSpOxZCTp8QkJ"
    }
}


class HomeTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    override func awakeFromNib() {
        delegate = self
        dataSource = self
    }
    let cellId = "cellTable"
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = PaddingLabel()
        
        if(section == 0) {
            label.text = "Today"
            label.backgroundColor = .white
            label.textColor = .black
            return label
        }
        else if (section == 1) {
            label.text = "Yesterday"
            label.backgroundColor = .white
            label.textColor = .black
            return label
        }
        label.text = "Other day"
        
        label.backgroundColor = .white
        label.textColor = .black
        return label
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        return cell
    }
    
  
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

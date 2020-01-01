//
//  DrawView.swift
//  ProtocolBasedSections
//
//  Created by rakesh karapu on 31/12/19.
//  Copyright © 2019 rakesh karapu. All rights reserved.
//

import UIKit
//https://medium.com/ios-os-x-development/protocol-oriented-uitableviewcells-6efa7ef8c45b
//https://academy.realm.io/posts/doios-natasha-murashev-protocol-oriented-mvvm/
//https://basememara.com/protocol-oriented-tableview-collectionview/
//https://medium.com/@lawrey/swift-protocol-oriented-programming-pop-2-bca620147c96\
//https://github.com/kemalekren/Sample-Custom-TableView-Project-

class DrawView: UIView,UITableViewDataSource,UITableViewDelegate {
    

    var items: [String] = ["One", "Two", "Three"]
        

    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView,
      titleForHeaderInSection section: Int) -> String? {
      return "Title"//"sections[section].title"
    }
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count //sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! DropdownListTableViewCell

        cell.titleLabel.text = "Hello"
        cell.arrowImageTitle = "download"
       // cell.setImagetitle(imageName: "download")
        return cell
        
    }

    
}


protocol TitlePresentable  {
    var titleLabel: UILabel! { get set }
    func setTitle(title: String?)
}

extension TitlePresentable {
    
    func setTitle(title: String?) {
        titleLabel.text = title
    }

}

protocol DropdownListPresentable {
    var arrowImageTitle: String! { get }
    var dlistElements: [String] { get set }
    func setListElements(listArray: [String]?)
}

 
extension DropdownListPresentable {
    
    var arrowImageTitle : String {
        return "download"
    }
    
    var dlistElements : [String] {
        return ["one","two","three"]
    }
    
    mutating func setListElements(listArray:[String?]) {
        dlistElements = listArray as! [String]
    }

}

protocol SwitchPresentable {
    var switchOn: Bool { get }
    func onSwitchToggleOn(on: Bool)
}


//With the help of above two protocols we can make a cell which contains title with dropdownlist

class DropdownListTableViewCell: UITableViewCell, TitlePresentable,DropdownListPresentable {

    var titleLabel: UILabel!
    
    var arrowImageTitle: String!
    
    var dlistElements: [String] = []
    
    
    func setListElements(listArray: [String]?) {
        dlistElements = listArray!
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 20, y: 10, width: 100, height: 50)
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .left
        addSubview(titleLabel)
        
        let arrowImageView = UIImageView(image: UIImage(named: arrowImageTitle))
        arrowImageView.frame = CGRect(x: 120, y: 10, width: 40, height: 40)
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.clipsToBounds = true
        arrowImageView.backgroundColor = .red
        addSubview(arrowImageView)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SwitchWithTextTableViewCell<T>: UITableViewCell where T: TitlePresentable, T: SwitchPresentable {
    private var delegate: T?
    
    func configure(withDelegate delegate: T) {
        // Configure views here
    }
}



enum Sections: Int {
    case DBSection
    case NetworkSection
}

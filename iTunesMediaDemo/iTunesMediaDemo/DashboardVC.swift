//
//  DashboardVC.swift
//  iTunesMediaDemo
//
//  Created by Ashutosh's Macbook on 1/9/20.
//  Copyright © 2020 Ashutosh's Macbook. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var viewTopBar:UIView = UIView()
    var lblTitle:UILabel = UILabel()
    var tblViewInfo:UITableView = UITableView()
    var arrFeeds:[[AnyHashable:Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.createTopBar()
        self.createTableBar()
        self.getDataToLoad()
    }
    
    // Mark: - Top bar
    func createTopBar() {
        let heightToUse:CGFloat = 60.0
        viewTopBar = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: heightToUse))
        viewTopBar.backgroundColor = UIColor.white
        viewTopBar.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Title Label
        lblTitle.text = "Itunes Music"
        lblTitle.font = UIFont(name: "Helvetica-Bold", size: 18)
        lblTitle.numberOfLines = 0
        lblTitle.sizeToFit()
        lblTitle.center = viewTopBar.center
        lblTitle.textAlignment = .center
        lblTitle.backgroundColor = UIColor.white
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        viewTopBar.addSubview(lblTitle)
        
        // Right Button
        let button:UIButton = UIButton(frame: CGRect(x: viewTopBar.frame.width-135, y: 0, width: 125, height: 40))
        button.backgroundColor = .white
        button.setTitle("Change Type", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .focused)
        button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        viewTopBar.addSubview(button)
        

        self.view.addSubview(viewTopBar)

        // Set constraints
        NSLayoutConstraint.activate([
            
            viewTopBar.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            viewTopBar.heightAnchor.constraint(equalToConstant: heightToUse),
            viewTopBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            viewTopBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),

            viewTopBar.widthAnchor.constraint(equalToConstant: 125),
            button.centerYAnchor.constraint(equalTo: viewTopBar.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: viewTopBar.trailingAnchor, constant: -15),

            lblTitle.centerXAnchor.constraint(equalTo: viewTopBar.centerXAnchor),
            lblTitle.centerYAnchor.constraint(equalTo: viewTopBar.centerYAnchor),
        ])

    }
    
    @objc func buttonClicked() {
        print("Button Clicked")
    }


    // Mark: - TableView
    func createTableBar() {
        let heightToUse = self.view.frame.height - viewTopBar.frame.maxY
        
        tblViewInfo = UITableView(frame: CGRect(x: 0, y: viewTopBar.frame.maxY, width: self.view.frame.width, height: heightToUse))
        tblViewInfo.register(MediaCell.self, forCellReuseIdentifier: "MediaCell")
        tblViewInfo.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        tblViewInfo.translatesAutoresizingMaskIntoConstraints = false
        tblViewInfo.tableFooterView = UIView()
        tblViewInfo.allowsSelection = false
        tblViewInfo.dataSource = self
        tblViewInfo.delegate = self
        self.view.addSubview(tblViewInfo)
        
        NSLayoutConstraint.activate([
            tblViewInfo.topAnchor.constraint(equalTo: viewTopBar.bottomAnchor),
            tblViewInfo.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tblViewInfo.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            tblViewInfo.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])

    }
    
    // Mark: - Get data to load
    func getDataToLoad() {
        AppDelegate.getDelegate().showActivityIndicator()
        
        APIManager().fetchMediaFromServer(requestParameter: "", completion: { (APIResponse) in
            if (APIResponse.response != nil) {
                print(APIResponse.response ?? "")
                let dictResponse : [AnyHashable:Any] = APIResponse.response as! [AnyHashable : Any]
                print("The response dict is :- \(dictResponse)")
                if let arr:[[AnyHashable:Any]] = dictResponse["results"] as? [[AnyHashable:Any]] {
                    self.arrFeeds = arr
                    self.tblViewInfo.reloadData()
                }
            } else {
                print(APIResponse.message ?? "")
            }
            AppDelegate.getDelegate().hideActivityIndicator()
        })

    }

    // Mark: - Table View Data source and Delegates
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFeeds.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdendifier: String = "MediaCell"

        let cell: MediaCell = tableView.dequeueReusableCell(withIdentifier: cellIdendifier, for: indexPath) as! MediaCell

        cell.backgroundColor = UIColor.white
        cell.separatorInset = UIEdgeInsets.init(top: 10, left: 20, bottom: 10, right: 10)

        cell.lblTitle.text = arrFeeds[indexPath.row]["name"] as? String
        cell.lblMediaType.text = "apple-music"
        cell.imgViewMedia.image = UIImage.init(named: "ashu.png")
        
        let url:URL = URL.init(string: arrFeeds[indexPath.row]["artworkUrl100"] as! String)!
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                cell.imgViewMedia.image = UIImage(data: data)
            }
        }

        cell.separatorInset = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }


}

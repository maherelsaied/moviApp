//
//  AllMovieCollection.swift
//  MoviApp
//
//  Created by Maher on 12/5/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit

class AllMovieCollection: UIViewController {
    
    var oldOpenCell : IndexPath?
    var newOpenCell : IndexPath?{
        didSet{
            oldOpenCell = oldValue
        }
    }
    
    
    @IBOutlet weak var allMovieTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        allMovieTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        allMovieTableView.delegate = self
        allMovieTableView.dataSource = self
        
    }
    
}

extension AllMovieCollection : UITableViewDataSource , UITableViewDelegate{
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allMovieTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        if newOpenCell == indexPath {
            cell.movieCollection.isHidden = false
            cell.collectionConstrain.constant = 200
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
        return cell
    }
    
    
   
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = allMovieTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        if self.newOpenCell == indexPath {
            self.newOpenCell = nil
        }else{
            self.newOpenCell = indexPath
        }
        tableView.reloadRows(at: [indexPath], with: .fade)
        if let oldCell = oldOpenCell {
            cell.movieCollection.isHidden = true
            cell.collectionConstrain.constant = 0
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
            tableView.reloadRows(at: [oldCell], with: .fade)
        }
   
    }
    
    
}

//
//  moviCollection.swift
//  AppStore
//
//  Created by Maher on 9/26/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit



class moviCollection: UIViewController  {
    
    var numberOfRow : Int?
    var id = [Int]()
    var selfid : Int!
    
    @IBOutlet weak var collectionview: UICollectionView!

    var isloading : Bool = false
    var last_page = 1
    var current_page = 1
   
    lazy var refresher : UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(uploadtasks), for: .valueChanged)
        return refresher
    }()

    var photoArr = [photos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.dataSource = self
        collectionview.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: nil, action: nil)
        let layout = self.collectionview.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width - 40 )/2, height: self.collectionview.frame.size.height/3)
        
        
        view.backgroundColor = .white
        collectionview.backgroundColor = .clear
        collectionview.alwaysBounceVertical = true
       // collectionview.register(UINib.init(nibName: cellident, bundle: nil), forCellWithReuseIdentifier: cellident)
        collectionview.addSubview(refresher)
        print(numberOfRow!)
        uploadtasks(index: numberOfRow!)

    }
    
    @objc private func uploadtasks( index : Int){
        self.refresher.endRefreshing()
        //  guard !isloading else{return}
        // self.isloading = true
        
        photoApi.getPhotos(index: index) { (Error:Error?, photo:[photos]?, last_page: Int) in
            if let ph = photo {
                self.photoArr = ph
                self.collectionview.reloadData()
                self.current_page = 1
                self.last_page = last_page
            }
          }
        }
    
        

    
    fileprivate func loadMore(index : Int){
        photoApi.getPhotos (index : index , page : current_page+1) { (Error:Error?, photo:[photos]?,last_page:Int) in
         
            if let ph = photo {
                self.photoArr.append(contentsOf: ph)
                self.collectionview.reloadData()
                self.current_page += 1
                self.last_page = last_page
            }
        }
    }
}


    extension moviCollection : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArr.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! moviCollectionCell
      
        cell.photo = photoArr[indexPath.item]
        self.id.append(cell.id!)
        cell.layer.cornerRadius = 20
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let count = self.photoArr.count
        if indexPath.row == count-1 {
            loadMore(index: numberOfRow!)
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        self.selfid = self.id[indexPath.row]
        performSegue(withIdentifier: "next", sender: self)
    
    }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier == "next"){
                let nextVc = segue.destination as! headercollectionView
                nextVc.translatedID = self.selfid
            }
        }
}

//
//  TableViewCell.swift
//  MoviApp
//
//  Created by Maher on 12/5/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
 

    @IBOutlet weak var moviSelectionOutlet: UIButton!
    @IBOutlet weak var movieCollection: UICollectionView!
    @IBOutlet weak var collectionConstrain: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        movieCollection.isHidden = true
        if movieCollection.isHidden{
            collectionConstrain.constant = 0
        }
        
        movieCollection.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        movieCollection.delegate = self
        movieCollection.dataSource = self
        let layout = movieCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: movieCollection.frame.size.width/3, height: 200)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
    }


 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
 
    var firstTouch = true
    @IBAction func viewCollectionOfMv(_ sender: UIButton) {
    
    }
    
    @IBAction func goMovieSelection(_ sender: Any) {
        
    }
  
    
}

extension TableViewCell : UICollectionViewDelegateFlowLayout , UICollectionViewDataSource{
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollection.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        return cell
    }

}

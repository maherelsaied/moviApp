//
//  collectionViewController.swift
//  MoviApp
//
//  Created by Maher on 12/4/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit

class collectionViewController: UIViewController {

    var isheiden = true
    @IBOutlet weak var topRatedCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if isheiden {
            topRatedCollection.alpha = 0
        }else{
            topRatedCollection.alpha = 1
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
        
    }
    
    @IBAction func topRatedAction(_ sender: UIButton) {
        self.isheiden = false
    }
    
    @IBAction func popularAction(_ sender: UIButton) {
    }
    
}
extension collectionViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    }
    
    
}

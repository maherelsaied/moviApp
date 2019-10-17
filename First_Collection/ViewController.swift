//
//  ViewController.swift
//  AppStore
//
//  Created by Maher on 9/15/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    let CellId = "cellid"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.white
        collectionView.register(catogeryCell.self, forCellWithReuseIdentifier: CellId)
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId, for: indexPath) as! catogeryCell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("maher \(indexPath.row)")
        restartApp()
     
    }
    
    
    // get socend view controller
    func restartApp(){
        guard let window = UIApplication.shared.keyWindow else{return}
        let sb = UIStoryboard(name: "Main", bundle: nil)
        var vc = UIViewController()
        //go to main screen
        vc = sb.instantiateViewController(withIdentifier: "socendCollection") as! moviCollection
        navigationController?.pushViewController(vc,animated: true)
        vc.title = "Best Movies"
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
        
        
    }
   
}









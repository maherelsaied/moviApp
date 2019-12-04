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
        
        let button = UIBarButtonItem(image: UIImage(named: "icon"), style: .done, target: self, action:nil)
            button.tintColor = .black
            navigationItem.rightBarButtonItem = button

        collectionView.backgroundColor = UIColor.white
        collectionView.register(catogeryCell.self, forCellWithReuseIdentifier: CellId)
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId, for: indexPath) as! catogeryCell
        if indexPath.row == 0 {
            cell.uploadtasks(index: 0)
            cell.namelabel.text = "Top Rated Movie"
            
        } else if indexPath.row == 1 {
            cell.uploadtasks(index: 1)
            cell.namelabel.text = "Popular Movie"
        } else if indexPath.row == 2 {
            cell.uploadtasks(index: 2)
            cell.namelabel.text = "Coming Soon"
        } else {
            cell.uploadtasks(index: 3)
            cell.namelabel.text = "Now Playing"
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        //go to main screen
        let vc = sb.instantiateViewController(withIdentifier: "socendCollection") as! moviCollection
        
        if indexPath.row == 0 {
            vc.title = "Top Rated"
            vc.numberOfRow = 0
        } else if indexPath.row == 1 {
            vc.title = "popular Movie"
            vc.numberOfRow = 1
        } else if indexPath.row == 2 {
            vc.title = "Coming Soon"
            vc.numberOfRow = 2
        } else if  indexPath.row == 3 {
            vc.title = "Now Playing"
            vc.numberOfRow = 3
        }
        
        navigationController?.pushViewController(vc,animated: true)
    }
    
     
 
 
    
    // get socend view controller
    func restartApp(index : Int){
        guard let window = UIApplication.shared.keyWindow else{return}
        let sb = UIStoryboard(name: "Main", bundle: nil)
        var vc = UIViewController()
        //go to main screen
        vc = sb.instantiateViewController(withIdentifier: "socendCollection") as! moviCollection
        if index == 0 {
            vc.title = "Top Rated"
           // vc.myindex = 1
        } else if index == 1 {
            vc.title = "popular Movie"
        } else if index == 2 {
            vc.title = "Coming Soon"
        } else if  index == 4 {
            vc.title = "Now Playing"
        }
        
        navigationController?.pushViewController(vc,animated: true)
       
        
        
        UIView.transition(with: window, duration: 0.5, options: .showHideTransitionViews , animations: nil, completion: nil)
        
        
    }
   
}









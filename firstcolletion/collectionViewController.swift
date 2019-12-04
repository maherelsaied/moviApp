//
//  collectionViewController.swift
//  MoviApp
//
//  Created by Maher on 12/4/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit

class collectionViewController: UIViewController {

    @IBOutlet weak var playingconstrain: NSLayoutConstraint!
    @IBOutlet weak var playingCollection: UICollectionView!
    @IBOutlet weak var comingConstain: NSLayoutConstraint!
    @IBOutlet weak var comingCollection: UICollectionView!
    @IBOutlet weak var popularconstrain: NSLayoutConstraint!
    @IBOutlet weak var popularCollection: UICollectionView!
    var photoArr = [photos]()
    var ids = [Int]()
    @IBOutlet weak var topConstrain: NSLayoutConstraint!
    @IBOutlet weak var topRatedCollection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    //    topRatedCollection.register(topRatedCell.self, forCellWithReuseIdentifier: "topRatedCell")
        topRatedCollection.delegate = self
        topRatedCollection.dataSource = self
        let layout = self.topRatedCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        
        ////////// socend collection////////
      //  popularCollection.register(topRatedCell.self, forCellWithReuseIdentifier: "topRatedCell")
        popularCollection.delegate = self
        popularCollection.dataSource = self
        let layout2 = self.popularCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout2.scrollDirection = .horizontal
        ////////// third collection///////
      //  comingCollection.register(topRatedCell.self, forCellWithReuseIdentifier: "topRatedCell")
        comingCollection.delegate = self
        comingCollection.dataSource = self
        let layout3 = self.comingCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout3.scrollDirection = .horizontal
        ///////////last collection////////
      //  playingCollection.register(topRatedCell.self, forCellWithReuseIdentifier: "topRatedCell")
        playingCollection.delegate = self
        playingCollection.dataSource = self
        let layout4 = self.playingCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout4.scrollDirection = .horizontal
        
        
        
        
        
    }
    func uploadtasks(index : Int){
        photoApi.getPhotos(index: index) { (Error:Error?, photo:[photos]?, last_page : Int) in
            if let ph = photo {
                self.photoArr = ph
                self.topRatedCollection.reloadData()
                self.comingCollection.reloadData()
                self.playingCollection.reloadData()
                self.popularCollection.reloadData()
            }
        }
    }
    
   
    var firstTouch = true
   
    
    @IBAction func topRatedAction(_ sender: UIButton) {
        if firstTouch {
                    firstTouch = false
                    uploadtasks(index: 0)
                    topConstrain.constant = 200
                    popularconstrain.constant = 0
                    comingConstain.constant = 0
                    playingconstrain.constant = 0
                    UIView.animate(withDuration: 0.3) {
                        self.view.layoutIfNeeded()
           }
            
        }else{
              firstTouch = true
              topConstrain.constant = 0
              UIView.animate(withDuration: 0.3) {
                  self.view.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func popularAction(_ sender: UIButton) {
        if firstTouch{
            firstTouch = true
            popularconstrain.constant = 200
            topConstrain.constant = 0
            comingConstain.constant = 0
            playingconstrain.constant = 0
            uploadtasks(index: 1)
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        }else{
            firstTouch = true
            popularconstrain.constant = 0
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
        
    }
    @IBAction func comingAction(_ sender: Any) {
        if firstTouch {
            firstTouch = false
        uploadtasks(index: 2)
            comingConstain.constant = 200
            popularconstrain.constant = 0
            topConstrain.constant = 0
            playingconstrain.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        }else{
            firstTouch = true
            comingConstain.constant = 0
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func playingAction(_ sender: Any) {
        
        if firstTouch{
          firstTouch = false
           uploadtasks(index: 3)
            playingconstrain.constant = 200
            popularconstrain.constant = 0
            topConstrain.constant = 0
            comingConstain.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        }else{
            firstTouch = true
            playingconstrain.constant = 0
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func goTopRelated(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "socendCollection") as! moviCollection
            vc.title = "Top Rated"
            vc.numberOfRow = 0
        navigationController?.pushViewController(vc,animated: true)
        
    }
    
    @IBAction func goPopular(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "socendCollection") as! moviCollection
        vc.title = "Top Rated"
        vc.numberOfRow = 1
        navigationController?.pushViewController(vc,animated: true)
    }
    
    @IBAction func goComing(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "socendCollection") as! moviCollection
        vc.title = "Top Rated"
        vc.numberOfRow = 2
        navigationController?.pushViewController(vc,animated: true)
    }
    
    @IBAction func goNowplaying(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "socendCollection") as! moviCollection
        vc.title = "Top Rated"
        vc.numberOfRow = 3
        navigationController?.pushViewController(vc,animated: true)
    }
    
    
    
    
    
    
    
}
extension collectionViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topRatedCell", for: indexPath) as! topRatedCell
            cell.photo = photoArr[indexPath.row]
            self.ids.append(cell.id!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
}

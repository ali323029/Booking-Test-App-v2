//
//  HomeController.swift
//  Booking Test App
//
//  Created by Geek on 16/06/2021.
//

import UIKit

class HomeController: UIViewController {
    
    
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var collectionViewSlider: UICollectionView!
    
    
    var imgSlider = [UIImage(named: "salon1"),UIImage(named: "salon2")]
//    var imageServices = [UIImage(named: "facial"),UIImage(named: "eyeliner"),UIImage(named: "eyelashes"),UIImage(named: "eyebrow"),UIImage(named: "Dermaplaning"),UIImage(named: "lips"),UIImage(named: "waxing"),UIImage(named: "HairCut")]

    
    var timer: Timer?
    var currentCellIndex = 0
    var designable = DesignableView()
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        
        
        
        pageController.numberOfPages = imgSlider.count
        pageController.currentPage = currentCellIndex

        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    }

    @objc func slideToNext(){

        if currentCellIndex<imgSlider.count
        {
            currentCellIndex = currentCellIndex + 1
            
        }else{
            currentCellIndex = 0
        }
        pageController.currentPage = currentCellIndex
        collectionViewSlider.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
    }

}

extension HomeController:UICollectionViewDelegate,UICollectionViewDataSource{
        // MARK: - UICollectionViewDataSource protocol
        
        // tell the collection view how many cells to make
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return imgSlider.count
        }
        
        // make a cell for each cell index path
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionView
            
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            cell.sliderimage.image = imgSlider[indexPath.row] // The row value is the same as the index of the desired text within the array.
            designable.ImageRoundCornor(imageview: cell.sliderimage, cRadius: 15)
            
            let size = collectionViewSlider.frame.size
            cell.sliderimage.frame = CGRect(x: 15, y: 5, width: size.width-30, height: 190)
            
//            cell.backgroundColor = UIColor.red // make cell more visible in our example project
    
            return cell

        }

}


extension HomeController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
                
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionViewSlider.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}



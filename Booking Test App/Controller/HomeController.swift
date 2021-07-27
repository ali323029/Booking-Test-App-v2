//
//  HomeServicesController.swift
//  Booking Test App
//
//  Created by Geek on 26/07/2021.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
   
    let servicesImages: [UIImage] = [
        UIImage(named: "facial")!,
        UIImage(named: "Dermaplaning")!,
        UIImage(named: "eyebrow")!,
        UIImage(named: "eyelashes")!,
        UIImage(named: "eyeliner")!,
        UIImage(named: "HairCut")!,
        UIImage(named: "HairExtension")!,
        UIImage(named: "lips")!,
        UIImage(named: "Makeup")!,
        UIImage(named: "Massage")!,
        UIImage(named: "waxing")!,
        UIImage(named: "menu")!
    ]
        
    let servicesNames:[String] = ["facial","Dermaplaning","eyebrow","eyelashes","eyeliner","HairCut","HairExtension","lips","Makeup","Massage","waxing","menu"]
    
    var imgSlider = [UIImage(named: "salon1"),UIImage(named: "salon2")]
    
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    
    @IBOutlet weak var homeSliderpageController: UIPageControl!
    
    
    var timer: Timer?
    var currentCellIndex = 0
    var designable = DesignableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
         navigationController?.navigationBar.barTintColor = UIColor.white
         self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
         self.navigationController?.navigationBar.shadowImage = UIImage()
         self.navigationController?.navigationBar.layoutIfNeeded()
         
        
        homeSliderpageController.numberOfPages = imgSlider.count
        homeSliderpageController.currentPage = currentCellIndex
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    }
    
    @objc func slideToNext(){

        if currentCellIndex<imgSlider.count
        {
            currentCellIndex = currentCellIndex + 1
            
        }else{
            currentCellIndex = 0
        }
        homeSliderpageController.currentPage = currentCellIndex
        sliderCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView == sliderCollectionView) {
            return self.imgSlider.count
        }
        
        return self.servicesNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == sliderCollectionView) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! HomeSliderCollectionViewCell
            
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            cell.homeSliderimage.image = imgSlider[indexPath.row] // The row value is the same as the index of the desired text within the array.
            designable.ImageRoundCornor(imageview: cell.homeSliderimage, cRadius: 15)
            
            let size = sliderCollectionView.frame.size
            cell.homeSliderimage.frame = CGRect(x: 15, y: 5, width: size.width-30, height: 190)
                    
            return cell
        }
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "servicesCell", for: indexPath as IndexPath) as! HomeServicesCollectionViewCell
        
        cell.homeServicesImage.image = servicesImages[indexPath.row]
        cell.homeServicesName.text = servicesNames[indexPath.row]
        
              return cell
    }
    
    
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           // handle tap events
           print("You selected cell #\(indexPath.item)!")
       }
    

   
}


extension HomeController: UICollectionViewDelegateFlowLayout{

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//
//
//        if(collectionView == sliderCollectionView)
//        {
//            return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        }
//
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

//        if(collectionView == collectionViewServices)
//        {
//            return CGSize(width: 80, height: 80)
//        }

        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)

    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
////
////        if(collectionView == collectionViewServices)
////        {
////            return 10
////        }
//
//        return 0.0
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
////
////        if(collectionView == collectionViewServices)
////        {
////            return 10
////        }
//
//        return 0.0
//    }
}




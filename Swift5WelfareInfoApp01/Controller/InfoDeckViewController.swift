//
//  InfoDeckViewController.swift
//  Swift5WelfareInfoApp01
//
//  Created by 中塚富士雄 on 2020/12/28.
//

import UIKit
import SegementSlide


class InfoDeckViewController: SegementSlideDefaultViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        reloadData()
//        scrollToSlide(at: 0, animated: true)
    }
    
//    override var headerView: UIView?{
//
//        let headerView = UIImageView()
//        headerView.isUserInteractionEnabled = true
//        headerView.contentMode = .scaleToFill
//        headerView.image = UIImage(named: "header")
//        headerView.translatesAutoresizingMaskIntoConstraints = false
//        let headerHeight:CGFloat
//        if #available(iOS 11.0, *){
//            headerHeight = view.bounds.height/4 +  view.safeAreaInsets.top
//        }else{
//            headerHeight = view.bounds.height/4 + topLayoutGuide.length
//        }
//
//        headerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
    override func segementSlideHeaderView() -> UIView? {
            let headerView = UIView()
            let headerView.translatesAutoresizingMaskIntoConstraints = false
            headerView.heightAnchor.constraint(equalToConstant: view.bounds.height/4).isActive = true
            return headerView
        }
    return headerView
        
        
        
    }
    
    
    override var titlesInSwitcher: [String] {
        
        return ["TOP","AbemaNews","Yahoo!!","IT","Buzz","CNN"]
        
    }
    
    
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        
        switch index{
            
        case 0:
            return Page1TableViewController()

        default:return Page1TableViewController()
            
        }

}
}

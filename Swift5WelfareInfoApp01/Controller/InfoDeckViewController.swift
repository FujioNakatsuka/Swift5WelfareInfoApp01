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

    }
 
    
    
    override func segementSlideHeaderView() -> UIView? {
            let headerView = UIView()
            headerView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.heightAnchor.constraint(equalToConstant: view.bounds.height/4).isActive = true
            return headerView
        
    }

    
    override var titlesInSwitcher: [String] {
        
        return ["TOP","AbemaNews","Yahoo!!","IT","Buzz","CNN"]
        
    }
    
    
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        
        switch index{
            
        case 0:
            return Page1ViewController()
            
        default:
            return Page1ViewController()
        }
        

}
}

//
//  InfoDeckViewController.swift
//  Swift5WelfareInfoApp01
//
//  Created by 中塚富士雄 on 2020/12/28.
//

import UIKit
import SegementSlide


class InfoDeckViewController: SegementSlideDefaultViewController {
    
    var nameArray = [String]()
    var urlArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.object(forKey: "nameArray") != nil{
            
            nameArray = UserDefaults.standard.object(forKey: "nameArray") as! [String]
        
//        reloadData()
//        defaultSelectedIndex = 0
    }
        //画像をTableViewの下に置く
        let image = UIImage(named: "header")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height:250))
    
            imageView.image = image
        self.view.addSubview(imageView)

//        view.backgroundColor = .black
        
//        print(nameArray.debugDescription)
        reloadData()
        defaultSelectedIndex = 0
    }
    
    override func segementSlideHeaderView() -> UIView? {
            let headerView = UIView()
            headerView.translatesAutoresizingMaskIntoConstraints = false

        headerView.heightAnchor.constraint(equalToConstant: view.bounds.height/4).isActive = true
            return headerView
        
    }

    
    override var titlesInSwitcher: [String] {
        
//        return ["Yahoo!","厚生労働省","東京都","訪問看護と介護","小金井市","福祉医療機構"]
//        return ["厚生労働省","東京都","訪問看護と介護","小金井市","福祉医療機構"]
        return nameArray
        
    }
    
    
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        
        switch index {
        case nameArray.count - 1:
            
            let viewController: Page1ViewController = Page1ViewController()
            viewController.index = index
        
            return Page1ViewController()
            
        default:
            return Page1ViewController()
        }
    }
}

//
//  PickerViewController.swift
//  Swift5WelfareInfoApp01
//
//  Created by 中塚富士雄 on 2020/12/28.
//

import UIKit

class PickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

}

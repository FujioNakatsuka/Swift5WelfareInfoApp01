//
//  PickerViewController.swift
//  Swift5WelfareInfoApp01
//
//  Created by 中塚富士雄 on 2020/12/28.
//

import UIKit
import AVFoundation

class PickerViewController: UIViewController,UIPickerViewDelegate
                            ,UIPickerViewDataSource {
   

    var player = AVPlayer()
    
    @IBOutlet weak var pickerView: UIPickerView!
    let dataNameList = ["Yahoo!","厚生労働省","東京都","訪問看護と介護","小金井市","福祉医療機構"]
    let dataURLList = ["https://news.yahoo.co.jp/rss","https://www.mhlw.go.jp/stf/news.rdf","https://www.metro.tokyo.lg.jp/rss/index.rdf","https://www.ndl.go.jp/jp/data/sakuin/rss/000000097643.xml","https://www.city.koganei.lg.jp/rss_news.xml","https://www.wam.go.jp/gyoseiShiryou/new_rss"]
    var nameString = String()
    var urlString = String()
    var nameArray = [String]()
    var urlArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        
        let path = Bundle.main.path(forResource: "start", ofType: "mov")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        
        let playerLayer = AVPlayerLayer(player:player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.repeatCount = 0
        playerLayer.zPosition = -1
        view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main){(_) in
            
            self.player.seek(to: .zero)
            //⭐️なぜ同じ物を縦に二つ並べた？
            self.player.play()
            self.player.play()
            
        }
        
    }
    
    //UIPickerViewの列の数
    func numberOfComponents(in pickerView:UIPickerView) -> Int{
        return 1
    }
    //UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataNameList.count
    }
    //UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataNameList[row]
    }
    //UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nameString = dataNameList[row]
        urlString = dataURLList[row]
        
    }
    
    @IBAction func selected(_ sender: Any) {
        nameArray.append(nameString)
        urlArray.append(urlString)
  
    }

    @IBAction func questionnaire(_ sender: Any) {
        
        //ナビゲーションで画面遷移
        //値を渡しながら画面遷移
        let nextVC = self.storyboard?.instantiateViewController(identifier: "nextVC") as! InfoDeckViewController
        
        nextVC.nameArray = nameArray
        nextVC.urlArray = urlArray
        
        UserDefaults.standard.setValue(urlArray, forKey: "urlArray")
        
        
        self.navigationController?.pushViewController(nextVC, animated: true)
   
    }
    
//    
//    
//    override func performSegue(withIdentifier identifier: String, sender: Any?) {
//        
//        
//    }
  
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    
    
 
    
}

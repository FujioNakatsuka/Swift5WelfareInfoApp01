//
//  Page1TableViewController.swift
//  Swift5WelfareInfoApp01
//
//  Created by 中塚富士雄 on 2020/12/28.
//

import UIKit
import SegementSlide

class Page1ViewController: UITableViewController,SegementSlideContentScrollViewDelegate,XMLParserDelegate {
    
    //XML Parserのインスタンスを作成する
    var parser = XMLParser()
   
    //RSSのパース中の現在の要素名
    var currentElementName:String!
    
    var newsItems = [NewsItems]()

    override func viewDidLoad() {
        super.viewDidLoad()

     
        tableView.backgroundColor = .clear
        
        //画像をTableViewの下に置く
        let image = UIImage(named: "0")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height:self.tableView.frame.size.height))
    
            imageView.image = image
        self.tableView.backgroundView = imageView
        
        //XMLパース
        //XMLパース(主要ニュース)
        let urlString = "https://news.yahoo.co.jp/rss/topics/top-picks.xml"
        //媒体別
        ////https://news.yahoo.co.jp/rss/media/wordleaf/all.xml
//
//
//
//        let urlString = "https://news.yahoo.co.jp/pickup/rss.xml"
        let url:URL = URL(string:urlString)!
        parser = XMLParser(contentsOf: url)!
        parser.delegate = self
        parser.parse()
        
    }
    @objc var scrollView: UIScrollView{
        
        return tableView
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsItems.count }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/5
    }
    
    
    
    
    //日付は表示できるか？
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.backgroundColor = .clear
        
        let newsItem = self.newsItems[indexPath.row]
        
        cell.textLabel?.text = newsItem.title
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        cell.textLabel?.textColor = .white
        cell.textLabel?.numberOfLines = 3
        
        cell.detailTextLabel?.text = newsItem.url
        cell.detailTextLabel?.textColor = .white
        
        //⭐️日時が表示されてurlは表示されなくなる
        cell.detailTextLabel?.text = newsItem.pubDate
        cell.detailTextLabel?.textColor = .white
        
        
        return cell
    }
   
    
    //XML書式で書かれたものを一つ一つチェックしていく。"item"にぶつかったらNewsItems(modelで定義)を初期化する。
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElementName = nil
        if elementName == "item"{
            
            self.newsItems.append(NewsItems())
            
        
        }else{
                
                currentElementName = elementName
            
            
        }
            

    
    }
   
    //判定メソッド
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if self.newsItems.count > 0{
            
            //配列の中身は1→5だが、順番は0→4番目なので1を入れると1番目の2になってしまう
            let lastItem = self.newsItems[self.newsItems.count - 1]
            
        
            switch self.currentElementName {
            
            
            //stringはfoundCharactersで見つけたもの。それをlastItemのtitleに入れる。
            case "title":
                lastItem.title = string
                
            case "link":
                lastItem.url = string
                
            case "pubDate":
                lastItem.pubDate = string
                
            default:break
                
            }
          
        }
    
    }
     
        func parser(_ parser:XMLParser, didEndElement elementName: String, namespaceURI: String? , qualifiedName qName: String?){
            
            self.currentElementName = nil
        }
          
            func parserDidEndDocument(_ parser: XMLParser){
                
                self.tableView.reloadData()
            }

               
            override func tableView(_ tableView: UITableView, didSelectRowAt IndexPath: IndexPath){
                    
                  let webViewController = WebViewController()
                webViewController.modalTransitionStyle = .crossDissolve
                let newsItem = newsItems[IndexPath.row]
                UserDefaults.standard.set(newsItem.url, forKey: "url")
                present(webViewController,animated: true, completion: nil)
                    
    }
 
    
}


    
    
    


//
//  PayOffViewController.swift
//  TaskTableViewApp01
//
//  Created by 福島悠樹 on 2020/06/07.
//  Copyright © 2020 福島悠樹. All rights reserved.
//

import UIKit

class PayOffList{
    var name:String
    var price:String
    
    init(name:String, price:String) {
        self.name = name
        self.price = price
    }
}

class PayOffViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {

    @IBOutlet weak var cartLabel: UILabel!
    @IBOutlet weak var payOffTableView: UITableView!
    let UserDefaultGiftNameKey:String = "GiftNameKey"
    let UserDefaultGiftPriceKey:String = "GiftPriceKey"
    var GiftName:String = ""
    var GiftPrice:String = ""
    var giftNameSearch:[String] = [
                                   "アメニティドーム", /* 0 */
                                   "カート", /* 1 */
                                   "コット", /* 2 */
                                   "コンテナ", /* 3 */
                                   "コンロ", /* 4 */
                                   "チェア", /* 5 */
                                   "テーブル", /* 6 */
                                   "バーナー", /* 7 */
                                   "ランタン", /* 8 */
                                   "Gジャン", /* 9（Gジャン） */
                                   "シャツ", /* 10（シャツ） */
                                   "帽子", /* 11（帽子） */
                                   "チェックのシャツ", /* 12（チェックのシャツ） */
                                   "ワンピース", /* 13（ワンピース） */
                                   "ジーンズ", /* 14（ジーンズ） */
                                   "ベスト", /* 15（ベスト） */
                                   "フリース", /* 16（フリース） */
                                   "パーカー", /* 17（パーカー） */
                                   "ニット帽", /* 18（ニット帽） */
                                   "焚き火台", /* 19 */
                                  ]
    
    var payOffList:[PayOffList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableViewCell()
        payOffTableView.delegate = self
        payOffTableView.dataSource = self
        
        /* データ(カートの中身)の読み込み */
        for i in 0 ..< giftNameSearch.count {
            if let receiveGiftPrice=UserDefaults.standard.string(forKey: giftNameSearch[i]){
                payOffList.append(PayOffList(name:giftNameSearch[i], price:receiveGiftPrice))
            }
        }
        
        /* カートの中身チェック(カラの時は警告画面に飛ぶ) */
        if payOffList.count==0 {
            emptyAlert()
        }
        
        // Do any additional setup after loading the view.
    }

    /* ★TableViewCellを読み込む(登録する)関数 */
    func configureTableViewCell(){
        /* nibを作成*/
        let nib = UINib(nibName: "PayOffTableViewCell", bundle: nil)
        
        /* ID */
        let cellID = "PayOffTableView"
        
        /* 登録 */
        payOffTableView.register(nib, forCellReuseIdentifier: cellID)
    }
    
    /* cellの個数 */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payOffList.count
    }
    
    /* cellに表示する内容 */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PayOffTableView", for: indexPath)as!PayOffTableViewCell
            
        /* タップした時にハイライトを消す */
        cell.selectionStyle = .none
        
        /* タップ検知のためisUserInteractionEnabledをtrueに */
        cell.eraseIconView.isUserInteractionEnabled = true
        
        /* タップ時イベント設定 */
        cell.eraseIconView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(eraseIconViewTapped)))

        /* タップ時処理で使用するためrowをtagに持たせておく */
        cell.eraseIconView.tag = indexPath.row
        
        if indexPath.row < payOffList.count{
            cell.payOffGiftName.text = payOffList[indexPath.row].name
            cell.payOffPrice.text = payOffList[indexPath.row].price
            cell.payOffImaveView.image = UIImage(named: payOffList[indexPath.row].name)
            cell.payOffGiftCounter.text = String(UserDefaults.standard.integer(forKey: payOffList[indexPath.row].name+"counter"))
        }
        
        return cell
    }
    
    /* ゴミ箱アイコンがクリックされた時にCallされる関数 */
    @objc func eraseIconViewTapped(sender:UITapGestureRecognizer){
        guard let inputRow=sender.view?.tag else {return}
        
        /* Databaseからデータを消す */
        UserDefaults.standard.removeObject(forKey: payOffList[inputRow].name)
        UserDefaults.standard.removeObject(forKey: payOffList[inputRow].name+"counter")
        
        /* 配列からデータを消す */
        payOffList.remove(at: inputRow)
        
        /* 再描画 */
        payOffTableView.reloadData()
        
        /* カラの時は警告画面に飛ぶ */
        if payOffList.count==0 {
            emptyAlert()
        }
        
    }
    
    /* cartがカラの時の警告 */
    func emptyAlert(){
        cartLabel.text = "買い物カゴは空です"
        cartLabel.textColor = UIColor.red
    }

    override func viewWillDisappear(_ animated: Bool) {
        //戻るボタン押下時の処理を行います。
        if let viewControllers = self.navigationController?.viewControllers {
            // 戻るボタン押下時にNavigationControllerの中に自分自身は存在しない。
            var existSelfInViewControllers = true
            for viewController in viewControllers {
                if viewController == self {
                    // NavigationControllerの中に自分自身が存在した場合
                    existSelfInViewControllers = false
                    break
                }
            }

            if existSelfInViewControllers {
                // 戻るボタンが押下された時
                // 戻るボタン押下時の処理を記述します。
//                let vc = IntroduceGiftViewController()
//                navigationController?.popToViewController(vc, animated: true)
                
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

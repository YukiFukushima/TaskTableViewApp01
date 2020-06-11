//
//  IntroduceGiftViewController.swift
//  TaskTableViewApp01
//
//  Created by 福島悠樹 on 2020/06/06.
//  Copyright © 2020 福島悠樹. All rights reserved.
//

import UIKit

class IntroduceGiftViewController: UIViewController {

    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultPriceLabel: UILabel!
    @IBOutlet weak var resultIntroText: UITextView!
    @IBOutlet weak var resultNameLabel: UILabel!
    @IBOutlet weak var cartInputLabel: UILabel!
    
    var introInfo:GiftInfo?
    var timer:Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let introInfo=introInfo else {return}
        resultImageView.image = UIImage(named: introInfo.giftName)
        resultPriceLabel.text = introInfo.giftPrice
        resultIntroText.text = introInfo.giftIntro
        resultNameLabel.text = introInfo.giftName

        // Do any additional setup after loading the view.
    }
    
    /* 画面を抜けた時にタイマー停止とカラ文字 */
    override func viewWillDisappear(_ animated: Bool) {
        dispCart(input:"")
        stopTimer()
    }
    /* cart表示関数 */
    func dispCart(input:String){
        cartInputLabel.text = input
    }
    /* cartチェック関数 */
    func cartCheck(){
        /* データの書き込み　*/
        guard let introInfo=introInfo else {return}
        UserDefaults.standard.set(introInfo.giftPrice, forKey: introInfo.giftName)
        
        /* データ(カートに入れたギフトの数)の読み込んでインクリメントして再書き込み */
        let keyGiftCounter:String = introInfo.giftName+"counter"
        var currentGiftCounter = UserDefaults.standard.integer(forKey: keyGiftCounter)
        currentGiftCounter += 1
        UserDefaults.standard.set(currentGiftCounter, forKey: keyGiftCounter)
        
    }
    
    /* タイマー開始関数 */
    func startTimer(){
        /* 既にタイマーが生成済みなら何もしないようにする */
        guard timer == nil else{ return }
        
        /* タイマー生成&開始*/
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: timerCBR)
    }
    
    /* タイマー停止関数 */
    func stopTimer(){
        timer?.invalidate()
        timer = nil
    }
    
    /* タイマー時間満了時(2sec経過時)にコールされる関数 */
    func timerCBR(timer:Timer){
        dispCart(input:"")
        stopTimer()
    }
    
    @IBAction func tappedCartInBtn(_ sender: Any) {
        cartCheck()
        dispCart(input:"カートに追加しました")
        
        /* 連続押下の為にリスタート */
        stopTimer()
        startTimer()
    }
    
    @IBAction func tappedPayOffBtn(_ sender: Any) {
        let vc = PayOffViewController()
        navigationController?.pushViewController(vc, animated: true)
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

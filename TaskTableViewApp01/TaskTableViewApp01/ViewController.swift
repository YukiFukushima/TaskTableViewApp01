//
//  ViewController.swift
//  TaskTableViewApp01
//
//  Created by 福島悠樹 on 2020/06/06.
//  Copyright © 2020 福島悠樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let giftClothLists:[GiftInfo] = [
        GiftInfo(giftName:"Gジャン",
                 giftPrice:"¥7,000",
                 giftIntro:"夏場のキャンプは日差しも強く、日焼けしやすい環境です。暑いからといって肌の露出が多い服装は避けたほうが無難ですよ！長袖を着て腕まくりをしたり、帽子を着用したりして日焼け対策をしましょう。"),
        GiftInfo(giftName:"シャツ",
                 giftPrice:"¥20,000",
                 giftIntro:"女性のシャツには、柔らかな着心地と優れた調温・調湿性能で人気のメリノウール素材をチョイス。汗を素早く吸い上げてくれるので、汗ばむ日中もサラサラの肌触りで快適に着られます。"),
        GiftInfo(giftName:"帽子",
                 giftPrice:"¥7,500",
                 giftIntro:"夏場のキャンプは日差しも強く、日焼けしやすい環境です。暑いからといって肌の露出が多い服装は避けたほうが無難ですよ！長袖を着て腕まくりをしたり、帽子を着用したりして日焼け対策をしましょう。"),
        GiftInfo(giftName:"チェックのシャツ", giftPrice:"¥10,000",
                 giftIntro:"女性のシャツには、柔らかな着心地と優れた調温・調湿性能で人気のメリノウール素材をチョイス。汗を素早く吸い上げてくれるので、汗ばむ日中もサラサラの肌触りで快適に着られます。"),
        GiftInfo(giftName:"ワンピース",
                 giftPrice:"¥15,000",
                 giftIntro:"夏場のキャンプは日差しも強く、日焼けしやすい環境です。暑いからといって肌の露出が多い服装は避けたほうが無難ですよ！長袖を着て腕まくりをしたり、帽子を着用したりして日焼け対策をしましょう。"),
        GiftInfo(giftName:"ジーンズ",
                 giftPrice:"¥16,000",
                 giftIntro:"女性のシャツには、柔らかな着心地と優れた調温・調湿性能で人気のメリノウール素材をチョイス。汗を素早く吸い上げてくれるので、汗ばむ日中もサラサラの肌触りで快適に着られます。"),
        GiftInfo(giftName:"ベスト",
                 giftPrice:"¥3,000",
                 giftIntro:"夏場のキャンプは日差しも強く、日焼けしやすい環境です。暑いからといって肌の露出が多い服装は避けたほうが無難ですよ！長袖を着て腕まくりをしたり、帽子を着用したりして日焼け対策をしましょう。"),
        GiftInfo(giftName:"フリース",
                 giftPrice:"¥4,000",
                 giftIntro:"女性のシャツには、柔らかな着心地と優れた調温・調湿性能で人気のメリノウール素材をチョイス。汗を素早く吸い上げてくれるので、汗ばむ日中もサラサラの肌触りで快適に着られます。"),
        GiftInfo(giftName:"パーカー",
                 giftPrice:"¥17,000",
                 giftIntro:"夏場のキャンプは日差しも強く、日焼けしやすい環境です。暑いからといって肌の露出が多い服装は避けたほうが無難ですよ！長袖を着て腕まくりをしたり、帽子を着用したりして日焼け対策をしましょう。"),
        GiftInfo(giftName:"ニット帽",
                 giftPrice:"¥10,000",
                 giftIntro:"女性のシャツには、柔らかな着心地と優れた調温・調湿性能で人気のメリノウール素材をチョイス。汗を素早く吸い上げてくれるので、汗ばむ日中もサラサラの肌触りで快適に着られます。")
    ]
    let giftInfoLists:[GiftInfo] = [
        GiftInfo(giftName:"アメニティドーム",
                 giftPrice:"¥50,000",
                 giftIntro:"快適性と耐久性を追求したスノーピークのテント高。軽くて弾力性に優れたフレームを使用。背の低い設計が風の影響を緩和します。"),
        GiftInfo(giftName:"コット",
                 giftPrice:"¥30,000",
                 giftIntro:"本体重量は1.8kgでコンパクトに収納可能。持ち運びが楽チンなのでキャンプやツーリングなど様々なアウトドアシーンで活躍します。"),
        GiftInfo(giftName:"コンテナ",
                 giftPrice:"¥10,000",
                 giftIntro:"アウトドアグッズを気兼ねなく入れて持ち運べる気軽さが特長で、メインのスペースには3枚の稼働可能な仕切りが付いているので荷物の仕分けも容易です。今シーズンから乗用車のトランクルームにも入れやすいサイズにリサイズされ、オートキャンプなどにもさらに持ち出しやすくなりました。"),
        GiftInfo(giftName:"コンロ",
                 giftPrice:"¥10,000",
                 giftIntro:"五徳をコンパクトに収納できる構造をもった、卓上ガスコンロ。すっきりと美しいフォルムで、キッチンやダイニングに置いても、インテリアに馴染みます。格納していたパーツを広げると五徳が出現。安定感があるので、大きめの鍋を置いても安心です。"),
        GiftInfo(giftName:"チェア",
                 giftPrice:"¥13,000",
                 giftIntro:"スノーピークのこだわりが凝縮した、ずっと使える大定番チェア。選んでおけば、間違いない逸品です。これに座ると姿勢がよくなって、食事もしやすいと評判です。リビングを落ち着いた雰囲気にカラーコーディネートできます。"),
        GiftInfo(giftName:"テーブル",
                 giftPrice:"¥20,000",
                 giftIntro:"脚部が一体式ワンタッチ構造により組立カンタンなアルミ製で軽量のテーブル"),
        GiftInfo(giftName:"バーナー",
                 giftPrice:"¥9,000",
                 giftIntro:"従来アウトドア用のバーナーはガスカートリッジの真上に装着するタイプ、ホースで連結するタイプ、ボックスタイプに大まかに分類されてきました。スノーピークは卓上・プレートタイプのバーナーを開発しました。ガスカートリッジを倒立させて装着するスノーピークオリジナルの“液出し”を採用。安定した出力を持続します。"),
        GiftInfo(giftName:"ランタン",
                 giftPrice:"¥7,000",
                 giftIntro:"マグネットでシャツの生地を挟んでくっつけたり、ヒモに通してぶら下げたり。取りつけは、かなり自由。あなたなら、どう使いますか?サイズφ62×75（h）mm重量57ｇ（電池を除く）特長手のひらに収まる愛らしいLEDランタン。"),
        GiftInfo(giftName:"焚き火台",
                 giftPrice:"¥18,000",
                 giftIntro:"直火禁止のキャンプ場などに使えます。ワンタッチで設営、撤収も平に折りたため収納便利。")
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var totalCartLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /* layoutを決める */
        let layout = UICollectionViewFlowLayout()
        
        /* アイテムの大きさ設定 */
        layout.itemSize = CGSize(width: self.view.frame.width / 3, height: 180)
        
        /* アイテムの横同士の間隔設定 */
        layout.minimumInteritemSpacing = 0
        
        /* アイテムの縦同士の間隔設定 */
        layout.minimumLineSpacing = 10
        
        /* layoutを決定 */
        collectionView.collectionViewLayout = layout
        
        /* 登録 */
        configureCollectionViewCell()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        /* カートの数を表示 */
        dispTotalCart()
    }

    /* collectionView登録 */
    func configureCollectionViewCell(){
        let nib = UINib(nibName: "GiftCollectionViewCell", bundle: nil)
        let celID = "GiftCollectionViewCell"
        
        /* collectionViewに登録 */
        collectionView.register(nib, forCellWithReuseIdentifier: celID)
    }
    
    /* アイテムの数 */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let countGiftInfoLists:Int = giftInfoLists.count
        let countClothLists:Int = giftClothLists.count
        
        if countGiftInfoLists > countClothLists{
            return countGiftInfoLists
        }
        else{
            return countClothLists
        }
    }
    
    /* 毎回呼ばれる */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCollectionViewCell", for: indexPath) as! GiftCollectionViewCell
        
        if indexPath.section==0{
            if indexPath.row<giftClothLists.count{
                cell.giftImage.image = UIImage(named: giftClothLists[indexPath.row].giftName)
                cell.priceLabel.text = giftClothLists[indexPath.row].giftPrice
            }else{
                cell.giftImage.image = nil
                cell.priceLabel.text = ""
            }
        }
        else if indexPath.section==1{
            if indexPath.row<giftInfoLists.count{
                cell.giftImage.image = UIImage(named: giftInfoLists[indexPath.row].giftName)
                cell.priceLabel.text = giftInfoLists[indexPath.row].giftPrice
            }else{
                cell.giftImage.image = nil
                cell.priceLabel.text = ""
            }
        }
        else{
            if indexPath.row<giftInfoLists.count{
                cell.giftImage.image = UIImage(named: giftInfoLists[indexPath.row].giftName)
                cell.priceLabel.text = giftInfoLists[indexPath.row].giftPrice
            }else{
                cell.giftImage.image = nil
                cell.priceLabel.text = ""
            }
        }
        
        return cell
    }
    
    /* セクションの数 */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    /* カートの数を数えて表示する関数 */
    func dispTotalCart(){
        var totalCart:Int = 0
        
        for i in 0 ..< giftClothLists.count {
            let keyGiftCounter:String = giftClothLists[i].giftName+"counter"
            
            let currentGiftCounter = UserDefaults.standard.integer(forKey: keyGiftCounter)
            totalCart += currentGiftCounter
        }
        for i in 0 ..< giftInfoLists.count {
            let keyGiftCounter:String = giftInfoLists[i].giftName+"counter"
            
            let currentGiftCounter = UserDefaults.standard.integer(forKey: keyGiftCounter)
            totalCart += currentGiftCounter
        }
        if totalCart != 0{
            totalCartLabel.text = String(totalCart)
        }else{
            totalCartLabel.text = ""
        }
    }
    
    /* Viewが表示された時に呼ばれるメソッド */
    override func viewWillAppear(_ animated: Bool) {
        dispTotalCart()
    }
    /* アイテムを押された時のアクション */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("osareta")
        let vc = IntroduceGiftViewController()
        
        if indexPath.section==0 {
            vc.introInfo = giftClothLists[indexPath.row]
        }else{
            vc.introInfo = giftInfoLists[indexPath.row]
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /* カートタップ時のアクション */
    @IBAction func tappedPayOffBtn(_ sender: Any) {
        let vc = PayOffViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}


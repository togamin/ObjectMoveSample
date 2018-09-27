//
//  ViewController.swift
//  ObjectMoveSample
//
//  Created by Togami Yuki on 2018/09/26.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var longGesture = UILongPressGestureRecognizer()
    var data:[NewUIImageView] = []
    var tag:Int = 1
    var taptag:Int!
    
    //画面の幅、画面の高さ
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        longGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(_:)))
        longGesture.minimumPressDuration = 0.5
        view.addGestureRecognizer(longGesture)
    }
    
    @objc func longPress(_ sender: UILongPressGestureRecognizer) {
        print("ロングプッシュ")
        print(data[taptag - 1].title)
        print(data[taptag - 1].detail)
    }
    
    
    @IBAction func addBtn(_ sender: UIButton) {
        let animalImageView = NewUIImageView()
        
        animalImageView.title = "ペンギン"
        animalImageView.detail = "めっちゃかわいいよねー"
        
        animalImageView.image = UIImage(named:"animal01.png")
        
        //一番目にタグ1の「NewUIImageView」が入っている。
        data.append(animalImageView)
        
        animalImageView.frame = CGRect(x:(screenWidth-100)/2,y:screenHeight/2 + 100,width:100,height:100)
        // ユーザーの操作を有効にする
        animalImageView.isUserInteractionEnabled = true
        // タッチしたものが設定した画像かどうかを判別する用のタグ
        animalImageView.tag = tag
        tag += 1
        // ビューに追加
        view.addSubview(animalImageView)
        print("画像表示")
    }
    
    
    class NewUIImageView:UIImageView{
        var title:String = ""
        var detail:String = ""
    }
    
    
    
    
    //画像をタッチした時、タッチした点に画像を動かす
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("タッチ")
        //最初にタッチした指のみ取得
        if let touch = touches.first {
            //タッチしたビューをviewプロパティで取得する
            if let touchedView = touch.view {
                if touchedView.tag >= 1 {
                    //指の位置にビューの中心を持っていく
                    touchedView.center = touch.location(in: view)
                    taptag = touchedView.tag
                    print("タグ:",taptag)
                }
            }
        }
    }
    //画像を動かした時、タッチした点に
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // touchesBeganと同じ処理
        self.touchesBegan(touches, with: event)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


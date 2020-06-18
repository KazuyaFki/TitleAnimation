//
//  ViewController.swift
//  AwesomeTitleAnimation
//
//  Created by Kazuya Fukui on 2020/06/17.
//  Copyright © 2020 Kazuya Fukui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    @IBOutlet weak var titleLabelTopConstrait: NSLayoutConstraint!
    
    
    @IBOutlet weak var titleLabelRightConstrait: NSLayoutConstraint!
    
    
    @IBOutlet weak var bodyTextViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bodyTextViewRightConstraint: NSLayoutConstraint!
    
    //viewDidLoadの前に実行される
    override func loadView() {
        super.loadView()
    
        //オートレイアウトを使って上に表示
        titleLabelTopConstrait.constant -= 250
        //非表示する
        titleLabel.alpha = 0
        bodyTextViewTopConstraint.constant -= 300
        bodyTextView.alpha = 0
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showAnimation()
        
        
    }
    
    private func showAnimation() {
        
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                          //アニメーションの時間範囲    //遅延　　//揺れ動く大きさの指定        //初速の速さ
            UIView.animate(withDuration: 1.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.9, options: [], animations: {
                //アニメーションの内容
                self.titleLabelTopConstrait.constant += 250
                self.titleLabel.alpha = 1
                //アニメーションしていても、すぐ画面に反映されないので更新
                self.view.layoutIfNeeded()
            }) { (_) in
                //アニメーション終了時の動作
                UIView.animate(withDuration: 1.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.9, options: [], animations: {
                    self.bodyTextViewTopConstraint.constant += 300
                    self.bodyTextView.alpha = 1
                    self.view.layoutIfNeeded()
                }) { (_) in
                    self.dismissAnimation()                }
            }
            
            
            
        }
        
    }
    
    private func dismissAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            UIView.animate(withDuration: 1.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.9, options: [], animations: {
                //アニメーションの内容
                self.titleLabelRightConstrait.constant -= 200
                self.titleLabel.alpha = 0
                //アニメーションしていても、すぐ画面に反映されないので更新
                self.view.layoutIfNeeded()
            }) { (_) in
                //アニメーション終了時の動作
                UIView.animate(withDuration: 1.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.9, options: [], animations: {
                    self.bodyTextViewRightConstraint.constant -= 200
                    self.bodyTextView.alpha = 0
                    self.view.layoutIfNeeded()
                })
            }
        }
    }

}


//
//  ViewController.swift
//  Fortuna
//
//  Created by touzi on 14/10/18.
//  Copyright (c) 2014年 touzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
                            
    @IBAction func rootViewTapped(sender: UITapGestureRecognizer) {
        //一个触摸事件，点击之后再随机显示一个
        
        
        displayRandomQuote()
    }
    
    @IBOutlet weak var quotationTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // println("Hacking in Swift, since iOS8")
       // println("controller: \(self)")
       // println("view: \(self.view)")
       // println("view's frame: \(self.view.frame)")
       // let path = NSBundle.mainBundle().pathForResource("positiveQuotes", ofType: "json")
       // println("positive quotes path: \(path)")
        
        
        //awakeFromNib()
        
        //打印输出UITextView
        println("viewDidLoad quotationTextView: \(quotationTextView)")
        
        //设置UITextView不可编辑
        quotationTextView.editable = false
        //设置UITextView不可选择拷贝
        quotationTextView.selectable = false
        
        //显示随机内容
        displayRandomQuote()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func awakeFromNib() {
        //
        super.awakeFromNib()
        println("awakeFromNib quotationTextView: \(quotationTextView)")
    }
    
    func displayRandomQuote() {
        //
        let delegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let positiveQuote = delegate.positiveQuotes
        let negativeQuote = delegate.negativeQuotes
        
        var quotes : [String]!
        
        quotes = arc4random_uniform(2) == 1 ? delegate.positiveQuotes : delegate.negativeQuotes
        
        var quote : String = quotes[Int(arc4random_uniform(UInt32(quotes.count)))]
        
        println("显示quote: \(quote)")
        
        quotationTextView.text = quote
    }


}


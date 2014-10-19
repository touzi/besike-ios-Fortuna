//
//  AppDelegate.swift
//  Fortuna
//
//  Created by touzi on 14/10/18.
//  Copyright (c) 2014年 touzi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    
    var positiveQuotes: [String]!
    var negativeQuotes: [String]!

    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        // Override point for customization after application launch.
        
        //取到json文件所在位置
        let positiveQuotesPath = NSBundle.mainBundle().pathForResource("positiveQuotes", ofType: "json")
        let negativeQuotesPath = NSBundle.mainBundle().pathForResource("negativeQuotes", ofType: "json")
        
        //调用loadJSON方法,得到json内容
        positiveQuotes = loadJSON(positiveQuotesPath!) as [String]!
        negativeQuotes = loadJSON(negativeQuotesPath!) as [String]!
        
        assert(positiveQuotes.count > 0, "加载 positive quotes")
        assert(negativeQuotes.count > 0, "加载 negative quotes")
        return true
    }

    func applicationWillResignActive(application: UIApplication!) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication!) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication!) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication!) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication!) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func loadJSON(path: String) -> AnyObject? {
        //用于处理加载JSON文件，可以用这个方法
        
        //从路径中加载数据
        let data = NSData(contentsOfFile: path)
        
        assert(data != nil, "无法读取数据: \(path)")
        
        //解析JSON数据
        var err : NSError?
        let json: AnyObject? = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.allZeros, error: &err)
        assert(err == nil, "解析json发生错误: \(err)")
        
        return json
    }
    


}


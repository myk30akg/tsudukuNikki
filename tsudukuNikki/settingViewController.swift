//
//  settingViewController.swift
//  tsudukuNikki
//
//  Created by 竹田美雪 on 9/1/16.
//  Copyright © 2016 竹田美雪. All rights reserved.
//

import UIKit

class settingViewController: UIViewController {
    @IBOutlet weak var alertSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        alertSwitch.on = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onAlertSwich(sender: UISwitch) {
        if alertSwitch.on {
            print("通知スイッチオン")
        
            //ローカル通知の設定
            let notification : UILocalNotification = UILocalNotification()
        
            //タイトル
            notification.alertTitle = "Remember"
        
            //通知メッセージ
            notification.alertBody = "日記を書きましょう！"
        
            //Timezoneの設定
            notification.timeZone = NSTimeZone.defaultTimeZone()
        
            //10秒後に通知を設定(NSDateは現在の時間)
            notification.fireDate = NSDate(timeIntervalSinceNow: 10)
        
            //Notificationを表示する
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
        }else{
            print("通知スイッチオフ")
            //通知の削除
            
        }
        
        

        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

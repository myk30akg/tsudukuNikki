//
//  editViewController.swift
//  tsudukuNikki
//
//  Created by 竹田美雪 on 8/11/16.
//  Copyright © 2016 竹田美雪. All rights reserved.
//

import UIKit

class editViewController: UIViewController {
    @IBOutlet weak var diarySaveBtn: UIButton!
    @IBOutlet weak var diaryDatePicker: UIDatePicker!
    @IBOutlet weak var diaryTextView: UITextView!
    
    var diaryList = [ ["date":"", "diary":""],]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        diaryDatePicker.datePickerMode = UIDatePickerMode.Date
        let df = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        //型変換
        var dateStr = df.stringFromDate(diaryDatePicker.date)
        print(dateStr)

        
        
        //userDefaultから保存した配列を取り出す
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        //UserDefaultを全削除する
        //        var appDomain:String = NSBundle.mainBundle().bundleIdentifier!
        //        myDefault.removePersistentDomainForName(appDomain)
        
        if (myDefault.objectForKey("diaryList") != nil) {
            //データを呼び出して
            diaryList = myDefault.objectForKey("diaryList") as! [Dictionary]
        }
        print(diaryList)

    }
    @IBAction func tapSaveBtn(sender: UIButton) {
        //日付をString型に変換
        let df = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        var dateStr = df.stringFromDate(diaryDatePicker.date)
        //タイトルを追加
        diaryList.append(["date":dateStr, "diary":""])
        print(diaryList)
        
        //UserDefaultに保存
        //ユーザーデフォルトを用意する
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを書き込んで
        myDefault.setObject(diaryList, forKey: "diaryList")
        
        //即反映させる
        myDefault.synchronize()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

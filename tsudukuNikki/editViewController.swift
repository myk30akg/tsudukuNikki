//
//  editViewController.swift
//  tsudukuNikki
//
//  Created by 竹田美雪 on 8/11/16.
//  Copyright © 2016 竹田美雪. All rights reserved.
//

import UIKit
import CoreData

class editViewController: UIViewController {
    @IBOutlet weak var diarySaveBtn: UIButton!
    @IBOutlet weak var diaryDatePicker: UIDatePicker!
    @IBOutlet weak var diaryTextView: UITextView!
    
    //空の辞書データ<文字列:文字列>
    var diaryList = [Dictionary<String, String>()]
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DatePickerの設定
        diaryDatePicker.datePickerMode = UIDatePickerMode.Date
        let df = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        //型変換
        var dateStr = df.stringFromDate(diaryDatePicker.date)
        print(dateStr)
        
        
        //userDefaultから保存した配列を取り出す
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        //UserDefaultを全削除する(日記の日付・タイトルを全削除したいときだけ実行すること！)
//          var appDomain:String = NSBundle.mainBundle().bundleIdentifier!
//          myDefault.removePersistentDomainForName(appDomain)
        
        if (myDefault.objectForKey("diaryList") != nil) {
            //データを呼び出して
            diaryList = myDefault.objectForKey("diaryList") as! [Dictionary]
        }
        print(diaryList)
        if selectedIndex >= 0{
            
            var dateFromStr = df.dateFromString(diaryList[selectedIndex]["date"]!)
            diaryDatePicker.date = dateFromStr!
            diaryTextView.text  = diaryList[selectedIndex]["diary"]! as String
        }
        read()
        print(NSBundle.mainBundle())
    }
    // すでに存在するデータの読み込み処理
    func read() {
        let df = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        
        // AppDeleteをコードで読み込む
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Entityの操作を制御するmanagedObjectContextをappDelegateから作成
        if let managedObjectContext:NSManagedObjectContext = appDelegate.managedObjectContext {
            
            // Entityを指定する設定
            let entityDiscription = NSEntityDescription.entityForName("Diary", inManagedObjectContext: managedObjectContext)
            
            let fetchRequest = NSFetchRequest(entityName: "Diary")
            fetchRequest.entity = entityDiscription
            
            // errorが発生した際にキャッチするための変数
            var error: NSError? = nil
            
            // フェッチリクエスト (データの検索と取得処理) の実行
            do {
                let results = try managedObjectContext.executeFetchRequest(fetchRequest)
                print(results.count)
                for managedObject in results {
                    let diary = managedObject as! Diary
                    
                    var savedDate:NSDate = NSDate(timeIntervalSinceReferenceDate:diary.date)
                        
                        print("date: \(df.stringFromDate(savedDate)), detail: \(diary.detail)")
                }
            } catch let error1 as NSError {
                error = error1
            }
        }
    }

    
    //保存ボタンを押したときの処理
    @IBAction func tapSaveBtn(sender: UIButton) {
//        //日付をString型に変換
//        let df = NSDateFormatter()
//        df.dateFormat = "yyyy/MM/dd"
//        var dateStr = df.stringFromDate(diaryDatePicker.date)
//                //UserDefaultに保存
//        //ユーザーデフォルトを用意する
//        var myDefault = NSUserDefaults.standardUserDefaults()
//        
//        
//        if (myDefault.objectForKey("diaryList") != nil) {
//            //タイトル(日付)を追加
//            diaryList.append(["date":dateStr, "diary":diaryTextView.text])
        
            
            //CoreData
            //データの保存
            // AppDeleteをコードで読み込む
            let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
            
            // Entityの操作を制御するmanagedObjectContextをappDelegateから作成
        if let managedObjectContext:NSManagedObjectContext = appDelegate!.managedObjectContext {
                
                // 新しくデータを追加するためのEntityを作成します
                let managedObject: AnyObject = NSEntityDescription.insertNewObjectForEntityForName("Diary", inManagedObjectContext: managedObjectContext)
                
                // 「Diary Entity」からObjectを生成し、Attributesに接続して値を代入
                let diary = managedObject as! Diary
                diary.date = diaryDatePicker.date.timeIntervalSinceReferenceDate
                diary.detail = "日記本文をここに書き込む"
                diary.feeling = "Smile"  //これで合ってる？
            
                // データの保存処理
                appDelegate!.saveContext() // ←←← これ重要
            
        }else{
//            diaryList = [["date":dateStr, "diary":diaryTextView.text]]
//        }
//        
//        print(diaryList)
//        
//        
//        //データを書き込んで
//        myDefault.setObject(diaryList, forKey: "diaryList")
//        
//        //即反映させる
//        myDefault.synchronize()

        }
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

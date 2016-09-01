//
//  listViewController.swift
//  tsudukuNikki
//
//  Created by 竹田美雪 on 8/10/16.
//  Copyright © 2016 竹田美雪. All rights reserved.
//

import UIKit
import CoreData



class listViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var listTableView: UITableView!
    
    var diaryList = [Dictionary<String, String>()]
    var selectedIndex = -1

    override func viewDidLoad() {
        super.viewDidLoad()
//        //ユーザーデフォルトを用意する
//        var myDefault = NSUserDefaults.standardUserDefaults()
//        
//        if (myDefault.objectForKey("diaryList") != nil) {
//            //データを呼び出して
//            diaryList = myDefault.objectForKey("diaryList") as! [Dictionary]
//        }
//        print(diaryList)
        
        //CoreData
        //CoreDataを呼び出す
        read()
    }
    //以下でコアデータから取り出した情報を配列に格納する
    
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
                let results = (try! managedObjectContext.executeFetchRequest(fetchRequest))
                print(results.count)
                var diaryListTmp = [Dictionary<String, String>()]
                for managedObject in results {
                    let diary = managedObject as! Diary

                    var savedDate:NSDate = NSDate(timeIntervalSinceReferenceDate:diary.date)
                    //空の配列[0]に代入、空ではなかったら新しく追加していくif文
                    if diaryListTmp[0].count == 0 {
                        
                        diaryListTmp[0] = ["date":df.stringFromDate(savedDate),"detail":diary.detail!]
                        
                    }else{
                        diaryListTmp.append(["date":df.stringFromDate(savedDate),"detail":diary.detail!])
                        
                    }
                    
                    
//                    //配列の作成
//                    diaryListTmp.append(["date":df.stringFromDate(savedDate),"detail":diary.detail!])
//                    
                    
                    print("date: \(df.stringFromDate(savedDate)), detail: \(diary.detail)")
                }
                
                //diaryListへの代入
                diaryList = diaryListTmp
                
            } catch let error1 as NSError {
                error = error1
            }
        }
    }
    //以上でコアデータの読み込みが終了

    
        //TableViewに表示する行数を決定する
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //配列の中身の分だけ表示
            return diaryList.count
            }
    
        //表示する行の中身
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell = UITableViewCell(style: .Default, reuseIdentifier:"listCell")
            
            cell.textLabel!.text = diaryList[indexPath.row]["date"]! as String
            return cell
            }
    
        //セルが選択されたとき
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
            print("\(indexPath.row)行目を選択")
            selectedIndex = indexPath.row
            //画面遷移
            performSegueWithIdentifier("showDetailSegue", sender: nil)
            var row = indexPath.row
         
        }
    //セグエを通って画面遷移をするとき
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "newEditSegue" {
            segue.destinationViewController as! editViewController
        }else{
            var showVC = segue.destinationViewController as! detailViewController
        
            showVC.selectedIndex = selectedIndex
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

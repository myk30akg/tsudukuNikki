//
//  detailViewController.swift
//  tsudukuNikki
//
//  Created by 竹田美雪 on 8/25/16.
//  Copyright © 2016 竹田美雪. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var showTextView: UITextView!
    var diaryList = [Dictionary<String, String>()]
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ユーザーデフォルトを用意する
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        if (myDefault.objectForKey("diaryList") != nil) {
            //データを呼び出して
            diaryList = myDefault.objectForKey("diaryList") as! [Dictionary]
        }
        
        print(diaryList)
        dateLabel.text = diaryList[selectedIndex]["date"]! as String
        showTextView.text  = diaryList[selectedIndex]["diary"]! as String
        
    }

    //セグエを通って画面遷移をするとき
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        var editVC = segue.destinationViewController as! editViewController
            
        editVC.selectedIndex = selectedIndex

        
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

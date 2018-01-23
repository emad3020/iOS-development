//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by Emad on 8/21/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {
    
    @IBOutlet weak var webview: UIWebView!
    
    @IBOutlet weak var title_Lbl: UILabel!
    private var _partyRock: PartRock!
    
    var partyRock : PartRock{
        set{
            _partyRock = newValue
        } get {
            return _partyRock
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title_Lbl.text = partyRock.videoTitle
        
        webview.loadHTMLString(partyRock.videoURL, baseURL: nil)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

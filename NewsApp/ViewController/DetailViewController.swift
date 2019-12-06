//
//  DetailViewController.swift
//  NewsApp
//
//  Created by SAURABH MISHRA on 06/12/19.
//  Copyright © 2019 SAURABH MISHRA. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var story:Story?
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup XCUITest Accessibility Labels
           storyTitle.accessibilityIdentifier = "label--storyTitleLabel"
           textView.accessibilityIdentifier = "label--storyDetailTxtView"

        if let story = story  {
            

            storyTitle.text = story.title
            textView.text = story.abstract
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

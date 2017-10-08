//
//  GameOverControllerViewController.swift
//  Bout Time
//
//  Created by mac on 10/5/17.
//  Copyright © 2017 Cameron Barnes. All rights reserved.
//

import UIKit

class GameOverControllerViewController: UIViewController {
    
    let roundsPerGame = 6
    var roundsAnsweredCorrectly = 0
    var roundsPlayed = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        showScore()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
 
    @IBOutlet weak var showScoreLabel: UILabel!

    func showScore() {
        showScoreLabel.text = "\(roundsAnsweredCorrectly)/\(roundsPlayed)"
    }
    
    @IBAction func PlayAgainButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)

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

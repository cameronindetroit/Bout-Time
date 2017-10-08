//
//  ViewController.swift
//  Bout Time
//
//  Created by admin on 9/28/17.
//  Copyright © 2017 Cameron Barnes. All rights reserved.
//

import UIKit
import GameKit
import SafariServices


class ViewController: UIViewController {
    
    //MARK: - GameSetup
    
    //////////////////////////////////////////////
    /////////////////Set App Variables////////////////
    /////////////////////////////////////////////
    
    let roundsPerGame = 6
    var roundsAnsweredCorrectly = 0
    var roundsPlayed = 0
    
    
    //Portrait Mode Only: Done in AppDelegate Class to incompass all views in app
    
    
    //Array to hold currently listed events
    
    var currentEventsArray: [EventStructure] = []
    

    //Array to hold priously listed events
    
    var previousEventsArray: [EventStructure] = []
    
    
    
    //decleration of UIButtons and labels 
    
    @IBOutlet weak var firstEventInfoButton: UIButton!
    @IBOutlet weak var secondEventInfoButton: UIButton!
    @IBOutlet weak var thirdEventInfoButton: UIButton!
    @IBOutlet weak var fourthEventInfoButton: UIButton!

    @IBOutlet weak var View1Down: UIButton!
    @IBOutlet weak var View2Up: UIButton!
    @IBOutlet weak var View2Down: UIButton!
    @IBOutlet weak var View3Up: UIButton!
    @IBOutlet weak var View3Down: UIButton!
    @IBOutlet weak var View4Down: UIButton!
    
    @IBOutlet weak var TimerButton: UIButton!
    
    @IBOutlet weak var EventInformationLabel: UILabel!
    
    
    //Connect score variables in both ViewController and GameOverController
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameOver" {
            if let controller = segue.destination as? GameOverControllerViewController {
                controller.roundsAnsweredCorrectly = self.roundsAnsweredCorrectly
                controller.roundsPlayed = self.roundsPlayed
            }
        }
    }
    
    
    
    
    //MARK: - TimerSetup
    
    //////////////////////////////////////////////
    /////////////////Timer Setup////////////////
    /////////////////////////////////////////////
    
    //Timer
    var roundTimer = Timer()
    var seconds = 60
    var timerRunning = false
    
    //TimerMethods 
    
    func beginTimer() {
        if timerRunning == false {
            roundTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.CountdownTimer), userInfo: nil, repeats: true)
            timerRunning = true
            
        }
    }
    
    //Countdown Timer 
    
    func CountdownTimer(){
        //countdown by 1 second 
        seconds -= 1
        TimerButton.setTitle("\(seconds)", for: .normal)
        
        if seconds == 0 {
            checkAnswer()
            
            
        }
        
    }
    
    
    //reset Timer 
    
    func resetTimer(){
        seconds = 60
        TimerButton.setTitle("\(seconds)", for: .normal)
        timerRunning = false
    }

    
    
    //MARK: - StartQuiz
    
    
    //////////////////////////////////////////////
    /////////////////Start Quiz ////////////////
    /////////////////////////////////////////////
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        CountdownTimer()
        newEvent()
        beginTimer()
        disableTimerButton()
        
    }

  /*
    //Load after viewDidLoad
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //show alert and begin timer 
        showalert()
        resetTimer()
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
   
        
    //MARK: - NewQuestions
    
    //////////////////////////////////////////////
    /////////////////New Question////////////////
    /////////////////////////////////////////////
    
    
    // Generate new question from Question Provider Model
    func getListOfEvents () {
        
        var randomIndex1 = 0
        var randomIndex2 = 0
        var randomIndex3 = 0
        var randomIndex4 = 0
        
        var randomEvent1: EventStructure
        var randomEvent2: EventStructure
        var randomEvent3: EventStructure
        var randomEvent4: EventStructure
        
        
        
        
        //Get random event from Period Events array add events to new events array and previous events array and then remove it from the Periods events array.
        
        
    
        randomIndex1 = GKRandomSource.sharedRandom().nextInt(upperBound: periodEvents.count)
        

        randomEvent1 = periodEvents[randomIndex1]
        currentEventsArray.append(randomEvent1)
        previousEventsArray.append(randomEvent1)
        periodEvents.remove(at: randomIndex1)
        
        
        randomIndex2 = GKRandomSource.sharedRandom().nextInt(upperBound: periodEvents.count)
        randomEvent2 = periodEvents[randomIndex2]
        currentEventsArray.append(randomEvent2)
        previousEventsArray.append(randomEvent2)
        periodEvents.remove(at: randomIndex2)
        
        
        randomIndex3 = GKRandomSource.sharedRandom().nextInt(upperBound: periodEvents.count)
        randomEvent3 = periodEvents[randomIndex3]
        currentEventsArray.append(randomEvent3)
        previousEventsArray.append(randomEvent3)
        periodEvents.remove(at: randomIndex3)
        
        randomIndex4 = GKRandomSource.sharedRandom().nextInt(upperBound: periodEvents.count)
        randomEvent4 = periodEvents[randomIndex4]
        currentEventsArray.append(randomEvent4)
        previousEventsArray.append(randomEvent4)
        periodEvents.remove(at: randomIndex4)
        
        
        
    }
    
    //New question set
    func newEvent() {
        
        getListOfEvents()
       
        // Set new events button labels
        loadEvents()
    }
    
    
    //Load events function
    
    func loadEvents() {
        
        disableURLLinks()
        enableSwapButtons()
        
        firstEventInfoButton.setTitle(currentEventsArray[0].event, for: UIControlState.normal)
        secondEventInfoButton.setTitle(currentEventsArray[1].event, for: UIControlState.normal)
        thirdEventInfoButton.setTitle(currentEventsArray[2].event, for: UIControlState.normal)
        fourthEventInfoButton.setTitle(currentEventsArray[3].event, for: .normal)

    }
    
    
    //MARK: - MoveEvents
    
    //////////////////////////////////////////////
    ///////////Move Events with arrows //////////
    /////////////////////////////////////////////
    
    
    //function to swap two events 
    
    func swapEvents( firstEvent: inout EventStructure, secondEvent: inout EventStructure) {
        
   
        let tempFirstEvent = firstEvent
        
        firstEvent = secondEvent
        
        secondEvent = tempFirstEvent
        //update display 
        loadEvents()
        
    }
    
    
    

    //UI Buttons for all down actions
    
    @IBAction func View1Down(_ sender: UIButton) {
        
       swapEvents(firstEvent: &currentEventsArray[0], secondEvent: &currentEventsArray[1])
       
    }
    
    @IBAction func View2Down(_ sender: UIButton) {
        
        swapEvents(firstEvent: &currentEventsArray[1], secondEvent: &currentEventsArray[2])
        
    }
    
    
    @IBAction func View3Down(_ sender: UIButton) {
        
        swapEvents(firstEvent: &currentEventsArray[2], secondEvent: &currentEventsArray[3])
    }
    
    
    
    
    //UI Buttons for all up actions
    
    @IBAction func View2Up(_ sender: UIButton) {
        
        swapEvents(firstEvent: &currentEventsArray[1], secondEvent: &currentEventsArray[0])
        
        
    }
    
    @IBAction func View3Up(_ sender: UIButton) {
        
        swapEvents(firstEvent: &currentEventsArray[2], secondEvent: &currentEventsArray[1])
        
    }
    
    
    
    @IBAction func View4Down(_ sender: UIButton) {
        
        swapEvents(firstEvent: &currentEventsArray[3], secondEvent: &currentEventsArray[2])
        
    }
    
    
    //MARK: - CheckAnswer
    
    
    //////////////////////////////////////////////
    /////////////////Check Answer ///////////////
    /////////////////////////////////////////////
  
    
    func checkAnswer() {
        
        //Increment the rounds played counter
        roundsPlayed += 1
        
        //enable next round button 
        enableTimerButton()
      
        
        //disable Swap Buttons 
        disableSwapButton()
        enableURLLinks()

        
        //Change the information label
        EventInformationLabel.text = "Tap an event to learn more"
        
        //disable timer button 
        roundTimer.invalidate()

        
        if currentEventsArray[0].year < currentEventsArray[1].year && currentEventsArray[1].year < currentEventsArray[2].year && currentEventsArray[2].year < currentEventsArray[3].year {
            
            //increase Rounds answered correctly counter by 1 
            roundsAnsweredCorrectly += 1
            
            
            // Enable Timer Button
            TimerButton.isEnabled = true
            //Change Button from timer to answered correct button 
            TimerButton.setTitle("   ", for: .normal)

            TimerButton.setBackgroundImage(#imageLiteral(resourceName: "next_round_success"), for: .normal)
            

            
        } else {
            
            // Enable Timer Button
            TimerButton.isEnabled = true
            //Change Button from timer to answered incorrectly button 
            TimerButton.setTitle("   ", for: .normal)
            TimerButton.setBackgroundImage(#imageLiteral(resourceName: "next_round_fail"), for: .normal)
            
           
        }
        
        
        
    }
    
    
    //MARK: - AnswerMethod 
    
    //////////////////////////////////////////////
    //////// After Answer Methods  ///////////////
    /////////////////////////////////////////////
    
    
    //Set TimerButton background image back to nil 
    
    func resetTimerButtonImage(){
        
        TimerButton.setBackgroundImage(nil, for: .normal)
    }
    
    // Set Event Information Label back to normal
    
    func resetInfoLabel() {
        
        EventInformationLabel.text = "Shake to Complete"
    }
    
    // Enable app for motiondetection 
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    //Check Answer when user shakes phone
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if (motion == .motionShake) {
        
            checkAnswer()
            
        }
    }
    
   
    
    
    //MARK: - NextRound
    
    
    //////////////////////////////////////////////
    /////////////////Next Round  ///////////////
    /////////////////////////////////////////////
    
    
    @IBAction func TimerButton(_ sender: UIButton) {
        nextRound()
    }
    
    
    
    //Move on to next round 
    func nextRound() {
        if roundsPlayed == roundsPerGame {
            
            //Game is over
            periodEvents = previousEventsArray
             presentGameOverController()
            roundsPlayed = 0
            roundsAnsweredCorrectly = 0
            resetTimerButtonImage()
            nextRound()
        } else {
            currentEventsArray.removeAll()
            resetTimer()
            CountdownTimer()
            resetTimerButtonImage()
            resetInfoLabel()
            newEvent()
            beginTimer()
            disableTimerButton()
        }
        
        
    }
    
    //Show player score in new view controller 
    
    
    //MARK: - URLDisplay
    
    //////////////////////////////////////////////
    /////////////////URL Display ////////////////
    /////////////////////////////////////////////

    
    //Display URL When Button is tapped 
    
    @IBAction func firstEventInfoButton(_ sender: UIButton) {
        
        let sfViewController = SFSafariViewController(url: currentEventsArray[0].url, entersReaderIfAvailable: true)
        self.present(sfViewController, animated: true, completion: nil)
        super.viewDidAppear(false)
        
            }
    
    @IBAction func secondEventInfoButton(_ sender: UIButton) {
        
        let sfViewController = SFSafariViewController(url: currentEventsArray[1].url, entersReaderIfAvailable: true)
        self.present(sfViewController, animated: true, completion: nil)
        super.viewDidAppear(false)
    }
   
    @IBAction func thirdEventInfoButton(_ sender: UIButton) {
        
        let sfViewController = SFSafariViewController(url: currentEventsArray[2].url, entersReaderIfAvailable: true)
        self.present(sfViewController, animated: true, completion: nil)
        super.viewDidAppear(false)
    }
    
    
    @IBAction func fourthEventInfoButton(_ sender: UIButton) {
        
        let sfViewController = SFSafariViewController(url: currentEventsArray[3].url, entersReaderIfAvailable: true)
        self.present(sfViewController, animated: true, completion: nil)
        super.viewDidAppear(false)
    }
    
    
    
    //MARK: - HelperMethods
    
    
    //////////////////////////////////////////////
    /////////////////Helper Methods ///////////////
    /////////////////////////////////////////////
    
    
    //Show Score when game has ended in GameOver Controller
    
    func presentGameOverController(){
        self.performSegue(withIdentifier: "gameOver", sender: self)
    }
    
    
   //Enable User to view events in web browser 
    
    func enableURLLinks() {
        firstEventInfoButton.isEnabled = true
        secondEventInfoButton.isEnabled = true
        thirdEventInfoButton.isEnabled = true
        fourthEventInfoButton.isEnabled = true
        
    }
    
    //Disable URL events 
    
    func disableURLLinks() {
        
        firstEventInfoButton.isEnabled = false
        secondEventInfoButton.isEnabled = false
        thirdEventInfoButton.isEnabled = false
        fourthEventInfoButton.isEnabled = false
    }
    
    //Enable swap buttons for use in game 
    func enableSwapButtons() {
        
        View1Down.isEnabled = true
        View2Down.isEnabled = true
        View3Down.isEnabled = true
        View4Down.isEnabled = true
        View2Up.isEnabled = true
        View3Up.isEnabled = true
        
    }
    
    func disableSwapButton() {
        
        View1Down.isEnabled = false
        View2Down.isEnabled = false
        View3Down.isEnabled = false
        View4Down.isEnabled = false
        View2Up.isEnabled = false
        View3Up.isEnabled = false
        
    }
    
    
    
    func disableTimerButton () {
    
        TimerButton.isEnabled = false
        
    }
    
    func enableTimerButton () {
        TimerButton.isEnabled = true
    }
    
}
    



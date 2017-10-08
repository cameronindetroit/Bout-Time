//
//  Question Provider.swift
//  Bout Time
//
//  Created by admin on 9/29/17.
//  Copyright © 2017 Cameron Barnes. All rights reserved.
//

import Foundation
import GameKit



///////////////////////////////////////////////////////
///////////////// Quiz Events ////////////////////////
/////////////////////////////////////////////////////


//Structure to model Questions

struct EventStructure  {
    
    var event: String
    var year: Int
    var url: URL

    
    init(event: String, year: Int, url: URL) {
        
        self.event = event
        self.year = year
        self.url = url
    }
    
    
}







let event1 =  EventStructure(event: "African Indentured Servants Brought to Jamestown", year: 1619 ,url: URL(string: "http://www.pbs.org/opb/historydetectives/feature/indentured-servants-in-the-us/")!)


let event2 = EventStructure(event: "Declaration of Independence", year: 1776, url: URL(string: "http://www.pbs.org/wgbh/aia/part2/2narr3.html")!)

let event3 = EventStructure(event: "Revolutionary War", year: 1775, url: URL(string: "http://www.pbs.org/wgbh/aia/part2/2narr3.html")!)


let event4 = EventStructure(event: "U.S. Constitution Adopted", year: 1789, url: URL(string: "https://en.wikipedia.org/wiki/Three-Fifths_Compromise")!)



let event5 = EventStructure(event: "Obama Election", year: 2008, url:
    URL(string:"http://news.bbc.co.uk/2/hi/americas/us_elections_2008/7710449.stm")!)


let event6 = EventStructure(event: "Harriet Tubman", year: 1849, url:
    URL(string:"http://www.hartford-hwp.com/archives/45a/168.html")!)


let event7 = EventStructure(event: "Sojourner Truth, Electrifies Women's Rights Conference", year: 1851, url:
    URL(string:"http://www.newsweek.com/and-aint-i-woman-133647")!)


let event8 = EventStructure(event: "Condoleezza Rice", year: 2005, url:
    URL(string:"https://en.wikipedia.org/wiki/Condoleezza_Rice")!)


let event9 = EventStructure(event: "The Emancipation Proclamation", year: 1863, url:
    URL(string:"https://en.wikipedia.org/wiki/Emancipation_Proclamation")!)


let event10 = EventStructure(event: "First Jim Crow Segregation Law Passed", year: 1871, url:
    URL(string:"https://en.wikipedia.org/wiki/Jim_Crow_laws")!)


let event11 =  EventStructure(event: "Plessy v. Ferguson", year: 1896, url:
    URL(string:"https://en.wikipedia.org/wiki/Plessy_v._Ferguson")!)


let event12 = EventStructure(event: " NAACP Established", year: 1909, url:
    URL(string:"https://en.wikipedia.org/wiki/National_Association_for_the_Advancement_of_Colored_People")!)


let event13 = EventStructure(event: "Great Migration Begins", year: 1910, url:
    URL(string:"https://en.wikipedia.org/wiki/Great_Migration_(African_American)")!)


let event14 = EventStructure(event: "World War I", year: 1918, url:
    URL(string:"https://books.google.com/books?id=S1kEAAAAMBAJ&pg=PA44&lpg=PA44&dq=w.e.b.+dubois%22this+is+our+war%22&source=bl&ots=SFS2i2WIUY&sig=lqa3DzXtbTEYvQ2K19RednZQ1Lc&hl=en&ei=47PdS9fpLI6E9AS-oa2rBw&sa=X&oi=book_result&ct=result#v=onepage&q&f=false")!)


let event15 = EventStructure(event: "Jesse Owens Wins Four Gold Medals at Berlin Olympics", year: 1936, url:
    URL(string:"https://en.wikipedia.org/wiki/Jesse_Owens")!)


let event16 = EventStructure(event: "Breaking the Color Line in Baseball", year: 1947, url:
    URL(string:"https://en.wikipedia.org/wiki/Jackie_Robinson")!)


let event17 = EventStructure(event: "Brown v Board of Education", year: 1954, url:
    URL(string:"https://en.wikipedia.org/wiki/Brown_v._Board_of_Education")!)


let event18 = EventStructure(event: "Rosa Parks and the Montgomery Bus Boycott", year: 1955, url:
    URL(string:"https://en.wikipedia.org/wiki/Montgomery_bus_boycott")!)


let event19 = EventStructure(event: "Civil Rights Act Passes Congress", year: 1957, url:
    URL(string:"https://en.wikipedia.org/wiki/Civil_Rights_Act_of_1957")!)


let event20 = EventStructure(event: "Malcolm X Assassinated", year: 1965, url:
    URL(string:"https://en.wikipedia.org/wiki/Malcolm_X")!)


let event21 = EventStructure(event: "Colin Powell", year: 2001, url:
    URL(string:"https://en.wikipedia.org/wiki/Colin_Powell")!)


let event22 = EventStructure(event: "Voting Rights Act", year: 1965, url:
    URL(string:"https://en.wikipedia.org/wiki/Voting_Rights_Act_of_1965")!)


let event23 = EventStructure(event: "Martin Luther King, Jr. Assassinated", year: 1968, url:
    URL(string:"https://en.wikipedia.org/wiki/Martin_Luther_King_Jr.")!)


let event24 = EventStructure(event: "Red Summer Race Riots", year: 1919, url:
    URL(string:"https://en.wikipedia.org/wiki/Red_Summer")!)


let event25 = EventStructure(event: "East Saint Louis Race Riots", year: 1917, url:
    URL(string:"https://en.wikipedia.org/wiki/East_St._Louis_riots")!)



//Array to hold all events

var  periodEvents: [EventStructure] = [event1,event2,event3,event4,event5,event6,event7,event8,event9,event10,event11,event12,event13,event14,event15,event16,event17,event18,event19,event20,event21,event22,event23,event24,event25]


















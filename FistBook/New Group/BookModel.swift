//
//  BookModel.swift
//  FistBook
//
//  Created by Christopher Woods on 11/11/23.
//

import Foundation
import SwiftUI



struct PageView: View{
    let page: Page
    let pageNumber: Int
    let onNextPage: () -> Void
    @State var myShake = true
    @State var isHelped = true
    @State var decision = ""
    @State var thugsDead = 0
    
    
    var body: some View{
        ZStack{
            Color(.background)
                .ignoresSafeArea()
            VStack{
                Text("Page \(pageNumber)")
                
                
                
                if let imageName = page.imageName{
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 400)
                        .onTapGesture{
                            if page.pageNumber > 9{
                                isHelped = false
                            }
                        }
                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in
                            if page.pageNumber == 12{
                                thugsDead += 1
                            }
                        }
                    
                    
                }
                if decision == "Eat"{
                    Text("\(mainCharacter) eats the sandwich, causing everyone in wano to starve.")
                        .padding()
                    
                }
                else if decision == "Multiply"{
                    Text("\(mainCharacter) uses magical powers to multiply the sandwich allowing everyone to have food and no longer fight")
                        .padding()
                }
                
                else{
                    if let text = page.pageText{
                        Text(chapterText[text])
                            .padding()
                    }
                    if page.isHelp != nil{
                        Text(isHelped ? "" : "Thank you so much \(mainCharacter)")
                            .padding()
                    }
                    if page.pageNumber == 12{
                        Text("Thugs Alive : \(3 - thugsDead)")
                            .padding()
                        
                    }
                    
                    
                }
                
                
                
                Spacer()
                
                
                
                if let isShake = page.isShake{
                    if isShake == true{
                        Button("Next Page"){
                            onNextPage()
                        }.onShake {
                            myShake = false
                        }
                        .disabled(myShake)
                        .padding()
                        
                    }
                }else{
                    if let isHelp = page.isHelp{
                        if isHelp == true{
                            Button("Next Page"){
                                onNextPage()
                            }
                            .disabled(isHelped)
                            .padding()
                            
                        }
                    }else{
                        if page.pageNumber == 12{
                            Button("Next Page"){
                                onNextPage()
                            }
                            .disabled(thugsDead <= 3)
                            .padding()
                        }
                        else{
                            if page.pageNumber == 15{
                                HStack{
                                    Button("Eat"){
                                        decision = "Eat"
                                        onNextPage()
                                        
                                    }
                                    .padding()
                                    
                                    Button("Multiply")
                                    {
                                        decision = "Multiply"
                                        onNextPage()
                                        
                                    }
                                    .padding()
                                }
                                
                            }else{
                                if page.pageNumber == 16{
                                    
                                }
                                else{
                                    Button("Next Page"){
                                        onNextPage()
                                        
                                    }
                                    .padding()
                                }
                                
                            }
                        }
                    }
                }
                
                
                
                
            }
            
        }
    }
    
}


struct Book{
    let pages: [Page]
}

struct Page{
    let pageNumber: Int
    var imageName: String? = nil
    var pageText: Int? = nil
    
    
    var isShake: Bool? = nil
    var isHelp: Bool? = nil
    
}


let myBook = Book(pages: 
                    [Page(pageNumber: 1, imageName: "FootballFight", pageText: 0),
                     Page(pageNumber: 2, imageName: "Referee", pageText: 1),
                     Page(pageNumber: 3, imageName: "Crowds", pageText: 1),
                     Page(pageNumber: 4, imageName: "Trophy", pageText: 2),
                     Page(pageNumber: 5, imageName: "Black", pageText: 3, isShake: true),
                     Page(pageNumber: 6, imageName: "CowboyTown", pageText: 4),
                     Page(pageNumber: 7, imageName: "CowboyFight", pageText: 5),
                     Page(pageNumber: 8, imageName: "CowboyCheering", pageText: 6),
                     
                     
                     Page(pageNumber: 9, imageName: "HelpTown", pageText: 7),
                     
                     Page(pageNumber: 10, imageName: "MedicineMan", pageText: 8, isHelp: true),
                     
                     Page(pageNumber: 11, imageName: "CowboyStore", pageText: 9),
                    
                     Page(pageNumber: 12, imageName: "Bandits", pageText: 10),
                     
                     Page(pageNumber: 13, imageName: "ThankYou", pageText: 11),
                     
                     Page(pageNumber: 14, imageName: "Wano", pageText: 12),
                     
                     Page(pageNumber: 15, imageName: "Sandwich", pageText: 13),
                     
                     Page(pageNumber: 16, imageName: "End", pageText: 14)
                    
                    ])



let chapterText = [
    "Once upon a time, there was a developer named \(mainCharacter). \(mainCharacter) walked into town and there were people fighting. In the heart of Detroit, a battle was brewing. \(theOpp) fans were concentrated in the downtown because the Lions had entered the Super Bowl against them. The game was tied, and with all of the money on the line, the fans were fighting out an ending of their own.",
    
    "With the stands in such a mess the game was called off, and the stadium evacuated. All over downtown Detroit, Michiganders battled the \(theOpp) fans attempting to bring home the win for their team.",

    "\(mainCharacter) was walking home from work at the Apple Developer Academy, when they got hit in the head with the Lambardi trophy",
    
    "Shake to wake up",
    
    "After waking up from the injury, \(mainCharacter) realizes he's no longer in modern day detroit, rather detroit 200 years ago.",
    
    "\(mainCharacter) sees a towny gettin beatup by some thugs then intervieens with an axe handle to save the day.\(mainCharacter) then is asked to join in 2 the other fights.",
    
    "Now \(mainCharacter) is a real hero to all 100 of the townies",
    
    "Our hero \(mainCharacter) walks into his next town on his journy across the country. The town looks like it can use his help.",

    "Hello traveler, my name is \(townie1.name). My son is sick and the doctor doesnt have the medicine he needs and the next closest place is days away. Please help!! (Tap to help)",
    
    "\(mainCharacter) continued his journey he got thirsty, and went to the store for some water when he started a converstaion with the clerk",
    
    "The clerk talked about the local bandits that robbed him, and as he was telling his story, the bandits arrived!!(ScreenShot to Shoot)",
    
    "Thank you so much for saving my store, but you should get out of here before the Sherrif Arives!",
    
    "\(mainCharacter) rapidly leaves the area and wanders into his final adventure in a town called Wano. In Wano the people were fighting over a lack of food.",
    
    "\(mainCharacter) found a delicious sandwich in the center of the town. Now he had a decision to make",
    ""
    
    

]





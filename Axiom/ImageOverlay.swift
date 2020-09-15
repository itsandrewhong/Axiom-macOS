//
//  ImageOverlay.swift
//  Demo
//
//  Created by Andrew Hong on 9/13/20.
//  Copyright © 2020 Raonpia. All rights reserved.
//

import SwiftUI

struct ImageOverlay: View {
    @State var selectedQuote: Quote
    @State var selectedImageName: String
    
    //  Timer: 5 minutes
    let timer = Timer.publish(every: 5 * 60, on: .main, in: .common).autoconnect()
    
    func updateQuote() {
        //  Update Quote
        selectedQuote = quotes.randomElement()!
        
        // Update background image
        selectedImageName = images.randomElement()!
    }
    
    var body: some View {
        ZStack {
            //  Background Image
            Image("\(self.selectedImageName)")
                .resizable()
            
            // Black transparent box
            Rectangle()
                .fill(Color.black)
                .opacity(0.65)
            
            
            //  Allows auto-sizing
            GeometryReader{g in
                VStack{
                    Text("􀌮")
                        .font(.system(size: g.size.height > g.size.width ? g.size.width * 0.15: g.size.height * 0.15))
                        .minimumScaleFactor(0.01)
                        .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                        .foregroundColor(.white)
                                        
                    Text("\(self.selectedQuote.text)")
                        .font(.system(size: g.size.height > g.size.width ? g.size.width * 0.3: g.size.height * 0.3))
                        .minimumScaleFactor(0.01)
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20))
                        .shadow(radius: 40)
                        .foregroundColor(.white)
                        
                        //  Updates quote every 5 minutes
                        .onReceive(self.timer) { time in
                            self.updateQuote()
                    }
                    
                    //  Horizontal Divider
                    Divider().background(Color.white)
                        .frame(width: g.size.width * 0.15)
                        .padding(10)
                        .minimumScaleFactor(0.01)
                    
                    Text("\(self.selectedQuote.author)")
                        .minimumScaleFactor(0.01)
                    
                    //  Refresh button
                    HStack {
                        Button(action: {
                            print("Refresh tapped!")
                            self.updateQuote()
                        }
                        ) {
                            Text("􀚁")
                                .fontWeight(.thin)
                                .font(.title)
                                .padding(12)
                                .background(Color.clear)
                                .cornerRadius(40)
                                .foregroundColor(.white)
                                .minimumScaleFactor(0.01)
                            }.background(Color.clear)
                        
                    }.buttonStyle(BorderlessButtonStyle())
                }
            }
//            .padding(EdgeInsets(top: 50, leading: 50, bottom: 50, trailing: 50))
        }
    }
}

struct ImageOverlay_Previews: PreviewProvider {
    
    static var previews: some View {
        ImageOverlay(selectedQuote: quotes.randomElement()!,
                     selectedImageName: images.randomElement()!)
    }
}

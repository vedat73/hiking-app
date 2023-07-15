//
//  CardView.swift
//  hiking
//
//  Created by Vedat Ozlu on 15.07.2023.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    // @State keyword is used to indicate that this is variable in the struct is mutable, also when this value is changed then reset the struct view. Works like setState in flutter
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet : Bool = false
    
    // MARK: - FUNCTIONS
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while(randomNumber == imageNumber)
        imageNumber = randomNumber
    }
    var body: some View {
        // MARK: - CARD
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK: - HEADER
                VStack(alignment:.leading) {
                    HStack {
                        // MARK: - Title
                        Text("Hiking")
                             .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(
                                colors:
                                [              .customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)) //:Title
                        Spacer()
                        Button {
                            // ACTION : Show a sheet
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }
                    }
                    Text("Fund and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                } //: HEADER
                .padding(.horizontal,30)
                // MARK: - MAIN CONTENT
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                    .resizable()
                    .scaledToFit()
                    .animation(.easeIn(duration: 0.5), value: imageNumber)
                }
                // MARK: - FOOTER
                Button {
                    // ACTION: Generate a random number
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(
                            colors: [.customGreenLight,.customGreenMedium],
                            startPoint: .top,
                            endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25),radius: 0.25,x:1,y:2)
                }
                .buttonStyle(GradientButton())
                
            }
        } // : CARD
        .frame(width: 320,height: 570 )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

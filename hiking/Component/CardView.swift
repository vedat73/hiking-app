//
//  CardView.swift
//  hiking
//
//  Created by Vedat Ozlu on 15.07.2023.
//

import SwiftUI

struct CardView: View {
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
                            print("button was pressed")
                        } label: {
                            CustomButtonView()
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
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                Color("ColorIndigoMedium"),
                                Color("ColorSalmonLight")],
                                           startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 256,height: 256)
                    Image("image-1")
                        .resizable()
                    .scaledToFit()
                }
                // MARK: - FOOTER
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

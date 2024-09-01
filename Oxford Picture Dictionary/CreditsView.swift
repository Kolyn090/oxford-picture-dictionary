//
//  CreditsView.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 8/9/24.
//

import SwiftUI

struct CreditsView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .opacity(1)
                .foregroundStyle(Color.BackgroundColor)
            
            ScrollView(.vertical) {
                Text("Credits")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.TextColorPrimary)
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("E. C. Parnwell")
                    .font(.custom("Arial", size: 18))
                    .foregroundStyle(Color.TextColorPrimary)
                
                Spacer()
                    .padding(.vertical)
                
                Text("Illustrations by:")
                    .font(.italic(.custom("Times New Roman", size: 18))())
                    .foregroundStyle(Color.TextColorPrimary)
                Text("Ray Burns")
                    .font(.custom("Times New Roman", size: 18))
                    .foregroundStyle(Color.TextColorPrimary)
                Text("Bob Giuliani")
                    .font(.custom("Times New Roman", size: 18))
                    .foregroundStyle(Color.TextColorPrimary)
                Text("Laura Hartman")
                    .font(.custom("Times New Roman", size: 18))
                    .foregroundStyle(Color.TextColorPrimary)
                Text("Pamela Johnson")
                    .font(.custom("Times New Roman", size: 18))
                    .foregroundStyle(Color.TextColorPrimary)
                Text("Melodye Rosales")
                    .font(.custom("Times New Roman", size: 18))
                    .foregroundStyle(Color.TextColorPrimary)
                Text("Raymond Skibinski")
                    .font(.custom("Times New Roman", size: 18))
                    .foregroundStyle(Color.TextColorPrimary)
                Text("Joel Snyder")
                    .font(.custom("Times New Roman", size: 18))
                    .foregroundStyle(Color.TextColorPrimary)
                
                Spacer()
                    .padding(.vertical)
                
                Text("Software by:")
                    .font(.italic(.custom("Times New Roman", size: 18))())
                    .foregroundStyle(Color.TextColorPrimary)
                Text("Jianxin (Kolyn) Lin")
                    .font(.custom("Times New Roman", size: 18))
                    .foregroundStyle(Color.TextColorPrimary)
                
                Spacer()
                    .padding(.vertical)
                
                Text("Assets used:")
                    .font(.italic(.custom("Times New Roman", size: 18))())
                    .foregroundStyle(Color.TextColorPrimary)
                Text("The New Oxford Picture Dictionary: https://homepage.ntu.edu.tw/~karchung/OxfordPictureDictionary.pdf")
                    .font(.custom("Times New Roman", size: 18))
                    .foregroundStyle(Color.TextColorPrimary)
                    .padding(.horizontal)
                Text("flags icons: https://www.flaticon.com/free-icons/flags")
                    .font(.custom("Times New Roman", size: 18))
                    .foregroundStyle(Color.TextColorPrimary)
                    .padding(.horizontal)
                
                Spacer()
                    .padding(.vertical)
                
                Text("Translators:")
                    .font(.italic(.custom("Times New Roman", size: 18))())
                    .foregroundStyle(Color.TextColorPrimary)
                Text("English: Oxford University Press")
                    .font(.custom("Times New Roman", size: 18))
                    .foregroundStyle(Color.TextColorPrimary)
                Text("Chinese: Jianxin (Kolyn) Lin")
                    .font(.custom("Times New Roman", size: 18))
                    .foregroundStyle(Color.TextColorPrimary)
                
                Spacer()
                    .padding(.vertical)
                
                Text("Please share your feedback regarding this software via")
                    .font(.italic(.custom("Times New Roman", size: 18))())
                    .foregroundStyle(Color.TextColorPrimary)
                Text("kolynlin@protonmail.com")
                    .font(.custom("Times New Roman", size: 18))
                    .foregroundStyle(Color.TextColorPrimary)
                
                Spacer()
                    .padding(.vertical)
                
                HStack {
                    Text("Oxford Picture Dictionary")
                        .fontDesign(.monospaced)
                        .foregroundStyle(Color.TextColorPrimary)
                    Text("is a free open source project released under Open Software License 3.0")
                        .font(.custom("Times New Roman", size: 18))
                        .foregroundStyle(Color.TextColorPrimary)
                }
                .padding(.horizontal)
                
                Text("If you want to participate in the translation, please go to https://github.com/Kolyn090/oxford-picture-dictionary for instructions.")
                    .font(.custom("Times New Roman", size: 18))
                    .foregroundStyle(Color.TextColorPrimary)
                    .padding(.horizontal)
                
                Spacer()
                    .padding(.vertical)
            }
        }
    }
}

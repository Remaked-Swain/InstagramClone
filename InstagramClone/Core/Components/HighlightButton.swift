//
//  HighlightButton.swift
//  InstagramClone
//
//  Created by Swain Yun on 2023/07/13.
//

import SwiftUI

struct HighlightButton: View {
    let title: String
    let image: String
    
    init(title: String = "새로 만들기", image: String = "plus") {
        self.title = title
        self.image = image
    }
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: 80, height: 80)
                .foregroundColor(.gray.opacity(0.3))
                .overlay(
                    Circle()
                        .frame(width: 76, height: 76)
                        .foregroundColor(.white)
                        .overlay(
                            Image(systemName: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18, height: 18)
                        )
                )
            
            Text(title)
                .font(.callout)
        }
    }
}

struct HighlightButton_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal) {
            HighlightButton()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 10)
        .padding(.horizontal)
    }
}

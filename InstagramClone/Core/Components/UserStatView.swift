//
//  UserStatView.swift
//  InstagramClone
//
//  Created by Swain Yun on 2023/07/13.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.headline)
            Text(title)
        }
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 51, title: "게시물")
    }
}

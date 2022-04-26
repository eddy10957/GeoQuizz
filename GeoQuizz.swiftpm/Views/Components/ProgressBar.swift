//
//  ProgressBar.swift
//  
//
//  Created by Edoardo Troianiello on 23/04/22.
//

import SwiftUI

struct ProgressBar: View {
    
    var progress : CGFloat
    
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .foregroundColor(Color(red: 0.1843137254901961, green: 0.4588235294117647, blue: 0.2784313725490196))
                .cornerRadius(10)
            
            Rectangle()
                .frame(maxWidth: progress, maxHeight: 4)
                .foregroundColor(Color("AccentColor"))
                .cornerRadius(10)
        }
        
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 10)
    }
}

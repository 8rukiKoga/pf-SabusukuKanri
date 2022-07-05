//
//  SampleView.swift
//  SabusukuKanri
//
//  Created by 古賀遥貴 on 2022/07/05.
//

import SwiftUI

struct SampleView: View {
    let test = "Hello, world."
    var body: some View {
        let t = test.prefix(3)
        Text(t)
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}

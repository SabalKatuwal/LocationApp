//
//  loadingView.swift
//  WeatherApp
//
//  Created by Sabal on 7/24/23.
//

import SwiftUI

struct loadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct loadingView_Previews: PreviewProvider {
    static var previews: some View {
        loadingView()
    }
}

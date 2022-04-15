//
//  MotherView.swift
//  MyApp
//
//  Created by Michael Ha on 4/13/22.
//


import SwiftUI

struct MotherView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .page1:
            View1(viewRouter: viewRouter)
        case .page2:
            View2(viewRouter: viewRouter)
        case .page3:
            View3(viewRouter: viewRouter)
        case .page4:
            View4(viewRouter: viewRouter)
        }
    
    
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}

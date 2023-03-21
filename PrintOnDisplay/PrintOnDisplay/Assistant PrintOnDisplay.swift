//
//  Assistant_PrintOnDisplay.swift
//  PrintOnDisplay
//
//  Created by 渡辺幹 on 2023/03/21.
//

import SwiftUI

struct PrintOnDisplayView: View {
    @ObservedObject var model: PrintOnDisplayModel = .printOnDisplay
    @State var position: CGPoint = CGPoint(x: 0, y: 0)
    var body: some View {
        VStack {
            ForEach(model.messages) { status in
                Text(status.message)
                    .foregroundColor(status.color)
                    .overlay(content: {})
            }
        }
        .background(Color.gray)
        .opacity(model.viewOpacity)
        .onAppear() {
            position = CGPoint(x: phone.w*0.3, y: phone.h*0.3)
        }
        .gesture(DragGesture()
            .onChanged({ value in
                self.position = value.location
            }))
    }
}

class PrintOnDisplayModel: ObservableObject {
    static let printOnDisplay = PrintOnDisplayModel()
    init(){}
    
    @Published var messages: [dispMessage] = []
    @Published var viewOpacity = 0.0
    
    func printA(_ message: String, _ color: Color = .black, _ isEmphasis: Bool = false) {
        viewOpacity = 0.7
        messages.append(
            dispMessage(message: message, color: color, isEmphasis: isEmphasis)
        )
    }
}

struct dispMessage: Identifiable {
    var id: String = UUID().uuidString
    var message: String
    var color: Color
    var isEmphasis: Bool
}

struct phone {
    static let w = UIScreen.main.bounds.width
    static let h = UIScreen.main.bounds.height
}

struct Assistant_PrintOnDisplay_Previews: PreviewProvider {
    static var previews: some View {
        PrintOnDisplayView()
    }
}

//
//  ContentView.swift
//  AGadgetBogotaWalking
//
//  Created by Juan Manuel Moreno on 9/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var address: String
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Rectangle()
                        .modifier(DiscTourModifier(text: "C", color: .cyan, frame: CGSize(width: 89, height: 89), onTouch: { address += "calle " } ))
                    Rectangle()
                        .modifier(DiscTourModifier(text: "K", color: .pink, frame: CGSize(width: 89, height: 89), onTouch: { address += "carrera " } ))
                    Rectangle()
                        .modifier(DiscTourModifier(text: "T", color: .purple, frame: CGSize(width: 89, height: 89), onTouch: { address += "transversal " } ))
                    Rectangle()
                        .modifier(DiscTourModifier(text: "D", color: .yellow, frame: CGSize(width: 89, height: 89), onTouch: { address += "diagonal " } ))
                    Rectangle()
                        .modifier(DiscTourModifier(text: "A", color: .yellow, frame: CGSize(width: 89, height: 89), onTouch: { address += "avenida " } ))
                    Rectangle()
                        .modifier(DiscTourModifier(text: "#", color: .yellow, frame: CGSize(width: 89, height: 89), onTouch: { address += "# " } ))
                }
                VStack {
                    Rectangle()
                        .modifier(DiscTourModifier(text: "Y", color: .cyan, frame: CGSize(width: 89, height: 89), onTouch: { print("Aqui ver como al teclado mostrarlopara escribir dirección") } ))
                    Rectangle()
                        .modifier(DiscTourModifier(text: "N", color: .pink, frame: CGSize(width: 89, height: 89), onTouch: { UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil) } ))
                    Rectangle()
                        .modifier(DiscTourModifier(text: "CmdC", color: .pink, frame: CGSize(width: 89, height: 89), onTouch: {
                                let pasteboard = UIPasteboard.general
                            pasteboard.string = self.address
                            } ))
                }
            }
            TextEditor(text: $address)
        }
        .padding()
    }
}

struct DiscTourModifier: ViewModifier {
    var text: String
    var color: Color
    var frame: CGSize
    var onTouch: () -> Void
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .frame(width: frame.width, height: frame.height)
            .overlay(
                Text(text)
            )
            .clipShape(Circle())
            .onTapGesture {
                onTouch()
            }
    }
}

#Preview {
    ContentView(address: "")
}

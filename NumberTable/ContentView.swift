//
//  ContentView.swift
//  NumberTable
//
//  Created by Jongwook Park on 2023/06/14.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var selectIndex: Int = 0
    @State var result: String = "(result)"
    
    let speechSynth = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Text("#Table")
                .font(.headline)
                .padding()
            
            HStack {
                Group {
                    Button {
                        // action 클로저 담길 영역
                        updateSelectedIndex(1)
                    } label: {
                        // label View 코드가 담길 영역
                        Text("1")
                            .font(.largeTitle)
                    }

                    Spacer()
                }
                Group {
                    Button {
                        updateSelectedIndex(2)
                    } label: {
                        Text("2")
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                }
                Group {
                    Button {
                        updateSelectedIndex(3)
                    } label: {
                        Text("3")
                            .font(.largeTitle)
                    }

                    Spacer()
                }
                Group {
                    Button {
                        updateSelectedIndex(4)
                    } label: {
                        Text("4")
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                }
                Group {
                    Button {
                        updateSelectedIndex(5)
                    } label: {
                        Text("5")
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                }
                Group {
                    Button {
                        updateSelectedIndex(6)
                    } label: {
                        Text("6")
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                }
                Group {
                    Button {
                        updateSelectedIndex(7)
                    } label: {
                        Text("7")
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                Group {
                    Button {
                        updateSelectedIndex(8)
                    } label: {
                        Text("8")
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                }
                Group {
                    Button {
                        updateSelectedIndex(9)
                    } label: {
                        Text("9")
                            .font(.largeTitle)
                    }
                }
            }
            .padding()
            
            if selectIndex > 0 {
                Text("Table for \(selectIndex)")
                    .font(.largeTitle)
                    .padding()
                
                Text("\(result)")
                    .font(.largeTitle)
                
                HStack {
                    Button {
                        let message = "\(result)"
                        
                        let utterance = AVSpeechUtterance(string: message)
                        speechSynth.speak(utterance)
                        
                    } label: {
                        Text("Say it")
                            .font(.largeTitle)
                            .padding()
                    }
                    
                    Button {
                        speechSynth.stopSpeaking(at: .immediate)
                        
                    } label: {
                        Text("Stop it")
                            .font(.largeTitle)
                            .padding()
                    }
                }
            }
            
            Spacer()
        }
        
    }
    
    func updateSelectedIndex(_ index: Int) {
        selectIndex = index
        print("\(selectIndex)")
        
        result = """
            \(selectIndex) x 1 = \(selectIndex * 1)
            \(selectIndex) x 2 = \(selectIndex * 2)
            \(selectIndex) x 3 = \(selectIndex * 3)
            \(selectIndex) x 4 = \(selectIndex * 4)
            \(selectIndex) x 5 = \(selectIndex * 5)
            \(selectIndex) x 6 = \(selectIndex * 6)
            \(selectIndex) x 7 = \(selectIndex * 7)
            \(selectIndex) x 8 = \(selectIndex * 8)
            \(selectIndex) x 9 = \(selectIndex * 9)
            """
        
        // 위 방법 말고 for-in 반복문으로 만드는 방법은?
        result = ""
        
        for indexTemp in 1...9 {
            result = result + "\(selectIndex) \u{D7} \(indexTemp) = \(selectIndex * indexTemp)\n"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ViewController.swift
//  QuestionPB
//
//  Created by eric on 2020/9/11.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var questions = [Question]()
    var index = 0
    var count = 1
    
 

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    
        
        let question1 = Question()
        question1.question = "紅 豆 生 南 國 春 來 發 幾 枝 願 君 多 采 擷 此 物 最 相 思"
        question1.answer = "相 思"
        questions.append(question1)
        
        let question2 = Question()
        question2.question = "床 前 明 月 光 疑 是 地 上 霜 舉 頭 望 明 月 低 頭 思 故 鄉 "
        question2.answer = "夜 思"
        questions.append(question2)
        
        let question3 = Question()
        question3.question = "春 眠 不 覺 曉 處 處 聞 啼 鳥 夜 來 風 雨 聲 花 落 知 多 少 "
        question3.answer = "春 曉"
        questions.append(question3)
        
        let question4 = Question()
        question4.question = "白 日 依 山 盡　黃 河 入 海 流 欲 窮 千 里 目　更 上 一 層 樓 "
        question4.answer = "登 鸛 鵲 樓"
        questions.append(question4)
        
        let question5 = Question()
        question5.question = "山 中 相 送 罷　日 暮 掩 柴 扉 春 草 明 年 綠　王 孫 歸 不 歸 "
        question5.answer = "送 別"
        questions.append(question5)
        
        let question6 = Question()
        question6.question = "千 山 鳥 飛 絕 萬 徑 人 蹤 滅 孤 舟 蓑 笠 翁　獨 釣 寒 江 雪"
        question6.answer = "江 雪"
        questions.append(question6)
        
        let question7 = Question()
        question7.question = "終 南 陰 嶺 秀　積 雪 浮 雲 端 林 表 明 霽 色　城 中 增 暮 寒"
        question7.answer = "終南望餘雪"
        questions.append(question7)
        
        let question8 = Question()
        question8.question = "孤 雲 將 野 鶴 豈 向 人 間 住 莫 買 沃 洲 山 時 人 已 知 處"
        question8.answer = "送 上 人"
        questions.append(question8)
        
        let question9 = Question()
        question9.question = "歸 山 深 淺 去 須 盡 邱 壑 美 莫 學 武 陵 人 暫 游 桃 源 裡"
        question9.answer = "送 崔 九"
        questions.append(question3)
        
        let question10 = Question()
        question10.question = "嶺 外 音 書 絕 經 冬 復 歷 春 近 鄉 情 更 怯 不 敢 問 來 人 "
        question10.answer = "渡 漢 江"
        questions.append(question10)
        
        let question11 = Question()
        question11.question = "向 晚 意 不 適 驅 車 登 古 原 夕 陽 無 限 好 只 是 近 黃 昏"
        question11.answer = "登 樂 遊 原"
        questions.append(question11)
        
        let question12 = Question()
        question12.question = "君 自 故 鄉 來 應 知 故 鄉 事 來 日 綺 窗 前 寒 梅 著 花 未"
        question12.answer = "雜 詩"
        questions.append(question12)
        
        let question13 = Question()
        question13.question = "三 日 入 廚 下 洗 手 作 羹 湯 未 諳 姑 食 性 先 遣 小 姑 嘗"
        question13.answer = "新 嫁 娘 詞"
        questions.append(question13)
        
        questions.shuffle()
        
      
   speek()
        
        questionLabel.text = questions[0].question
        countLabel.text = "題目：\(count)"
    
    }

    func speek(){
        
        let speechUtterance = AVSpeechUtterance(string: "\(questions[index].question)")
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        speechUtterance.rate = 0.5
        speechUtterance.postUtteranceDelay = 50
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        index = index + 1
        count = count + 1
        if index == 10 {
        index = 0
        count = 1
        }
        
        questionLabel.text = questions[index].question
        
        countLabel.text = "題目：\(count)"
        speek()
//        let speechUtterance = AVSpeechUtterance(string: "\(questions[index].question)")
//        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
//        speechUtterance.rate = 0.5
//        speechUtterance.postUtteranceDelay = 50
//        let synthesizer = AVSpeechSynthesizer()
//        synthesizer.speak(speechUtterance)
//
        answerLabel.text = ""
        
    }
 
    @IBAction func replayBtn(_ sender: Any) {
        index = 0
        count = 1
       speek()
        questionLabel.text = questions[index].question
        countLabel.text = "題目：\(count)"
        answerLabel.text = ""
    }
    
    @IBAction func answerBtn(_ sender: Any) {

        let speechUtterance = AVSpeechUtterance(string: "\(questions[index].answer)")
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        speechUtterance.rate = 0.5
        speechUtterance.postUtteranceDelay = 50
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
      
        answerLabel.text = questions[index].answer
    }
    
    
    
}


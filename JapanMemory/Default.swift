//
//  Default.swift
//  JapanMemory
//
//  Created by gebiwanger on 2024/1/16.
//

import Foundation

class Default {
  static var privateTypes = ["Yin", "Word", "Sentence"]
  static var privateSegments = [ "All", "Raw", "Alias", "Raw&Alias", "Des" ]
}

let defaultConfig: String = """
{
  "10_type_sel" : "Yin",
  "20_repeat_sel" : 1.5,
  "21_repeats" : [
    1,
    1.5,
    2,
    3,
    5
  ],
  "30_segment_sel" : "All",
  "40_yin_items" : [
    {
      "10_raw" : "あ",
      "20_alias" : "ア",
      "30_des" : "a",
      "40_filted" : true
    },
    {
      "10_raw" : "い",
      "20_alias" : "イ",
      "30_des" : "i",
      "40_filted" : false
    },
    {
      "10_raw" : "う",
      "20_alias" : "ウ",
      "30_des" : "u",
      "40_filted" : false
    },
    {
      "10_raw" : "え",
      "20_alias" : "エ",
      "30_des" : "e",
      "40_filted" : false
    },
    {
      "10_raw" : "お",
      "20_alias" : "オ",
      "30_des" : "o",
      "40_filted" : false
    },
    {
      "10_raw" : "か",
      "20_alias" : "カ",
      "30_des" : "ka",
      "40_filted" : true
    },
    {
      "10_raw" : "き",
      "20_alias" : "キ",
      "30_des" : "ki",
      "40_filted" : true
    },
    {
      "10_raw" : "く",
      "20_alias" : "ク",
      "30_des" : "ku",
      "40_filted" : true
    },
    {
      "10_raw" : "け",
      "20_alias" : "ケ",
      "30_des" : "ke",
      "40_filted" : true
    },
    {
      "10_raw" : "こ",
      "20_alias" : "コ",
      "30_des" : "ko",
      "40_filted" : true
    },
    {
      "10_raw" : "さ",
      "20_alias" : "サ",
      "30_des" : "sa",
      "40_filted" : true
    },
    {
      "10_raw" : "し",
      "20_alias" : "シ",
      "30_des" : "si",
      "40_filted" : true
    },
    {
      "10_raw" : "す",
      "20_alias" : "ス",
      "30_des" : "su",
      "40_filted" : true
    },
    {
      "10_raw" : "せ",
      "20_alias" : "セ",
      "30_des" : "se",
      "40_filted" : true
    },
    {
      "10_raw" : "そ",
      "20_alias" : "ソ",
      "30_des" : "so",
      "40_filted" : true
    },
    {
      "10_raw" : "た",
      "20_alias" : "タ",
      "30_des" : "ta",
      "40_filted" : true
    },
    {
      "10_raw" : "ち",
      "20_alias" : "チ",
      "30_des" : "ti",
      "40_filted" : true
    },
    {
      "10_raw" : "つ",
      "20_alias" : "ツ",
      "30_des" : "tu",
      "40_filted" : true
    },
    {
      "10_raw" : "て",
      "20_alias" : "テ",
      "30_des" : "te",
      "40_filted" : true
    },
    {
      "10_raw" : "と",
      "20_alias" : "ト",
      "30_des" : "to",
      "40_filted" : true
    },
    {
      "10_raw" : "な",
      "20_alias" : "ナ",
      "30_des" : "na",
      "40_filted" : false
    },
    {
      "10_raw" : "に",
      "20_alias" : "ニ",
      "30_des" : "ni",
      "40_filted" : false
    },
    {
      "10_raw" : "ぬ",
      "20_alias" : "ヌ",
      "30_des" : "nu",
      "40_filted" : true
    },
    {
      "10_raw" : "ね",
      "20_alias" : "ネ",
      "30_des" : "ne",
      "40_filted" : false
    },
    {
      "10_raw" : "の",
      "20_alias" : "ノ",
      "30_des" : "no",
      "40_filted" : false
    },
    {
      "10_raw" : "は",
      "20_alias" : "ハ",
      "30_des" : "ha",
      "40_filted" : true
    },
    {
      "10_raw" : "ひ",
      "20_alias" : "ヒ",
      "30_des" : "hi",
      "40_filted" : true
    },
    {
      "10_raw" : "ふ",
      "20_alias" : "フ",
      "30_des" : "hu",
      "40_filted" : true
    },
    {
      "10_raw" : "へ",
      "20_alias" : "ヘ",
      "30_des" : "he",
      "40_filted" : true
    },
    {
      "10_raw" : "ほ",
      "20_alias" : "ホ",
      "30_des" : "ho",
      "40_filted" : true
    },
    {
      "10_raw" : "ま",
      "20_alias" : "マ",
      "30_des" : "ma",
      "40_filted" : true
    },
    {
      "10_raw" : "み",
      "20_alias" : "ミ",
      "30_des" : "mi",
      "40_filted" : true
    },
    {
      "10_raw" : "む",
      "20_alias" : "ム",
      "30_des" : "mu",
      "40_filted" : true
    },
    {
      "10_raw" : "め",
      "20_alias" : "メ",
      "30_des" : "me",
      "40_filted" : true
    },
    {
      "10_raw" : "も",
      "20_alias" : "モ",
      "30_des" : "mo",
      "40_filted" : true
    },
    {
      "10_raw" : "や",
      "20_alias" : "ヤ",
      "30_des" : "ya",
      "40_filted" : false
    },
    {
      "10_raw" : "-",
      "20_alias" : "-",
      "30_des" : "-",
      "40_filted" : true
    },
    {
      "10_raw" : "ゆ",
      "20_alias" : "ユ",
      "30_des" : "yu",
      "40_filted" : false
    },
    {
      "10_raw" : "-",
      "20_alias" : "-",
      "30_des" : "-",
      "40_filted" : true
    },
    {
      "10_raw" : "よ",
      "20_alias" : "ヨ",
      "30_des" : "yo",
      "40_filted" : false
    },
    {
      "10_raw" : "ら",
      "20_alias" : "ラ",
      "30_des" : "ra",
      "40_filted" : false
    },
    {
      "10_raw" : "り",
      "20_alias" : "リ",
      "30_des" : "ri",
      "40_filted" : false
    },
    {
      "10_raw" : "る",
      "20_alias" : "ル",
      "30_des" : "ru",
      "40_filted" : false
    },
    {
      "10_raw" : "れ",
      "20_alias" : "レ",
      "30_des" : "re",
      "40_filted" : false
    },
    {
      "10_raw" : "ろ",
      "20_alias" : "ロ",
      "30_des" : "ro",
      "40_filted" : false
    },
    {
      "10_raw" : "わ",
      "20_alias" : "ワ",
      "30_des" : "wa",
      "40_filted" : false
    },
    {
      "10_raw" : "-",
      "20_alias" : "-",
      "30_des" : "-",
      "40_filted" : true
    },
    {
      "10_raw" : "-",
      "20_alias" : "-",
      "30_des" : "-",
      "40_filted" : true
    },
    {
      "10_raw" : "-",
      "20_alias" : "-",
      "30_des" : "-",
      "40_filted" : true
    },
    {
      "10_raw" : "を",
      "20_alias" : "ヲ",
      "30_des" : "wo",
      "40_filted" : false
    },
    {
      "10_raw" : "ん",
      "20_alias" : "ン",
      "30_des" : "h",
      "40_filted" : false
    }
  ],
  "50_word_items" : [
    {
      "10_raw" : "こんにちは",
      "20_alias" : "Konnichiwa",
      "30_des" : "你好",
      "40_filted" : true
    },
    {
      "10_raw" : "ありがとう",
      "20_alias" : "Arigatou",
      "30_des" : "谢谢",
      "40_filted" : true
    },
    {
      "10_raw" : "さようなら",
      "20_alias" : "Sayonara",
      "30_des" : "再见",
      "40_filted" : true
    },
    {
      "10_raw" : "おはようございます",
      "20_alias" : "Ohayou gozaimasu",
      "30_des" : "早上好",
      "40_filted" : true
    },
    {
      "10_raw" : "ごめんなさい",
      "20_alias" : "Gomen nasai",
      "30_des" : "对不起",
      "40_filted" : true
    },
    {
      "10_raw" : "お元気ですか",
      "20_alias" : "Ogenki desu ka",
      "30_des" : "你好吗？",
      "40_filted" : true
    },
    {
      "10_raw" : "いいえ",
      "20_alias" : "Iie",
      "30_des" : "不是",
      "40_filted" : true
    },
    {
      "10_raw" : "はい",
      "20_alias" : "Hai",
      "30_des" : "是",
      "40_filted" : true
    },
    {
      "10_raw" : "お願いします",
      "20_alias" : "Onegaishimasu",
      "30_des" : "请",
      "40_filted" : true
    },
    {
      "10_raw" : "すごい",
      "20_alias" : "Sugoi",
      "30_des" : "很棒",
      "40_filted" : true
    },
    {
      "10_raw" : "元気",
      "20_alias" : "Genki",
      "30_des" : "精神饱满",
      "40_filted" : true
    },
    {
      "10_raw" : "おやすみなさい",
      "20_alias" : "Oyasuminasai",
      "30_des" : "晚安",
      "40_filted" : true
    },
    {
      "10_raw" : "どういたしまして",
      "20_alias" : "Dou itashimashite",
      "30_des" : "不客气",
      "40_filted" : true
    },
    {
      "10_raw" : "すみません",
      "20_alias" : "Sumimasen",
      "30_des" : "对不起  打扰一下",
      "40_filted" : true
    },
    {
      "10_raw" : "わかりました",
      "20_alias" : "Wakarimashita",
      "30_des" : "我明白了",
      "40_filted" : true
    },
    {
      "10_raw" : "失礼します",
      "20_alias" : "Shitsurei shimasu",
      "30_des" : "请原谅我  打扰一下",
      "40_filted" : true
    },
    {
      "10_raw" : "いただきます",
      "20_alias" : "Itadakimasu",
      "30_des" : "我要开始吃了",
      "40_filted" : true
    },
    {
      "10_raw" : "ごちそうさまでした",
      "20_alias" : "Gochisousama deshita",
      "30_des" : "谢谢美味的食物",
      "40_filted" : true
    },
    {
      "10_raw" : "わかりません",
      "20_alias" : "Wakarimasen",
      "30_des" : "我不知道",
      "40_filted" : true
    },
    {
      "10_raw" : "いいえ、だめです",
      "20_alias" : "Iie, dame desu",
      "30_des" : "不行",
      "40_filted" : true
    },
    {
      "10_raw" : "どうぞ",
      "20_alias" : "Douzo",
      "30_des" : "请",
      "40_filted" : true
    },
    {
      "10_raw" : "お疲れ様でした",
      "20_alias" : "Otsukaresama deshita",
      "30_des" : "辛苦了  干得好",
      "40_filted" : false
    },
    {
      "10_raw" : "がんばって",
      "20_alias" : "Ganbatte",
      "30_des" : "加油",
      "40_filted" : false
    },
    {
      "10_raw" : "お誕生日おめでとうございます",
      "20_alias" : "Otanjoubi omedetou gozaimasu",
      "30_des" : "生日快乐",
      "40_filted" : false
    },
    {
      "10_raw" : "おめでとうございます",
      "20_alias" : "Omedetou gozaimasu",
      "30_des" : "恭喜你",
      "40_filted" : true
    },
    {
      "10_raw" : "よろしくお願いします",
      "20_alias" : "Yoroshiku onegaishimasu",
      "30_des" : "请多关照",
      "40_filted" : true
    },
    {
      "10_raw" : "これは何ですか",
      "20_alias" : "Kore wa nan desu ka",
      "30_des" : "这是什么",
      "40_filted" : true
    },
    {
      "10_raw" : "わかりますか",
      "20_alias" : "Wakarimasu ka",
      "30_des" : "你懂吗",
      "40_filted" : true
    },
    {
      "10_raw" : "ありがとうございます",
      "20_alias" : "Arigatou gozaimasu",
      "30_des" : "非常感谢",
      "40_filted" : true
    },
    {
      "10_raw" : "これからお世話になります",
      "20_alias" : "Korekara osewa ni narimasu",
      "30_des" : "今后请多关照",
      "40_filted" : true
    },
    {
      "10_raw" : "ごちそうさまでした",
      "20_alias" : "Gochisousama deshita",
      "30_des" : "谢谢美味的食物",
      "40_filted" : true
    },
    {
      "10_raw" : "どんな風に",
      "20_alias" : "Donna fuu ni",
      "30_des" : "以什么方式",
      "40_filted" : true
    },
    {
      "10_raw" : "気をつけて",
      "20_alias" : "Ki o tsukete",
      "30_des" : "请注意安全",
      "40_filted" : true
    },
    {
      "10_raw" : "いくつか",
      "20_alias" : "Ikutsu ka",
      "30_des" : "几个",
      "40_filted" : true
    },
    {
      "10_raw" : "それはありません",
      "20_alias" : "Sore wa arimasen",
      "30_des" : "那没有",
      "40_filted" : true
    },
    {
      "10_raw" : "どうして",
      "20_alias" : "Doushite",
      "30_des" : "为什么",
      "40_filted" : true
    },
    {
      "10_raw" : "もちろん",
      "20_alias" : "Mochiron",
      "30_des" : "当然",
      "40_filted" : true
    },
    {
      "10_raw" : "それは問題ありません",
      "20_alias" : "Sore wa mondai arimasen",
      "30_des" : "那没问题",
      "40_filted" : true
    },
    {
      "10_raw" : "おつかれさま",
      "20_alias" : "Otsukaresama",
      "30_des" : "辛苦了",
      "40_filted" : true
    },
    {
      "10_raw" : "おっと",
      "20_alias" : "Otto",
      "30_des" : "哎呀",
      "40_filted" : true
    },
    {
      "10_raw" : "だれか",
      "20_alias" : "Dareka",
      "30_des" : "有人吗",
      "40_filted" : true
    },
    {
      "10_raw" : "じゃね",
      "20_alias" : "Ja ne",
      "30_des" : "再见",
      "40_filted" : true
    },
    {
      "10_raw" : "さよなら",
      "20_alias" : "Sayonara",
      "30_des" : "再见",
      "40_filted" : false
    }
  ],
  "60_sentence_items" : [
    {
      "10_raw" : "今日は本当にいい天気ですね。そうじゃないですか。",
      "20_alias" : "",
      "30_des" : "今天天气真不错，不是吗？",
      "40_filted" : true
    },
    {
      "10_raw" : "おはようございます。今日も頑張りましょう。",
      "20_alias" : "",
      "30_des" : "早上好，今天也要加油哦。",
      "40_filted" : true
    },
    {
      "10_raw" : "美味しい食べ物が好きです。",
      "20_alias" : "",
      "30_des" : "我喜欢美味的食物。",
      "40_filted" : true
    },
    {
      "10_raw" : "楽しい時間を過ごしましょう。",
      "20_alias" : "",
      "30_des" : "让我们度过愉快的时光。",
      "40_filted" : true
    },
    {
      "10_raw" : "新しい友達を作るのは楽しいです。",
      "20_alias" : "",
      "30_des" : "交新朋友很有趣。",
      "40_filted" : true
    },
    {
      "10_raw" : "今晩何を食べたいですか？",
      "20_alias" : "",
      "30_des" : "今晚想吃什么？",
      "40_filted" : true
    },
    {
      "10_raw" : "日本の文化に興味があります。",
      "20_alias" : "",
      "30_des" : "我对日本文化感兴趣。",
      "40_filted" : true
    },
    {
      "10_raw" : "週末はどう過ごしますか？",
      "20_alias" : "",
      "30_des" : "周末你会怎么度过？",
      "40_filted" : true
    },
    {
      "10_raw" : "お疲れ様でした。ゆっくり休んでください。",
      "20_alias" : "",
      "30_des" : "辛苦了，请好好休息。",
      "40_filted" : true
    },
    {
      "10_raw" : "来週の計画は何ですか？",
      "20_alias" : "",
      "30_des" : "下周有什么计划？",
      "40_filted" : true
    },
    {
      "10_raw" : "良い一日をお過ごしください。",
      "20_alias" : "",
      "30_des" : "祝您度过愉快的一天。",
      "40_filted" : true
    },
    {
      "10_raw" : "この本は難しいけれど、面白いです。",
      "20_alias" : "",
      "30_des" : "这本书虽然难，但很有趣。",
      "40_filted" : true
    },
    {
      "10_raw" : "お腹が空いた。何か食べましょう。",
      "20_alias" : "",
      "30_des" : "肚子饿了，吃点东西吧。",
      "40_filted" : true
    },
    {
      "10_raw" : "これは私の友達です。彼は優しい人です。",
      "20_alias" : "",
      "30_des" : "这是我的朋友，他是个好人。",
      "40_filted" : true
    },
    {
      "10_raw" : "昨日は忙しかったです。",
      "20_alias" : "",
      "30_des" : "昨天很忙。",
      "40_filted" : true
    },
    {
      "10_raw" : "美しい花が咲いています。",
      "20_alias" : "",
      "30_des" : "漂亮的花开了。",
      "40_filted" : false
    },
    {
      "10_raw" : "この町には観光名所がたくさんあります。",
      "20_alias" : "",
      "30_des" : "这个城市有很多旅游景点。",
      "40_filted" : false
    },
    {
      "10_raw" : "お風呂に入るとリラックスできます。",
      "20_alias" : "",
      "30_des" : "泡个澡可以放松。",
      "40_filted" : false
    },
    {
      "10_raw" : "今週末は何か予定がありますか？",
      "20_alias" : "",
      "30_des" : "这个周末有什么计划吗？",
      "40_filted" : false
    },
    {
      "10_raw" : "新しい言葉を学ぶのは楽しいです。",
      "20_alias" : "",
      "30_des" : "学新词汇很有趣。",
      "40_filted" : false
    }
  ]
}
"""

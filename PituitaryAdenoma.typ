// Get Polylux from the official package repository
#import "@preview/touying:0.5.5": *
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
#import themes.university: *

#import "@preview/numbly:0.1.0": numbly

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [下垂体偶発種について],
    subtitle: [なんで頭部CT撮ってんだよ！],
    author: [Nozomi Niimi],
    date: datetime.today(),
    institution: [東京医療センター総合内科],
    // logo: emoji.school,
  ),
)

// for tall slide
#let tall-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-page(
    width: 33.867cm,
    height: 33.867cm,
  ))
  touying-slide(self: self, body)
})




#show link: underline

#set heading(numbering: numbly("{1}.", default: "1.1"))

#import fletcher.shapes: diamond


// Make the paper dimensions fit for a presentation and the text larger
#set footnote.entry(clearance: 0.1em, gap: 0.2em)
#show heading:set align(start + top)
#show heading: set text(size: 28pt)
#set align(horizon)

#let lb = linebreak(justify: false)

// 大まかなゲシュタルトとして若年者の \ 「繰り返す発熱と腹痛(+高CRP)」を忘れない  使用例

#let refs(body) = {
  set text(size: 8pt)
  align(right, body)
}

// #refs("Dysphagia. 2024;39(5):837-845.") 使用例

#set list(marker: ([•], [◦], [🗸]))
#let list-counter = counter("list")

#show list: set text(14pt)
#show list: it => {
  list-counter.step()

  context {
    set text(24pt) if list-counter.get().first() == 1
    set text(20pt) if list-counter.get().first() == 2
    set text(16pt) if list-counter.get().first() >= 3
    it
  }
  list-counter.update(i => i - 1)
}

// for main text
#set text(
    lang: "ja",  // 英語しか使わない文書では"en"とする（もしくは指定しない）
    font: ("Calibri", "Noto Serif CJK JP"),  
    // font: (日本語文字を含まないフォント, 日本語文字を含むフォント),  となっている
)

// Use #polylux-slide to create a slide and style it using your favourite Typst functions

#title-slide(authors: ([Nozomi Niimi]))

== 症例 

- 79歳女性、自宅内転倒で救急搬送
- 頭部CTで下垂体腺腫を指摘される
- 依頼文にて、「偶発的に下垂体腺腫が指摘されておりそちらの精査もお願いします」と


== 下垂体偶発種とは

- 下垂体に偶発的に見つかった結節を”下垂体偶発種”と言う
- 微小の下垂体結節は結構Common
  - 無関係の理由でMRIを撮像したうち、microadenomaは10-38%
  - macroadenomaは0.2%
  - Autopsyだと日本人のうち18%程度の有病率と言われている
    - 日本での1000人の連続するAutopsy患者では178人にIncidentalomaがあり、そのうち34%が2mm以上

#refs("Radiology. 1994;193(1):161-164. doi:10.1148/radiology.193.1.8090885
")

== 下垂体偶発種の疫学

#table(
  columns: (1fr, 1fr),
  table.header(
    [原疾患], [頻度], 
  ),
    [下垂体腺腫], [80-90%],
    [頭蓋咽頭腫], [3%],
    [Rathke嚢胞], [2%],
    [髄膜腫], [1%],
    [下垂体炎], [1%未満],
    [脳動脈瘤], [1-2%]
)

#refs("DynaMed. Sellar Mass - Approach to the Patient. EBSCO Information Services. Accessed 2025年8月2日. 
https://www.dynamed.com/approach-to/sellar-mass-approach-to-the-patient")

- 今回は最多の下垂体腺腫について話していきます

== 下垂体腺腫の分類

- 大きさで分けるのが最も重要
  - 10mm以上: macroadenoma
  - 10mm未満: microadenoma

== 下垂体腺腫の由来

- 実臨床的にはホルモン産生で分けるのが良い
  - Prolactinoma
  - GH産生腫瘍
  - ACTH産生腫瘍
  - TSH産生腫瘍
  - 非機能性腫瘍(non-functioning pituitary adenoma: NFPA)

== 下垂体腺腫 at glance

#figure(
  image("figure/PA_atglance.png", height: 90%)
)
#refs("N Engl J Med. 2020;382(10):937-950. doi:10.1056/NEJMra1810772")



== 下垂体偶発種を語る上で重要な視点

- 上記の通り、Incidentalomaは実は多い
- その為、悉皆調査は基本的には無理
- かつ、分類や下垂体腺腫の種類は本来はOpeしないと分からない
- ⇒ 下垂体腺腫の疫学はその臨床現場 \ (見つかった理由やOpeをしたかなど)に依存する

== 疫学

- Incidentalomaと通常のAdenomaで疫学が変わる
  - 通常のPituitary adenomaの場合
    - 53%がProlactinoma
    - #text(size: 28pt, fill: red, weight: "bold")[30%が非機能性腺腫]
    - 12%がGH産生腫瘍(somatotropinoma)
    - 4%がACTH産生腫瘍(Corticotropinoma)
    - 1%がTSH産生腫瘍(thyrotropinoma)

  - Incidentalomaの場合(約90%がAdenoma)
    - #text(size: 28pt, fill: red, weight: "bold")[約50%が非機能性腺腫]
    - 10%がGH産生腫瘍
    - 15%がGonadothropinoma
- Incidentalomaだと、非機能性腺腫が多い事は注目に値する
#refs("J Clin Endocrinol Metab. 2011;96(4):894-904. doi:10.1210/jc.2010-1048")



== Pituitary incidentalomaを見たら・・・・・・

- 3つの視点で考える
  1. 腫瘍によるホルモン過剰産生
  2. 腫瘍による圧排効果による下垂体機能不全
  3. 腫瘍による視交叉の圧排の有無
- 内科医としてはMEN 1も見逃さない

== ホルモン検査の原則

#figure(
  image("figure/PA_hormone.png", height: 40%)
)
#refs("竹内靖博・竹下彰・辰島啓太編著(2020).虎の門病院内分泌クリニカルプラクティス―外来・入院からフォローアップまで.クリニコ出版")
- ホルモン検査は日内変動が大きい
- Positive/Negative feedbackにより代償されやすい
- ホルモン欠乏の検査: 最も分泌が多い時間帯の測定で判断
  - ホルモン分泌を促進する介入した後の検査もあるがRiskが高い
- ホルモン過剰の検査: ホルモンを抑制する介入をした上で測定

= ホルモン過剰産生

== 基本的な考え方

- Microincidetanlomaでは稀とされる
- Macroadenoma全体では以下の通り
  - Prolactinomaが53%
  - GH産生が12%
  - ACTH産生が4% 
  - TSH産生が1%
- 頻度と治療可能性の観点で考える
  - PRLは#text(fill: red, weight: "bold")[内科的に治療可能]
  - ACTH, GHは#underline[*予後不良で手術の治療適応*]
- PRL, ACTH, GHは検索すべし！！

#refs("JAMA. 2023;329(16):1386-1398. doi:10.1001/jama.2023.5444")

== ホルモン過剰産生の各論

- #link(<hyperprl>)[
   高PRL血症: ルーチンで検査
  ]

- #link(<cushing>)[
   Cushing syndrome: ルーチンで検査(?)
  ]

- #link(<hypergh>)[
   先端巨大症(GH excess): ルーチンで検査
  ]

- #link(<hypertsh>)[
   中枢性甲状腺機能亢進症: ルーチンでは行わない
  ]

== 高PRL血症 #label("hyperprl")


- PRL > 250 mcg/Lは特異度100％でProlactinoma
- 一方で中途半端な高値は色々な理由がある
  - 妊娠、薬剤(D2 blocker)や甲状腺機能を確認する
- 更に下垂体腺腫自身の茎部圧迫によるもの(Stalk effect)のもありうる
  - Stalk effectだけではPRL < 150 mcg/L程度である事が多い
#refs("JAMA. 2023;329(16):1386-1398. doi:10.1001/jama.2023.5444")

== Cushing syndrome #label("cushing")

- 2011年のガイドラインだと実はルーチン検査ではない \ (臨床的に疑った時のみ)
#refs("J Clin Endocrinol Metab. 2011;96(4):894-904. doi:10.1210/jc.2010-1048")
- 個人的には、Macroadenomaならばルーチンで行うべきと考える
- 3種類の方法があるが、一番簡単なのはLDST
  - LDST(1mg Dex負荷試験)：感度98.6%, 特異度90.6%
  - 24時間蓄尿のFree cortisol:感度94%, 特異度93%
  - 夜間唾液中cortisol：感度95.8%, 特異度93.4%

== 先端巨大症(GH excess) #label("hypergh")

- GHの値だけでは診断出来ない
- IGF-1：年齢調整されたCutoffで感度、特異度はほぼ100% \ (12-18歳、妊婦以外)
- OGTT検査でGH ≧0.4 mcg/L(抑制されない)は \ 感度85-90%, 特異度は95%を超える

== 中枢性甲状腺機能亢進症 #label("hypertsh")

- TSH過剰症の検査はルーチンでは行わない
  - ただし、ホルモン欠乏とか考えると結局検査している
- 血清FT4高値で、TSHが不適切に正常～高値の感度は約100%

== いつ、どのように検査をする？

- ホルモン過剰について、Macroadenomaにおいても明らかなScreening方法は決まっていない
  - 2011年のガイドラインでは、PRLとGHはルーチンで測定を推奨。\ ACTHは臨床所見をみての検査を推奨している。
    - Prolactinomaは経口での治療が可能なため
    - GH過剰産生は予後に強く影響する上に初期は無症候である事が多いため
    - ACTHも同じ理由でExpertによっては検査をするとの事
  - Review論文だと下垂体のホルモン過剰産生はProlactin, IGF-1の測定で \ 除外すべきとの記載あり
  - UptodateだとPRL、IGF-1、LH、FSH、ACTH、24時間尿中Cortisol推奨

#refs(
  "Best Pract Res Clin Endocrinol Metab. 2019;33(2):101268. doi:10.1016/j.beem.2019.04.002
  Peter J Snyder, MD. Pituitary incidentalomas. In: UpToDate, Connor RF (Ed), Wolters Kluwer. Accessed August 15, 2025. https://www.uptodate.com.")

= 下垂体機能不全

== 下垂体機能不全総論

- Micro incidentalomaでの下垂体機能不全は7-66%でMacroincidentalomaでは19-46%とされる
  - Hypogonadismは～30%
  - 副腎不全は～18%
  - 甲状腺機能低下は～28%
  - GH欠乏は～8%
- 腫瘍圧迫による下垂体機能低下の一般論として
  - GH, FSH, LH↓ → TSH↓ → ACTH↓ 
    - 副腎不全がある時は汎下垂体機能低下症を疑う
- 2011年のガイドラインだとClass Iでホルモン欠乏の検査の推奨
#refs("竹内靖博・竹下彰・辰島啓太編著(2020).虎の門病院内分泌クリニカルプラクティス―外来・入院からフォローアップまで.クリニコ出版
J Clin Endocrinol Metab. 2011;96(4):894-904. doi:10.1210/jc.2010-1048")
  
== 下垂体機能不全総論

- 生命予後を悪化させるホルモンを重点的にみる
  - #text(size: 28pt, fill: red, weight: "bold")[副腎不全]
  - #text(size: 28pt, fill: red, weight: "bold")[甲状腺機能低下症]
- 一方で、HypogonadismやGH欠乏は成人だと治療適応も難しい
=> 見るべきは、*副腎不全、甲状腺機能低下症*
- 中枢性副腎不全→TSH欠乏→中枢性Hypogonadismの検査
  - GH欠乏は下垂体腺腫の治療が終わり他のホルモン補充が終わったあとまでは検査しない事を推奨。
#refs("JAMA. 2023;330(15):1472-1483. doi:10.1001/jama.2023.19052")

== 下垂体機能不全各論

- #link(<adrenal_insuf>)[
  中枢性副腎不全: ルーチンで検査
  ]

- #link(<hypothyroid>)[
  中枢性甲状腺機能低下: ルーチンで検査
  ]

- #link(<GH_def>)[
  GH欠乏: ルーチンで検査
  ]

- #link(<hypogonado>)[
  Hypogonadism: ルーチンで検査
  ]

- #link(<prolactin_def>)[
  Prolactin欠乏: ルーチンでは行わない
  ]

- #link(<central_di>)[
  中枢性尿崩症: ルーチンで検査
  ]

== 中枢性副腎不全 #label("adrenal_insuf")

- Insulin tolerance test (ITT) が最も良い検査だが使いにくい
- 早朝Cortisolが第一
  - まずは、8-9時の血清Cortisolを測定する
    - cortisol < 80 nmol/L (3 mcg/dL)は副腎不全
    - cortisol < TODO nmol/L (18 mcg/dL)は副腎不全
- Cortisolが3mcg/dL-15mcg/dLの時 → ACTH負荷試験を行う
    - 250mcgのACTH投与後30/60分後のCortisolが\<18mcgで副腎不全
    - 二次性副腎不全の場合通常ACTHは< 12 pmol/L (52 pg/mL)となる.



== 中枢性甲状腺機能低下 #label("hypothyroid")

- 低T4にも関わらず不適切に低値～正常範囲のTSHのときに疑う
- 特に深く考えないでも良い
- もしも、NTIと区別が難しいときは時間をあけて再検査が現実的

== GH欠乏 #label("GH_def")

- GH欠乏は事前確率が高い状態でのみ疑う(高い事前確率とは以下の基準のうち1つ以上を満たす)
  - 若い男性で正常な下垂体だが低身長でGH欠乏の診断が幼少期にされている
  - 下垂体の障害が疑われる病歴(下垂体手術、放射線治療、下垂体の画像変化、頭部外傷、脳卒中)
- ITTがGH欠乏のGold standardだが使いにくい
  - その他としては、Glucagon刺激試験、Macimorelin test、arginine plus GH-releasing hormone (GHRH) test
  - Dynamedでは3つ以上の下垂体ホルモン欠乏があり、年齢調整された血清IGF-1が低い時はGH低値と診断して良い
    #align(center)[vs.]
  - 2011年のガイドラインでは、IGF-1低下のみでGH欠乏の診断は出来ない
#refs("DynaMed. Sellar Mass - Approach to the Patient. EBSCO Information Services. Accessed 2025年8月2日. https://www.dynamed.com/approach-to/sellar-mass-approach-to-the-patient
J Clin Endocrinol Metab. 2011;96(4):894-904. doi:10.1210/jc.2010-1048")

== Hypogonadism総論 #label("hypogonado")

- 男性、女性(閉経前/後)で方法が異なる。
- ゴナドトロピン放出ホルモン（GnRH）刺激検査は、基礎ホルモン検査の結果がはっきりしない場合に用いられてきたが、国際的な内分泌学会では*推奨されていない*

== Hypogonadism 各論
- 男性
  - 早朝(可能なら7-11時前で空腹)のTotal testosteroneを最初に行う
    - Total testosteroneが300ng/dL未満で、FSH, LHが2回とも低いか正常であれば、ゴナドトロピン欠乏症と診断可能
    - Total testosterone < 231 ng/dLはTestosterone欠乏
    - Total testosterone > 231 ng/dLかつ< 346 ng/dLでは追加の検査(free or bioavailable testosterone)を考慮する
    - Total testosterone level ≥ 346 ng/dLはTestosterone正常と考えて良い
- 閉経前女性: 無月経あるいは月経不順があり、E2低値および低値～正常値のFSHとLHだと診断可能
- 閉経後女性: FSH, LHが高値でないだけでほぼ診断可能
  - 甲状腺異常やPRL高値について事前に除外する
  

== Prolactin欠乏 #label("prolactin_def")

- 血清PRLが< 100 pmol/Lの時に欠乏を示唆する

== 中枢性尿崩症 #label("central_di")

- 虎ノ門の教科書では中枢性尿崩症は術後でない限り下垂体腺腫では起きないとの事
#refs("竹内靖博・竹下彰・辰島啓太編著(2020).虎の門病院内分泌クリニカルプラクティス―外来・入院からフォローアップまで.クリニコ出版")
- 診断のGold standardは存在しない
- 水制限試験がしばしば初期の検査で行われる
  - 多尿 (> 50 mL/kg in 24 hours or 3.5 L/day in a 70kg) の時に血清と尿中浸透圧を同時測定する
  - 尿糖なしの時に、血清浸透圧 >295 mOsm/kg、尿浸透圧が600 mOsm/kgの時(尿と血清浸透圧の比が2以上)が正常
  - 尿崩症は血清浸透圧 >295 mOsm/kgの時に尿浸透圧が600 mOsm/kg未満の時(尿と血清浸透圧の比が2未満)で診断される
- 水分制限試験の亜種として、3%食塩水刺激試験がある

== いつ、どのように検査をする？

- ホルモン低下について、複数のScreening方法があり確定的なものはない。
  - 2011年のガイドラインでは意見を2つ載せている
    - Minimal: FT4, 朝のCortisolとTestosterone
    - 追加: FT4, 朝のCortisolとTestosteroneに加えてTSH、LH, FSH, IGF-1
    - ACTHとGH欠乏がBaselineの検査で確定できない時に負荷試験を考慮する。
  - Microadenomaだとより分かっていない。UptodateだとPRLだけ推奨だが2011年のEndocrine Society Guidelineとは異なる。
#refs("J Clin Endocrinol Metab. 2011;96(4):894-904. doi:10.1210/jc.2010-1048
Peter J Snyder, MD. Pituitary incidentalomas. In: UpToDate, Connor RF (Ed), Wolters Kluwer. Accessed August 15, 2025. https://www.uptodate.com. 
")

== 視野障害について

#figure(
  image("figure/PA_anatomy.png", height: 45%)
)
#refs("JAMA. 2017;317(5):516-524. doi:10.1001/jama.2016.19699")

- 下垂体の真上に視交叉があり押されると*両耳側半盲*が起こる
  - MRIで視交叉と腺腫が接している場合は自覚症状がなくても、\ 正式な視野障害の評価を行う
  - 海綿静脈洞内に伸展するとIII, IV, V1などが障害される事もある
  
#refs("Clin Med. 2023;23(2):129-134. doi:10.7861/clinmed.2023-0020")


= 治療法

== 治療法総論

- Cushing syndrome、末端肥大症は外科治療が必要
- 非機能性腫瘍で視野障害がある場合は外科治療が必要
- 2011年のガイドラインでは、incidentalomaでも \ ホルモン分泌障害があるときは手術を考慮するとの記載あり
- Ope適応などは専門医にコンサルトが良い

== Hypopituitarismの治療

- 中枢性副腎不全: Hydrocortisoneを15-20mg/day
  - fludrocortisoneは不要
  - Sick dayの説明を忘れない
- 甲状腺機能低下症: Levothyroxinを1.6 mcg/kg/day
  - 目標としてTSHは使えない
    - FT4が正常範囲の上半分に入るようにする
- 副腎不全がある場合は先に副腎不全を治療する
- GHや性ホルモンの補充は適応が難しいので専門医にコンサルト

#refs("J Clin Endocrinol Metab. 2016;101(11):3888-3921. doi:10.1210/jc.2016-2118")

== Follow up

#figure(
  image("figure/PA_followup_guideline.png", height: 40%)
)
#refs("J Clin Endocrinol Metab. 2011;96(4):894-904. doi:10.1210/jc.2010-1048")

- Mass effect: MRIでfollow up
  - Macro/Microadenoma: 6/12ヶ月後
- ホルモン分泌: hypopituitarismの有無を検査
  - Macro/Microadenoma: 半年後→1年毎に行う/ルーチンは不要

#refs("J Clin Endocrinol Metab. 2011;96(4):894-904. doi:10.1210/jc.2010-1048")

== 下垂体偶発種at glance

#figure(
  image("figure/PA_manage.png", height: 80%)
)
#refs("Best Pract Res Clin Endocrinol Metab. 2019;33(2):101268. doi:10.1016/j.beem.2019.04.002")


== 参考文献

#block[
  #set text(size: 12pt)

1. 竹内靖博・竹下彰・辰島啓太編著(2020).虎の門病院内分泌クリニカルプラクティス―外来・入院からフォローアップまで.クリニコ出版
2. Freda PU, Beckers AM, Katznelson L, et al. Pituitary incidentaloma: an endocrine society clinical practice guideline. J Clin Endocrinol Metab. 2011;96(4):894-904. doi:10.1210/jc.2010-1048 
3. Teramoto A, Hirakawa K, Sanno N, Osamura Y. Incidental pituitary lesions in 1,000 unselected autopsy specimens. Radiology. 1994;193(1):161-164. doi:10.1148/radiology.193.1.8090885 
4. American College of Physicians. ACP MKSAP: Medical Knowledge Self-Assessment Program. American College of Physicians; 2025. https://www.acponline.org/featured-products/acp-mksap
5. DynaMed. Sellar Mass - Approach to the Patient. EBSCO Information Services. Accessed 2025年8月2日. https://www.dynamed.com/approach-to/sellar-mass-approach-to-the-patient
6. Boguszewski CL, de Castro Musolino NR, Kasuki L. Management of pituitary incidentaloma. Best Pract Res Clin Endocrinol Metab. 2019;33(2):101268. doi:10.1016/j.beem.2019.04.002 
7. Lee SY, Pearce EN. Hyperthyroidism: A Review. JAMA. 2023;330(15):1472-1483. doi:10.1001/jama.2023.19052 
8. Peter J Snyder, MD. Pituitary incidentalomas. In: UpToDate, Connor RF (Ed), Wolters Kluwer. Accessed August 15, 2025. https://www.uptodate.com. 
9. Westall SJ, Aung ET, Kejem H, Daousi C, Thondam SK. Management of pituitary incidentalomas. Clin Med. 2023;23(2):129-134. doi:10.7861/clinmed.2023-0020
10. Melmed S. Pituitary-tumor endocrinopathies. N Engl J Med. 2020;382(10):937-950. doi:10.1056/NEJMra1810772
11. Fleseriu M, Hashim IA, Karavitaki N, et al. Hormonal replacement in hypopituitarism in adults: An Endocrine Society clinical practice guideline. J Clin Endocrinol Metab. 2016;101(11):3888-3921. doi:10.1210/jc.2016-2118

]

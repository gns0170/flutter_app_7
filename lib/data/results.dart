import 'package:flutter/material.dart';
import 'package:flutter_application_7/widgets/texts.dart';
import '../values/colors.dart' as custom_color;

class DataResult {
  final String key;
  final Widget title;
  final Widget explain;
  DataResult(this.key, this.title, this.explain);
}

//Data
List<DataResult> r = [
  DataResult(
      'result1',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '화려한', color: custom_color.labelColor1),
        SizedBox(width: 10),
        TextQuestion(words: '탑')
      ]),
      const SingleChildScrollView(
          child: TextExplain(
        words:
            """ 탑은 외로운 라인이면서, 그만큼 영웅이 탄생하기 쉬운 라인입니다. 오직 개인의 역량으로 상대방을 압살하며 탑으로 올라오는 적들을 분쇄하고 있으면 아군의 박수 갈채가 쏟아질 것입니다.
 화려함을 좋아하는 당신이라면, 1:1 상황에서 상대를 압도하는 전사형 챔피언이나 강력한 원거리 챔피언, 혹은 스플릿형 챔피언이 어울릴 것입니다. 성장을 요구하는 챔피언을 다루는 것도 좋지만, 자칫하면 적 정글에게 억까를 당할 수 있다는 점은 유의하여야 합니다. 추천 챔피언을 정리하면 다음과 같습니다.
- 이렐리아, 레넥톤, 야스오 등의 전사형 챔피언
- 루시안, 칼리스타, 제이스같은 강력한 원거리 챔피언
- 다리우스, 이렐리아, 일라오이 등의 스플릿 챔피언
""",
      ))),
  DataResult(
      'result2',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '정교한', color: custom_color.labelColor2),
        SizedBox(width: 10),
        TextQuestion(words: '탑')
      ]),
      const TextExplain(
        words:
            """ 정교한 플레이를 추구하는 당신에게 탑은 하나의 도전입니다. 당신이 얼마나 잘 하던 간에, 아래가 밀려 게임을 질 수 있기 때문입니다. 따라서 역량 하나로 게임을 깨부수기 위해서는 성장 잠재력이 뛰어난 챔피언을 고르고 아주 정밀하게 플레이할 필요가 있습니다. 성공한다면 판을 아예 엎어버리는 짜릿한 경험을 얻을 것입니다. 다음은 추천 챔피언 목록입니다.
- 빅토르, 라이즈와 같은 성장형 메이지 챔프
- 잭스, 피오라, 카밀 등의 잠재력이 강하고 기동력이 뛰어난 챔프
- 리븐, 요네, 케넨와 같이 한타 구도를 완전히 박살내는 딜 챔프
""",
      )),
  DataResult(
      'result3',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '협력하는', color: custom_color.labelColor3),
        SizedBox(width: 10),
        TextQuestion(words: '탑')
      ]),
      const TextExplain(
        words:
            """탑은 전통적으로 두려움이 없는 라인이었습니다. 죽지 않는 용맹한 선봉장이야 말로, 모든 탑들의 가슴속에 들어있는 뜨거운 낭만입니다. 팀원과 협동하기를 좋아하는 여러분은 이 오래된 유산의 주인공이 될 자격이 있습니다. 팀의 든든한 맡형으로서 위험한 전장에서도 앞장서는 든든한 장군님이 되어주시길 바랍니다. 다음은 추천 챔피언 목록입니다.
- 오른, 말파이트, 마오카이 처럼 든든한 탱커 챔피언
- 나르, 헤카림, 클레드, 케넨처럼 강력한 이니시가 가능한 챔피언
- 쉔, 판테온 같이 슝 날아가서 아군을 지켜줄 수 있는 챔피언.
""",
      )),
  DataResult(
      'result4',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '숭고한', color: custom_color.labelColor4),
        SizedBox(width: 10),
        TextQuestion(words: '탑')
      ]),
      const TextExplain(
        words:
            """스스로 주인공이 되기보다, 남을 돕는 신사임당이 되길 원하는 당신을 위해 탑은 다양한 옵션을 제공합니다. 라인전을 하지 않고도 몇가지 방법을 통해 아래 라인에 영향을 줄 수 있습니다. 비록 캐리력이 살짝 부족할 수 있어도, 뭐 어떤가요? 당신이 준 도움과 끼친 영향력을 팀원들은 기억하고 또 고마워할 것입니다. 다음은 추천 챔피언 목록입니다.
- 룰루, 잔나, 소라카 같은 서포터 챔피언 중, 메타에 맞는 챔피언
- 람머스, 신지드 처럼 cs 다 버리고 로밍가도 가망이 있는 챔피언
- 말파이트, 마오카이 처럼 한타 기여도가 뛰어나지만, 이니시 후 뒤가 없는 챔피언
""",
      )),
  DataResult(
      'result5',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '화려한', color: custom_color.labelColor1),
        SizedBox(width: 10),
        TextQuestion(words: '정글')
      ]),
      const TextExplain(
        words:
            """ 멀고도 가까운 라인, 정글입니다. 정글의 활약과 승전보는 그만큼 아군의 사기를 끌어올리는 데 제격입니다. 화려한 플레이나 강력한 딜링을 통해 모두의 시선을 집중시킬 수 있는 챔피언이 많은 만큼, 자유롭게 골라 활약하시길 바랍니다. 다만, 정글은 이득 계산과 최선의 선택이 굉장히 중요한 라인인 만큼, 내가 원하는 장면을 연출하려면 어렵더라도 약간의 노력과 계산을 염두에 두어야 할 것입니다. 다음은 추천 챔피언 목록입니다.
- 리신, 앨리스와 같은 인상에 깊게 남고 화려한 챔피언
- 쉬바나, 카서스 처럼 시선을 주목하게 만드는 쉽고 쌘 ap 챔피언
- 마스터 이, 그레이브즈, 케인 처럼 딜 뽕에 취하는 강력한 ad 챔피언
- 에코, 이블린, 키아나 처럼 순식간에 적을 따내는 암살자 챔피언
""",
      )),
  DataResult(
      'result6',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '정교한', color: custom_color.labelColor2),
        SizedBox(width: 10),
        TextQuestion(words: '정글')
      ]),
      const TextExplain(
        words:
            """뇌지컬의 라인, 정글입니다. 선택에 따라 결과가 극과 극으로 나뉘는 만큼, 플레이가 정교하면 정교할수록 같은 상황에서 많은 이득을 거둘 수 있습니다. 정교함을 추구하는 당신이라면, 어떠한 챔프를 고르든 간에 잘 해낼 것입니다. 다만 소위 억까를 당하지 않으려면 선택권이 많은 챔피언을 하는 것을 추천합니다. 다음은 추천 챔피언 목록입니다.
- 리신, 니달리, 엘리스, 샤코, 신짜오, 렉사이 같은 초반이 강한 챔피언
- 케인, 카서스, 그레이브즈, 탈리야, 킨드레드 같이 잠재력이 높고 정글링이 빠른 챔피언
""",
      )),
  DataResult(
      'result7',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '협력하는', color: custom_color.labelColor3),
        SizedBox(width: 10),
        TextQuestion(words: '정글')
      ]),
      const TextExplain(
        words:
            """정글은 전 라인에 영향력을 끼치는 포지션입니다. 당연히 팀원 도와주기를 좋아하는 사람들에게는 이만큼 보람찬 포지션도 없을 것입니다. 철저한 계산과 정교한 설계는 못하더라도, 상황이 발생했을 때 빠르게 달려갈 수 있는 챔피언을 고른다면 팀원들은 고마워 할 것입니다. 또는 캐리력은 조금 떨어지더라도, 한타 파괴력을 지닌 탱커를 골라 존재감을 과시해보십시오. 다음은 추천 챔피언 목록입니다.
- 누누, 리신, 자크, 람머스, 탈리아, 헤카림 등 상황이 발생하면 빠르게 달려갈 수 있는 챔피언
- 아무무, 세주아니, 헤카림, 자크,오공 등 한타 파괴력이 강한 탱커 챔피언
""",
      )),
  DataResult(
      'result8',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '숭고한', color: custom_color.labelColor4),
        SizedBox(width: 10),
        TextQuestion(words: '정글')
      ]),
      const TextExplain(
        words:
            """누구보다 빠르게 달려가서 팀원을 도와줄 수 있는 정글은 당신에게 사명을 제공합니다. 다음은 추천 챔피언 목록입니다.
- 세주아니, 아무무, 헤카림과 같은 탱커 챔피언
""",
      )),
  DataResult(
      'result9',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '화려한', color: custom_color.labelColor1),
        SizedBox(width: 10),
        TextQuestion(words: '미드')
      ]),
      const TextExplain(
        words:
            """팀의 중심을 책임지는 만큼, 미드는 가장 주목받는 포지션입니다. 페이커를 비롯한 수많은 스타 플레이어들이 소속된 이 라인은 당신의 활약에 따라 영웅이 될 수도, 팀의 패배 요인이 될 수도 있는 가능성의 라인입니다. 그렇기에 진정으로 주목받고 싶다면, 한 번쯤 미드를 서보십시오. 스타 플레이어로서 당신의 자질을 시험할 좋은 기회일 것입니다. 다음은 주목받기 쉬운 미드 챔피언 목록입니다.
- 제드, 키아나, 탈론, 르블랑, 카타리나, 피즈 등의 화려한 순간 딜링 능력을 가진 암살자 챔피언
- 야스오, 요네, 이렐리아 같은 자꾸 눈이 가는 전사 챔피언
- 루시안, 아크샨 같이 초반부터 강하게 압박하며 존재감을 뽐낼 수 있는 원거리 챔피언
""",
      )),
  DataResult(
      'result10',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '정교한', color: custom_color.labelColor2),
        SizedBox(width: 10),
        TextQuestion(words: '미드')
      ]),
      const TextExplain(
        words:
            """ 미드는 롤에서 가장 영향력이 강한 라인입니다. 정교하면 정교할수록, 팀이 승리할 확률이 기하급수적으로 올라갑니다. 정교한 플레이를 추구하는 당신이라면, 많은 선택권을 가지게 될 것입니다. 다음은 정교한 플레이를 통해 게임을 승리로 이끌 수 있는 추천 챔피언 목록입니다.
- 트위스티드 페이트, 갈리오 같은 라인 클리어가 빠르고, 로밍에 특화된 챔피언
- 빅토르, 오리아나처럼 상대를 빡세게 견제하며 한타 잠재력도 갖춘 메이지 챔피언
- 루시안, 아크샨, 신드라, 아지르처럼 정교한 플레이를 통해 초반부터 최대한 많은 이득을 거둘 수 있는 챔피언
- 사일러스, 조이 처럼 변수를 바탕으로 게임을 굴릴 수 있는 챔피언
""",
      )),
  DataResult(
      'result11',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '협력하는', color: custom_color.labelColor3),
        SizedBox(width: 10),
        TextQuestion(words: '미드')
      ]),
      const TextExplain(
        words:
            """어떤 챔피언을 하던, 미드 유저는 팀과 호흡을 맞춰야 합니다. 그리고 이 중에는 특히 팀과의 호흡을 중시하게끔 설계된 챔피언들이 있습니다.
- 갈리오, 르블랑, 말자하, 리산드라 처럼 혼자만으로는 딜이 약간 부족하지만, 호응이 뛰어난 챔피언
- 어떤 챔피언들은 소규모 팀파이트, 합류에 유리하도록 설계되었습니다.
- 트위스티드 페이트, 갈리오, 판테온, 아우렐리온 솔 같은 빠른 합류가 가능한 챔피언
""",
      )),
  DataResult(
      'result12',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '숭고한', color: custom_color.labelColor4),
        SizedBox(width: 10),
        TextQuestion(words: '미드')
      ]),
      const TextExplain(
        words: """미드는 남을 도울 수 있는 챔피언 들이 많습니다.
- 룰루, 질리언, 제라스 처럼 초장거리 지원 혹은 팀을 서포트해줄 수 있는 챔피언
- 트위스티드 페이트, 갈리오, 판테온, 아우렐리온 솔 같은 빠른 합류가 가능한 챔피언
""",
      )),
  DataResult(
      'result13',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '화려한', color: custom_color.labelColor1),
        SizedBox(width: 10),
        TextQuestion(words: '원딜')
      ]),
      const TextExplain(
        words:
            """원딜은 가장 화려한 라인입니다. 잘 크면 혼자 다 쓸어버리며, 기회를 한번 낚아 채면 아무도 막지 못하는 챔피언들을 소개합니다.
- 아펠리오스,사미라, 트리스타나,트위치 같은 성장하면 딜이 너무 쌔서 막기 매우 힘든 챔피언
- 루시안, 드레이븐 처럼 시작부터 강하게 나갈 수 있는 챔피언
- 카이사, 자야, 루시안 처럼 순간 딜링이 쌔고 이동기를 가져 공격과 회피에 자유롭게 활용할 수 있는 챔피언
""",
      )),
  DataResult(
      'result14',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '정교한', color: custom_color.labelColor2),
        SizedBox(width: 10),
        TextQuestion(words: '원딜')
      ]),
      const TextExplain(
        words:
            """원딜은 정교한 플레이가 필수입니다. 어떤 원딜을 하던 다 어울릴 것입니다. 사미라만 빼고요. 사미라는 마스터이 같은 구석이 있어서 가끔은 계산하지 않고 꼬라박을 줄도 알아야 합니다.""",
      )),
  DataResult(
      'result15',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '협력하는', color: custom_color.labelColor3),
        SizedBox(width: 10),
        TextQuestion(words: '원딜')
      ]),
      const TextExplain(
        words:
            """원딜은 팀원 따라 다니면서 천천히 하면 반은 갑니다. 그리고 아군은 그런 원딜과 협력하기 꽤 좋아합니다. 다음은 라인전 적당히 가져가면서 전략 목표를 달성하기 수월하거나 팀을 지원할 수 있는 챔피언 목록입니다.
- 진, 애쉬, 시비르와 같이 지원 혹은 라인클리어가 빠른 챔프
- 케이틀린/징크스 처럼 사거리가 길어 비교적 안전한 챔프,
- 이즈리얼,카이사 처럼 이동기가 뛰어나 잘 죽지 않는 챔프
""",
      )),
  DataResult(
      'result16',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '숭고한', color: custom_color.labelColor4),
        SizedBox(width: 10),
        TextQuestion(words: '원딜')
      ]),
      const TextExplain(
        words: """원딜은 희생에 적합한 챔피언이 없습니다.
서포터를 갈게 아니라면, 비 원딜이나 바텀 파괴 조합을 추천합니다.
승패가 특별히 중요한게 아니라면, 아군 서포터와 합을 맞춰 잘하는 챔피언을 골라보세요!
""",
      )),
  DataResult(
      'result17',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '화려한', color: custom_color.labelColor1),
        SizedBox(width: 10),
        TextQuestion(words: '서포터')
      ]),
      const TextExplain(
        words: """- cc와 호응이 강력한 챔프 [파이크, 쓰레쉬, 블리츠 등]
- 자기가 딜하는 챔프 [럭스, 벨코즈, 제라스]
- 견제가 강한 챔프 , 라인클리어에 도움을 주는 챔프 [럭스, 룰루]
""",
      )),
  DataResult(
      'result18',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '정교한', color: custom_color.labelColor2),
        SizedBox(width: 10),
        TextQuestion(words: '서포터')
      ]),
      const TextExplain(
        words: """- 핑퐁 수단이 많은 챔프 [파이크, 라칸, 잔나, 룰루]
- 하이 리스크 하이 리턴의 챔프 [레오나, 알리스타, 노틸러스]
- 백업이나 이동이 빠른 챔프 [바드, 잔나, 파이크]
""",
      )),
  DataResult(
      'result19',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '협력하는', color: custom_color.labelColor3),
        SizedBox(width: 10),
        TextQuestion(words: '서포터')
      ]),
      const TextExplain(
        words: """- 호응이 강력한 챔프[파이크, 쓰레쉬, 블리츠]
- 연계가 쉽고 강력한 챔프 [알리스타, 쓰레쉬, 라칸]
- 모든 유틸 서폿
""",
      )),
  DataResult(
      'result20',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '숭고한', color: custom_color.labelColor4),
        SizedBox(width: 10),
        TextQuestion(words: '서포터')
      ]),
      const TextExplain(
        words:
            """팀의 가장 고된 일을 책임지는 숭고한 마음가짐을 가진 당신은 서포터에 제격입니다. 딜량 좀 낮고 데스가 좀 높더라도, 아군 원딜러의 칭찬 한마디가 모든 뻐근함을 날려버립니다. 어떤 챔피언을 하던 숭고한 마음가짐을 가진 당신이라면 어울릴 것입니다. 다만, 다음 챔피언은 안됩니다.
- 바드같이 로밍만 가는 서포터
- 럭스, 제라스, 벨코즈, 브랜드 같은 팀원의 고마움을 얻기 힘든 몸 약한 딜포터
- 그 외의 이상한 거
""",
      )),
];

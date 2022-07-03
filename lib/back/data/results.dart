import 'package:flutter/material.dart';
import 'package:flutter_application_7/front/widgets/parts/texts.dart';
import 'package:flutter_application_7/front/provider/values/colors.dart'
    as custom_color;

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
      const TextExplainResult(
        words:
            """ 탑은 외로운 라인이면서, 그만큼 영웅이 탄생하기 쉬운 라인입니다. 오직 개인의 역량으로 상대방을 압살하며 탑으로 올라오는 적들을 분쇄하고 있으면 아군의 박수 갈채가 쏟아질 것입니다.
 화려함을 좋아하는 당신이라면, 1:1 상황에서 상대를 압도하는 전사형 챔피언이나 강력한 원거리 챔피언, 혹은 스플릿형 챔피언이 어울릴 것입니다. 성장을 요구하는 챔피언을 다루는 것도 좋지만, 자칫하면 적 정글에게 억까를 당할 수 있다는 점은 유의하여야 합니다. 추천 챔피언을 정리하면 다음과 같습니다.

- 이렐리아, 레넥톤, 야스오 등의 전사형 챔피언
- 루시안, 칼리스타, 제이스같은 강력한 원거리 챔피언
- 다리우스, 이렐리아, 일라오이 등의 스플릿 챔피언
""",
      )),
  DataResult(
      'result2',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '정교한', color: custom_color.labelColor2),
        SizedBox(width: 10),
        TextQuestion(words: '탑')
      ]),
      const TextExplainResult(
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
      const TextExplainResult(
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
      const TextExplainResult(
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
      const TextExplainResult(
        words:
            """ 멀고도 가까운 라인, 정글입니다. 정글의 활약과 승전보는 그만큼 아군의 사기를 끌어올리는 데 제격입니다. 화려한 플레이나 강력한 딜링을 통해 모두의 시선을 집중시킬 수 있는 챔피언이 많은 만큼, 자유롭게 골라 활약하시길 바랍니다. 다만, 정글은 이득 계산과 최선의 선택이 굉장히 중요한 라인인 만큼, 내가 원하는 장면을 연출하려면 어렵더라도 약간의 노력과 계산을 염두에 두어야 할 것입니다. 다음은 추천 챔피언 목록입니다.

- 리신, 앨리스, 비에고와 같은 화려하고 인상에 깊게 남는 챔피언
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
      const TextExplainResult(
        words:
            """정글은 뇌지컬의 라인입니다. 선택에 따라 결과가 극과 극으로 나뉘는 만큼, 플레이가 정교하면 정교할수록 같은 상황에서 많은 이득을 거둘 수 있습니다. 정교함을 추구하는 당신이라면, 어떠한 챔프를 고르든 간에 잘 해낼 것입니다. 다만 소위 억까를 당하지 않으려면 선택권이 많은 챔피언을 하는 것을 추천합니다. 다음은 추천 챔피언 목록입니다.

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
      const TextExplainResult(
        words:
            """정글은 전 라인에 영향력을 끼치는 포지션입니다. 당연히 팀원과 협력하길 좋아하는 사람들에게는 이만큼 보람찬 포지션도 없을 것입니다. 철저한 계산과 정교한 설계는 못하더라도, 상황이 발생했을 때 빠르게 달려갈 수 있는 챔피언을 고른다면 팀원들은 고마워 할 것입니다. 또는 캐리력은 조금 떨어지더라도, 한타 파괴력을 지닌 탱커를 골라 존재감을 과시해보십시오. 다음은 추천 챔피언 목록입니다.

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
      const TextExplainResult(
        words:
            """누가장 가깝고도 멀기에, 정글은 많은 이들을 직접 도울 수 있습니다. 안타깝게도 해당 라인의 챔피언은 정글링을 할 수 있어야 하기에 챔프폭이 제한되지만, 팀원을 돕고자하는 정글 유저에게는 아직 하드 cc, 강력한 이동기를 가진 챔프들이 있습니다. 이들을 활용하여 아군을 도와 승리의 초석이 되어주시길 바랍니다.

- 헤카림, 누누 처럼 이동 속도가 빨라 갱이 강한 챔피언
- 세주아니, 아무무 같은 cc기가 강력한 챔피언
""",
      )),
  DataResult(
      'result9',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '화려한', color: custom_color.labelColor1),
        SizedBox(width: 10),
        TextQuestion(words: '미드')
      ]),
      const TextExplainResult(
        words:
            """팀의 중심을 책임지는 만큼, 미드는 가장 주목받는 포지션입니다. 페이커를 비롯한 수많은 스타 플레이어들이 소속된 미드 라인은 당신의 활약에 따라 영웅이 될 수도, 팀의 패배 요인이 될 수도 있는 가능성을 선사합니다. 그러므로 당신이 진정으로 주목받고 싶어하는 플레이어라면, 한 번쯤 미드를 서보십시오. 스타 플레이어로서 그 자질을 시험할 수 있는 좋은 기회일 것입니다. 추천하는 챔피언들은 실력에 따라 리턴이 매우 높아질 수 있는 챔피언, 혹은 화려한 움직임으로 팀원의 갈채와 적군의 탄식을 자아낼 수 있는 이들입니다.

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
      const TextExplainResult(
        words:
            """ 미드는 롤에서 가장 영향력이 강한 라인입니다. 정교하면 정교할수록, 팀이 승리할 확률이 급격히 올라갑니다. 정교한 플레이를 추구하는 당신이라면, 플레이를 하면서 자연스레 많은 선택권을 가지게 될 것입니다. 당신의 선택을 바탕으로 게임을 물 흐르듯 승리로 이끄십시오. 대다수의 적팀은 이것이 당신의 설계인지도 모르고, 서로 싸우다 자멸하게 될 것입니다. 다음은 영악하고 계산적인 플레이를 통해 게임을 지배할 수 있는 추천 챔피언 목록입니다.

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
      const TextExplainResult(
        words:
            """ 어떤 챔피언을 하던, 미드 유저는 팀과 호흡을 맞춰야 합니다. 그리고 이 중에는 팀과의 호흡을 특히 중시하게끔 설계된 챔피언들이 있습니다. 이들은 딜이 조금 약한 대신, 강력한 호응 능력이나 합류 능력을 가지고 있습니다. 사용자는 이러한 능력을 적극 활용하여 아군과의 적절한 연계를 통해 적을 잡아내야 합니다. 그 ‘각’을 보는 능력에 따라 더음 챔피언들은 혼자서는 아무것도 못하는 쓰레기가 될 수도, 적팀이 가장 까다로워하는 피니셔가 될 수도 있습니다. 다음은 추천 챔피언 목록입니다.

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
      const TextExplainResult(
        words:
            """미드는 챔프 선택이 가장 자유로운 라인입니다. 그 중에는 후반을 바라보며 메인 딜을 보조해줄 목적으로 고르는 챔피언도 있습니다. 자신의 성장은 최소한으로 챙기며, 아군 딜러의 성장과 생존을 우선에 두고 플레이하다보면, 아군 딜러의 하드 캐리로 그 노력을 보상받을 수 있기도 합니다. 딜러들을 ‘서울대’로 보내고 싶은 미드 유저라면, 다음 챔피언을 고려해보십시오.

- 룰루, 질리언처럼 라인전은 무난하게 하면서 이후 팀을 서포트해줄 수 있는 챔피언
- 트위스티드 페이트, 갈리오, 판테온, 누누, 파이크처럼 잦은 로밍을 통해 우리팀 딜러의 상황을 풀어줄 수 있는 챔피언
""",
      )),
  DataResult(
      'result13',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '화려한', color: custom_color.labelColor1),
        SizedBox(width: 10),
        TextQuestion(words: '원딜')
      ]),
      const TextExplainResult(
        words:
            """ 원딜은 가장 화려한 라인입니다. 잘 크면 혼자 다 쓸어버리며, 기회를 한번 낚아 채면 아무도 막지 못하는 괴물이 되기도 합니다. 그 중에서도 특히 화려한 몇몇 챔피언이 있는데, 뭐, 말이 필요한가요? 바로 매드무비 몇 편 보고 오시길 바랍니다. 잘 크면 게임 내 모든 사람의 관심을 앗아가는 챔피언들을 소개합니다! 

- 사미라, 트위치, 코그모 같이 임계점을 넘으면 하늘을 나는 챔피언
- 루시안, 칼리스타, 베인, 트리스타나처럼 이동기를 적극 활용하며 화려하게 딜을 넣는 챔피언
- 자야, 아펠리오스처럼 죽은 적이 본인이 왜 죽었는지 모르는 화려하고 의아한 챔피언
- 이즈리얼, 바루스, 진처럼 스킬 한 방에 모든 관심을 끌 수 있는 챔피언
""",
      )),
  DataResult(
      'result14',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '정교한', color: custom_color.labelColor2),
        SizedBox(width: 10),
        TextQuestion(words: '원딜')
      ]),
      const TextExplainResult(
        words:
            """원딜은 정교한 플레이가 필수입니다. 프로들의 화려한 플레이의 이면에는 철저히 계산된 포지셔닝과 상대 스킬 인지가 숨어있습니다. 말파이트의 궁을 점멸로 피하려면, 처음 싸움이 날 때부터 계속 생각을 해야합니다. 정교함을 추구하는 당신은 당신 손에 최대한 많은 권리가 주어지길 바랄 것입니다. 다음은 정교한 플레이가 곁들여지면 정글이 감히 레드를 탐낼 수 없는 챔피언들의 목록입니다.

- 케이틀린, 징크스, 이즈리얼 처럼 초반 사거리를 통해 지속적인 이득을 거두고, 이후 얻은 강력한 캐리력을 바탕으로 게임을 끌고 나가는 챔피언
- 루시안, 드레이븐, 트리스타나 등의 강한 초반을 바탕으로 스노우볼을 굴려 게임을 터뜨릴 수 있으면서 후반이 그리 꿀리지 않는 챔피언
- 베인, 루시안, 이즈리얼 같이 기동력이 우수해 플레이가 정교해질 수록 리턴이 말이 안되는 챔피언
""",
      )),
  DataResult(
      'result15',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '협력하는', color: custom_color.labelColor3),
        SizedBox(width: 10),
        TextQuestion(words: '원딜')
      ]),
      const TextExplainResult(
        words:
            """ 흔히 원딜은 cs만 잘 먹으면 된다는 말이 있습니다. 앞 라인이 충분한 영향력을 행사할 경우, 원딜이 따로 해야 되는 것은 따라 다니면서 뒤에서 평타 몇대나 치는게 전부인 경우도 있죠. 그러나 어떤 챔피언은 원딜임에도 딜 외의 강력한 호응 능력, 또는 뛰어난 생존기를 갖추어 상황을 만들거나, 아군이 만든 상황을 더 크게 벌이기도 합니다. 딜 올인 원딜에 비해 딜은 조금 부족할 수 있지만, 강력한 호응 능력을 통해 이들은 게임을 끝내기 충분한 상황을 만들 것입니다. 이런 점을 모두 고려하면, 추천 챔피언은 다음과 같습니다.

- 진, 아펠리오스(중력포), 애쉬, 바루스처럼 원거리 cc 지원을 통해 아군과 호응할 수 있는 챔피언
- 시비르, 자야 처럼 핵심적인 상황에서 적의 공격을 한 번 흘리는 챔피언
- cc기 호응, 강력한 이동기, 긴 사거리를 모두 가진 케이틀린.
""",
      )),
  DataResult(
      'result16',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '숭고한', color: custom_color.labelColor4),
        SizedBox(width: 10),
        TextQuestion(words: '원딜')
      ]),
      const TextExplainResult(
        words:
            """ 원딜은 기본적으로 딜러 포지션입니다. 딜러란, 팀의 이익을 위해 때로는 이기적으로 굴 수 있어야 합니다. 따라서 숭고한 행동을 원하는 이들이 원딜을 하고자 한다면, 포지션을 변경하는 것을 추천합니다. 그러나 그럼에도 하고자 한다면, 정석적인 픽을 하거나, 서폿 분과 상의하여 원딜이 없는 특별한 바텀 조합을 구성해보시기 바랍니다. 보통 메타마다 그러한 비원딜 조합이 하나 이상은 있기 마련이니까요.

- 케이틀린, 애쉬처럼 아군이 받쳐주기 무난한 정석 원딜
- 바텀은 2인 라인인 만큼, 아군 서포터가 좋아하는 픽도 나쁘지 않습니다.
- 그 외의 바텀 파괴 조합.
""",
      )),
  DataResult(
      'result17',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '화려한', color: custom_color.labelColor1),
        SizedBox(width: 10),
        TextQuestion(words: '서포터')
      ]),
      const TextExplainResult(
        words:
            """ 바텀 라인전은 10 중 7이 서포터의 역량에 달렸습니다. 4명의 바텀유저들은 당신의 일거수일투족을 하나하나 눈여겨 볼 것이고, 당신이 화려한 실력을 뽑낸다면 최소한 이 4명은 당신의 활약을 기억할 것입니다. 다음은 유난히 ‘무엇인가를 한다’ 라고 느끼게 만드는 챔피언 목록입니다.

- 블리츠크랭크, 쓰레쉬, 파이크, 노틸러스, 스웨인 같은 적을 끌고 오는 챔피언
- 럭스, 룰루, 제라스, 자이라 등 사거리가 길고 견제가 빡센 챔피언
- 알리스타, 레오나, 라칸, 렐 처럼 화끈하게 먼저 들어가서 휘집어 놓는 챔피언
""",
      )),
  DataResult(
      'result18',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '정교한', color: custom_color.labelColor2),
        SizedBox(width: 10),
        TextQuestion(words: '서포터')
      ]),
      const TextExplainResult(
        words:
            """ 정교한 교전수행 능력과 상황판단 능력은 서포터에게 필수적인 덕목입니다. 왕자님은 cs를 챙겨야 해 미니맵을 잘 못보시니, 우리가 나서서 적 정글이나 미드의 상황, 시야의 여부를 통해 적 인원들의 바텀 개입 가능성을 판단하고 움직여야 합니다. 그러다 기회가 되면, 바텀에서 벗어나 상체에 개입하여 깽판을 쳐놓는 강단을 부리는 것도 좋을 것입니다. 따라서 우리에게는 상황에 따라 다르게 행동할 수 있는 다양한 수단을 가진 챔피언이 필요합니다.

- 쓰레쉬, 탐켄치 처럼 cc기가 강하고, 아군 원딜을 한 번 살릴 수 있는 챔피언
- 파이크, 바드, 질리언 처럼 상황에 적극 개입하고, 수틀리면 도망갈 수 있는 챔피언
- 소라카, 잔나, 모르가나, 레나타, 세라핀처럼 유리한 상황을 만들 수 있고, 상대가 만든 상황을 잘 받아칠 수 있는 챔피언.
""",
      )),
  DataResult(
      'result19',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '협력하는', color: custom_color.labelColor3),
        SizedBox(width: 10),
        TextQuestion(words: '서포터')
      ]),
      const TextExplainResult(
        words:
            """ 서포터는 그 이름부터가 협력에 특화된 라인입니다. 해당 라인에 서는 모든 챔피언이 아군과의 협력을 염두에 두고 설계되었습니다. (제라스만 빼고요.) 따라서 어떤 챔프를 사용하던 아군과 협력하면서 여러 즐거움을 얻을 수 있을 것입니다. 그래도 굳이 추천을 하자면, 무난하게 아군을 도와주며 지속적으로 그 효용가치를 인정받을 수 있는 챔피언들을 소개합니다.

- 나미, 룰루, 유미 등의 리스크가 비교적 적은 유틸 챔피언.
- 블리츠 크랭크 처럼 구조가 비교적 단순하여 하나에 집중하기 좋은 챔피언
""",
      )),
  DataResult(
      'result20',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '숭고한', color: custom_color.labelColor4),
        SizedBox(width: 10),
        TextQuestion(words: '서포터')
      ]),
      const TextExplainResult(
        words:
            """팀의 가장 고된 일을 책임지는 숭고한 마음가짐을 가진 당신은 서포터에 제격입니다. 딜량 좀 낮고 데스가 좀 높더라도, 아군 원딜러의 칭찬 한마디가 모든 뻐근함을 날려버립니다. 어떤 챔피언을 하던 숭고한 마음가짐을 가진 당신이라면 어울릴 것입니다. 다만, 다음 챔피언은 안됩니다.

- 바드같이 로밍으로 게임을 풀어가는 서포터
- 제라스, 벨코즈, 브랜드 같은 팀원의 고마움을 얻기 힘든 딜포터

추천 챔피언 목록은 다음과 같습니다.

- 알리스타, 레오나, 렐 같이 먼저 들어가 싸움을 여는 챔피언
- 룰루, 소라카, 잔나, 쓰레쉬 등 아군을 극적으로 살려내고 따봉을 받을 수 있는 챔피언
""",
      )),
];

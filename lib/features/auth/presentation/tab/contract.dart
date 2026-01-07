import 'package:ard_light/components/button.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';

class Contract extends StatefulWidget {
  final Function(int) onSave;

  const Contract({Key? key, required this.onSave}) : super(key: key);

  @override
  _ContractState createState() => _ContractState();
}

class _ContractState extends State<Contract> {
  void onDecline() {
    GoRouter.of(context).pop();
  }

  void onApprove() {
    widget.onSave(6);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Html(
                data: contractHtml,
                style: {
                  "h1": Style(
                    fontSize: FontSize(24),
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    color: Colors.black87,
                    margin: Margins.only(bottom: 20),
                  ),
                  "h2": Style(
                    fontSize: FontSize(18),
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                    margin: Margins.only(top: 15, bottom: 10),
                  ),
                  "p": Style(
                    fontSize: FontSize(14),
                    textAlign: TextAlign.justify,
                    lineHeight: LineHeight(1.6),
                    margin: Margins.only(bottom: 10),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  "strong": Style(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  "li": Style(color: Theme.of(context).colorScheme.primary),
                  ".party": Style(
                    backgroundColor: Colors.grey[200],
                    padding: HtmlPaddings.all(15),
                    margin: Margins.only(top: 10, bottom: 10),
                    color: Theme.of(context).colorScheme.primary,
                    border: Border(
                      left: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 4,
                      ),
                    ),
                  ),
                  ".signature": Style(
                    margin: Margins.only(top: 30),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Button(
                  onTap: onDecline,
                  text: AppLocalizations.of(context)!.validateContractReject,
                  color: Theme.of(context).colorScheme.secondary,
                  titleColor: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Button(
                  onTap: onApprove,
                  text: AppLocalizations.of(context)!.validateContractApprove,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const String contractHtml = '''
<h1>АЖЛЫН ГЭРЭЭ</h1>

<p><strong>Гэрээний дугаар:</strong> АГ-2025/001</p>
<p><strong>Огноо:</strong> 2025 оны 01 дүгээр сарын 07</p>
<p><strong>Газар:</strong> Улаанбаатар хот</p>

<div class="party">
  <h2>ГЭРЭЭНИЙ ТАЛУУД:</h2>
  <p><strong>ЗАХИАЛАГЧ:</strong> "Монгол ХХК" компани<br>
  <strong>Хаяг:</strong> СБД, 1-р хороо, Сүхбаатарын талбай<br>
  <strong>Утас:</strong> 7011-1234<br>
  <strong>Регистр:</strong> 1234567890</p>
  
  <p><strong>ГҮЙЦЭТГЭГЧ:</strong> Б.Болд<br>
  <strong>Хаяг:</strong> БЗД, 10-р хороо<br>
  <strong>Утас:</strong> 9999-8888<br>
  <strong>Регистр:</strong> УБ12345678</p>
</div>

<h2>1. ГЭРЭЭНИЙ ЗОРИЛГО</h2>
<p>Энэхүү гэрээ нь Захиалагч болон Гүйцэтгэгч хоёрын хооронд хийгдэх ажлын харилцааг зохицуулах зорилготой.</p>

<h2>2. АЖЛЫН АГУУЛГА</h2>
<p>Гүйцэтгэгч дараахь ажлуудыг хийж гүйцэтгэнэ:</p>
<ul>
  <li>Программ хангамж хөгжүүлэх</li>
  <li>Систем шинэчлэх</li>
  <li>Техникийн туслалцаа үзүүлэх</li>
  <li>Баримт бичиг бэлтгэх</li>
</ul>

<h2>3. ХУГАЦАА</h2>
<p>Гэрээ <strong>2025 оны 01 дүгээр сарын 07</strong>-ны өдрөөс эхлэн <strong>2025 оны 12 дугаар сарын 31</strong>-ний өдөр дуусна.</p>

<h2>4. ТӨЛБӨРИЙН НӨХЦӨЛ</h2>
<p>Захиалагч Гүйцэтгэгчид сар бүр <strong>3,000,000₮ (гурван сая төгрөг)</strong> цалин төлнө.</p>
<p>Цалинг сар бүрийн <strong>5-ны өдөр</strong> дансанд шилжүүлнэ.</p>

<h2>5. ТАЛУУДЫН ҮҮР ХАРИУЦЛАГА</h2>
<p><strong>Захиалагч:</strong></p>
<ul>
  <li>Ажлын орчин бүрдүүлэх</li>
  <li>Цалинг цагтай олгох</li>
  <li>Хууль ёсны баримт бичиг гаргах</li>
</ul>

<p><strong>Гүйцэтгэгч:</strong></p>
<ul>
  <li>Ажлыг чанартай гүйцэтгэх</li>
  <li>Ажлын дүрэм журам сахих</li>
  <li>Нууцлал хадгалах</li>
</ul>

<h2>6. ГЭРЭЭ ЦУЦЛАХ НӨХЦӨЛ</h2>
<p>Гэрээг дараахь тохиолдолд цуцалж болно:</p>
<ul>
  <li>Талуудын харилцан тохиролцсоноор</li>
  <li>30 хоногийн өмнө урьдчилан мэдэгдсэнээр</li>
  <li>Гэрээний нөхцөл зөрчигдсөн тохиолдолд</li>
</ul>

<h2>7. МАРГААН ШИЙДВЭРЛЭХ</h2>
<p>Гэрээтэй холбоотой маргааныг талууд эвлэрүүлэн шийдвэрлэх бөгөөд эвлэрч шийдвэрлэх боломжгүй бол Монгол Улсын хууль тогтоомжийн дагуу шүүхээр шийдвэрлүүлнэ.</p>

<h2>8. БУСАД НӨХЦӨЛ</h2>
<p>Гэрээг <strong>2 хувь</strong> үйлдэж, тал бүр <strong>1 хувийг</strong> эзэмшинэ.</p>
<p>Гэрээ нь талууд гарын үсэг зурснаар хүчин төгөлдөр болно.</p>

<div class="signature">
  <p><strong>ЗАХИАЛАГЧ:</strong><br>
  _______________________<br>
  Захирал: Ц.Дорж<br>
  Гарын үсэг: ___________</p>
</div>

<div class="signature">
  <p><strong>ГҮЙЦЭТГЭГЧ:</strong><br>
  _______________________<br>
  Б.Болд<br>
  Гарын үсэг: ___________</p>
</div>
''';

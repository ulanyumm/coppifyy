import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/purchase/purchases_provider.dart';
import 'package:hypotenuse/viewmodel/pricingPage_viewModel.dart';
import 'package:provider/provider.dart';

class CopifyMonth extends StatelessWidget {
  final String text;
  final String price;
  final int credit;
  final int id;
  final String paymentInterval;

  const CopifyMonth({
    Key? key,
    required this.text,
    required this.price,
    required this.credit,
    required this.id,
    required this.paymentInterval,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewmodel = Provider.of<PricingPageViewModel>(context);
    final purchaseProvider = Provider.of<PurchaseProvider>(context);

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                InkWell(
                    onTap: () {},
                    child: SvgPicture.asset('assets/images/icons/growth.svg',
                        height: 30)),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )
              ]),
              const Divider(
                thickness: 2,
              ),
              const Text(
                  "Start exploring now and find out if it's the perfect fit for you."),
              RichText(
                text: TextSpan(
                    text: '\$$price',
                    style: const TextStyle(color: Colors.black, fontSize: 23),
                    children: const <TextSpan>[
                      TextSpan(
                        text: ' /month',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      )
                    ]),
              ),
              const Text('Standart', style: TextStyle(fontSize: 18)),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: '$credit',
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                const TextSpan(
                  text: ' credits/month ',
                ),
              ])),
              const Text.rich(TextSpan(children: [
                WidgetSpan(
                    child: Icon(Icons.check, color: Colors.indigo, size: 20)),
                TextSpan(
                  text: 'Write your articles with Article Writing Tools',
                )
              ])),
              const Text.rich(TextSpan(children: [
                WidgetSpan(
                    child: Icon(Icons.check, color: Colors.indigo, size: 20)),
                TextSpan(
                  text: 'Text to Image Generation',
                )
              ])),
              const Text.rich(TextSpan(children: [
                WidgetSpan(
                    child: Icon(Icons.check, color: Colors.indigo, size: 20)),
                TextSpan(text: 'Unlimited free AI images')
              ])),
              const Text.rich(TextSpan(children: [
                WidgetSpan(
                    child: Icon(Icons.check, color: Colors.indigo, size: 20)),
                TextSpan(
                  text:
                      'Create CEO friendly advertisement for several platforms',
                )
              ])),
              const Text.rich(TextSpan(children: [
                WidgetSpan(
                    child: Icon(Icons.check, color: Colors.indigo, size: 20)),
                TextSpan(
                  text: 'Make your videos with guidance of Video Timeline Tool',
                )
              ])),
              const Text.rich(TextSpan(children: [
                WidgetSpan(
                    child: Icon(Icons.check, color: Colors.indigo, size: 20)),
                TextSpan(
                  text: 'Make your time consuming contents with ease',
                )
              ])),
              const Text.rich(TextSpan(children: [
                WidgetSpan(
                    child: Icon(Icons.check, color: Colors.indigo, size: 20)),
                TextSpan(
                  text: 'Create your content in 11 LANGUAGES',
                )
              ])),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 30,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: UIHelper.activeButtonColor(),
                    ),
                    onPressed: () async {
                      final product = purchaseProvider.products[
                          0]; // Seçilen ürünü alın (örneğin, PricingPageViewModel üzerinden alabilirsiniz).
                      try {
                        await purchaseProvider.buyProduct(product);
                        // Satın alma başarılıysa
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Satın alma işlemi başarılı oldu.'),
                        ));
                      } catch (e) {
                        // Satın alma işlemi başarısız veya iptal edildiyse
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              'Satın alma işlemi başarısız veya iptal edildi.'),
                        ));
                      }
                    },
                    child: const Text("Select")),
              ),
            ]),
      ),
    );
  }
}

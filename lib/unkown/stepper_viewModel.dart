/* import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/Stepper/blogArticlePage2.dart';
import 'package:hypotenuse/screen/Stepper/blogArticlePage3.dart';
import 'package:hypotenuse/screen/Stepper/blogArticlePost.dart';
import 'package:hypotenuse/viewmodel/Blog%20Article%20/blogArticlePost_viewmodel.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class StepperViewModel extends ChangeNotifier {
  bool isActiveButton = false;
  bool selectedMoreOptions = false;

  List<String> outlineList = [
    "Early Life and Background of Hasan",
    "The Journey to Success: Hasan's Career Path",
    "Unraveling the Secrets Behind Hasan's Success",
    "Hasan's Extraordinary Talents and Achievements",
    "Hasan's Secret to Success: Unleashing the Power Within",
  ];
  int currentStep = 0;

  bool isActiveStep(String stepTitle, BuildContext context) {
    if (stepTitle == 'Step 1') {
      return isActiveButton;
    } else if (stepTitle == 'Step 2') {
      // İkinci adımın isActive durumunu kontrol etmek için gerekli koşullar
      bool isFirstStepCompleted = isActiveButton;
      bool isSomeConditionMet = selectedMoreOptions;
      return isFirstStepCompleted && isSomeConditionMet;
    } else if (stepTitle == 'Step 3') {
      // Üçüncü adımın isActive durumunu kontrol etmek için gerekli koşullar
      return outlineList.isNotEmpty; // Örnek bir koşul
    }
    return false; // Varsayılan durum
  }

  List<Step> steps(BuildContext context) {
    return [
      Step(
        title: Text('Step 1'),
        content: BlogArticlePost(),
        isActive: isActiveStep('Step 1', context),
      ),
      Step(
        title: Text('Step 2'),
        content: BlogArticleTitle(),
        isActive: isActiveStep('Step 2', context),
      ),
      Step(
        title: Text('Step 3'),
        content: BlogArticleOutline(),
        isActive: isActiveStep('Step 3', context),
      ),
    ];
  }

  // Adımlar arasında ileri gitmeyi sağlayan metod
  stepContinueFunc(BuildContext context) {
    /*   if (currentStep < getSteps(context).length - 1) {
      currentStep++;
      //notifyListeners();
    } */

    ++currentStep;
  }

  // Adımlar arasında geri gitmeyi sağlayan metod
/*   stepCancelFunc() {
    if (currentStep > 0) {
      currentStep--;
      // notifyListeners();
    }
  } */

  // İleri gidip geri gitmeye uygun olan adımları oluşturan metod
  List<Step> getSteps(BuildContext context) {
    final viewModel =
        Provider.of<BlogArticlePostViewModel>(context, listen: false);

    return [
      _buildStep(context, viewModel, 'Step 1', BlogArticlePost()),
      _buildStep(context, viewModel, 'Step 2', BlogArticleTitle()),
      _buildStep(context, viewModel, 'Step 3', BlogArticleOutline()),
    ];
  }

  Step _buildStep(BuildContext context, BlogArticleProjectViewModel viewModel,
      String title, Widget content) {
    return Step(
      title: Text(title),
      content: SingleChildScrollView(child: content),
      //   isActive: viewModel.isActiveStep(title, context),
    );
  }

  buildStep1({
    required BuildContext context,
    required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
    required BlogArticlePostViewModel viewModel,
  }) {/*  */
    return Step(
      title: title,
      subtitle: Text('Subtitle'),
      state: state,
      isActive: isActive,
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Describe your topic *', style: UIHelper.getBaslikTextStyle()),
            TextFormField(
              maxLength: 800,
              controller: viewModel.describleTopicController,
              autofocus: false,
              minLines: 5,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(10),
                filled: true,
                fillColor: UIHelper.fillColor(),
                labelStyle: TextStyle(fontSize: 13),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            Text('Keywords *', style: UIHelper.getBaslikTextStyle()),
            SizedBox(height: 5),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () {
                      final blogViewModel =
                          Provider.of<BlogArticlePostViewModel>(context,
                              listen: false);
                      if (viewModel.keywordsController.text.isNotEmpty) {
                        blogViewModel.addItemToList(
                            viewModel.keywordsController.text, context);
                        viewModel.keywordsController.text = "";
                      } else {
                        Provider.of<BlogArticlePostViewModel>(context,
                                listen: false)
                            .checkAvailable(false);
                        viewModel.keywordsController.text = "";
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Değer giriniz"),
                          ),
                        );
                      }
                      Provider.of<BlogArticlePostViewModel>(context,
                              listen: false)
                          .isButtonActiveFunc();
                    },
                  ),
                ),
                controller: viewModel.keywordsController,
              ),
            ),
            Wrap(
              spacing: 8,
              children: Provider.of<BlogArticlePostViewModel>(context)
                  .keywordsList
                  .map((item) {
                return Chip(
                  label: Text(item),
                  onDeleted: () {
                    Provider.of<BlogArticlePostViewModel>(context,
                            listen: false)
                        .removeInterest(item);
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text('Tone *', style: UIHelper.getBaslikTextStyle()),
            SizedBox(height: 5),
            Consumer<BlogArticlePostViewModel>(
                builder: (context, viewModel, child) {
              return Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton(
                    focusColor: Colors.grey,
                    elevation: 0,
                    underline: Container(),
                    isExpanded: true,
                    value: viewModel.selectedTone,
                    onChanged: (value) {
                      Provider.of<BlogArticlePostViewModel>(context,
                              listen: false)
                          .selectToneFunc(value.toString());
                    },
                    items: viewModel.toneMap.keys.map((itemone) {
                      return DropdownMenuItem(
                          value: itemone,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(itemone),
                          ));
                    }).toList(),
                  ));
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Provider.of<BlogArticlePostViewModel>(context,
                            listen: false)
                        .animateContainer(context);
                  },
                  child: Text('More options',
                      style: TextStyle(color: Colors.grey)),
                ),
                IconButton(
                  onPressed: () {
                    Provider.of<BlogArticlePostViewModel>(context,
                            listen: false)
                        .animateContainer(context);
                  },
                  icon: Provider.of<BlogArticlePostViewModel>(context,
                              listen: false)
                          .selectedDrafts
                      ? Icon(Icons.keyboard_arrow_down)
                      : Icon(Icons.keyboard_arrow_up),
                ),
              ],
            ),
            Container(
              child: Selector<BlogArticlePostViewModel, bool>(
                builder: (context, selectedDrafts, child) {
                  return AnimatedContainer(
                    color: Colors.white,
                    height: Provider.of<BlogArticlePostViewModel>(context,
                                listen: false)
                            .selectedDrafts
                        ? MediaQuery.of(context).size.height * 0.2
                        : 0,
                    duration: const Duration(milliseconds: 300),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ToggleButtons(
                                  isSelected: [
                                    Provider.of<BlogArticlePostViewModel>(
                                                context)
                                            .selectedTabIndex ==
                                        0,
                                    Provider.of<BlogArticlePostViewModel>(
                                                context)
                                            .selectedTabIndex ==
                                        1,
                                    Provider.of<BlogArticlePostViewModel>(
                                                context)
                                            .selectedTabIndex ==
                                        2,
                                  ],
                                  onPressed: (index) {
                                    Provider.of<BlogArticlePostViewModel>(
                                            context,
                                            listen: false)
                                        .selectedTabIndex = index;

                                    Provider.of<BlogArticlePostViewModel>(
                                            context,
                                            listen: false)
                                        .setSelectedButtons(index);
                                  },
                                  renderBorder: false,
                                  children: [
                                    Container(
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color:
                                                  Provider.of<BlogArticlePostViewModel>(
                                                                  context)
                                                              .selectedTabIndex ==
                                                          0
                                                      ? Color.fromARGB(
                                                          255, 20, 10, 117)
                                                      : Colors.transparent)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text('First Person',
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Provider.of<BlogArticlePostViewModel>(
                                                              context)
                                                          .selectedTabIndex ==
                                                      1
                                                  ? Color.fromARGB(
                                                      255, 144, 135, 229)
                                                  : Colors.transparent)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text('Second Person',
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Provider.of<BlogArticlePostViewModel>(
                                                              context)
                                                          .selectedTabIndex ==
                                                      2
                                                  ? Color.fromARGB(
                                                      255, 144, 135, 229)
                                                  : Colors.transparent)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text('Third Person',
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: TextFormField(
                              controller: viewModel.audienceController,
                              autofocus: false,
                              minLines: 1,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(10),
                                filled: true,
                                fillColor: UIHelper.fillColor(),
                                labelStyle: TextStyle(fontSize: 12),
                                hintText:
                                    'those who want to their writing skills',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                selector: (context, viewModel) => viewModel.selectedDrafts,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Selector<BlogArticlePostViewModel, bool>(
              builder: (context, isActiveButton, child) {
                return SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.035,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: UIHelper.activeButtonColor(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: Provider.of<BlogArticlePostViewModel>(context,
                                  listen: false)
                              .isActiveButton
                          ? () {
                              Provider.of<BlogArticlePostViewModel>(context,
                                      listen: false)
                                  .postTransiction(
                                      topic: viewModel
                                          .describleTopicController.text,
                                      keywords:
                                          viewModel.keywordsList.toString(),
                                      toneId: viewModel.selectedToneId,
                                      viewId: viewModel.articleTabSelected);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlogArticleTitle()),
                              );
                            }
                          : null,
                      child: Selector<BlogArticlePostViewModel, bool>(
                        builder: (context, isLoading, child) {
                          return isLoading
                              ? CircularProgressIndicator()
                              : Text(
                                  'Renew Outline',
                                  style: UIHelper.getButtonTextStyle(),
                                );
                        },
                        selector: (context, state) => state.isLoading,
                      ),
                    ));
              },
              selector: (context, state) => state.isActiveButton,
            ),
            NoContent(),
            SizedBox(height: 10),
          ]),
        ),
      ),
    );
  }
}
 */
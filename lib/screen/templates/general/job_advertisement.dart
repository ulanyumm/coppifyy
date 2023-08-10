import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/jobAdvertisement_viewModel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class JobAdvertisement extends StatefulWidget {
  const JobAdvertisement({super.key});

  @override
  State<JobAdvertisement> createState() => _JobAdvertisementState();
}

class _JobAdvertisementState extends State<JobAdvertisement> {
  JobAdvertisementViewModel viewModel = JobAdvertisementViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: viewModel.scaffoldKey,
        drawer: DrawerMenu(),
        floatingActionButton: FloatingActionButton(
          child: SvgPicture.asset("assets/images/icons/logo1.svg", height: 60),
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            viewModel.scaffoldKey.currentState!.openDrawer();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 44.0),
            child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Job Advertisement',
                          style: UIHelper.getAnaBaslikTextStyle()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Write a professional job advertisement that will help you attract top talents.',
                        style: UIHelper.getIcerikTextStyle(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Job *',
                        style: UIHelper.getBaslikTextStyle(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Form(
                        key: viewModel.key,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              onChanged: (value) {},
                              controller: viewModel.job,
                              autofocus: false,
                              minLines: 1,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(10),
                                filled: true,
                                fillColor: UIHelper.fillColor(),
                                labelStyle: TextStyle(fontSize: 12),
                                hintText:
                                    'architect, human, resources manager, etc',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              'Job Info  *',
                              style: UIHelper.getBaslikTextStyle(),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              maxLength: 1000,
                              onChanged: (value) {},
                              controller: viewModel.jobInfo,
                              autofocus: false,
                              minLines: 6,
                              decoration: InputDecoration(
                                isDense: true,
                                filled: true,
                                fillColor: UIHelper.fillColor(),
                                labelStyle: TextStyle(fontSize: 13),
                                hintText: 'Info about the role',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              'What employee are you looking for? *',
                              style: UIHelper.getBaslikTextStyle(),
                            ),
                            TextFormField(
                              maxLength: 1000,
                              onChanged: (value) {},
                              controller: viewModel.employee,
                              autofocus: false,
                              minLines: 4,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: UIHelper.fillColor(),
                                labelStyle: TextStyle(fontSize: 13),
                                hintText:
                                    "-Bachelor's degree in Computer Science or related field-Proficiency in at least one programming language (such as Java, Python) -Strong problem-solving skills and attention to detail-Ability to work effectively both independently and as part of a team -Good communication skills",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text('Tone *',
                                style: UIHelper.getBaslikTextStyle()),
                            SizedBox(height: 5),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButton(
                                focusColor: Colors.grey,
                                elevation: 0,
                                underline: Container(),
                                isExpanded: true,
                                value: viewModel.selectedTone,
                                onChanged: (value) {
                                  Provider.of<JobAdvertisementViewModel>(
                                          context,
                                          listen: false)
                                      .instaTone(value.toString());
                                },
                                items: viewModel.jobToneMap.keys.map((toneKey) {
                                  return DropdownMenuItem(
                                      value: toneKey,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: Text(toneKey),
                                      ));
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Provider.of<JobAdvertisementViewModel>(
                                            context,
                                            listen: false)
                                        .animateContainer(context);
                                  },
                                  child: Text('More options',
                                      style: TextStyle(color: Colors.grey)),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Provider.of<JobAdvertisementViewModel>(
                                            context,
                                            listen: false)
                                        .animateContainer(context);
                                  },
                                  icon: viewModel.selectedDrafts
                                      ? Icon(Icons.keyboard_arrow_down)
                                      : Icon(Icons.keyboard_arrow_up),
                                ),
                              ],
                            ),
                            AnimatedContainer(
                              color: Colors.white,
                              width: double.infinity,
                              height: Provider.of<JobAdvertisementViewModel>(
                                          context,
                                          listen: false)
                                      .selectedDrafts
                                  ? MediaQuery.of(context).size.height * 0.12
                                  : 0,
                              duration: const Duration(milliseconds: 300),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Company Name',
                                      style: UIHelper.getBaslikTextStyle()),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    child: TextField(
                                      onChanged: (value) {},
                                      controller: viewModel.companyName,
                                      autofocus: false,
                                      minLines: 1,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        isDense: true,
                                        fillColor: UIHelper.fillColor(),
                                        labelStyle: TextStyle(fontSize: 13),
                                        hintText: 'blog writers and marketers',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            SizedBox(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.035,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  onPressed: viewModel.job.text.isNotEmpty &&
                                          viewModel.jobInfo.text.isNotEmpty &&
                                          viewModel.selectedTone != null
                                      ? () {
                                          //post işlemleri
                                        }
                                      : null,
                                  child:
                                      Selector<JobAdvertisementViewModel, bool>(
                                    builder: (context, isLoading, child) {
                                      return isLoading
                                          ? CircularProgressIndicator()
                                          : Text(
                                              'Generate',
                                              style:
                                                  UIHelper.getButtonTextStyle(),
                                            );
                                    },
                                    selector: (context, state) =>
                                        state.isLoading,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Consumer<JobAdvertisementViewModel>(
                          builder: ((context, state, child) {
                        return state.isDataAvailable
                            ? Container()
                            : NoContent();
                      }))
                    ]))));
  }
}

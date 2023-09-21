import '../../../../core/constants/app_text.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/enums/gender_type.dart';
import '../../../../core/enums/login_step.dart';
import '../../../../core/extensions/string_formatting.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../providers/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/widgets/elevated_button.dart';
import '../../../../core/widgets/genric_drop_down.dart';
import '../../../../core/widgets/input_field.dart';
import '../../base/base_view_model.dart';

class CCLoginWidget extends StatelessWidget {
  const CCLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BaseView<AuthViewModel>(
      builder: (context, model, _) {
        return Form(
          key: model.loginFormKey,
          child: Column(
            children: [
              if (model.loginStep == LoginStep.login) ...[
                AppInputForm(
                  controller: model.mobileNumberController,
                  hintText: AppText.phoneNumber,
                  suffixIcon: AppIcons.close,
                  iconSize: 30,
                  iconColor: AppColor.white,
                  maxLength: Constants.phoneMaxLen,
                  validator: AppValidator.mobileNumber,
                  suffixWidget: Container(
                    width: 130,
                    height: 20,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: AppElevatedButton(
                      title: AppText.send,
                      onPressed: () {
                        final isValid =
                            model.loginFormKey.currentState!.validate();
                        if (isValid) {
                          model.setIsVerified(true);
                        }
                      },
                      fontSize: 12,
                      color: AppColor.lightNavyBlue,
                      padding: const EdgeInsets.all(0.0),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                AppInputForm(
                  controller: model.otpController,
                  hintText: AppText.enterOTP,
                  inputType: TextInputType.number,
                  maxLength: Constants.otpMaxLen,
                  suffixIcon: AppIcons.close,
                  iconSize: 30,
                  iconColor: AppColor.white,
                  validator: AppValidator.otp,
                  suffixIconHandler: () {
                    model.otpController.clear();
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: AppElevatedButton(
                    title: AppText.verify,
                    onPressed: () {
                      final isFormValid =
                          model.loginFormKey.currentState!.validate();
                      if (!isFormValid) {
                        return;
                      }
                      final otp = model.otpController.text;
                      final isValid = ((otp.length) == Constants.otpMaxLen &&
                          model.isVerified);
                      if (isValid) {
                        model.setLoginStep(LoginStep.one);
                      } else {
                        showSnackBar(
                          context,
                          msg: "Invalid OTP!",
                          isError: true,
                        );
                      }
                    },
                  ),
                ),
              ],
              if (model.loginStep == LoginStep.one) ...[
                Column(
                  children: [
                    const SizedBox(height: 30),
                    AppInputForm(
                      controller: model.fullNameController,
                      hintText: AppText.enterFullName,
                      suffixIcon: AppIcons.close,
                      iconColor: model.fullNameController.text.isEmpty
                          ? AppColor.grey
                          : AppColor.white,
                      maxLength: 50,
                      validator: AppValidator.fullName,
                      suffixIconHandler: () {},
                    ),
                    SizedBox(height: screenSize.height * 0.1),
                    SizedBox(
                      width: screenSize.width * 0.5,
                      child: AppElevatedButton(
                        title: AppText.next,
                        onPressed: () {
                          final isValid =
                              model.loginFormKey.currentState!.validate();
                          if (isValid) {
                            model.setLoginStep(LoginStep.two);
                          } else {}
                        },
                      ),
                    ),
                  ],
                ),
              ],
              if (model.loginStep == LoginStep.two) ...[
                Column(
                  children: [
                    const SizedBox(height: 30),
                    AppDropDownButton<GenderType>(
                      items: Constants.genders,
                      onChanged: (val) {
                        model.setGenderType(val);
                      },
                      initialItem: model.genderType,
                      titleHandler: (gen) {
                        return gen.name.toTitleCase();
                      },
                    ),
                    const SizedBox(height: 15),
                    AppInputForm(
                      controller: model.dobController,
                      hintText: AppText.dateOfBirth,
                      suffixIcon: Icons.date_range,
                      validator: AppValidator.dob,
                      suffixIconHandler: () async {
                        final DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.utc(1900),
                          lastDate: DateTime.now(),
                        );

                        if (selectedDate != null &&
                            selectedDate != DateTime.now()) {
                          model.dobController.text =
                              DateFormat(Constants.dateFormat)
                                  .format(selectedDate);
                        }
                      },
                    ),
                    SizedBox(height: screenSize.height * 0.1),
                    SizedBox(
                      width: screenSize.width * 0.5,
                      child: AppElevatedButton(
                        title: AppText.login,
                        onPressed: () {
                          if (model.dob == DateTime.now()) {
                            showSnackBar(
                              context,
                              msg: "Please select a valid DOB!",
                              isError: true,
                            );
                          } else {
                            // Navigate to Dashboard
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ]
            ],
          ),
        );
      },
    );
  }
}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:kts_booking_api/src/model/summary_response.dart';
import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:kts_booking_api/src/date_serializer.dart';
import 'package:kts_booking_api/src/model/date.dart';

import 'package:kts_booking_api/src/model/account_dto.dart';
import 'package:kts_booking_api/src/model/account_exists_response.dart';
import 'package:kts_booking_api/src/model/accounting_period_overview_response.dart';
import 'package:kts_booking_api/src/model/accounting_period_overview_stats.dart';
import 'package:kts_booking_api/src/model/accouting_period_dto.dart';
import 'package:kts_booking_api/src/model/address_dto.dart';
import 'package:kts_booking_api/src/model/app_fac_problem_details.dart';
import 'package:kts_booking_api/src/model/app_fac_problem_details_all_of.dart';
import 'package:kts_booking_api/src/model/appointment_dto.dart';
import 'package:kts_booking_api/src/model/bk_user_dto.dart';
import 'package:kts_booking_api/src/model/cancel_appointment_request.dart';
import 'package:kts_booking_api/src/model/change_password_request.dart';
import 'package:kts_booking_api/src/model/country.dart';
import 'package:kts_booking_api/src/model/create_appointment_request.dart';
import 'package:kts_booking_api/src/model/create_appointment_response.dart';
import 'package:kts_booking_api/src/model/create_cusotmer_response.dart';
import 'package:kts_booking_api/src/model/create_customer_request.dart';
import 'package:kts_booking_api/src/model/create_expense_request.dart';
import 'package:kts_booking_api/src/model/create_expense_response.dart';
import 'package:kts_booking_api/src/model/create_income_request.dart';
import 'package:kts_booking_api/src/model/create_income_response.dart';
import 'package:kts_booking_api/src/model/create_service_request.dart';
import 'package:kts_booking_api/src/model/create_service_response.dart';
import 'package:kts_booking_api/src/model/customer_dto.dart';
import 'package:kts_booking_api/src/model/delete_customer_request.dart';
import 'package:kts_booking_api/src/model/delete_expense_request.dart';
import 'package:kts_booking_api/src/model/delete_income_request.dart';
import 'package:kts_booking_api/src/model/delete_service_request.dart';
import 'package:kts_booking_api/src/model/deposit_type.dart';
import 'package:kts_booking_api/src/model/expense_by_category_item.dart';
import 'package:kts_booking_api/src/model/expense_category_dto.dart';
import 'package:kts_booking_api/src/model/expense_dto.dart';
import 'package:kts_booking_api/src/model/file_dto.dart';
import 'package:kts_booking_api/src/model/forgot_password_request.dart';
import 'package:kts_booking_api/src/model/get_account_notifications_response.dart';
import 'package:kts_booking_api/src/model/get_account_response.dart';
import 'package:kts_booking_api/src/model/get_appointment_response.dart';
import 'package:kts_booking_api/src/model/income_dto.dart';
import 'package:kts_booking_api/src/model/init_account_expense_by_category_response.dart';
import 'package:kts_booking_api/src/model/init_account_expense_response.dart';
import 'package:kts_booking_api/src/model/init_account_expenses_response.dart';
import 'package:kts_booking_api/src/model/init_account_income_response.dart';
import 'package:kts_booking_api/src/model/init_account_incomes_response.dart';
import 'package:kts_booking_api/src/model/init_appointment_response.dart';
import 'package:kts_booking_api/src/model/init_customers_response.dart';
import 'package:kts_booking_api/src/model/init_services_response.dart';
import 'package:kts_booking_api/src/model/notification_dto.dart';
import 'package:kts_booking_api/src/model/payment.dart';
import 'package:kts_booking_api/src/model/payment2.dart';
import 'package:kts_booking_api/src/model/payment_method.dart';
import 'package:kts_booking_api/src/model/problem_details.dart';
import 'package:kts_booking_api/src/model/service_dto.dart';
import 'package:kts_booking_api/src/model/set_notification_request.dart';
import 'package:kts_booking_api/src/model/signup_request.dart';
import 'package:kts_booking_api/src/model/signup_response.dart';
import 'package:kts_booking_api/src/model/subscription_type.dart';
import 'package:kts_booking_api/src/model/update_account_request.dart';
import 'package:kts_booking_api/src/model/update_account_response.dart';
import 'package:kts_booking_api/src/model/update_appointment_request.dart';
import 'package:kts_booking_api/src/model/update_appointment_response.dart';
import 'package:kts_booking_api/src/model/update_cusotmer_response.dart';
import 'package:kts_booking_api/src/model/update_customer_request.dart';
import 'package:kts_booking_api/src/model/update_expense_request.dart';
import 'package:kts_booking_api/src/model/update_expense_response.dart';
import 'package:kts_booking_api/src/model/update_income_request.dart';
import 'package:kts_booking_api/src/model/update_income_response.dart';
import 'package:kts_booking_api/src/model/update_service_request.dart';
import 'package:kts_booking_api/src/model/update_service_response.dart';
import 'package:kts_booking_api/src/model/upload_file_response.dart';
import 'package:kts_booking_api/src/model/welcome_notification_dto.dart';

part 'serializers.g.dart';

@SerializersFor([
  AccountDto,
  AccountExistsResponse,
  AccountingPeriodOverviewResponse,
  AccountingPeriodOverviewStats,
  AccoutingPeriodDto,
  AddressDto,
  AppFacProblemDetails,
  AppFacProblemDetailsAllOf,$AppFacProblemDetailsAllOf,
  AppointmentDto,
  BkUserDto,
  CancelAppointmentRequest,
  ChangePasswordRequest,
  Country,
  CreateAppointmentRequest,
  CreateAppointmentResponse,
  CreateCusotmerResponse,
  CreateCustomerRequest,
  CreateExpenseRequest,
  CreateExpenseResponse,
  CreateIncomeRequest,
  CreateIncomeResponse,
  CreateServiceRequest,
  CreateServiceResponse,
  CustomerDto,
  DeleteCustomerRequest,
  DeleteExpenseRequest,
  DeleteIncomeRequest,
  DeleteServiceRequest,
  DepositType,
  ExpenseByCategoryItem,
  ExpenseCategoryDto,
  ExpenseDto,
  FileDto,
  ForgotPasswordRequest,
  GetAccountNotificationsResponse,
  GetAccountResponse,
  GetAppointmentResponse,
  IncomeDto,
  InitAccountExpenseByCategoryResponse,
  InitAccountExpenseResponse,
  InitAccountExpensesResponse,
  InitAccountIncomeResponse,
  InitAccountIncomesResponse,
  InitAppointmentResponse,
  InitCustomersResponse,
  InitServicesResponse,
  NotificationDto,$NotificationDto,
  Payment,
  Payment2,
  PaymentMethod,
  ProblemDetails,$ProblemDetails,
  ServiceDto,
  SetNotificationRequest,
  SignupRequest,
  SignupResponse,
  SubscriptionType,
  UpdateAccountRequest,
  UpdateAccountResponse,
  UpdateAppointmentRequest,
  UpdateAppointmentResponse,
  UpdateCusotmerResponse,
  UpdateCustomerRequest,
  UpdateExpenseRequest,
  UpdateExpenseResponse,
  UpdateIncomeRequest,
  UpdateIncomeResponse,
  UpdateServiceRequest,
  UpdateServiceResponse,
  UploadFileResponse,
  WelcomeNotificationDto,
  SummaryResponse,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(AppFacProblemDetailsAllOf.serializer)
      ..add(NotificationDto.serializer)
      ..add(ProblemDetails.serializer)
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kts_mobile/common/identity/services/token.provider.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/modules/account/account.view.dart';
import 'package:kts_mobile/modules/account/components/change-password/change-password.view.dart';
import 'package:kts_mobile/modules/account/components/forgot-password/forgot-password.view.dart';
import 'package:kts_mobile/modules/account/components/login/login.view.dart';
import 'package:kts_mobile/modules/account/components/signup/signup.view.dart';
import 'package:kts_mobile/modules/account/employment-info.view.dart';
import 'package:kts_mobile/modules/calendar/appointment.view.dart';
import 'package:kts_mobile/modules/calendar/calendar.view.dart';
import 'package:kts_mobile/modules/expenses/expense-category-breakdown.view.dart';
import 'package:kts_mobile/modules/expenses/expense.view.dart';
import 'package:kts_mobile/modules/expenses/expenses.view.dart';
import 'package:kts_mobile/modules/global/shell/components/shell.view.dart';
import 'package:kts_mobile/modules/global/splash/components/splash.view.dart';
import 'package:kts_mobile/modules/income/income.view.dart';
import 'package:kts_mobile/modules/income/incomes.view.dart';
import 'package:kts_mobile/modules/notifications/notifications.view.dart';
import 'package:kts_mobile/modules/overview/overview.view.dart';
import 'package:kts_mobile/modules/settings/customer/customers.view.dart';
import 'package:kts_mobile/modules/settings/service/services.view.dart';
import 'package:kts_mobile/modules/settings/settings.view.dart';
import 'package:kts_mobile/modules/summaries/summaries.view.dart';
import 'package:kts_mobile/common/api/factory.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'dart:async';

class KtsRouteConfigurator {
  static final KtsBookingApi apiClient = createApi();

  static StreamController<void> shelladdStream =
      StreamController<void>.broadcast();

  static StreamController<bool> toggleAddStream =
      StreamController<bool>.broadcast();

  static GoRouter getConfig(bool hasLoggedIn) {
    return GoRouter(
      initialLocation: hasLoggedIn ? "/login" : "/",
      routes: <RouteBase>[
        ShellRoute(
            builder: (context, state, child) => Shell(
                  child: child,
                  addStream: shelladdStream,
                  toggleAddStream: toggleAddStream.stream,
                  apiClient: apiClient,
                ),
            routes: [
              GoRoute(
                  path: "/overview",
                  name: KtsRoutingLinks.overview,
                  pageBuilder: (context, state) => MaterialPage<void>(
                        key: state.pageKey,
                        child: OverviewView(apiClient, toggleAddStream),
                      )),
              GoRoute(
                  path: "/calendar",
                  name: KtsRoutingLinks.calendar,
                  pageBuilder: (context, state) => MaterialPage<void>(
                        key: state.pageKey,
                        child: CalendarViewScreen(
                          apiClient,
                          shelladdStream.stream,
                          toggleAddStream,
                          initalDateTime:
                              state.queryParams["initalDateTime"] != null
                                  ? DateTime.parse(
                                      state.queryParams["initalDateTime"]!)
                                  : null,
                        ),
                      ),
                  routes: [
                    GoRoute(
                      path: "create:proposedDateTime",
                      name: KtsRoutingLinks.create_appointment_with_datetime,
                      pageBuilder: (context, state) => MaterialPage<void>(
                          key: state.pageKey,
                          child: AppointmentView.create(
                            apiClient,
                            toggleAddStream,
                            proposedDateTime: DateTime.parse(
                                state.params["proposedDateTime"]!),
                          )),
                    ),
                    GoRoute(
                      path: "create",
                      name: KtsRoutingLinks.create_appointment,
                      pageBuilder: (context, state) => MaterialPage<void>(
                        key: state.pageKey,
                        child:
                            AppointmentView.create(apiClient, toggleAddStream),
                      ),
                    ),
                    GoRoute(
                      path: "edit/:id",
                      name: KtsRoutingLinks.edit_appointment,
                      pageBuilder: (context, state) => MaterialPage<void>(
                        key: state.pageKey,
                        child: AppointmentView.edit(apiClient,
                            int.parse(state.params["id"]!), toggleAddStream),
                      ),
                    )
                  ]),
              GoRoute(
                  path: "/expenses-breakdown",
                  name: KtsRoutingLinks.expenses_breakdown,
                  pageBuilder: (context, state) => MaterialPage<void>(
                        key: state.pageKey,
                        child: ExpensesCategoryBreakdownView(
                            apiClient, shelladdStream.stream, toggleAddStream),
                      ),
                  routes: [
                    GoRoute(
                      path: "create",
                      name: KtsRoutingLinks.create_expense_from_category,
                      pageBuilder: (context, state) => MaterialPage<void>(
                        key: state.pageKey,
                        child: ExpenseView.create(apiClient, toggleAddStream),
                      ),
                    ),
                    GoRoute(
                        path: "expenses:categoryId",
                        name: KtsRoutingLinks.expenses,
                        pageBuilder: (context, state) => MaterialPage<void>(
                              key: state.pageKey,
                              child: ExpensesView(
                                  apiClient,
                                  shelladdStream.stream,
                                  toggleAddStream,
                                  int.parse(state.params["categoryId"]!)),
                            ),
                        routes: [
                          GoRoute(
                            path: "create",
                            name: KtsRoutingLinks.create_expense,
                            pageBuilder: (context, state) => MaterialPage<void>(
                              key: state.pageKey,
                              child: ExpenseView.create(
                                  apiClient, toggleAddStream,
                                  categoryId: state.params["categoryId"] != null
                                      ? int.parse(
                                          state.params["categoryId"] ?? "")
                                      : null),
                            ),
                          ),
                          GoRoute(
                            path: "edit/:id",
                            name: KtsRoutingLinks.edit_expense,
                            pageBuilder: (context, state) => MaterialPage<void>(
                              key: state.pageKey,
                              child: ExpenseView.edit(
                                  apiClient,
                                  toggleAddStream,
                                  int.parse(state.params["id"]!),
                                  categoryId: state.params["categoryId"] != null
                                      ? int.parse(
                                          state.params["categoryId"] ?? "")
                                      : null),
                            ),
                          )
                        ]),
                  ]),
              GoRoute(
                  path: "/income",
                  name: KtsRoutingLinks.income,
                  pageBuilder: (context, state) => MaterialPage<void>(
                        key: state.pageKey,
                        child: IncomesView(
                            apiClient, shelladdStream.stream, toggleAddStream),
                      ),
                  routes: [
                    GoRoute(
                      path: "create",
                      name: KtsRoutingLinks.create_income,
                      pageBuilder: (context, state) => MaterialPage<void>(
                        key: state.pageKey,
                        child: IncomeView.create(apiClient, toggleAddStream),
                      ),
                    ),
                    GoRoute(
                      path: "edit/:id",
                      name: KtsRoutingLinks.edit_income,
                      pageBuilder: (context, state) => MaterialPage<void>(
                        key: state.pageKey,
                        child: IncomeView.edit(apiClient, toggleAddStream,
                            int.parse(state.params["id"]!)),
                      ),
                    )
                  ]),
              GoRoute(
                  path: "/summaries",
                  name: KtsRoutingLinks.summaries,
                  pageBuilder: (context, state) => MaterialPage<void>(
                      key: state.pageKey,
                      child: SummariesView(apiClient, toggleAddStream))),
            ]),
        GoRoute(
            path: "/settings",
            name: KtsRoutingLinks.settings,
            builder: (BuildContext context, GoRouterState state) {
              return SettingsView(apiClient, toggleAddStream);
            },
            routes: [
              GoRoute(
                path: "account-details",
                name: KtsRoutingLinks.edit_account_details,
                pageBuilder: (context, state) => MaterialPage<void>(
                  key: state.pageKey,
                  child: AccountView(apiClient),
                ),
              ),
              GoRoute(
                path: "employment-income",
                name: KtsRoutingLinks.edit_employment_income,
                pageBuilder: (context, state) => MaterialPage<void>(
                  key: state.pageKey,
                  child: EmploymentInfoView(apiClient),
                ),
              ),
              GoRoute(
                path: "customers",
                name: KtsRoutingLinks.customers,
                pageBuilder: (context, state) => MaterialPage<void>(
                  key: state.pageKey,
                  child: CustomersView(apiClient),
                ),
              ),
              GoRoute(
                path: "services",
                name: KtsRoutingLinks.services,
                pageBuilder: (context, state) => MaterialPage<void>(
                  key: state.pageKey,
                  child: ServicesView(
                      apiClient, shelladdStream.stream, toggleAddStream),
                ),
              ),
              GoRoute(
                path: "change-password",
                name: KtsRoutingLinks.change_password,
                pageBuilder: (context, state) => MaterialPage<void>(
                  key: state.pageKey,
                  child: ChangePasswordView(apiClient),
                ),
              ),
            ]),
        GoRoute(
            path: "/notifications",
            name: KtsRoutingLinks.notifications,
            builder: (BuildContext context, GoRouterState state) {
              return NotificationsView(apiClient, toggleAddStream);
            }),
        GoRoute(
          path: "/signup",
          name: KtsRoutingLinks.signup,
          builder: (BuildContext context, GoRouterState state) {
            return SignupView(apiClient);
          },
        ),
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return SplashView();
          },
        ),
        GoRoute(
          path: "/login",
          name: KtsRoutingLinks.login,
          builder: (BuildContext context, GoRouterState state) {
            return LoginView(apiClient);
          },
        ),
        GoRoute(
          path: "/forgot-password",
          name: KtsRoutingLinks.forgot_password,
          builder: (BuildContext context, GoRouterState state) {
            return ForgotPasswordView(apiClient);
          },
        )
      ],
    );
  }
}

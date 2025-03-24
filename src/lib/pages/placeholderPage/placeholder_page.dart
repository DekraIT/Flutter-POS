import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:src/core/route/app_router.gr.dart';
import 'package:src/pages/homePage/home_page.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

@RoutePage()
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({
    super.key,
  }); // Add the title parameter to the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SupaEmailAuth(
            redirectTo: kIsWeb ? null : 'io.mydomain.myapp://callback',
            onSignInComplete: (response) {
              if (response.session?.accessToken != null) {
                context.router.replaceAll([const HomeRoute()]);
              }
            },
            onSignUpComplete: (response) {},
            metadataFields: [
              MetaDataField(
                prefixIcon: const Icon(Icons.person),
                label: 'Username',
                key: 'username',
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter something';
                  }
                  return null;
                },
              ),
            ],
          )
        ]));
  }
}

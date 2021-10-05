import 'package:brasil_fields/brasil_fields.dart';
import 'package:coffee_shop_website_design/app/modules/core/core_store.dart';
import 'package:coffee_shop_website_design/app/shared/custom_text_form_field/custom_text_form_field.dart';
import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:coffee_shop_website_design/app/modules/contact/contact_store.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ContactPage extends StatefulWidget {
  final String title;
  const ContactPage({Key? key, this.title = 'ContactPage'}) : super(key: key);
  @override
  ContactPageState createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  final ContactStore store = Modular.get();
  final CoreStore coreStore = Modular.get();
  final ConstStyle constStyle = ConstStyle();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, sizingInformation) => LayoutBuilder(
            builder: (context, constraints) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AutoScrollTag(
                        key: const ValueKey(5),
                        controller: coreStore.scrollController,
                        index: 5,
                        child: Text(
                          store.textInfo("contactUsTitle"),
                          style: TextStyle(
                              color: constStyle.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: sizingInformation.isDesktop
                                  ? constraints.maxWidth * 0.03
                                  : constraints.maxWidth * 0.1),
                          textAlign: TextAlign.center,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: sizingInformation.isDesktop ? 50 : 15),
                      child: sizingInformation.isDesktop ||
                              sizingInformation.isTablet
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 50,
                                  child: MouseRegion(
                                    onExit: (value) {
                                      if (sizingInformation.isDesktop) {
                                        coreStore.setMapIsHover(false);
                                      }
                                    },
                                    onHover: (value) {
                                      if (sizingInformation.isDesktop) {
                                        coreStore.setMapIsHover(true);
                                      }
                                    },
                                    child: Container(
                                      height: constraints.maxHeight / 1.6,
                                      color: constStyle.backgroundColor,
                                      child: FlutterMap(
                                        options: MapOptions(
                                          center:
                                              LatLng(-5.8112814, -35.2084129),
                                        ),
                                        layers: [
                                          TileLayerOptions(
                                              urlTemplate:
                                                  "http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",
                                              subdomains: [
                                                'mt0',
                                                'mt1',
                                                'mt2',
                                                'mt3'
                                              ]),
                                          MarkerLayerOptions(
                                            markers: [
                                              Marker(
                                                point: LatLng(
                                                    -5.8112814, -35.2084129),
                                                builder: (context) => Icon(
                                                  Icons.location_on,
                                                  color:
                                                      constStyle.primaryColor,
                                                  semanticLabel:
                                                      'Sua localização atual',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 50,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    height: constraints.maxHeight / 1.6,
                                    color: constStyle.backgroundColor,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          store.textInfo("contactUSTxt1"),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  constraints.maxWidth * 0.02),
                                        ),
                                        CustomTextFormField(
                                            prefixIcon: const Icon(Icons.person,
                                                color: Colors.white),
                                            hint:
                                                store.textInfo("contactUSTxt2"),
                                            obscureText: false,
                                            needTheSpace: false),
                                        CustomTextFormField(
                                            prefixIcon: const Icon(
                                              Icons.email,
                                              color: Colors.white,
                                            ),
                                            hint:
                                                store.textInfo("contactUSTxt3"),
                                            obscureText: false,
                                            needTheSpace: false),
                                        CustomTextFormField(
                                            prefixIcon: const Icon(
                                              Icons.phone,
                                              color: Colors.white,
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              TelefoneInputFormatter()
                                            ],
                                            hint:
                                                store.textInfo("contactUSTxt4"),
                                            obscureText: false,
                                            needTheSpace: false),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary:
                                                    constStyle.primaryColor),
                                            onPressed: () {},
                                            child: Text(store
                                                .textInfo("contactUSButton")))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(
                              width: constraints.maxWidth,
                              height: constraints.maxHeight * 0.8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 50,
                                    child: Container(
                                      height: constraints.maxHeight / 1.6,
                                      width: constraints.maxWidth,
                                      color: constStyle.backgroundColor,
                                      child: FlutterMap(
                                        options: MapOptions(
                                          center:
                                              LatLng(-5.8112814, -35.2084129),
                                        ),
                                        layers: [
                                          TileLayerOptions(
                                              urlTemplate:
                                                  "http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",
                                              subdomains: [
                                                'mt0',
                                                'mt1',
                                                'mt2',
                                                'mt3'
                                              ]),
                                          MarkerLayerOptions(
                                            markers: [
                                              Marker(
                                                point: LatLng(
                                                    -5.8112814, -35.2084129),
                                                builder: (context) => Icon(
                                                  Icons.location_on,
                                                  color:
                                                      constStyle.primaryColor,
                                                  semanticLabel:
                                                      'Sua localização atual',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 50,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      height: constraints.maxHeight / 1.6,
                                      width: constraints.maxWidth,
                                      color: constStyle.backgroundColor,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            store.textInfo("contactUSTxt1"),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    sizingInformation.isDesktop
                                                        ? constraints.maxWidth *
                                                            0.02
                                                        : constraints.maxWidth *
                                                            0.04),
                                          ),
                                          CustomTextFormField(
                                              prefixIcon: const Icon(
                                                  Icons.person,
                                                  color: Colors.white),
                                              hint: store
                                                  .textInfo("contactUSTxt2"),
                                              obscureText: false,
                                              needTheSpace: false),
                                          CustomTextFormField(
                                              prefixIcon: const Icon(
                                                Icons.email,
                                                color: Colors.white,
                                              ),
                                              hint: store
                                                  .textInfo("contactUSTxt3"),
                                              obscureText: false,
                                              needTheSpace: false),
                                          CustomTextFormField(
                                              prefixIcon: const Icon(
                                                Icons.phone,
                                                color: Colors.white,
                                              ),
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                                TelefoneInputFormatter()
                                              ],
                                              hint: store
                                                  .textInfo("contactUSTxt4"),
                                              obscureText: false,
                                              needTheSpace: false),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary:
                                                      constStyle.primaryColor),
                                              onPressed: () {},
                                              child: Text(store
                                                  .textInfo("contactUSButton")))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    )
                  ],
                )));
  }
}

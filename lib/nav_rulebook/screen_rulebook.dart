import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../models/globals.dart';
import '../models/token_spacing.dart';

class ScreenRulebook extends StatefulWidget {
  const ScreenRulebook({Key? key}) : super(key: key);

  @override
  State<ScreenRulebook> createState() => _ScreenRulebookState();
}

class _ScreenRulebookState extends State<ScreenRulebook> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  final GlobalKey<SearchToolbarState> _textSearchKey = GlobalKey();

  // final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  late bool _showToolbar;
  late bool _showScrollHead;
  bool _showSearchInSameScreen = false;
  OverlayEntry? _overlayEntry;
  LocalHistoryEntry? _historyEntry;

  @override
  void initState() {
    // TODO CURRENT: init with the toolbar when the global variable "search" is set to true
    // debugPrint('>>>> ScreenRulebook > initState in > currentPage: "${currentPage}"');

    // Test to turn off the rulebook refresh if the user is calling the search from within the rule book page
    if (currentPage == 'rulebook') {
      _showSearchInSameScreen = true;
    } else {
      _showSearchInSameScreen = false;
    }

    /// Display or hide the search bar
    if (search == true) {
      /// Start with Search
      _showScrollHead = false;
      _showToolbar = true;
    } else {
      /// Start without opening the search
      _showToolbar = false;
      _showScrollHead = true;
    }
    ;
    // debugPrint('>>>> ScreenRulebook > initState in > currentPage: "${currentPage}"');
    currentPage = 'rulebook';
    // could be 'start', 'rulebook', 'penalties', 'quiz', 'about'
    // debugPrint('>>>> ScreenRulebook > initState out > currentPage: "${currentPage}"');
    super.initState();
  }

  /// Ensure the entry history of text search.
  void _ensureHistoryEntry() {
    if (_historyEntry == null) {
      final ModalRoute<dynamic>? route = ModalRoute.of(context);
      if (route != null) {
        _historyEntry = LocalHistoryEntry(onRemove: _handleHistoryEntryRemoved);
        route.addLocalHistoryEntry(_historyEntry!);
      }
    }
  }

  /// Remove history entry for text search.
  void _handleHistoryEntryRemoved() {
    _textSearchKey.currentState?.clearSearch();
    setState(() {
      _showToolbar = false;
    });
    _historyEntry = null;
  }

  /// Show the Copy Menu item
  void _showContextMenu(
      BuildContext context, PdfTextSelectionChangedDetails details) {
    final OverlayState _overlayState = Overlay.of(context)!;
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalSelectedRegion!.center.dy - 55,
        left: details.globalSelectedRegion!.bottomLeft.dx,
        child: ElevatedButton(
          onPressed: () {
            Clipboard.setData(
                ClipboardData(text: details.selectedText.toString()));
            // debugPrint('Text copied to clipboard: ' + details.selectedText.toString());
            _pdfViewerController.clearSelection();
          },
          // make translation
          child: Text(
            AppLocalizations.of(context)!.rulebookCopy,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
    _overlayState.insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    // debugPrint('>>>>> ScreenRulebook > myLocale.languageCode: ${myLocale.languageCode} - myLocale.countryCode: ${myLocale.countryCode}');

    /// Select the rules file depending on the language selected by the user or set by the OS
    getRulebookUrl(Locale appLocale) {
      // Select the document to be displayed in the pdf viewer based on the selected locale
      String tempUrl =
          'assets/rulebooks/2022-2025_World-Aquatics-Diving-Rules_en_20230705.pdf';
      appLocale.languageCode == 'fr'
          ? tempUrl =
              'assets/rulebooks/2022-2025_Reglement-WA-Plongeon-v2_fr.pdf'
          : appLocale.languageCode == 'es'
              ? appLocale.countryCode == 'MX'
                  ? tempUrl =
                      'assets/rulebooks/2022-2025_Reglas-WA-Clavados-FMN_es_MX.pdf'
                  : tempUrl =
                      'assets/rulebooks/2022-2025_WA_Reglamento_Saltos_es.pdf'
              // Add Italian rulebook here
              // : appLocale.languageCode == 'it'
              //     ? tempUrl = 'assets/rulebooks/2022-2025_xxxxxxx_it.pdf')
              : tempUrl =
                  'assets/rulebooks/2022-2025_World-Aquatics-Diving-Rules_en_20230705.pdf';
      // debugPrint('>>>>> ScreenRulebook > getRulebookUrl > tempUrl: ${tempUrl} ');
      return tempUrl;
    }

    return Scaffold(
      appBar: _showToolbar
          ? AppBar(
              flexibleSpace: SafeArea(
                child: SearchToolbar(
                  key: _textSearchKey,
                  showTooltip: true,
                  controller: _pdfViewerController,
                  onTap: (Object toolbarItem) async {
                    if (toolbarItem.toString() == 'Cancel Search') {
                      setState(() {
                        _showToolbar = false;
                        _showScrollHead = true;
                        if (Navigator.canPop(context)) {
                          Navigator.maybePop(context);
                        }
                      });
                    }
                    if (toolbarItem.toString() == 'noResultFound') {
                      setState(() {
                        _textSearchKey.currentState?._showToast = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      setState(() {
                        _textSearchKey.currentState?._showToast = false;
                      });
                    }
                  },
                ),
              ),
              automaticallyImplyLeading: false,
              // backgroundColor: Color(0xFFFAFAFA),
            )
          : null,
      body: Stack(
        children: [
          /// The display of the pdf file
          // testing if the user is calling the search from within the rulebook page - linked to the current page global variable
          // _showSearchInSameScreen == false
          //     ?
          SfPdfViewer.asset(
            getRulebookUrl(myLocale),
            // key: _pdfViewerKey,
            enableDoubleTapZooming: false,
            enableTextSelection: true,
            onTextSelectionChanged: (PdfTextSelectionChangedDetails details) {
              if (details.selectedText == null && _overlayEntry != null) {
                _overlayEntry!.remove();
                _overlayEntry = null;
              } else if (details.selectedText != null &&
                  _overlayEntry == null) {
                _showContextMenu(context, details);
              }
            },
            controller: _pdfViewerController,
            canShowScrollHead: _showScrollHead,
          ),
          // :,

          /// Unsuccessful search result acknowledgement
          Visibility(
            visible: _textSearchKey.currentState?._showToast ?? false,
            child: Align(
              alignment: Alignment.center,
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: DRSpacing.x2l,
                        top: DRSpacing.m,
                        right: DRSpacing.x2l,
                        bottom: DRSpacing.m),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.all(
                        Radius.circular(DRSpacing.x2l),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.rulebookSearchNoResult,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Strip out edge spaces at beginning and end of string
String stripOutStartEndSpaces(String tmp) {
  while (tmp.startsWith(' ')) {
    tmp = tmp.substring(1);
  }
  while (tmp.endsWith(' ')) {
    tmp = tmp.substring(0, tmp.length - 1);
  }
  return tmp;
}

/// Signature for the [SearchToolbar.onTap] callback.
typedef SearchTapCallback = void Function(Object item);

/// SearchToolbar widget
class SearchToolbar extends StatefulWidget {
  ///it describe the search toolbar constructor
  SearchToolbar({
    this.controller,
    this.onTap,
    this.showTooltip = true,
    Key? key,
  }) : super(key: key);

  /// Indicates whether the tooltip for the search toolbar items need to be shown or not.
  final bool showTooltip;

  /// An object that is used to control the [SfPdfViewer].
  final PdfViewerController? controller;

  /// Called when the search toolbar item is selected.
  final SearchTapCallback? onTap;

  @override
  SearchToolbarState createState() => SearchToolbarState();
}

/// State for the SearchToolbar widget
class SearchToolbarState extends State<SearchToolbar> {
  /// Indicates whether search is initiated or not.
  bool _isSearchInitiated = false;

  /// Indicates whether search toast need to be shown or not.
  bool _showToast = false;

  ///An object that is used to retrieve the current value of the TextField.
  final TextEditingController _editingController = TextEditingController();

  /// An object that is used to retrieve the text search result.
  PdfTextSearchResult _pdfTextSearchResult = PdfTextSearchResult();

  ///An object that is used to obtain keyboard focus and to handle keyboard events.
  FocusNode? focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode?.requestFocus();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNode?.dispose();
    _pdfTextSearchResult.removeListener(() {});
    super.dispose();
  }

  ///Clear the text search result
  void clearSearch() {
    _isSearchInitiated = false;
    _pdfTextSearchResult.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        /// Bookmarks
        // Visibility(
        //   visible: _editingController.text.isEmpty,
        //   child: Material(
        //     color: Colors.transparent,
        //     child: IconButton(
        //       icon: Icon(
        //         CupertinoIcons.bookmark_fill,
        //         size: 24,
        //         color: Theme.of(context).colorScheme.primary,
        //       ),
        //       onPressed: () {
        //         _pdfViewerKey.currentState?.openBookmarkView();
        //       },
        //       tooltip: widget.showTooltip
        //           ? AppLocalizations.of(context)!.rulebookBookmarks
        //           : null,
        //     ),
        //   ),
        // ),

        /// Search input field
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(left: DRSpacing.m, right: DRSpacing.m),
            child: TextFormField(
              style: Theme.of(context).textTheme.bodyLarge,
              enableInteractiveSelection: false,
              focusNode: focusNode,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              controller: _editingController,
              decoration: InputDecoration(
                prefixIcon: const Icon(CupertinoIcons.search),
                // prefixIconColor: Theme.of(context).colorScheme.primary,
                // border: InputBorder.none,
                hintText: AppLocalizations.of(context)!.rulebookSearchHintText,
                hintStyle: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .tertiary
                        .withOpacity(0.4)),
              ),
              onChanged: (text) {
                if (_editingController.text.isNotEmpty) {
                  setState(() {});
                }
              },
              onFieldSubmitted: (String value) {
                // debugPrint(
                //     '>>>> ScreenRulebook > TextFormField > onFieldSubmitted > value: "${value}"');
                // // TODO Current: take out the last extra space if any
                // value = stripOutStartEndSpaces(value);
                // debugPrint(
                //     '>>>> ScreenRulebook > TextFormField > onFieldSubmitted > value stripped: "${value}"');
                // TODO: strip the text input from spaces before or after
                debugPrint(
                    '>>>> ScreenRulebook > TextFormField > onFieldSubmitted > _editingController.text: "${_editingController.text}"');
                debugPrint(
                    '>>>> ScreenRulebook > TextFormField > onFieldSubmitted > _editingController.text stripped: "${stripOutStartEndSpaces(_editingController.text)}"');
                if (kIsWeb) {
                  _pdfTextSearchResult = widget.controller!.searchText(
                      stripOutStartEndSpaces(_editingController.text)
                          .toString());
                  if (_pdfTextSearchResult.totalInstanceCount == 0) {
                    widget.onTap?.call('noResultFound');
                  }
                  setState(() {});
                } else {
                  _isSearchInitiated = true;
                  _pdfTextSearchResult =
                      widget.controller!.searchText(_editingController.text);
                  _pdfTextSearchResult.addListener(() {
                    if (super.mounted) {
                      setState(() {});
                    }
                    if (!_pdfTextSearchResult.hasResult &&
                        _pdfTextSearchResult.isSearchCompleted) {
                      widget.onTap?.call('noResultFound');
                    }
                  });
                }
              },
            ),
          ),
        ),

        /// Previous button
        Visibility(
          visible: _pdfTextSearchResult.hasResult,
          child: Row(
            children: [
              Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: (_pdfTextSearchResult.currentInstanceIndex <= 1)
                      ? const Icon(
                          CupertinoIcons.arrowtriangle_left,
                          size: 24,
                        )
                      : Icon(
                          CupertinoIcons.arrowtriangle_left_fill,
                          size: 24,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  onPressed: () {
                    setState(() {
                      if (_pdfTextSearchResult.currentInstanceIndex > 1) {
                        _pdfTextSearchResult.previousInstance();
                      }
                    });
                    widget.onTap!.call('Previous Instance');
                  },
                  tooltip: widget.showTooltip
                      ? AppLocalizations.of(context)!.rulebookSearchPrevious
                      : null,
                ),
              ),

              /// Number of corresponding search results and current highlight
              Text(
                '${_pdfTextSearchResult.currentInstanceIndex}',
                style: const TextStyle(fontSize: 16),
              ),
              const Text(
                '/',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '${_pdfTextSearchResult.totalInstanceCount}',
                style: const TextStyle(fontSize: 16),
              ),

              /// Next button
              Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: (_pdfTextSearchResult.currentInstanceIndex ==
                              _pdfTextSearchResult.totalInstanceCount &&
                          _pdfTextSearchResult.currentInstanceIndex != 0 &&
                          _pdfTextSearchResult.totalInstanceCount != 0 &&
                          _pdfTextSearchResult.isSearchCompleted)
                      ? const Icon(
                          CupertinoIcons.arrowtriangle_right,
                          size: 24,
                        )
                      : Icon(
                          CupertinoIcons.arrowtriangle_right_fill,
                          size: 24,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  onPressed: () {
                    setState(() {
                      if (_pdfTextSearchResult.currentInstanceIndex ==
                              _pdfTextSearchResult.totalInstanceCount &&
                          _pdfTextSearchResult.currentInstanceIndex != 0 &&
                          _pdfTextSearchResult.totalInstanceCount != 0 &&
                          _pdfTextSearchResult.isSearchCompleted) {
                      } else {
                        widget.controller!.clearSelection();
                        _pdfTextSearchResult.nextInstance();
                      }
                    });
                    widget.onTap!.call('Next Instance');
                  },
                  tooltip: widget.showTooltip
                      ? AppLocalizations.of(context)!.rulebookSearchNext
                      : null,
                ),
              ),
            ],
          ),
        ),

        /// Progress indicator
        Visibility(
          visible:
              !_pdfTextSearchResult.isSearchCompleted && _isSearchInitiated,
          child: Padding(
            padding: EdgeInsets.only(right: DRSpacing.m),
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),

        /// Clear selection
        Visibility(
          visible: _editingController.text.isNotEmpty ||
              _editingController.text.isEmpty,
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(
                CupertinoIcons.clear_circled_solid,
                size: 24,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                setState(() {
                  // close the search bar (Currently testing
                  search = false;
                  // _handleHistoryEntryRemoved();
                  // _showToolbar = false;
                  // _showScrollHead = true;

                  // previous code to clear the search
                  _editingController.clear();
                  _pdfTextSearchResult.clear();
                  widget.controller!.clearSelection();
                  _isSearchInitiated = false;
                  focusNode!.requestFocus();
                  // clear the entire search field
                  // search = false; // that did not work
                });
                // widget.onTap!.call('Clear Text');
                // widget.onTap!.call('Cancel Search');
                Get.offAllNamed(
                  '/',
                );
              },
              tooltip: widget.showTooltip
                  ? AppLocalizations.of(context)!.rulebookSearchCancel
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}

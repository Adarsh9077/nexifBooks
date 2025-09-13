import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'sales_provider/add_new_sales_invoice_provider.dart';
import 'widgets/add_new_sales_invoice_widgets/loading_list_widget.dart';

class DropdownSearchTextFieldWidget extends ConsumerStatefulWidget {
  const DropdownSearchTextFieldWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  ConsumerState<DropdownSearchTextFieldWidget> createState() =>
      _DropdownSearchTextFieldWidgetState();
}

class _DropdownSearchTextFieldWidgetState
    extends ConsumerState<DropdownSearchTextFieldWidget> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _openSearchSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        final TextEditingController bottomController = TextEditingController(
          text: widget.controller.text,
        );

        String currentQuery = bottomController.text;

        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).viewInsets.bottom,
              ),
              child: SizedBox(
                height: MediaQuery.of(ctx).size.height * 0.55,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24,
                        left: 14,
                        right: 14,
                        bottom: 0,
                      ),
                      child: TextField(
                        controller: bottomController,
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: "Search",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onChanged: (val) {
                          if (_debounce?.isActive ?? false) _debounce!.cancel();
                          _debounce = Timer(
                            const Duration(milliseconds: 300),
                            () {
                              setState(() {
                                currentQuery = val;
                              });
                            },
                          );
                        },
                      ),
                    ),

                    Expanded(
                      child: Consumer(
                        builder: (sheetContext, sheetRef, child) {
                          final async = sheetRef.watch(
                            fetchListOfItemsProvider(currentQuery),
                          );
                          // final itemList = sheetRef.watch(
                          //   itemsProvider.notifier,
                          // );
                          // itemList.loadMore();
                          // itemList.reset();
                          return async.when(
                            data: (items) {
                              if (items.isEmpty) {
                                return const Center(child: Text('No results'));
                              }

                              return Padding(
                                padding: const EdgeInsets.only(
                                  top: 0,
                                  left: 12,
                                  right: 12,
                                  bottom: 12,
                                ),
                                child: ListView.separated(
                                  itemCount: items.length,
                                  separatorBuilder: (_, __) =>
                                      const Divider(height: 1),
                                  itemBuilder: (context, index) {
                                    final item = items[index];
                                    return ListTile(
                                      title: Text(item.name ?? ''),
                                      onTap: () {
                                        widget.controller.text =
                                            item.name ?? '';
                                        sheetRef
                                                .read(
                                                  selectedTableItemProvider
                                                      .notifier,
                                                )
                                                .state =
                                            item.id?.toString() ??
                                            (item.name ?? '');
                                        Navigator.pop(ctx);
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                            loading: () => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: LoadingListWidget(),
                            ),
                            error: (err, st) =>
                                Center(child: Text('Error: $err')),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: widget.controller,
        readOnly: true,
        decoration: InputDecoration(
          labelText: 'Select',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        ),
        onTap: _openSearchSheet,
      ),
    );
  }
}

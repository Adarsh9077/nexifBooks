import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'sales_provider/add_new_sales_invoice_provider.dart';
import 'widgets/add_new_sales_invoice_widgets/loading_list_widget.dart';

// class DropdownSearchTextFieldWidget extends ConsumerStatefulWidget {
//   const DropdownSearchTextFieldWidget({super.key, required this.controller});
//
//   final TextEditingController controller;
//
//   @override
//   ConsumerState<DropdownSearchTextFieldWidget> createState() =>
//       _DropdownSearchTextFieldWidgetState();
// }

class DropdownSearchTextFieldWidget extends ConsumerStatefulWidget {
  const DropdownSearchTextFieldWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  ConsumerState<DropdownSearchTextFieldWidget> createState() =>
      _DropdownSearchTextFieldWidgetState();
}

class _DropdownSearchTextFieldWidgetState
    extends ConsumerState<DropdownSearchTextFieldWidget> {
  final ScrollController _scrollController = ScrollController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(itemsProvider.notifier).loadMore();
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _openSearchSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        final TextEditingController bottomController =
        TextEditingController(text: widget.controller.text);

        return Consumer(
          builder: (sheetContext, sheetRef, _) {
            final notifier = sheetRef.read(itemsProvider.notifier);

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).viewInsets.bottom,
              ),
              child: SizedBox(
                height: MediaQuery.of(ctx).size.height * 0.55,
                child: Column(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(top: 24, left: 14, right: 14),
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
                              notifier.fetchItems(query: val, refresh: true);
                            },
                          );
                        },
                      ),
                    ),

                    Expanded(
                      child: Consumer(
                        builder: (_, ref, __) {
                          final state = ref.watch(itemsProvider);

                          return state.when(
                            data: (items) {
                              if (items.isEmpty) {
                                return const Center(child: Text('No results'));
                              }
                              return ListView.separated(
                                controller: _scrollController,
                                itemCount: items.length,
                                separatorBuilder: (_, __) =>
                                const Divider(height: 1),
                                itemBuilder: (context, index) {
                                  final item = items[index];
                                  return ListTile(
                                    title: Text(item.name ?? ''),
                                    onTap: () {
                                      widget.controller.text = item.name ?? '';
                                      ref
                                          .read(
                                          selectedTableItemProvider.notifier)
                                          .state = item.id?.toString() ??
                                          (item.name ?? '');
                                      Navigator.pop(ctx);
                                    },
                                  );
                                },
                              );
                            },
                            loading: () => const LoadingListWidget(),
                            error: (err, st) =>
                                Center(child: Text("Error: $err")),
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        ),
        onTap: _openSearchSheet,
      ),
    );
  }
}

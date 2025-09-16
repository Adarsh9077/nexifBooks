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
  final ScrollController _scrollController = ScrollController();
  Timer? _debounce;
  bool _initialFetchDone = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final state = ref.read(itemsProvider);
    if (state.hasValue) {
      final itemsState = state.value!;
      if (itemsState.next != null &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200) {
        ref.read(itemsProvider.notifier).loadMore();
      }
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
        final TextEditingController bottomController = TextEditingController(
          text: widget.controller.text,
        );

        return Consumer(
          builder: (sheetContext, sheetRef, _) {
            final notifier = sheetRef.read(itemsProvider.notifier);

            if (!_initialFetchDone && bottomController.text.isEmpty) {
              _initialFetchDone = true;
              Future.microtask(() {
                notifier.fetchItems(query: "", refresh: true);
              });
            }

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
                          _debounce?.cancel();
                          _debounce = Timer(
                            const Duration(milliseconds: 800),
                                () {
                              final latest = bottomController.text.trim();
                              notifier.fetchItems(query: latest, refresh: true);
                            },
                          );
                        },
                        onSubmitted: (v) {
                          _debounce?.cancel();
                          notifier.fetchItems(
                            query: bottomController.text.trim(),
                            refresh: true,
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Consumer(
                        builder: (_, ref, __) {
                          final state = ref.watch(itemsProvider);
                          return state.when(
                            data: (itemsState) {
                              final items = itemsState.items;
                              // final next = itemsState.next;
                              final query = bottomController.text.trim();

                              if (items.isEmpty && query.isEmpty) {
                                return const Center(
                                  child: Text("No results found"),
                                );
                              }

                              return ListView.separated(
                                controller: _scrollController,
                                itemCount: items.length + (query.isNotEmpty ? 1 : 0),
                                separatorBuilder: (_, __) =>
                                const Divider(height: 1),
                                itemBuilder: (context, index) {
                                  if (index < items.length) {
                                    final item = items[index];
                                    return ListTile(
                                      title: Text(item.name ?? ''),
                                      onTap: () {
                                        widget.controller.text = item.name ?? '';
                                        ref
                                            .read(selectedTableItemProvider.notifier)
                                            .state = item.id?.toString() ??
                                            (item.name ?? '');
                                        Navigator.of(ctx).maybePop().then((_) {
                                          _initialFetchDone = false;
                                        });
                                      },
                                    );
                                  }
                                  return ListTile(
                                    leading: const Icon(Icons.add),
                                    title: Text(
                                      'Create "$query"',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onTap: () {
                                      widget.controller.text = query;
                                      ref
                                          .read(selectedTableItemProvider.notifier)
                                          .state = query;
                                      Navigator.of(ctx).maybePop().then((_) {
                                        _initialFetchDone = false;
                                      });
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
    ).whenComplete(() {
      _initialFetchDone = false;
    });
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
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 6,
          ),
        ),
        onTap: _openSearchSheet,
      ),
    );
  }
}
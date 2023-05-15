import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/infra/utils/utils.dart';
import 'package:flutter_bloc_pattern/ui/widgets/item_book.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  final _refreshController = RefreshController(initialRefresh: true);

  @override
  void initState() {
    _searchController.text = 'moon';
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search',
            filled: true,
            fillColor: Theme.of(context).cardColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (value) {
            context.read<HomeBloc>().add(FetchBooks(searchText: value));
          },
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        buildWhen: (previous, current) => previous.isLoading != current.isLoading || previous.bookList != current.bookList,
        listener: (context, state) {
          if (!state.isLoading) {
            _refreshController.refreshCompleted();
            _refreshController.loadComplete();
          }
          if (state.errorMsg.isNotEmpty) {
            Utils.showSnackBar(context: context, msg: state.errorMsg);
          }
        },
        builder: (context, state) {
          return SmartRefresher(
            enablePullUp: true,
            header: const WaterDropMaterialHeader(),
            footer: CustomFooter(
              builder: (context, mode) {
                Widget body;
                switch (mode) {
                  case LoadStatus.idle:
                    body = const Text('Pull up to load more');
                    break;
                  case LoadStatus.loading:
                    body = const CircularProgressIndicator();
                    break;
                  case LoadStatus.failed:
                    body = const Text('Load Failed! Click retry!');
                    break;
                  default:
                    body = const Text('No more books!');
                    break;
                }
                return SizedBox(
                  height: 55,
                  child: Center(child: body),
                );
              },
            ),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoadMore,
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: state.bookList.length,
              itemBuilder: (BuildContext context, int index) {
                final data = state.bookList[index];
                return ItemBook(data: data);
              },
            ),
          );
        },
      ),
    );
  }

  void _onRefresh() {
    HapticFeedback.lightImpact();
    context.read<HomeBloc>().add(FetchBooks(searchText: _searchController.text));
  }

  void _onLoadMore() {
    HapticFeedback.lightImpact();
    context.read<HomeBloc>().add(FetchMoreBooks(searchText: _searchController.text));
  }
}

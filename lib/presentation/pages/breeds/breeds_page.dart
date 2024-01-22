import 'package:catbreeds/domain/entities/breed_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:catbreeds/domain/utils/request_status_enum.dart';
import 'package:catbreeds/presentation/providers/breeds_provider.dart';

import 'package:catbreeds/presentation/widgets/loading_message.dart';
import 'package:catbreeds/presentation/widgets/network_error_message.dart';

import 'package:catbreeds/presentation/pages/breeds/widgets/breed_card.dart';
import 'package:catbreeds/presentation/pages/breeds/widgets/breeds_app_bar.dart';
import 'package:catbreeds/presentation/pages/breeds/widgets/no_results_message.dart';


class BreedsPage extends ConsumerStatefulWidget {
  const BreedsPage({super.key});

  @override
  ConsumerState createState() => _BreedsPageState();
}

class _BreedsPageState extends ConsumerState<BreedsPage> {

  String filterText = '';
  late List<BreedEntity> filteredBreedList;

  @override
  Widget build(BuildContext context) {

    final breedsStateProvider = ref.watch(breedsProvider);
    final breedsStateNotifier = ref.watch(breedsProvider.notifier);

    if(breedsStateProvider.breedsLoadingStatus == RequestStatusEnum.none || breedsStateProvider.breedsLoadingStatus == RequestStatusEnum.isLoading) {
      return const Scaffold(body: LoadingBreedsMessage());
    }

    if(breedsStateProvider.breedsLoadingStatus == RequestStatusEnum.error) {
      return Scaffold(body: NetworkErrorMessage(onAction: breedsStateNotifier.getCatsBreeds));
    }

    if(filterText.isEmpty) {
      filteredBreedList = breedsStateProvider.catsBreedsList;
    } else {
      filteredBreedList = breedsStateProvider.catsBreedsList.where(
          (breed) => breed.name.toLowerCase().contains(
          filterText.toLowerCase()
        )
      ).toList();
    }

    return Scaffold(
      body: GestureDetector(
        onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
        child: Scrollbar(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Theme.of(context).secondaryHeaderColor,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.dark
                ),
                floating: true,
                toolbarHeight: 100,
                flexibleSpace: FlexibleSpaceBar(
                  title: BreedsAppBar(
                    searchTextValue: filterText,
                    onChangeSearch: (searchValue) {
                      setState(() {
                        filterText = searchValue;
                      });
                    }
                  ),
                  centerTitle: true,
                  titlePadding: const EdgeInsets.all(0),
                ),
                backgroundColor: Colors.transparent,
              ),
          
              SliverList(
                delegate: filteredBreedList.isEmpty
                ? SliverChildBuilderDelegate(
                    (context, index) => NoResultsMessage(),
                    childCount: 1
                  )
                : SliverChildBuilderDelegate(
                  childCount: filteredBreedList.length,
                    (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: BreedCard(
                        breed: filteredBreedList[index],
                      )
                    );
                  },
                )
              )
            ],
          ),
        ),
      )
    );
  }
}
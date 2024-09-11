import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/modules/upload/bloc/history_upload_data_cubit.dart';
import 'package:flutter_app/modules/upload/model/history_upload_model.dart';
import 'package:flutter_app/modules/upload/page/widget/upload_item_widget.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_app/utils/navigator_key.dart';
import 'package:flutter_app/utils/snack_bar.dart';
import 'package:flutter_app/widget/circular_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryUploadScreen extends StatelessWidget {
  HistoryUploadScreen({super.key});

  final UploadHistoryCubit _uploadHistoryCubit = UploadHistoryCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _uploadHistoryCubit..getUploadHistory(),
      child: BaseScaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(),
      ),
    );
  }

  CustomAppbar _buildAppBar(BuildContext context) {
    return CustomAppbar(
      leading: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () => Navigator.pop(context),
        icon: SvgPicture.asset(
          Assets.icon.arrowBackSvg,
          width: 24,
          height: 24,
        ),
      ),
      title: "Lịch sử cung cấp dữ liệu",
    );
  }

  Widget _buildBody() {
    return BlocConsumer<UploadHistoryCubit, UploadHistoryState>(
      listener: (context, state) {
        if (state is UploadHistoryErrorState) {
          context.showSnackBarFail(text: state.error, positionTop: true);
        }
      },
      builder: (context, state) {
        if (state is UploadHistoryLoadingState) {
          return const Center(child: CircularIndicator());
        }

        if (state is UploadHistoryLoadedState) {
          return _buildUploads(uploads: state.uploads);
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildUploads({
    required HistoryUploadModel uploads,
  }) {
    final data = uploads.data;
    if (data != null && data.isNotEmpty) {
      return RefreshIndicator(
          color: AppColors.startBtnColor,
          onRefresh: () async {
            return _uploadHistoryCubit.refresh();
          },
          child: _buildUploadsSameDay(getContext, data));
    }
    return Center(
      child: Text(
        "Không có lịch sử",
        style: textTheme.t16M,
      ),
    );
  }

  Widget _buildUploadsSameDay(
    BuildContext context,
    List<Data> items,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return IteamDetailUpload(item: items[index]);
            },
          ),
        )
      ],
    );
  }
}


import 'package:flutter_lihui/base/base_presenter.dart';
import 'package:flutter_lihui/contract/send_contract.dart';
import 'package:flutter_lihui/model/SendModel.dart';

class SendPresenter extends BasePresenter<ISendView> {

  ISendModel mModel;

  SendPresenter() {
    mModel = SendModel();
  }

  sendDiary(){

  }
}
class DioHelper
{
  static late DioHelper dioHelper;
  static init()async
  {
    dioHelper=await DioHelper.init();
  }
}
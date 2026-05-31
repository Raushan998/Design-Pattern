from app_setting import AppSetting

app_setting_1 = AppSetting()
app_setting_2 = AppSetting()
print(app_setting_1.get_api_key())
print(app_setting_2.get_api_key())
print(app_setting_1 == app_setting_2)
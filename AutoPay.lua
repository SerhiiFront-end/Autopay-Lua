local se = require("samp.events")
local onDialog = {}
local active = true
function se.onShowDialog(id, stytle, title, btn1, btn2, text)
	if active and id == 3051 and title:find("{34C924}�������� ��� ����")and not CloseMainDialog then
		sampSendDialogResponse(id, 1, 1, '')
		onDialog[2] = true
		return false
	end
	if active and onDialog[2] and id == 3060 and title:find("{34C924}��������� ����������")then
		PayDays = text:match('�� ������ �������� ���������� ��� �� {D8A903}(%d+)')
		sampSendDialogResponse(id, 1, 0, PayDays)
		onDialog[2] = false
		onDialog[3] = true
		return false
	end
	if active and onDialog[3] and id == 3062 and title == "{34C924}��������� ����������" then
		sampSendDialogResponse(id, 1, 0, '')
		onDialog[3] = false
		onDialog[4] = true
		return false
	end
	if active and onDialog[4] and id == 3052 and text:find('{ffffff}�� ������� �������� ���������� ����') then
		sampSendDialogResponse(id, 0, 0, '')
		onDialog[4] = false
		CloseMainDialog = true
		sampAddChatMessage('[AP] {FFFFFF}' .. text, 0xFF32CD32)
		return false
	end
	if active and CloseMainDialog and id == 3051 and title:find("{34C924}�������� ��� ����") then
		sampSendDialogResponse(id, 0, 0, '')
		CloseMainDialog = false
		return false
	end
	 if active and id == 3052 and text:find('��� ������������ ����') then
		 sampSendDialogResponse(id, 0, 0, '')
		 sampAddChatMessage('[AP] {FFFFFF}���� ��� ��� ������� �� ������������ ����.', 0xFF32CD32)
		 CloseMainDialog = true
		 return false
	 end
	 if active and id == 3603 and text:find('�� ������ �������� ���������� ��� ��') then
	 		Pdays = text:match('�� ������ �������� ���������� ��� �� {D8A903}(%d+)')
		 sampSendDialogResponse(id, 1, 0, Pdays)
		 onDialog[1] = true
		 return false
	 end
	 if active and onDialog[1] and id == 3605 and text:find('{ffffff}�� ������ �������� ���������� �����������')then
		 sampSendDialogResponse(id, 1, 0, '')
		 onDialog[1] = false
		 onDialog[2] = true
		 return false
	 end
	 if active and onDialog[2] and id == 3602 and text:find('{ffffff}�� �������� ���������� �����������')then
		 sampSendDialogResponse(id, 0, 0, '')
		 onDialog[2] = false
		 sampAddChatMessage('[AP] {FFFFFF}�� �������� ��������� ���� �����������.', 0xFF32CD32)
		 return false
	 end
	 if active and id == 3602 and text:find('{ffffff}���������� ���������� ����������� ��� ��������')then
		 sampSendDialogResponse(id, 0, 0, '')
		 sampAddChatMessage('[AP] {FFFFFF} ��� ����������� ��� �������� �� ������������ ����.', 0xFF32CD32)
		 return false
	 end
end
function main()
	if not isSampfuncsLoaded() or not isSampLoaded() then return end
	while not isSampAvailable() do wait(100) end
	sampRegisterChatCommand('autopay', function() active = not active sampAddChatMessage(active and '[AP] {FFFFFF}Auto Pay {32CD32} �����������{FFFFFF}, ��������� �� ����� ��� �������� �����/��������.' or '[AP] {FFFFFF}Auto Pay {AA0000} �������������.', 0xFF32CD32) end)
	sampAddChatMessage('[AP] {FFFFFF}AutoPay ��������...�����: {32CD32}ELopez.', 0xFF32CD32)
end

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Untitled Page</title>
    </head>
    <body>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" />
            <asp:UpdatePanel ID="ChatUpdatePanel" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    Chatters<br/>
                    <asp:BulletedList ID="ChattersBulletedList" runat="server" />
                    Chat Text<br/>
                    <div id="ChatText" style="width: 640px; height: 240px; overflow: auto;">
                        <asp:BulletedList runat="server" ID="ChatMessageList" />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="SendButton" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="ChatTextTimer" EventName="Tick" />
                </Triggers>
            </asp:UpdatePanel>
            Send Message Text<br/>
            <asp:TextBox ID="NewMessageTextBox" Columns="50" runat="server" /><asp:Button EnableViewState="false" ID="SendButton" Text="Send" runat="server" OnClick="SendButton_Click" />
            <asp:Timer runat="server" ID="ChatTextTimer" Interval="1000" />
        </form>
        <script type="text/javascript">
            function _SetChatTextScrollPosition()
            {
                var chatText = document.getElementById("ChatText");
                chatText.scrollTop = chatText.scrollHeight;
                window.setTimeout("_SetChatTextScrollPosition()", 1);
            }

            window.onload = function()
            {
                _SetChatTextScrollPosition();
            }
        </script>
    </body>
</html>

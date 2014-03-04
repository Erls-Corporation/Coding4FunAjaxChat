using System;
using System.Collections.Generic;

public partial class _Default : System.Web.UI.Page 
{
    private Chat m_chat = Chat.ActiveChats()[0];
    private Chatter m_chatter = Chatter.ActiveChatters()[new Guid("CD863C27-2CEE-45fd-A2E0-A69E62B816B9")];

    protected void Page_Load(object sender, EventArgs e)
    {
        _UpdateChatterList();
        _UpdateChatMessageList();
    }

    private void _UpdateChatMessageList()
    {
        ChatMessageList.DataSource = m_chat.Messages;
        ChatMessageList.DataBind();
    }

    private void _UpdateChatterList()
    {
        ChattersBulletedList.DataSource = m_chat.Chatters;
        ChattersBulletedList.DataTextField = "Name";
        ChattersBulletedList.DataBind();
    }

    protected void SendButton_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(NewMessageTextBox.Text))
        {
            string messageSent = m_chat.SendMessage(m_chatter, NewMessageTextBox.Text);
            NewMessageTextBox.Text = string.Empty;
        }
        _UpdateChatterList();
        _UpdateChatMessageList();
    }
}
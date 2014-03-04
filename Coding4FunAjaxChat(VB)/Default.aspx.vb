Imports System
Imports System.Collections.Generic
Partial Class _Default
    Inherits System.Web.UI.Page

    Private m_chat As Chat = Chat.ActiveChats(0)

    Private m_chatter As Chatter = Chatter.ActiveChatters(New Guid("CD863C27-2CEE-45fd-A2E0-A69E62B816B9"))

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        _UpdateChatterList()
        _UpdateChatMessageList()
    End Sub

    Private Sub _UpdateChatMessageList()
        ChatMessageList.DataSource = m_chat.Messages
        ChatMessageList.DataBind()
    End Sub

    Private Sub _UpdateChatterList()
        ChattersBulletedList.DataSource = m_chat.Chatters
        ChattersBulletedList.DataTextField = "Name"
        ChattersBulletedList.DataBind()
    End Sub

    Protected Sub SendButton_Click(ByVal sender As Object, ByVal e As EventArgs)
        If Not String.IsNullOrEmpty(NewMessageTextBox.Text) Then
            Dim messageSent As String = m_chat.SendMessage(m_chatter, NewMessageTextBox.Text)
            NewMessageTextBox.Text = String.Empty
        End If
        _UpdateChatterList()
        _UpdateChatMessageList()
    End Sub
End Class
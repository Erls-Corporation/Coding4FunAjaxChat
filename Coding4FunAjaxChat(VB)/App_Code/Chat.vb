Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Collections.ObjectModel
Imports System.Web
Public Class Chat

    Private m_id As Guid

    Private m_messages As List(Of String) = New List(Of String)

    Private m_chatters As List(Of Chatter) = New List(Of Chatter)

    Public Sub New()
        MyBase.New()
        m_id = Guid.NewGuid
    End Sub

    Public ReadOnly Property Id() As Guid
        Get
            Return m_id
        End Get
    End Property

    Public ReadOnly Property Messages() As List(Of String)
        Get
            Return m_messages
        End Get
    End Property

    Public Property Chatters() As List(Of Chatter)
        Get
            Return m_chatters
        End Get
        Set(ByVal value As List(Of Chatter))
            m_chatters = value
        End Set
    End Property

    Public Shared Function ActiveChats() As ReadOnlyCollection(Of Chat)
        If (Not (HttpContext.Current.Application("Chats")) Is Nothing) Then
            Dim chats As List(Of Chat) = CType(HttpContext.Current.Application("Chats"), List(Of Chat))
            Return New ReadOnlyCollection(Of Chat)(chats)
        Else
            Return New ReadOnlyCollection(Of Chat)(New List(Of Chat))
        End If
    End Function

    Public Function SendMessage(ByVal chatter As Chatter, ByVal message As String) As String
        Dim messageMask As String = "{0} @ {1} : {2}"
        message = String.Format(messageMask, chatter.Name, DateTime.Now.ToString, message)
        m_messages.Add(message)
        Return message
    End Function
End Class

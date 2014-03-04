<%@ Application Language="VB" %>
<%@ Import Namespace="System.Collections.Generic" %>
<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        Dim chatters As List(Of Chatter) = New List(Of Chatter)
        chatters.Add(New Chatter(New Guid("CD863C27-2CEE-45fd-A2E0-A69E62B816B9"), "Me"))
        chatters.Add(New Chatter(Guid.NewGuid, "Juan"))
        chatters.Add(New Chatter(Guid.NewGuid, "Joe"))
        chatters.Add(New Chatter(Guid.NewGuid, "Eric"))
        chatters.Add(New Chatter(Guid.NewGuid, "Brian"))
        chatters.Add(New Chatter(Guid.NewGuid, "Kim"))
        chatters.Add(New Chatter(Guid.NewGuid, "Victor"))
        Application.Add("Chatters", chatters)
        Dim chats As List(Of Chat) = New List(Of Chat)
        chats.Add(New Chat)
        Application.Add("Chats", chats)
        For Each c As KeyValuePair(Of Guid, Chatter) In Chatter.ActiveChatters
            c.Value.Join(Chat.ActiveChats(0))
        Next
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
       
</script>
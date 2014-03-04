<%@ Import Namespace="System.Collections.Generic" %>
<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        List<Chatter> chatters = new List<Chatter>();
        chatters.Add(new Chatter(new Guid("CD863C27-2CEE-45fd-A2E0-A69E62B816B9"), "Me"));
        chatters.Add(new Chatter(Guid.NewGuid(), "Juan"));
        chatters.Add(new Chatter(Guid.NewGuid(), "Joe"));
        chatters.Add(new Chatter(Guid.NewGuid(), "Eric"));
        chatters.Add(new Chatter(Guid.NewGuid(), "Brian"));
        chatters.Add(new Chatter(Guid.NewGuid(), "Kim"));
        chatters.Add(new Chatter(Guid.NewGuid(), "Victor"));
        Application.Add("Chatters", chatters);

        List<Chat> chats = new List<Chat>();
        chats.Add(new Chat());
        Application.Add("Chats", chats);

        foreach (KeyValuePair<Guid, Chatter> chatter in Chatter.ActiveChatters())
        {
            chatter.Value.Join(Chat.ActiveChats()[0]);
        }
    }
    
    void Application_End(object sender, EventArgs e) 
    {
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
    }

    void Session_Start(object sender, EventArgs e) 
    {
    }

    void Session_End(object sender, EventArgs e) 
    {
    }
       
</script>

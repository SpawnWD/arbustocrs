<%
        If Request.ServerVariables("HTTPS")  = "off" Then
                Response.Redirect "https://" & Request.ServerVariables("HTTP_HOST") & "/index.aspx"
        ElseIf Request.ServerVariables("HTTPS")  = "on" Then
                Response.Redirect "https://" & Request.ServerVariables("HTTP_HOST") & "/index.aspx" 
        End If
%>
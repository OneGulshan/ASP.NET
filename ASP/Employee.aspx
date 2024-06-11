<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="ASP.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function JSval() {
            var msg = "";
            msg = chkname();
            msg += chkmob();
            msg += chkgender();
            msg += chkddljp();
            /*msg += chkcblskl();*/
            msg += chkcourse();
            msg += chkemail();
            msg += chkpassword();
            msg += chkage();
            msg += chkcountry();
            msg += chkstate();
            msg += chkcity();
            msg += chkprofile();
            msg += chkcomment();

            if (msg == "") {
                return true;
            }
            else {
                alert(msg);
                return false;
            }


            function chkname() {
                var a = document.getElementById('<%=txtname.ClientID%>');
                var exp = /^[A-Za-z ]+$/;
                if (a.value == "") {
                    return 'Please enter your name !!\n';
                }
                else if (exp.test(a.value)) {
                    return "";
                }
                else {
                    return 'Name should be only alphabets !!\n';
                }
            }

            function chkmob() {
                var a = document.getElementById('<%=txtmob.ClientID%>');
                var exp = /[0-9]{10}/
                if (a.value == "") {
                    return 'Please enter your mobile number !!\n';
                }
                else if (exp.test(a.value)) {
                    return "";
                }
                else {
                    return 'Mobile number should be only numericle or in 10 digits !!\n';
                }
            }

            function chkgender() {
                var a = document.getElementById('<%=rblgender.ClientID%>');
                var ipt = a.getElementsByTagName('input');
                var count = 0;

                for (var i = 0; i < ipt.length; i++) {
                    if (ipt[i].checked == true) {
                        count = 1;
                    }
                }

                if (count == 0) {
                    return 'Please select your gender !!\n';
                }
                else {
                    return "";
                }
            }

            function chkddljp() {
                if (document.getElementById('<%=ddljp.ClientID%>').value == "0") {
                    return 'Please select your job profile !!\n';
                }
                else {
                    return "";
                }
            }

            <%--function chkcblskl() {
                var a = document.getElementById('<%=cblskl.ClientID%>');
                var ipt = a.getElementsByTagName('input');
                var count = 0;

                for (var i = 0; i < ipt.length; i++) {
                    if (ipt[i].checked == true) {
                        count = 1;
                    }
                }

                if (count == 0) {
                    return 'Please select your skills !!\n';
                }
                else {
                    return "";
                }
            }--%>

            <%--function chkprofile() {
                if (document.getElementById('<%=fuimg.ClientID%>').value == "") {
                    return 'Please select your file !!\n';
                }
                else {
                    return "";
                }
            }            --%>

            function chkcourse() {
                if (document.getElementById('<%=ddljp.ClientID%>').value == "0") {
                    return 'Please select your job profile !!\n';
                }
                else {
                    return "";
                }
            }

            function chkemail() {
                var a = document.getElementById('<%=txtemail.ClientID%>');
                var exp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                if (a.value == "") {
                    return 'Please enter your email !!\n';
                }
                else if (exp.test(a.value)) {
                    return "";
                }
                else {
                    return 'Please enter correct email id !!\n';
                }
            }

            function chkpassword() {
                if (document.getElementById('<%=txtpassword.ClientID%>').value == "") {
                    return 'Please enter your password !!\n';
                }
                else {
                    return "";
                }
            }

            function chkage() {
                if (document.getElementById('<%=txtage.ClientID%>').value == "") {
                    return 'Please enter your age !!\n';
                }
                else {
                    return "";
                }
            }

            function chkcountry() {
                if (document.getElementById('<%=ddlcountry.ClientID%>').value == "0") {
                    return 'Please select your country !!\n';
                }
                else {
                    return "";
                }
            }

            function chkstate() {
                if (document.getElementById('<%=ddlstate.ClientID%>').value == "0") {
                    return 'Please select your state !!\n';
                }
                else {
                    return "";
                }
            }

            function chkcity() {
                if (document.getElementById('<%=ddlcity.ClientID%>').value == "0") {
                    return 'Please select your city !!\n';
                }
                else {
                    return "";
                }
            }

            function chkcomment() {
                if (document.getElementById('<%=txtcomment.ClientID%>').value == "") {
                    return 'Please enter your comment !!';
                }
                else {
                    return "";
                }
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Name :</td>
                    <td>
                        <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Mobile :</td>
                    <td>
                        <asp:TextBox ID="txtmob" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Gender :</td>
                    <td>
                        <asp:RadioButtonList ID="rblgender" runat="server" RepeatColumns="3">
                            <asp:ListItem Value="1">Male</asp:ListItem>
                            <asp:ListItem Value="2">Female</asp:ListItem>
                            <asp:ListItem Value="3">Other</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>

                <tr>
                    <td>Job Profile :</td>
                    <td>
                        <asp:DropDownList ID="ddljp" runat="server" OnSelectedIndexChanged="Ddljp_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList></td>
                </tr>

                <tr id="skl" runat="server" visible="false">
                    <td>Skills :</td>
                    <td>
                        <asp:CheckBoxList ID="cblskl" runat="server" RepeatColumns="3"></asp:CheckBoxList></td>
                </tr>

                <tr>
                    <td>Email :</td>
                    <td>
                        <asp:TextBox ID="txtemail" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Password :</td>
                    <td>
                        <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Profile :</td>
                    <td>
                        <asp:FileUpload ID="fuimg" runat="server" /><asp:Image ID="img" runat="server" Height="25px" Width="25px" Visible="false" /></td>
                </tr>

                <tr>
                    <td>Age :</td>
                    <td>
                        <asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Country :</td>
                    <td>
                        <asp:DropDownList ID="ddlcountry" runat="server" OnSelectedIndexChanged="Ddlcountry_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
                </tr>

                <tr>
                    <td>State :</td>
                    <td>
                        <asp:DropDownList ID="ddlstate" runat="server" OnSelectedIndexChanged="Ddlstate_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
                </tr>

                <tr>
                    <td>City :</td>
                    <td>
                        <asp:DropDownList ID="ddlcity" runat="server"></asp:DropDownList></td>
                </tr>

                <tr>
                    <td style="vertical-align: top">Comment :</td>
                    <td>
                        <asp:TextBox ID="txtcomment" runat="server" TextMode="MultiLine" Columns="37" Rows="6"></asp:TextBox></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnins" runat="server" Text="Submit" OnClick="Btnins_Click" OnClientClick="return JSval()" /></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:GridView ID="grd" runat="server" AutoGenerateColumns="False" OnRowCommand="Grd_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <%#Eval("name") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Mobile">
                                    <ItemTemplate>
                                        <%#Eval("mobno") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Gender">
                                    <ItemTemplate>
                                        <%#Eval("gender").ToString()=="1" ? "Male" : Eval("gender").ToString()=="2" ? "Female" : "Other"%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Email">
                                    <ItemTemplate>
                                        <%#Eval("email") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Password">
                                    <ItemTemplate>
                                        <%#Eval("password") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="JobProfile">
                                    <ItemTemplate>
                                        <%#Eval("jpname") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Skills">
                                    <ItemTemplate>
                                        <%#Eval("skl") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Age">
                                    <ItemTemplate>
                                        <%#Eval("age") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Country">
                                    <ItemTemplate>
                                        <%#Eval("cntname") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="State">
                                    <ItemTemplate>
                                        <%#Eval("sttname") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="City">
                                    <ItemTemplate>
                                        <%#Eval("cname") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Profile">
                                    <ItemTemplate>
                                        <asp:Image ID="img" runat="server" Height="40px" Width="25px" ImageUrl='<%#Eval("prof","~/Profile/{0}") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Comment">
                                    <ItemTemplate>
                                        <%#Eval("comment") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btndel" runat="server" Text="Delete" CommandName="D" CommandArgument='<%#Eval("id") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnedit" runat="server" Text="Edit" CommandName="E" CommandArgument='<%#Eval("id") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ASPVB._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color: blueviolet; font-size: xx-large; color: white" align="center">
        Crud Operation in Asp.Net VB
    </div>
    <br />
    <div style="padding: 15px">
        <table class="nav-justified">
            <tr>
                <td>
                    <asp:Label runat="server" Text="Product ID" ID="lblproductid"></asp:Label>&nbsp;</td>
                <td>&nbsp;<asp:TextBox runat="server" Width="200px" ID="txtproductid"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Item Name" ID="lblitemname"></asp:Label>&nbsp;</td>
                <td>&nbsp;<asp:TextBox runat="server" Width="200px" ID="txtitemname"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Specification" ID="lblspecification"></asp:Label>&nbsp;</td>
                <td>&nbsp;<asp:TextBox runat="server" Width="200px" ID="txtspecification"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Unit" ID="lblunit"></asp:Label>&nbsp;</td>
                <td>&nbsp;<asp:DropDownList ID="ddlunit" runat="server" Width="200px">
                    <asp:ListItem>KG</asp:ListItem>
                    <asp:ListItem>PCS</asp:ListItem>
                    <asp:ListItem>DZN</asp:ListItem>
                </asp:DropDownList></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Color" ID="lblcolor"></asp:Label>&nbsp;</td>
                <td>&nbsp;<asp:RadioButtonList runat="server" ID="rblcolor" RepeatDirection="Horizontal">
                    <asp:ListItem>RED</asp:ListItem>
                    <asp:ListItem>GREEN</asp:ListItem>
                    <asp:ListItem>BLACK</asp:ListItem>
                </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Insert Date" ID="lblinsertdate"></asp:Label>&nbsp;</td>
                <td>&nbsp;<asp:TextBox runat="server" Width="200px" ID="txtdate" placeholder="mm-dd-yyyy"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Opening Quantity" ID="lblopeningqty"></asp:Label>&nbsp;</td>
                <td>&nbsp;<asp:TextBox runat="server" Width="200px" ID="txtopeningqty"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Product Status" ID="lblprodstatus"></asp:Label>&nbsp;</td>
                <td>&nbsp;<asp:CheckBox runat="server" Text="Regular" ID="chkregular"></asp:CheckBox><asp:CheckBox runat="server" Text="Irregular" ID="chkirregular"></asp:CheckBox></td>
                <td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="Btninsert" runat="server" Text="Insert" BackColor="#9900CC" Height="34px" Width="80px" OnClick="Btninsert_Click"></asp:Button></td>
            </tr>
        </table>
        <div align="center">
            <hr />
            <asp:GridView ID="Grd" runat="server" Width="80%" HeaderStyle-BackColor="#9900CC" HeaderStyle-ForeColor="White" OnRowCommand="Grd_RowCommand" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField HeaderText="Product ID">
                        <ItemTemplate>
                            <%#Eval("ProductID") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Name">
                        <ItemTemplate>
                            <%#Eval("ItemName") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Specification">
                        <ItemTemplate>
                            <%#Eval("Specification") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unit">
                        <ItemTemplate>
                            <%#Eval("Unit") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Color">
                        <ItemTemplate>
                            <%#Eval("Color") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Insert Date">
                        <ItemTemplate>
                            <%# Eval("InsertDate", "{0:yyyy-MM-dd}") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Opening">
                        <ItemTemplate>
                            <%#Eval("Opening") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <%#Eval("Status") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btndel" runat="server" Text="Delete" CommandName="D" CommandArgument='<%#Eval("ProductID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnedit" runat="server" Text="Edit" CommandName="E" CommandArgument='<%#Eval("ProductID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

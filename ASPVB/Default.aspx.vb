Imports System.Data.SqlClient
Imports System.Drawing

Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        ListProduct()
    End Sub
    'Dim <- For Diclaring var'
    Dim connect As New SqlConnection("Data Source=DESKTOP-BTE5UP2;Initial Catalog=ASPVBDB;Integrated Security=True") 'Go Database -> Property -> Copy Connection String'
    Protected Sub Btninsert_Click(sender As Object, e As EventArgs)
        Dim productid As Integer = txtproductid.Text
        Dim itemname As String = txtitemname.Text
        Dim specification As String = txtspecification.Text
        Dim unit As String = ddlunit.SelectedValue
        Dim color As String = rblcolor.SelectedValue
        Dim inserdate As DateTime = txtdate.Text
        Dim inserdateshort = inserdate.ToShortDateString()

        Dim opening As Double = txtopeningqty.Text
        Dim status As String
        If chkregular.Checked = True Then
            status = "Regular"
        Else
            status = "Irregular"
        End If
        connect.Open()
        If (Btninsert.Text = "Insert") Then
            Dim command As New SqlCommand("Insert into ProductInfo_Tab values('" & productid & "','" & itemname & "','" & specification & "','" & unit & "','" & color & "','" & inserdateshort & "','" & opening & "','" & status & "')", connect)
            command.ExecuteNonQuery()
            MsgBox("Successfully Inserted", MsgBoxStyle.Information, "Message")
        ElseIf (Btninsert.Text = "Update") Then
            Dim command As New SqlCommand("Update ProductInfo_Tab set ItemName='" & itemname & "',Specification='" & specification & "',Unit='" & unit & "',Color='" & color & "',InsertDate='" & inserdateshort & "',Opening='" & opening & "',Status='" & status & "' where ProductID='" & productid & "'", connect)
            command.ExecuteNonQuery()
            MsgBox("Successfully Updated", MsgBoxStyle.Information, "Message")
        End If
        ListProduct()
        Clear()
    End Sub

    Private Sub ListProduct()
        Dim command As New SqlCommand("select * From ProductInfo_Tab", connect)
        Dim da As New SqlDataAdapter(command)
        Dim dt As New DataTable()
        da.Fill(dt)
        Grd.DataSource = dt
        Grd.DataBind()
    End Sub

    Protected Sub Grd_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        If (e.CommandName = "D") Then
            connect.Open()
            Dim productid As Integer = e.CommandArgument
            Dim command As New SqlCommand("delete From ProductInfo_Tab where ProductID='" & productid & "'", connect)
            command.ExecuteNonQuery()
            MsgBox("Successfully Deleted", MsgBoxStyle.Information, "Message")
            connect.Close()
            ListProduct()
            Clear()
        ElseIf (e.CommandName = "E") Then
            Dim productid As Integer = e.CommandArgument
            Dim command As New SqlCommand("select * From ProductInfo_Tab where ProductID='" & productid & "'", connect)
            Dim da As New SqlDataAdapter(command)
            Dim dt As New DataTable()
            da.Fill(dt)
            If dt.Rows.Count > 0 Then
                Dim row As DataRow = dt.Rows(0)
                txtproductid.Text = row("ProductID").ToString()
                txtitemname.Text = row("ItemName").ToString()
                txtspecification.Text = row("Specification").ToString()
                ddlunit.Text = row("Unit").ToString()
                rblcolor.Text = row("Color").ToString()
                txtdate.Text = row("InsertDate").ToString()
                txtopeningqty.Text = row("Opening").ToString()
                Dim Status = row("Status").ToString()
                If Status = "Regular" Then
                    chkregular.Checked = True
                    chkirregular.Checked = False
                ElseIf Status = "Irregular" Then
                    chkirregular.Checked = True
                    chkregular.Checked = False
                End If
                Btninsert.Text = "Update"
            End If
        End If
    End Sub

    Public Sub Clear()
        txtproductid.Text = ""
        txtitemname.Text = ""
        txtspecification.Text = ""
        ddlunit.SelectedValue = "KG"
        rblcolor.ClearSelection()
        txtdate.Text = ""
        txtopeningqty.Text = ""
        chkregular.Checked = False
        chkirregular.Checked = False
        Btninsert.Text = "Insert"
    End Sub
End Class
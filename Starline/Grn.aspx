<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="Grn.aspx.cs" Inherits="Starline.WebForm22" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white;">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">GRN</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="GRN ID" runat="server" />
                            <asp:TextBox ID="txtgrnid" Style="width: 325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="DATE" runat="server" />
                            <asp:TextBox ID="txtdate" ReadOnly="true" Style="width: 325px;" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label9" Text="Category" runat="server" />
                            <asp:DropDownList ID="ddlcategory" runat="server" Style="width: 325px;" AutoPostBack="true" CssClass="form-control"  BackColor="Transparent" OnSelectedIndexChanged="ddlcategory_SelectedIndexChanged">
                            </asp:DropDownList>                            
                        </div>
                    </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="PURCHASE ORDERID" runat="server" />
                            <asp:DropDownList ID="ddlpurchaseorderid" Style="width: 325px;" AutoPostBack="true" CssClass="form-control"  BackColor="Transparent" required="Required" runat="server" OnSelectedIndexChanged="ddlpurchaseorderid_SelectedIndexChanged" >                             
                            </asp:DropDownList>
                        </div>
                    </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="SUPPLIER NAME" runat="server" />
                            <asp:TextBox ID="txtsuppliername" Style="width: 325px;" CssClass="form-control"   BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>                    
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label5" Text="MATERIAL CODE" runat="server" />
                            <asp:DropDownList ID="ddlmaterialname" Style="width: 325px;" AutoPostBack="true" CssClass="form-control"  BackColor="Transparent" required="Required" runat="server" OnSelectedIndexChanged="ddlmaterialname_SelectedIndexChanged" >                             
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label10" Text="MATERIAL NAME" runat="server" />
                            <asp:TextBox ID="txtmaterialname" Style="width: 325px;" CssClass="form-control"   BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="QUANTITY" runat="server" />
                            <asp:TextBox ID="txtquantity" Style="width: 325px;" CssClass="form-control"   BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="ACCEPT" runat="server" />
                            <asp:TextBox ID="txtaccept" Style="width: 325px;" CssClass="form-control" AutoPostBack="true"  BackColor="Transparent" required="Required" runat="server" OnTextChanged="txtaccept_TextChanged" />
                        </div>
                    </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label8" Text="DAMAGED" runat="server" />
                            <asp:TextBox ID="txtdamaged" Style="width: 325px;" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label11" runat="server" Visible="false" />
                            <asp:TextBox ID="txtavailablestock" Style="width: 325px;" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" Visible="false" />
                        </div>
                    </div>
                    </div>
                <div class="row">
                    <div class="col-sm-6" style="margin-left: 300px">
                        <div class="form-group">
                            <asp:Button ID="btn" Text="Submit" CssClass="btn btn-success col-sm-4" runat="server" OnClick="btn_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <div class="container-fluid" >
                    <div class="row col-md-offset-1" style="width: 750px;">
                         <div class="col-sm-6" style="margin-left:597px;">
                        <div class="form-group">
                            <asp:Button ID="Button1" Text="ExporttoExcel" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" OnClick="Button1_Click" />
                        </div>
                    </div>
                        <asp:GridView ID="Gridview1" runat="server" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="YellowGreen" RowStyle-BackColor="WhiteSmoke" HeaderStyle-Width="400px" HeaderStyle-Height="40px" RowStyle-Height="40px" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="id">

                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="Grn_id" />
                                <asp:BoundField DataField="Date" HeaderText="Date" />
                                <asp:BoundField DataField="Category" HeaderText="Category" />
                                <asp:BoundField DataField="PurchaseOrder" HeaderText="PurchaseOrder" />
                                <asp:BoundField DataField="MaterialCode" HeaderText="MaterialCode" />
                                 <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                <asp:BoundField DataField="Approved" HeaderText="Approved" />
                                <asp:BoundField DataField="Reject" HeaderText="Reject" />
                            </Columns>
                        </asp:GridView>
                        <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.9/css/dataTables.bootstrap.min.css" />
                        <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
                        <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/responsive/1.0.7/css/responsive.bootstrap.min.css" />
                        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
                        <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
                        <script type="text/javascript" src="https://cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.min.js"></script>
                        <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>
                        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
                        <script type="text/javascript">
                            $(function () {
                                $('[id*=Gridview1]').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                                    "responsive": true,
                                    "sPaginationType": "full_numbers"
                                });
                            });
                        </script>
                    </div>
                </div>
            <div>
                <br />
                 <br /> <br /> <br /> <br />
            </div>
        </section>
    </section>
</asp:Content>

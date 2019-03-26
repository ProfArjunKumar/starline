<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="PurchaseOrder.aspx.cs" Inherits="Starline.WebForm21" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white;">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">PURCHASE ORDER</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="ORDER ID" runat="server" />
                            <asp:TextBox ID="txtorderid" Style="width: 325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="DATE" runat="server" />
                            <asp:TextBox ID="txtdate" Style="width: 325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />


                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="SUPPLIER NAME" runat="server" />
                            <asp:DropDownList ID="ddlsuppliername" AutoPostBack="true" Style="width: 325px;" CssClass="form-control" BackColor="Transparent" runat="server" OnSelectedIndexChanged="ddlsuppliername_SelectedIndexChanged">
                              
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="TAX" runat="server" />
                            <asp:TextBox runat="server" ID="txttax" Style="width: 325px;" placeholder="Enter tax" CssClass="form-control" BackColor="Transparent" />
                         
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="HSN CODE" runat="server" />
                            <asp:TextBox ID="txthsncode" Style="width: 325px;" placeholder="Enter hsn code" BackColor="Transparent" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label5" Text="Category" runat="server" />
                            <asp:DropDownList runat="server" ID="ddlcategory" Style="width: 325px;" placeholder="Enter Materialname" BackColor="Transparent" CssClass="form-control" OnSelectedIndexChanged="ddlcategory_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="MATERIAL NAME" runat="server" />
                            <asp:DropDownList runat="server" ID="ddlmaterialname" Style="width: 325px;" placeholder="Enter Materialname" BackColor="Transparent" CssClass="form-control">                             
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label8" Text="REQUIRED QUANTITY" runat="server" />
                            <asp:TextBox ID="txtRequiredquantity" Style="width: 325px;" placeholder="Enter requiredquantity" BackColor="Transparent" required="Required" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label9" Text="PRICE" runat="server" />
                            <asp:TextBox ID="txtprice" Style="width: 325px;" BackColor="Transparent" placeholder="Enter Price" CssClass="form-control" required="Required" runat="server" AutoPostBack="True" OnTextChanged="txtprice_TextChanged" />
                        </div>
                    </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label13" Text="TOTAL" runat="server" />
                            <asp:TextBox ID="txttotal" Style="width: 325px;" placeholder="Enter total" BackColor="Transparent" required="Required" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                   
                    </div>
                <div class="row">
                    <div class="col-sm-6" style="margin-left: 300px">
                        <div class="form-group">
                            <asp:Button ID="btnadd" Text="Add" CssClass="btn btn-success col-sm-4" runat="server" OnClick="btnadd_Click" />
                        </div>
                    </div>
                </div>
                <br />
                <br />
                 <asp:GridView ID="gvradd" runat="server" ClientIDMode="Static" AutoGenerateDeleteButton="True" OnRowDeleting="gvradd_RowDeleting"></asp:GridView>
                <br />
                <br />
                <div class="row">
                    <div class="col-sm-6" style="margin-left: 300px">
                        <asp:Button ID="btnsubmit" Text="Submit" UseSubmitBehavior="false" CssClass="btn btn-success col-sm-4" runat="server" Visible="false" OnClick="btnsubmit_Click" />
                    </div>
                </div>
            </div>
            <div>
             <div class="container-fluid" >
                    <div class="row col-lg-offset-1" style="width:800px;">
                         <div class="col-sm-6" style="margin-left:617px;">
                        <div class="form-group">
                            <asp:Button ID="Button1" Text="ExporttoExcel" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" OnClick="Button1_Click" />
                        </div>
                    </div>
                        <asp:GridView ID="Gridview1" ClientIDMode="Static" runat="server" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="YellowGreen" RowStyle-BackColor="WhiteSmoke" HeaderStyle-Width="300px" HeaderStyle-Height="40px" RowStyle-Height="40px" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="Order_ID">

                            <Columns>
                                
                                <asp:BoundField DataField="Order_ID" HeaderText="Order_ID" />
                                <asp:BoundField DataField="Date" HeaderText="Date" />
                                <asp:BoundField DataField="Supplier_name" HeaderText="Supplier_name" />
                                <asp:BoundField DataField="Material_name" HeaderText="Material_name" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                <asp:BoundField DataField="Total" HeaderText="Total" />
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
                </div>
        </section>
    </section>
</asp:Content>

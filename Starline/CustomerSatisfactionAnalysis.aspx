<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="CustomerSatisfactionAnalysis.aspx.cs" Inherits="Starline.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color: white; height: 1500px;">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 15px; margin-top: -9px; font-size: 20px;">CUSTOMER SATISFACTION ANALYSIS</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="CUSTOMER ID" runat="server" />
                            <asp:DropDownList runat="server" ID="txtddcustomerid" OnSelectedIndexChanged="txtddcustomerid_SelectedIndexChanged" Style="width: 325px;" AutoPostBack="true" CssClass="form-control" BackColor="Transparent">
                            </asp:DropDownList>
                           
                        </div>
                    </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label12" Text="CUSTOMER NAME" runat="server" />
                            <asp:TextBox ID="txtcustomername" Style="width: 315px;" ReadOnly="true" placeholder="Enter customer name" CssClass="form-control" BackColor="Transparent" runat="server" />                            
                        </div>
                    </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="COMPANY NAME" runat="server" />
                            <asp:TextBox ID="txtcompanyname" Style="width: 325px;" ReadOnly="true" placeholder="Enter company name" CssClass="form-control" BackColor="Transparent" runat="server" />
                        </div>
                    </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="DESIGNATION" runat="server" />
                            <asp:TextBox runat="server" ID="txtdesignation" Style="width: 315px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="REVIEW NAME" runat="server" />
                            <asp:TextBox ID="txtreviewname" Style="width: 325px;" placeholder="Enter review name" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                           
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="REVIEW DATE" runat="server" />
                            <asp:TextBox ID="txtreviewdate" Style="width: 315px;"  BackColor="Transparent" ReadOnly="true" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                   
                </div>
                <br />
                <div class="row" style="margin-left: -20px;">
                    <div class="col-sm-3">
                        <div class="form-group">
                            <h4>QUALITY</h4>
                            <br />
                            <asp:Label ID="Label8" Text="" runat="server" />
                            <asp:DropDownList ID="ddlquality" Style="width: 145px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                <asp:ListItem>--Rating--</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:DropDownList>
                           
                            </div>
                        </div>

                            <div class="col-sm-3">
                                <div class="form-group">
                                    <h4>DELIVERY</h4>
                                    <br />
                                    <asp:Label ID="Label9" Text="" runat="server" />
                                    <asp:DropDownList ID="ddldelivery" Style="width: 145px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                        <asp:ListItem>--Rating--</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                    </asp:DropDownList>
                                    
                                    </div>
                                </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <h4>PRICE</h4>
                                    <br />
                                    <asp:Label ID="Label10" Text="" runat="server" />
                                    <asp:DropDownList ID="ddlprice" Style="width: 145px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                        <asp:ListItem>--Rating--</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                    </asp:DropDownList>
                                   
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <h4>SERVICE</h4>
                                    <br />
                                    <asp:Label ID="Label11" Text="" runat="server" />
                                    <asp:DropDownList ID="ddlservice" Style="width: 145px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                        <asp:ListItem>--Rating--</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                    </asp:DropDownList>
                                   
                                </div>
                            </div>
                       <div class="col-sm-3">
                                <div class="form-group">
                                    <h4>IMPORVEMENT</h4>
                                    <br />
                                    <asp:Label ID="Label6" Text="" runat="server" />
                                    <asp:DropDownList ID="ddlimprovement" Style="width: 145px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                        <asp:ListItem>--Rating--</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                    </asp:DropDownList>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
            <br />
            <div class="row">
                <div class="col-sm-6" style="margin-left: 473px">
                    <div class="form-group">
                       <asp:Button ID="btn" Text="Submit" OnClick="btn_Click" CssClass="btn btn-success col-sm-4" Style="Width:100px" runat="server" />
                    </div>
                </div>
            </div>
            <br />
            <br />
            <br />

             <div class="container-fluid" >
                    <div class="row col-md-offset-1" style="width: 800px;overflow-x:auto">
                         <div class="col-sm-6" style="margin-left:617px;">
                        <div class="form-group">
                            <asp:Button ID="Button1" Text="ExporttoExcel" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" OnClick="Button1_Click" />
                        </div>
                    </div>
                        <asp:GridView ID="Gridview1" runat="server" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="YellowGreen" RowStyle-BackColor="WhiteSmoke" HeaderStyle-Width="10px" HeaderStyle-Height="35px" RowStyle-Height="35px" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="id">

                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" />
                                <asp:BoundField DataField="customerid" HeaderText="customerid" />
                                <asp:BoundField DataField="customername" HeaderText="customername" />
                                <asp:BoundField DataField="companyname" HeaderText="companyname" />
                                <asp:BoundField DataField="designation" HeaderText="designation" />
                                <asp:BoundField DataField="reviewname" HeaderText="reviewname" />
                                <asp:BoundField DataField="reviewdate" HeaderText="reviewdate" />
                                <asp:BoundField DataField="quality" HeaderText="quality" />
                                <asp:BoundField DataField="delivery" HeaderText="delivery" />
                                <asp:BoundField DataField="price" HeaderText="price" />
                                 <asp:BoundField DataField="service" HeaderText="service" />
                                 <asp:BoundField DataField="improment" HeaderText="improment" />
                                 
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

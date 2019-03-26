<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="ProductMaster.aspx.cs" Inherits="Starline.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white;">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">Product Master</h3>
                </div>
                <div class="row" style="margin-top:25px; margin-left:-15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="PRODUCT ID" runat="server" />
                            <asp:TextBox ID="txtproductid" Style="width:325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                   </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="MATERIAL" runat="server" />
                            <asp:TextBox ID="txtmaterial" Style="width:325px;" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="SIZE" runat="server" />
                            <asp:TextBox ID="txtsize" Style="width:325px;" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="UOM" runat="server" />
                            <asp:TextBox ID="txtuom" Style="width:325px;" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="LENGTH" runat="server" />
                            <asp:TextBox ID="txtlength" Style="width:325px;" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="WEIGHT" runat="server" />
                            <asp:TextBox ID="txtweight" Style="width:325px;" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label8" Text="HEIGHT/THICKNESS" runat="server" />
                            <asp:TextBox ID="txtheight" Style="width:325px;" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                        </div>
                    <div class="col-sm-6">
                         <div class="form-group">
                            <asp:Label ID="Label5" Text="GRADE" runat="server" />
                            <asp:TextBox ID="txtgrade" Style="width:325px;" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                         <div class="form-group">
                            <asp:Label ID="Label9" Text="RATE" runat="server" />
                            <asp:TextBox ID="txtrate" Style="width:325px;" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-6" style="margin-left: 300px">
                        <div class="form-group">
                            <asp:Button ID="btn" Text="Submit"  CssClass="btn btn-success col-sm-4" runat="server" OnClick="btn_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid" >
                    <div class="row col-lg-offset-1" style="width: 750px;">
                         <div class="col-sm-6" style="margin-left:617px;">
                        <div class="form-group">
                            <asp:Button ID="Button1" Text="ExporttoExcel" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" OnClick="Button1_Click" />
                        </div>
                    </div>
                        <asp:GridView ID="Gridview1" runat="server" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="YellowGreen" RowStyle-BackColor="WhiteSmoke" HeaderStyle-Width="300px" HeaderStyle-Height="40px" RowStyle-Height="40px" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="Id" OnRowCancelingEdit="Gridview1_RowCancelingEdit" OnRowDeleting="Gridview1_RowDeleting" OnRowEditing="Gridview1_RowEditing" OnRowUpdating="Gridview1_RowUpdating">

                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" />
                                <asp:BoundField DataField="ProductId" HeaderText="ProductId" />
                                <asp:BoundField DataField="Material" HeaderText="Material" />
                                <asp:BoundField DataField="Size" HeaderText="Size" />
                                <asp:BoundField DataField="UOM" HeaderText="UOM" />
                                <asp:BoundField DataField="Length" HeaderText="Length" />
                                <asp:BoundField DataField="Weight" HeaderText="Weight" />
                                <asp:BoundField DataField="Height" HeaderText="Height" />
                                <asp:BoundField DataField="Grade" HeaderText="Grade" />
                                <asp:BoundField DataField="Rate" HeaderText="Rate" />
                                <asp:CommandField ShowEditButton="true" />
                                <asp:CommandField ShowDeleteButton="true" />

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

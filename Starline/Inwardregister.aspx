<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Inwardregister.aspx.cs" Inherits="Starline.WebForm23" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="main-content" style="background-color:white;height:1000px">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">Inward Register</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="DATE" runat="server" />
                            <asp:TextBox ID="txtdate" Style="width: 325px;" ReadOnly="true" placeholder="Enter materialcategory" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="VEHICLE NUMBER" runat="server" />
                            <asp:TextBox ID="txtvehiclenumber" Style="width: 325px;" CssClass="form-control"  PLACEHOLDER="Enter date" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="VEHICLE TYPE" runat="server" />
                            <asp:TextBox ID="txtvehicletype" Style="width: 325px;" CssClass="form-control"  PLACEHOLDER="Enter vehicle type" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="TIME" runat="server" />
                            <asp:TextBox ID="txttime" TextMode="Time" Style="width: 325px;" CssClass="form-control"   BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    </div>
                 <br />
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
                    <div class="row col-lg-offset-3" style="width: 600px;">
                         <div class="col-sm-6" style="margin-left:417px;">
                        <div class="form-group">
                            <asp:Button ID="Button1" Text="ExporttoExcel" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" OnClick="Button1_Click" />
                        </div>
                    </div>
                        <asp:GridView ID="Gridview1" runat="server" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="YellowGreen" RowStyle-BackColor="WhiteSmoke" RowStyle-Width="500px" HeaderStyle-Width="1000px" HeaderStyle-Height="40px" RowStyle-Height="40px" ClientIDMode="Static" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="Id" OnRowCancelingEdit="Gridview1_RowCancelingEdit" OnRowDeleting="Gridview1_RowDeleting" OnRowEditing="Gridview1_RowEditing" OnRowUpdating="Gridview1_RowUpdating">

                            <Columns>
                                <asp:BoundField DataField="Date" HeaderText="Date" />
                                <asp:BoundField DataField="Vehicleno" HeaderText="Vehicleno" />
                                <asp:BoundField DataField="Vehicletype" HeaderText="Vehicletype" />
                                <asp:BoundField DataField="Time" HeaderText="Time" />
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

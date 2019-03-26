<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="VehicleMaster.aspx.cs" Inherits="Starline.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white;">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">VEHICLE DETAILS</h3>
                </div>
                <div class="row" style="margin-top:25px; margin-left:-15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="VEHICLE ID" runat="server" />
                            <asp:TextBox ID="txtvehicleid" Style="width:325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent"  required="Required" runat="server" />
                        </div>
                   </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="DATE" runat="server" />
                            <asp:TextBox ID="txtdate" ReadOnly="true" Style="width:325px;" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="VEHICLE NUMBER" runat="server" />
                            <asp:TextBox ID="txtvehiclenum" Style="width:325px;" placeholder="Enter Vehicle Number" CssClass="form-control" BackColor="Transparent" required="Required"  runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="POLLUTION CHECK" runat="server" />
                            <asp:TextBox ID="txtpollutioncheck" Style="width:325px;" placeholder="Enter Pollution Check" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="RC" runat="server" />
                            <asp:TextBox ID="txtrc" Style="width:325px;" placeholder="Enter Rc" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="INSURANCE" runat="server" />
                            <asp:TextBox ID="txtinsurance" Style="width:325px;" PLACEHOLDER="Enter Insurance" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label8" Text="VEHICLE TYPE" runat="server" />
                            <asp:TextBox ID="txtvehicletype" Style="width:325px;" PLACEHOLDER="Enter Vehicle Type" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
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
                        <asp:GridView ID="Gridview1" runat="server" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="YellowGreen" RowStyle-BackColor="WhiteSmoke" HeaderStyle-Width="300px" HeaderStyle-Height="40px" RowStyle-Height="40px" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="vehicleid" OnRowCancelingEdit="Gridview1_RowCancelingEdit" OnRowDeleting="Gridview1_RowDeleting" OnRowEditing="Gridview1_RowEditing" OnRowUpdating="Gridview1_RowUpdating">

                            <Columns>
                                <asp:BoundField DataField="vehicleid" HeaderText="vehicleid" />
                                <asp:BoundField DataField="vehiclenumber" HeaderText="vehiclenumber" />
                                <asp:BoundField DataField="RC" HeaderText="RC" />
                                <asp:BoundField DataField="vehicletype" HeaderText="vehicletype" />
                                <asp:BoundField DataField="date" HeaderText="date" />
                                <asp:BoundField DataField="pollutioncheck" HeaderText="pollutioncheck" />
                                <asp:BoundField DataField="insurance" HeaderText="insurance" />
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

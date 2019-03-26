<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Damage.aspx.cs" Inherits="Starline.WebForm24" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section id="main-content" style="background-color: white; height: 2000px;">
        <section class="wrapper">
    <div class="container-fluid" >
                    <div class="row col-md-offset-2" style="width: 650px;">
                        <div class="header">
                            <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">Damage Material</h3>
                        </div>
                         <div class="col-sm-6" style="margin-left:467px;">
                        <div class="form-group">
                            <asp:Button ID="Button1" Text="ExporttoExcel" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" OnClick="Button1_Click" />
                        </div>
                    </div>
                        <asp:GridView ID="Gridview1" runat="server" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="YellowGreen" RowStyle-BackColor="WhiteSmoke" HeaderStyle-Width="300px" HeaderStyle-Height="40px" RowStyle-Height="40px" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="Grn_id">

                            <Columns>
                                <asp:BoundField DataField="Grn_id" HeaderText="Grn_id" />
                                <asp:BoundField DataField="date" HeaderText="date" />
                                <asp:BoundField DataField="purchase_order" HeaderText="purchase_order" />
                                <asp:BoundField DataField="suplier_name" HeaderText="suplier_name" />
                                <asp:BoundField DataField="material_name" HeaderText="material_name" />
                                <asp:BoundField DataField="quantity" HeaderText="quantity" />
                                <asp:BoundField DataField="damage" HeaderText="damage" />
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

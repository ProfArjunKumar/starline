<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="PaperPacking.aspx.cs" Inherits="Starline.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white; height:1000px">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">PAPER PACKING</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="MATERIAL CODE" runat="server" />
                            <asp:TextBox ID="papermaterialcode" Style="width: 325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="CATEGORY" runat="server" />
                            <asp:TextBox ID="papercategory" Style="width: 325px;" CssClass="form-control" ReadOnly="true" PLACEHOLDER="Enter category" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>                    
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="SUB-CATEGORY" runat="server" />
                            <asp:TextBox ID="paperscategory" Style="width: 325px;" CssClass="form-control" ReadOnly="true" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="MATERIAL" runat="server" />
                            <asp:TextBox ID="papermaterial" Style="width: 325px;" CssClass="form-control"  placeholder="Enter material" BackColor="Transparent" runat="server" />

                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="LENGTH" runat="server" />
                            <asp:TextBox ID="paperlength" AutoPostBack="true" Style="width: 325px;" placeholder="Enter length" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="paperlength_TextChanged" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="UOM" runat="server" />
                            <asp:TextBox ID="paperUOM1" Style="width: 325px;" ReadOnly="true" placeholder="Enter uom1" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label8" Text="WIDTH" runat="server" />
                            <asp:TextBox ID="paperwidth" Style="width: 325px;" placeholder="Enter width" AutoPostBack="true"  BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="paperwidth_TextChanged" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label9" Text="UOM" runat="server" />
                            <asp:TextBox ID="paperuom2" Style="width: 325px;" BackColor="Transparent" ReadOnly="true" placeholder="Enter uom2" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label5" Text="HEIGHT/THICKNESS" runat="server" />
                            <asp:TextBox ID="paperheight" Style="width: 325px;" placeholder="Enter height" AutoPostBack="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="paperheight_TextChanged" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label10" Text="UOM" runat="server" />
                             <asp:TextBox ID="paperuom3" Style="width: 325px;" ReadOnly="true" placeholder="Enter uom3" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label11" Text="SPECIFICATIONS" runat="server" />
                            <asp:TextBox ID="paperspecification" Style="width: 325px;" placeholder="Enter specification" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label12" Text="SIZE(L*W*H)" runat="server" />
                            <asp:TextBox ID="paperSIZE" Style="width: 325px;" ReadOnly="true" placeholder="Enter size" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label13" Text="TOTAL QUANTITY" runat="server" />
                            <asp:TextBox ID="papertotalquantity" Style="width: 325px;" AutoPostBack="true"  placeholder="Enter total quality" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="papertotalquantity_TextChanged" />
                        </div>
                    </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label14" Text="MINIMUM QUANTITY" runat="server" />
                            <asp:TextBox ID="paperminimumquantity" Style="width: 325px;"  placeholder="Enter Minimum Quality" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label15" Text="SQ.FT" runat="server" />
                            <asp:TextBox ID="papersqft" Style="width: 325px;" ReadOnly="true" placeholder="Enter sq.ft" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label16" Text="SQ.MT" runat="server" />
                            <asp:TextBox ID="papersqmt" Style="width: 325px;" ReadOnly="true" placeholder="Enter Sq.mt" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
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

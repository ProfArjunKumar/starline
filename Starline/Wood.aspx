<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="Wood.aspx.cs" Inherits="Starline.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white;">
        <section class="wrapper" style="margin-right:10px">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">WOOD</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="MATERIAL CODE" runat="server" />
                            <asp:TextBox ID="txtmaterialcode" Style="width: 325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="CATEGORY" runat="server" />
                            <asp:TextBox ID="txtcategory" Style="width: 325px;" CssClass="form-control" ReadOnly="true" PLACEHOLDER="Subcategory" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="SUB-CATEGORY" runat="server" />
                            <asp:DropDownList runat="server" ID="ddlsubcategory" Style="width: 325px;" AutoPostBack="true" CssClass="form-control" placeholder="Enter Length" BackColor="Transparent" required="Required" OnSelectedIndexChanged="ddlsubcategory_SelectedIndexChanged">
                                <asp:ListItem>select Craft</asp:ListItem>
                                                    <asp:ListItem>Metric</asp:ListItem>
                                                    <asp:ListItem>Imperial</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="MATERIAL" runat="server" />
                            <asp:TextBox ID="txtmaterial" Style="width: 325px;" CssClass="form-control"  placeholder="Enter width" BackColor="Transparent" required="Required" runat="server" />

                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="LENGTH" runat="server" />
                            <asp:TextBox ID="txtlength" AutoPostBack="true" Style="width: 325px;" placeholder="Enter specificatios" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="txtlength_TextChanged" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="UOM" runat="server" />
                            <asp:TextBox ID="txtUOM" Style="width: 325px;" placeholder="Enter Minimum Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label8" Text="WIDTH" runat="server" />
                            <asp:TextBox ID="txtwidth" Style="width: 325px;" placeholder="Enter width" AutoPostBack="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="txtwidth_TextChanged" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label9" Text="UOM" runat="server" />
                            <asp:TextBox ID="txtuom1" Style="width: 325px;" BackColor="Transparent" placeholder="Enter uom1" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label5" Text="HEIGHT/THICKNESS" runat="server" />
                            <asp:TextBox ID="txtheight" Style="width: 325px;" placeholder="Enter height" AutoPostBack="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="txtheight_TextChanged" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label10" Text="UOM" runat="server" />
                             <asp:TextBox ID="txtuomh" Style="width: 325px;" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label11" Text="SPECIFICATIONS" runat="server" />
                            <asp:TextBox ID="txtspecification" Style="width: 325px;" placeholder="Enter Minimum Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label12" Text="SIZE(L*W*H)" runat="server" />
                            <asp:TextBox ID="txtSIZE" Style="width: 325px;" ReadOnly="true" placeholder="Enter Minimum Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label13" Text="TOTAL QUANTITY" runat="server" />
                            <asp:TextBox ID="txttotalquantity" Style="width: 325px;" placeholder="Enter Minimum Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" AutoPostBack="True" OnTextChanged="txttotalquantity_TextChanged" />
                        </div>
                    </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label14" Text="MINIMUM QUANTITY" runat="server" />
                            <asp:TextBox ID="txtminimumquantity" Style="width: 325px;"  placeholder="Enter Minimum Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label15" Text="SQ.FT" runat="server" />
                            <asp:TextBox ID="txtsqft" Style="width: 325px;" placeholder="Enter Sq.Ft" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label16" Text="SQ.MT" runat="server" />
                            <asp:TextBox ID="txtsqmt" Style="width: 325px;" placeholder="Enter Sq.mt" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
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
                    <div class="row" style="width: 750px;margin-left:20px">
                         <div class="col-sm-6" style="margin-left:617px;">
                        <div class="form-group">
                            <asp:Button ID="Button1" Text="ExporttoExcel" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" OnClick="Button1_Click" />
                        </div>
                    </div>
                        <asp:GridView ID="Gridview1" runat="server" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="YellowGreen" RowStyle-BackColor="WhiteSmoke" HeaderStyle-Width="300px" HeaderStyle-Height="40px" RowStyle-Height="40px" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="mid">
                           
                            <Columns>
                                <asp:BoundField DataField="mid" HeaderText="mid" />
                                <asp:BoundField DataField="mmaterialcode" HeaderText="mmaterialcode" />
                                <asp:BoundField DataField="mcategory" HeaderText="mcategory" />
                                <asp:BoundField DataField="msubcategory" HeaderText="msubcategory" />
                                <asp:BoundField DataField="mmaterial" HeaderText="mmaterial" />
                                <asp:BoundField DataField="mspecifications" HeaderText="mspecifications" />
                                <asp:BoundField DataField="msize" HeaderText="msize" />
                                <asp:BoundField DataField="mminimum" HeaderText="mminimum" />
                                <asp:BoundField DataField="mtotalqty" HeaderText="mtotalqty" />
                                <asp:BoundField DataField="CFT" HeaderText="CFT" />
                                <asp:BoundField DataField="CUM" HeaderText="CUM" />
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

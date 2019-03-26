<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Hardware.aspx.cs" Inherits="Starline.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color: white;">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">HARDWARE</h3>
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
                            <asp:Label ID="Label8" Text="CATEGORY" runat="server" />
                            <asp:TextBox ID="txtcategory" Style="width: 325px;" BackColor="Transparent" placeholder="Enter Categorey" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="SUBCATEGORY" runat="server" />
                            <asp:TextBox ID="txtsubcategory" Style="width: 325px;" CssClass="form-control" PLACEHOLDER="Subcategory" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="LENGTH" runat="server" />
                            <asp:TextBox ID="txtlength" Style="width: 325px;" OnTextChanged="txtlength_TextChanged" AutoPostBack="true" CssClass="form-control" placeholder="Enter Length" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="WIDTH" runat="server" />
                            <asp:TextBox ID="txtwidth" Style="width: 325px;" OnTextChanged="txtwidth_TextChanged" CssClass="form-control" AutoPostBack="true" placeholder="Enter width" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label5" Text="HEIGHT/THICKNESS" runat="server" />
                            <asp:TextBox ID="txtheight" Style="width: 325px;" OnTextChanged="txtthickness_TextChanged" AutoPostBack="true" BackColor="Transparent" placeholder="Enter Height" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="SPECIFICATIONS" runat="server" />
                            <asp:TextBox ID="txtspecifications" Style="width: 325px;" placeholder="Enter specificatios" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="MINIMUM STOCK" runat="server" />
                            <asp:TextBox ID="txtminimumstock" Style="width: 325px;" placeholder="Enter Minimum Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>                    
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label9" Text="MATERIAL" runat="server" />
                            <asp:TextBox ID="txtmaterial" Style="width: 325px;" BackColor="Transparent" placeholder="Enter Material" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label10" Text="UOM" runat="server" />
                            <asp:DropDownList runat="server" ID="txtddlUOM" Style="width: 325px; top:698PX;left:883PX" BackColor="Transparent" CssClass="form-control" required="Required">
                                <asp:ListItem>Select Craft</asp:ListItem>
                                <asp:ListItem>KG</asp:ListItem>
                                <asp:ListItem>Feet</asp:ListItem>
                                <asp:ListItem>Inch</asp:ListItem>
                                <asp:ListItem>Grams</asp:ListItem>
                                <asp:ListItem>Bottle</asp:ListItem>
                                <asp:ListItem>Number</asp:ListItem>
                                <asp:ListItem>MM</asp:ListItem>
                                <asp:ListItem>Kilogram</asp:ListItem>
                                <asp:ListItem>Ply</asp:ListItem>
                                <asp:ListItem>Meter</asp:ListItem>
                                <asp:ListItem>GSM</asp:ListItem>
                                <asp:ListItem>BS</asp:ListItem>
                                <asp:ListItem>Box</asp:ListItem>
                                <asp:ListItem>Roll</asp:ListItem>
                                <asp:ListItem>Pockets</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label11" Text="SIZE(L*W*H)" runat="server" />
                            <asp:TextBox ID="txtsize" Style="width: 325px;" placeholder="Enter Minimum Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label12" Text="AVAILABLE STOCK" runat="server" />
                            <asp:TextBox ID="txtavailablestock" Style="width: 325px;" placeholder="Enter Minimum Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
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
                   <div>
                       <br />
                       <br />
                       <br />
                   </div>        
            </div>
            <div class="container-fluid">
                <div class="row" style="overflow-x: auto" aria-setsize="500">
                    <div class="col-sm-6" style="margin-left: 820px;">
                        <div class="form-group">
                            <asp:Button ID="Button1" Text="ExporttoExcel" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" OnClick="Button1_Click" />
                        </div>
                    </div>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" DeleteCommand="DELETE FROM [mhardware] WHERE [hid] = @hid" InsertCommand="INSERT INTO [mhardware] ([hmaterialcode], [hcategory], [hsubcategory], [hmaterial], [hlength], [hheight], [hwidth], [huom], [hspecifications], [hsize], [hminimum], [htotalqty]) VALUES (@hmaterialcode, @hcategory, @hsubcategory, @hmaterial, @hlength, @hheight, @hwidth, @huom, @hspecifications, @hsize, @hminimum, @htotalqty)" SelectCommand="SELECT * FROM [mhardware]" UpdateCommand="UPDATE [mhardware] SET [hmaterialcode] = @hmaterialcode, [hcategory] = @hcategory, [hsubcategory] = @hsubcategory, [hmaterial] = @hmaterial, [hlength] = @hlength, [hheight] = @hheight, [hwidth] = @hwidth, [huom] = @huom, [hspecifications] = @hspecifications, [hsize] = @hsize, [hminimum] = @hminimum, [htotalqty] = @htotalqty WHERE [hid] = @hid">
                        <DeleteParameters>
                            <asp:Parameter Name="hid" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="hmaterialcode" Type="String" />
                            <asp:Parameter Name="hcategory" Type="String" />
                            <asp:Parameter Name="hsubcategory" Type="String" />
                            <asp:Parameter Name="hmaterial" Type="String" />
                            <asp:Parameter Name="hlength" Type="String" />
                            <asp:Parameter Name="hheight" Type="String" />
                            <asp:Parameter Name="hwidth" Type="String" />
                            <asp:Parameter Name="huom" Type="String" />
                            <asp:Parameter Name="hspecifications" Type="String" />
                            <asp:Parameter Name="hsize" Type="String" />
                            <asp:Parameter Name="hminimum" Type="Decimal" />
                            <asp:Parameter Name="htotalqty" Type="Decimal" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="hmaterialcode" Type="String" />
                            <asp:Parameter Name="hcategory" Type="String" />
                            <asp:Parameter Name="hsubcategory" Type="String" />
                            <asp:Parameter Name="hmaterial" Type="String" />
                            <asp:Parameter Name="hlength" Type="String" />
                            <asp:Parameter Name="hheight" Type="String" />
                            <asp:Parameter Name="hwidth" Type="String" />
                            <asp:Parameter Name="huom" Type="String" />
                            <asp:Parameter Name="hspecifications" Type="String" />
                            <asp:Parameter Name="hsize" Type="String" />
                            <asp:Parameter Name="hminimum" Type="Decimal" />
                            <asp:Parameter Name="htotalqty" Type="Decimal" />
                            <asp:Parameter Name="hid" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" ClientIDMode="Static" HeaderStyle-Height="40px" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="hid" Width="1500px" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="hid" HeaderText="hid" InsertVisible="False" ReadOnly="True" SortExpression="hid" />
                            <asp:BoundField DataField="hmaterialcode" HeaderText="hmaterialcode" SortExpression="hmaterialcode" />
                            <asp:BoundField DataField="hcategory" HeaderText="hcategory" SortExpression="hcategory" />
                            <asp:BoundField DataField="hsubcategory" HeaderText="hsubcategory" SortExpression="hsubcategory" />
                            <asp:BoundField DataField="hmaterial" HeaderText="hmaterial" SortExpression="hmaterial" />
                            <asp:BoundField DataField="hlength" HeaderText="hlength" SortExpression="hlength" />
                            <asp:BoundField DataField="hheight" HeaderText="hheight" SortExpression="hheight" />
                            <asp:BoundField DataField="hwidth" HeaderText="hwidth" SortExpression="hwidth" />
                            <asp:TemplateField HeaderText="huom" SortExpression="huom">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style1" DataSourceID="SqlDataSource2" DataTextField="huom" DataValueField="huom" SelectedValue='<%# Bind("huom") %>' Style="z-index: 1">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" SelectCommand="SELECT DISTINCT [huom] FROM [mhardware]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("huom") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="hspecifications" HeaderText="hspecifications" SortExpression="hspecifications" />
                            <asp:BoundField DataField="hsize" HeaderText="hsize" SortExpression="hsize" />
                            <asp:BoundField DataField="hminimum" HeaderText="hminimum" SortExpression="hminimum" />
                            <asp:BoundField DataField="htotalqty" HeaderText="htotalqty" SortExpression="htotalqty" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
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
                                $('[id*=GridView1]').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                                    "responsive": true,
                                    "sPaginationType": "full_numbers"
                                });
                            });
                        </script>
                     
                </div>
            </div>
            <div>
                <br />

                <br />
                <br />
                <br />
                <br />
                       <br />
                       <br />

            </div>
        </section>
    </section>
</asp:Content>

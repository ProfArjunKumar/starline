<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="Polythene.aspx.cs" Inherits="Starline.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white;">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">POLYTHENE</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="MATERIAL CODE" runat="server" />
                            <asp:TextBox ID="polythenematerialcode" Style="width: 325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="SUBCATEGORY" runat="server" />
                            <asp:TextBox ID="polythenesubcategory" Style="width: 325px;" CssClass="form-control" PLACEHOLDER="Subcategory" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="LENGTH" runat="server" />
                            <asp:TextBox ID="polythenelength" Style="width: 325px;" CssClass="form-control" PLACEHOLDER="Subcategory" BackColor="Transparent" required="Required" runat="server" OnTextChanged="polythenelength_TextChanged" />                            
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="WIDTH" runat="server" />
                            <asp:TextBox ID="polythenewidth" Style="width: 325px;" CssClass="form-control" AutoPostBack="true"  placeholder="Enter width" BackColor="Transparent" required="Required" runat="server" OnTextChanged="polythenewidth_TextChanged" />

                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="SPECFIFICATION" runat="server" />
                            <asp:TextBox ID="polythenespecification" AutoPostBack="true" Style="width: 325px;" placeholder="Enter specificatios" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="MINIMUM STOCK" runat="server" />
                            <asp:TextBox ID="polytheneminiomumstock" Style="width: 325px;" placeholder="Enter Minimum Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label8" Text="CATEGORY" runat="server" />
                            <asp:TextBox ID="polythenecategory" Style="width: 325px;" placeholder="Enter category"  ReadOnly="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label9" Text="MATERIAL" runat="server" />
                            <asp:TextBox ID="polythenematerial" Style="width: 325px;" BackColor="Transparent" placeholder="Enter material" CssClass="form-control" required="Required" runat="server" />
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
                            <asp:DropDownList  ID="polytheneuom" Style="width: 325px;" ReadOnly="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server">
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
                            <asp:TextBox ID="polythenesize" Style="width: 325px;" placeholder="Enter size" AutoPostBack="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label12" Text="AVAILABLE STOCK" runat="server" />
                            <asp:TextBox ID="polytheneavailablestock" Style="width: 325px;"  placeholder="Enter available Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
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
                <div class="container-fluid">
                    <div class="row" style="overflow-x: auto">
                        <div class="col-sm-6" style="margin-left: 617px;">
                            <div class="form-group">
                                <asp:Button ID="Button1" Text="ExporttoExcel" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" OnClick="Button1_Click" />
                            </div>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" DeleteCommand="DELETE FROM [mpolythene] WHERE [poid] = @poid" InsertCommand="INSERT INTO [mpolythene] ([pomaterialcode], [posubcategory], [polength], [powidth], [pospecifications], [pominimum], [pocategory], [pomaterial], [poheight], [pouom], [posize], [pototalqty]) VALUES (@pomaterialcode, @posubcategory, @polength, @powidth, @pospecifications, @pominimum, @pocategory, @pomaterial, @poheight, @pouom, @posize, @pototalqty)" SelectCommand="SELECT * FROM [mpolythene]" UpdateCommand="UPDATE [mpolythene] SET [pomaterialcode] = @pomaterialcode, [posubcategory] = @posubcategory, [polength] = @polength, [powidth] = @powidth, [pospecifications] = @pospecifications, [pominimum] = @pominimum, [pocategory] = @pocategory, [pomaterial] = @pomaterial, [poheight] = @poheight, [pouom] = @pouom, [posize] = @posize, [pototalqty] = @pototalqty WHERE [poid] = @poid">
                            <DeleteParameters>
                                <asp:Parameter Name="poid" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="pomaterialcode" Type="String" />
                                <asp:Parameter Name="posubcategory" Type="String" />
                                <asp:Parameter Name="polength" Type="String" />
                                <asp:Parameter Name="powidth" Type="String" />
                                <asp:Parameter Name="pospecifications" Type="String" />
                                <asp:Parameter Name="pominimum" Type="Decimal" />
                                <asp:Parameter Name="pocategory" Type="String" />
                                <asp:Parameter Name="pomaterial" Type="String" />
                                <asp:Parameter Name="poheight" Type="String" />
                                <asp:Parameter Name="pouom" Type="String" />
                                <asp:Parameter Name="posize" Type="String" />
                                <asp:Parameter Name="pototalqty" Type="Decimal" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="pomaterialcode" Type="String" />
                                <asp:Parameter Name="posubcategory" Type="String" />
                                <asp:Parameter Name="polength" Type="String" />
                                <asp:Parameter Name="powidth" Type="String" />
                                <asp:Parameter Name="pospecifications" Type="String" />
                                <asp:Parameter Name="pominimum" Type="Decimal" />
                                <asp:Parameter Name="pocategory" Type="String" />
                                <asp:Parameter Name="pomaterial" Type="String" />
                                <asp:Parameter Name="poheight" Type="String" />
                                <asp:Parameter Name="pouom" Type="String" />
                                <asp:Parameter Name="posize" Type="String" />
                                <asp:Parameter Name="pototalqty" Type="Decimal" />
                                <asp:Parameter Name="poid" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="poid" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="poid" HeaderText="poid" InsertVisible="False" ReadOnly="True" SortExpression="poid" />
                                <asp:BoundField DataField="pomaterialcode" HeaderText="pomaterialcode" SortExpression="pomaterialcode" />
                                <asp:BoundField DataField="posubcategory" HeaderText="posubcategory" SortExpression="posubcategory" />
                                <asp:BoundField DataField="polength" HeaderText="polength" SortExpression="polength" />
                                <asp:BoundField DataField="powidth" HeaderText="powidth" SortExpression="powidth" />
                                <asp:BoundField DataField="pospecifications" HeaderText="pospecifications" SortExpression="pospecifications" />
                                <asp:BoundField DataField="pominimum" HeaderText="pominimum" SortExpression="pominimum" />
                                <asp:BoundField DataField="pocategory" HeaderText="pocategory" SortExpression="pocategory" />
                                <asp:BoundField DataField="pomaterial" HeaderText="pomaterial" SortExpression="pomaterial" />
                                <asp:BoundField DataField="poheight" HeaderText="poheight" SortExpression="poheight" />
                                <asp:TemplateField HeaderText="pouom" SortExpression="pouom">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="pouom" DataValueField="pouom" SelectedValue='<%# Bind("pouom", "{0}") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" SelectCommand="SELECT DISTINCT [pouom] FROM [mpolythene]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("pouom") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="posize" HeaderText="posize" SortExpression="posize" />
                                <asp:BoundField DataField="pototalqty" HeaderText="pototalqty" SortExpression="pototalqty" />
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </div>
                </div>
            <div>
                <br />
                
                 <br /> <br /> <br /> <br />
            </div>
        </section>
    </section>
</asp:Content>

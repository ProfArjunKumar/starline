<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="Tools.aspx.cs" Inherits="Starline.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white;height:1000px">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">TOOLS</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="MATERIAL CODE" runat="server" />
                            <asp:TextBox ID="toolsmaterialcode" Style="width: 325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="SUBCATEGORY" runat="server" />
                            <asp:TextBox ID="toolssubcategory" Style="width: 325px;" CssClass="form-control" PLACEHOLDER="Subcategory" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="LENGTH" runat="server" />
                            <asp:TextBox ID="toolslength" Style="width: 325px;" AutoPostBack="true" CssClass="form-control" placeholder="Enter Length" BackColor="Transparent" required="Required" runat="server" OnTextChanged="toolslength_TextChanged" />

                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="WIDTH" runat="server" />
                            <asp:TextBox ID="toolswidth" Style="width: 325px;" CssClass="form-control" AutoPostBack="true" placeholder="Enter width" BackColor="Transparent" required="Required" runat="server" OnTextChanged="toolswidth_TextChanged" />

                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="SPECFIFICATION" runat="server" />
                            <asp:TextBox ID="toolsspecification" Style="width: 325px;" placeholder="Enter specificatios" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="MINIMUM QTY LEVEL" runat="server" />
                            <asp:TextBox ID="toolsminiomumqtylevel" Style="width: 325px;" placeholder="Enter Minimum qty level" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label8" Text="CATEGORY" runat="server" />
                            <asp:TextBox ID="toolscategory" Style="width: 325px;" placeholder="Enter category" ReadOnly="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label9" Text="MATERIAL " runat="server" />
                            <asp:TextBox ID="toolsmaterial" Style="width: 325px;" BackColor="Transparent" placeholder="Enter material" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label5" Text="HEIGHT/THICKNESS" runat="server" />
                            <asp:TextBox ID="toolsheight" Style="width: 325px;" placeholder="Enter height" AutoPostBack="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="toolsheight_TextChanged" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label10" Text="UOM" runat="server" />
                            <asp:DropDownList ID="toolsuom" Style="width: 325px;" BackColor="Transparent" CssClass="form-control" required="Required" runat="server">
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
                            <asp:TextBox ID="toolssize" Style="width: 325px;" placeholder="Enter size" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label12" Text="AVAILABLE STOCK" runat="server" />
                            <asp:TextBox ID="toolsavailablestock" Style="width: 325px;" placeholder="Enter available Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
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
            <div class="container-fluid">

                <div class="row" style="overflow-x: auto">
                    <div class="col-lg-12">

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" DeleteCommand="DELETE FROM [mtools] WHERE [tid] = @tid" InsertCommand="INSERT INTO [mtools] ([tmaterialcode], [tsubcategory], [tlength], [twidth], [tspecifications], [tminimum], [tcategory], [tmaterial], [theight], [tuom], [tsize], [ttotalqty]) VALUES (@tmaterialcode, @tsubcategory, @tlength, @twidth, @tspecifications, @tminimum, @tcategory, @tmaterial, @theight, @tuom, @tsize, @ttotalqty)" SelectCommand="SELECT * FROM [mtools]" UpdateCommand="UPDATE [mtools] SET [tmaterialcode] = @tmaterialcode, [tsubcategory] = @tsubcategory, [tlength] = @tlength, [twidth] = @twidth, [tspecifications] = @tspecifications, [tminimum] = @tminimum, [tcategory] = @tcategory, [tmaterial] = @tmaterial, [theight] = @theight, [tuom] = @tuom, [tsize] = @tsize, [ttotalqty] = @ttotalqty WHERE [tid] = @tid">
                            <DeleteParameters>
                                <asp:Parameter Name="tid" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="tmaterialcode" Type="String" />
                                <asp:Parameter Name="tsubcategory" Type="String" />
                                <asp:Parameter Name="tlength" Type="String" />
                                <asp:Parameter Name="twidth" Type="String" />
                                <asp:Parameter Name="tspecifications" Type="String" />
                                <asp:Parameter Name="tminimum" Type="Decimal" />
                                <asp:Parameter Name="tcategory" Type="String" />
                                <asp:Parameter Name="tmaterial" Type="String" />
                                <asp:Parameter Name="theight" Type="String" />
                                <asp:Parameter Name="tuom" Type="String" />
                                <asp:Parameter Name="tsize" Type="String" />
                                <asp:Parameter Name="ttotalqty" Type="Decimal" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="tmaterialcode" Type="String" />
                                <asp:Parameter Name="tsubcategory" Type="String" />
                                <asp:Parameter Name="tlength" Type="String" />
                                <asp:Parameter Name="twidth" Type="String" />
                                <asp:Parameter Name="tspecifications" Type="String" />
                                <asp:Parameter Name="tminimum" Type="Decimal" />
                                <asp:Parameter Name="tcategory" Type="String" />
                                <asp:Parameter Name="tmaterial" Type="String" />
                                <asp:Parameter Name="theight" Type="String" />
                                <asp:Parameter Name="tuom" Type="String" />
                                <asp:Parameter Name="tsize" Type="String" />
                                <asp:Parameter Name="ttotalqty" Type="Decimal" />
                                <asp:Parameter Name="tid" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="tid" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="tid" HeaderText="tid" InsertVisible="False" ReadOnly="True" SortExpression="tid" />
                                <asp:BoundField DataField="tmaterialcode" HeaderText="tmaterialcode" SortExpression="tmaterialcode" />
                                <asp:BoundField DataField="tsubcategory" HeaderText="tsubcategory" SortExpression="tsubcategory" />
                                <asp:BoundField DataField="tlength" HeaderText="tlength" SortExpression="tlength" />
                                <asp:BoundField DataField="twidth" HeaderText="twidth" SortExpression="twidth" />
                                <asp:BoundField DataField="tspecifications" HeaderText="tspecifications" SortExpression="tspecifications" />
                                <asp:BoundField DataField="tminimum" HeaderText="tminimum" SortExpression="tminimum" />
                                <asp:BoundField DataField="tcategory" HeaderText="tcategory" SortExpression="tcategory" />
                                <asp:BoundField DataField="tmaterial" HeaderText="tmaterial" SortExpression="tmaterial" />
                                <asp:BoundField DataField="theight" HeaderText="theight" SortExpression="theight" />
                                <asp:TemplateField HeaderText="tuom" SortExpression="tuom">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="tuom" DataValueField="tuom" SelectedValue='<%# Bind("tuom", "{0}") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" DeleteCommand="DELETE FROM [mtools] WHERE [tid] = @tid" InsertCommand="INSERT INTO [mtools] ([tmaterialcode], [tsubcategory], [tlength], [twidth], [tspecifications], [tminimum], [tcategory], [tmaterial], [theight], [tuom], [tsize], [ttotalqty]) VALUES (@tmaterialcode, @tsubcategory, @tlength, @twidth, @tspecifications, @tminimum, @tcategory, @tmaterial, @theight, @tuom, @tsize, @ttotalqty)" SelectCommand="SELECT * FROM [mtools]" UpdateCommand="UPDATE [mtools] SET [tmaterialcode] = @tmaterialcode, [tsubcategory] = @tsubcategory, [tlength] = @tlength, [twidth] = @twidth, [tspecifications] = @tspecifications, [tminimum] = @tminimum, [tcategory] = @tcategory, [tmaterial] = @tmaterial, [theight] = @theight, [tuom] = @tuom, [tsize] = @tsize, [ttotalqty] = @ttotalqty WHERE [tid] = @tid">
                                            <DeleteParameters>
                                                <asp:Parameter Name="tid" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="tmaterialcode" Type="String" />
                                                <asp:Parameter Name="tsubcategory" Type="String" />
                                                <asp:Parameter Name="tlength" Type="String" />
                                                <asp:Parameter Name="twidth" Type="String" />
                                                <asp:Parameter Name="tspecifications" Type="String" />
                                                <asp:Parameter Name="tminimum" Type="Decimal" />
                                                <asp:Parameter Name="tcategory" Type="String" />
                                                <asp:Parameter Name="tmaterial" Type="String" />
                                                <asp:Parameter Name="theight" Type="String" />
                                                <asp:Parameter Name="tuom" Type="String" />
                                                <asp:Parameter Name="tsize" Type="String" />
                                                <asp:Parameter Name="ttotalqty" Type="Decimal" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="tmaterialcode" Type="String" />
                                                <asp:Parameter Name="tsubcategory" Type="String" />
                                                <asp:Parameter Name="tlength" Type="String" />
                                                <asp:Parameter Name="twidth" Type="String" />
                                                <asp:Parameter Name="tspecifications" Type="String" />
                                                <asp:Parameter Name="tminimum" Type="Decimal" />
                                                <asp:Parameter Name="tcategory" Type="String" />
                                                <asp:Parameter Name="tmaterial" Type="String" />
                                                <asp:Parameter Name="theight" Type="String" />
                                                <asp:Parameter Name="tuom" Type="String" />
                                                <asp:Parameter Name="tsize" Type="String" />
                                                <asp:Parameter Name="ttotalqty" Type="Decimal" />
                                                <asp:Parameter Name="tid" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("tuom") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="tsize" HeaderText="tsize" SortExpression="tsize" />
                                <asp:BoundField DataField="ttotalqty" HeaderText="ttotalqty" SortExpression="ttotalqty" />
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </section>
    </section>
</asp:Content>

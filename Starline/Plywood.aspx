<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="Plywood.aspx.cs" Inherits="Starline.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color: white; height: 1000px">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">PLYWOOD</h3>
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
                            <asp:TextBox ID="txtcategory" Style="width: 325px;" CssClass="form-control" PLACEHOLDER="Subcategory" BackColor="Transparent" required="Required" runat="server" />
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
                            <asp:TextBox ID="txtmaterial" Style="width: 325px;" CssClass="form-control" placeholder="Enter width" BackColor="Transparent" required="Required" runat="server" />

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
                            <asp:Label ID="Label6" Text="LENGTH" runat="server" />
                            <asp:TextBox ID="txtlength" AutoPostBack="true" Style="width: 325px;" placeholder="Enter specificatios" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="txtlength_TextChanged" />
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
                            <asp:Label ID="Label8" Text="WIDTH" runat="server" />
                            <asp:TextBox ID="txtwidth" Style="width: 325px;" placeholder="Enter width" AutoPostBack="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="txtwidth_TextChanged" />
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
                            <asp:Label ID="Label5" Text="HEIGHT/THICKNESS" runat="server" />
                            <asp:TextBox ID="txtheight" Style="width: 325px;" placeholder="Enter height" AutoPostBack="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="txtheight_TextChanged" />
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
                            <asp:TextBox ID="txttotalquantity" Style="width: 325px;" placeholder="Enter Minimum Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="txttotalquantity_TextChanged" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label14" Text="MINIMUM QUANTITY" runat="server" />
                            <asp:TextBox ID="txtminimumquantity" Style="width: 325px;" placeholder="Enter Minimum Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label15" Text="SQ.FT" runat="server" />
                            <asp:TextBox ID="txtsqft" Style="width: 325px;" placeholder="Enter Minimum Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label16" Text="SQ.MT" runat="server" />
                            <asp:TextBox ID="txtsqmt" Style="width: 325px;" placeholder="Enter Minimum Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-6" style="margin-left: 300px">
                        <div class="form-group">
                            <asp:Button ID="btn" Text="Submit" CssClass="btn btn-success col-sm-4" runat="server" OnClick="btn_Click" />
                        </div>
                        <center>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="sds">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>
                            </asp:GridView>
                    <asp:sqldatasource runat="server" ID="sds" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" DeleteCommand="DELETE FROM [mplywood] WHERE [pid] = @original_pid AND (([pmaterialcode] = @original_pmaterialcode) OR ([pmaterialcode] IS NULL AND @original_pmaterialcode IS NULL)) AND (([pcategory] = @original_pcategory) OR ([pcategory] IS NULL AND @original_pcategory IS NULL)) AND (([psubcategory] = @original_psubcategory) OR ([psubcategory] IS NULL AND @original_psubcategory IS NULL)) AND (([pmaterial] = @original_pmaterial) OR ([pmaterial] IS NULL AND @original_pmaterial IS NULL)) AND (([plength] = @original_plength) OR ([plength] IS NULL AND @original_plength IS NULL)) AND (([luom] = @original_luom) OR ([luom] IS NULL AND @original_luom IS NULL)) AND (([pheight] = @original_pheight) OR ([pheight] IS NULL AND @original_pheight IS NULL)) AND (([huom] = @original_huom) OR ([huom] IS NULL AND @original_huom IS NULL)) AND (([pwidth] = @original_pwidth) OR ([pwidth] IS NULL AND @original_pwidth IS NULL)) AND (([wuom] = @original_wuom) OR ([wuom] IS NULL AND @original_wuom IS NULL)) AND (([pspecifications] = @original_pspecifications) OR ([pspecifications] IS NULL AND @original_pspecifications IS NULL)) AND (([psize] = @original_psize) OR ([psize] IS NULL AND @original_psize IS NULL)) AND (([pminimum] = @original_pminimum) OR ([pminimum] IS NULL AND @original_pminimum IS NULL)) AND (([ptotalqty] = @original_ptotalqty) OR ([ptotalqty] IS NULL AND @original_ptotalqty IS NULL)) AND (([CFT] = @original_CFT) OR ([CFT] IS NULL AND @original_CFT IS NULL)) AND (([CUM] = @original_CUM) OR ([CUM] IS NULL AND @original_CUM IS NULL))" InsertCommand="INSERT INTO [mplywood] ([pmaterialcode], [pcategory], [psubcategory], [pmaterial], [plength], [luom], [pheight], [huom], [pwidth], [wuom], [pspecifications], [psize], [pminimum], [ptotalqty], [CFT], [CUM]) VALUES (@pmaterialcode, @pcategory, @psubcategory, @pmaterial, @plength, @luom, @pheight, @huom, @pwidth, @wuom, @pspecifications, @psize, @pminimum, @ptotalqty, @CFT, @CUM)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [mplywood]" UpdateCommand="UPDATE [mplywood] SET [pmaterialcode] = @pmaterialcode, [pcategory] = @pcategory, [psubcategory] = @psubcategory, [pmaterial] = @pmaterial, [plength] = @plength, [luom] = @luom, [pheight] = @pheight, [huom] = @huom, [pwidth] = @pwidth, [wuom] = @wuom, [pspecifications] = @pspecifications, [psize] = @psize, [pminimum] = @pminimum, [ptotalqty] = @ptotalqty, [CFT] = @CFT, [CUM] = @CUM WHERE [pid] = @original_pid AND (([pmaterialcode] = @original_pmaterialcode) OR ([pmaterialcode] IS NULL AND @original_pmaterialcode IS NULL)) AND (([pcategory] = @original_pcategory) OR ([pcategory] IS NULL AND @original_pcategory IS NULL)) AND (([psubcategory] = @original_psubcategory) OR ([psubcategory] IS NULL AND @original_psubcategory IS NULL)) AND (([pmaterial] = @original_pmaterial) OR ([pmaterial] IS NULL AND @original_pmaterial IS NULL)) AND (([plength] = @original_plength) OR ([plength] IS NULL AND @original_plength IS NULL)) AND (([luom] = @original_luom) OR ([luom] IS NULL AND @original_luom IS NULL)) AND (([pheight] = @original_pheight) OR ([pheight] IS NULL AND @original_pheight IS NULL)) AND (([huom] = @original_huom) OR ([huom] IS NULL AND @original_huom IS NULL)) AND (([pwidth] = @original_pwidth) OR ([pwidth] IS NULL AND @original_pwidth IS NULL)) AND (([wuom] = @original_wuom) OR ([wuom] IS NULL AND @original_wuom IS NULL)) AND (([pspecifications] = @original_pspecifications) OR ([pspecifications] IS NULL AND @original_pspecifications IS NULL)) AND (([psize] = @original_psize) OR ([psize] IS NULL AND @original_psize IS NULL)) AND (([pminimum] = @original_pminimum) OR ([pminimum] IS NULL AND @original_pminimum IS NULL)) AND (([ptotalqty] = @original_ptotalqty) OR ([ptotalqty] IS NULL AND @original_ptotalqty IS NULL)) AND (([CFT] = @original_CFT) OR ([CFT] IS NULL AND @original_CFT IS NULL)) AND (([CUM] = @original_CUM) OR ([CUM] IS NULL AND @original_CUM IS NULL))" >
                        <DeleteParameters>
                            <asp:Parameter Name="original_pid" Type="Int32" />
                            <asp:Parameter Name="original_pmaterialcode" Type="String" />
                            <asp:Parameter Name="original_pcategory" Type="String" />
                            <asp:Parameter Name="original_psubcategory" Type="String" />
                            <asp:Parameter Name="original_pmaterial" Type="String" />
                            <asp:Parameter Name="original_plength" Type="String" />
                            <asp:Parameter Name="original_luom" Type="String" />
                            <asp:Parameter Name="original_pheight" Type="String" />
                            <asp:Parameter Name="original_huom" Type="String" />
                            <asp:Parameter Name="original_pwidth" Type="String" />
                            <asp:Parameter Name="original_wuom" Type="String" />
                            <asp:Parameter Name="original_pspecifications" Type="String" />
                            <asp:Parameter Name="original_psize" Type="String" />
                            <asp:Parameter Name="original_pminimum" Type="Decimal" />
                            <asp:Parameter Name="original_ptotalqty" Type="Decimal" />
                            <asp:Parameter Name="original_CFT" Type="String" />
                            <asp:Parameter Name="original_CUM" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="pmaterialcode" Type="String" />
                            <asp:Parameter Name="pcategory" Type="String" />
                            <asp:Parameter Name="psubcategory" Type="String" />
                            <asp:Parameter Name="pmaterial" Type="String" />
                            <asp:Parameter Name="plength" Type="String" />
                            <asp:Parameter Name="luom" Type="String" />
                            <asp:Parameter Name="pheight" Type="String" />
                            <asp:Parameter Name="huom" Type="String" />
                            <asp:Parameter Name="pwidth" Type="String" />
                            <asp:Parameter Name="wuom" Type="String" />
                            <asp:Parameter Name="pspecifications" Type="String" />
                            <asp:Parameter Name="psize" Type="String" />
                            <asp:Parameter Name="pminimum" Type="Decimal" />
                            <asp:Parameter Name="ptotalqty" Type="Decimal" />
                            <asp:Parameter Name="CFT" Type="String" />
                            <asp:Parameter Name="CUM" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="pmaterialcode" Type="String" />
                            <asp:Parameter Name="pcategory" Type="String" />
                            <asp:Parameter Name="psubcategory" Type="String" />
                            <asp:Parameter Name="pmaterial" Type="String" />
                            <asp:Parameter Name="plength" Type="String" />
                            <asp:Parameter Name="luom" Type="String" />
                            <asp:Parameter Name="pheight" Type="String" />
                            <asp:Parameter Name="huom" Type="String" />
                            <asp:Parameter Name="pwidth" Type="String" />
                            <asp:Parameter Name="wuom" Type="String" />
                            <asp:Parameter Name="pspecifications" Type="String" />
                            <asp:Parameter Name="psize" Type="String" />
                            <asp:Parameter Name="pminimum" Type="Decimal" />
                            <asp:Parameter Name="ptotalqty" Type="Decimal" />
                            <asp:Parameter Name="CFT" Type="String" />
                            <asp:Parameter Name="CUM" Type="String" />
                            <asp:Parameter Name="original_pid" Type="Int32" />
                            <asp:Parameter Name="original_pmaterialcode" Type="String" />
                            <asp:Parameter Name="original_pcategory" Type="String" />
                            <asp:Parameter Name="original_psubcategory" Type="String" />
                            <asp:Parameter Name="original_pmaterial" Type="String" />
                            <asp:Parameter Name="original_plength" Type="String" />
                            <asp:Parameter Name="original_luom" Type="String" />
                            <asp:Parameter Name="original_pheight" Type="String" />
                            <asp:Parameter Name="original_huom" Type="String" />
                            <asp:Parameter Name="original_pwidth" Type="String" />
                            <asp:Parameter Name="original_wuom" Type="String" />
                            <asp:Parameter Name="original_pspecifications" Type="String" />
                            <asp:Parameter Name="original_psize" Type="String" />
                            <asp:Parameter Name="original_pminimum" Type="Decimal" />
                            <asp:Parameter Name="original_ptotalqty" Type="Decimal" />
                            <asp:Parameter Name="original_CFT" Type="String" />
                            <asp:Parameter Name="original_CUM" Type="String" />
                        </UpdateParameters>
                            </asp:SqlDataSource>
                </center>
            </div>
            <div>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
                    </div>
                </div>                
            <div>
            </div>
        </section>
    </section>
</asp:Content>

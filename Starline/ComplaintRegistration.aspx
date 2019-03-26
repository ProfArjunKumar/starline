<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="ComplaintRegistration.aspx.cs" Inherits="Starline.WebForm25" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white;height:1500px">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 15px; margin-top: -9px; font-size: 20px;">COMPLAINT REGISTER</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="COMPLAINT ID" runat="server" />
                            <asp:TextBox  ID="txtcomplaintid" Style="width: 325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" runat="server"/>
                          
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="DATE" runat="server" />
                            <asp:TextBox ID="txtDATE" Style="width: 325px;"  ReadOnly="true" CssClass="form-control" BackColor="Transparent" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="CUSTOMER ID" runat="server" />
                            <asp:DropDownList ID="txtddcustomerid" OnSelectedIndexChanged="txtddcustomerid_SelectedIndexChanged" AutoPostBack="true" Style="width: 325px;" AppendDataBoundItems="true" CssClass="form-control" BackColor="Transparent" runat="server">
                              
                            </asp:DropDownList>
                        </div>
                    </div>
                   <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="COMPANY NAME" runat="server" />
                            <asp:TextBox ID="txtcompanyname" Style="width: 325px;" ReadOnly="true" BackColor="Transparent" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="COMPANY DETAILS" runat="server" />
                            <asp:TextBox runat="server" ID="txtcompanydetails" Style="width: 325px;" placeholder="Enter Company Details" CssClass="form-control" required="Required" BackColor="Transparent" />
                            
                        </div>
                    </div>
                   
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="TYPE" runat="server" />
                            <asp:DropDownList ID="txtddtype" Style="width: 325px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                <asp:ListItem Text="--select--" />
                                <asp:ListItem Text="High Priority" />
                                 <asp:ListItem Text="Low Priority" />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label8" Text="ACTION TAKEN ON" runat="server" />
                            <asp:TextBox ID="txtactiontaken" Style="width: 325px;" placeholder="Enter action taken"  BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                       <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label5" Text="STATUS" runat="server" />
                            <asp:DropDownList ID="txtddlstatus" Style="width: 325px;" placeholder="Enter companydetails" CssClass="form-control" BackColor="Transparent" runat="server">
                                <asp:ListItem Text="--select--" />
                                <asp:ListItem Text="Hold" />
                                 <asp:ListItem Text="Processing" />
                                <asp:ListItem Text="Resolved" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6" style="margin-left: 300px">
                        <div class="form-group">
                            <asp:Button ID="btn" Text="Submit" CssClass="btn btn-success col-sm-4" OnClick="btn_Click" runat="server" />
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
                        <asp:GridView ID="Gridview1" runat="server" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="YellowGreen" RowStyle-BackColor="WhiteSmoke" HeaderStyle-Width="300px" HeaderStyle-Height="40px" RowStyle-Height="40px" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="Id">

                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" />
                                <asp:BoundField DataField="ComplaintId" HeaderText="ComplaintId" />
                                <asp:BoundField DataField="Date" HeaderText="Date" />
                                <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" />
                                <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" />
                                <asp:BoundField DataField="CompanyDetails" HeaderText="CompanyDetails" />
                                <asp:BoundField DataField="Type" HeaderText="Type" />
                                <asp:BoundField DataField="ActionTakenOn" HeaderText="ActionTakenOn" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
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

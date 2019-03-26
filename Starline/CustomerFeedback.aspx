<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="CustomerFeedback.aspx.cs" Inherits="Starline.WebForm16" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color: white;">
        <section class="wrapper" style="margin-right:200px;">
            <div class="container" style="width: 695px;">
                <div class="header" style="width: 680px;">
                    <h3 style="color: mediumslateblue; padding: 15px; margin-top: -9px; font-size: 20px;">CUSTOMER FEEDBACK</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -7px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="CUSTOMER ID" runat="server" />
                            <asp:DropDownList ID="txtcustomerid" Style="width: 325px;" AutoPostBack="true" OnSelectedIndexChanged="txtcustomerid_SelectedIndexChanged" CssClass="form-control" BackColor="Transparent" runat="server">
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="COMPANY NAME" runat="server" />
                            <asp:TextBox ID="txtcompanyname" Style="width: 325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="CONTACT NAME" runat="server" />
                            <asp:TextBox ID="txtcontactname" Style="width: 325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label5" Text="CONTACT NUMBER" runat="server" />
                            <asp:TextBox ID="txtcontactnumber" Style="width: 325px;" placeholder="Enter company name" CssClass="form-control" BackColor="Transparent" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="DESIGNATION" runat="server" />
                            <asp:TextBox runat="server" ID="txtdesignation" Style="width: 325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="REVIEWER NAME" runat="server" />
                            <asp:TextBox ID="txtreviewername" Style="width: 325px;" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="REVIEWER DATE" runat="server" />
                            <asp:TextBox ID="txtreviewerdate" Style="width: 325px;" ReadOnly="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>

                </div>
                <br />
                <div class="row" style="margin-left: -49px;">
                    <div class="col-sm-3">
                        <div class="form-group">
                            <h4>QUALITY</h4>
                            <br />
                            <asp:Label ID="Label8" Text="meeting  specification" runat="server" />
                            <asp:DropDownList ID="ddlmeeting" Style="width: 175px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                <asp:ListItem>--Give The Rating--</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="Label15" Text="Consistency in Quality" runat="server" />
                            <asp:DropDownList ID="ddlconsistency" Style="width: 175px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                <asp:ListItem>--Give The Rating--</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="Label16" Text="Identification & Traceablility" runat="server" />
                            <asp:DropDownList ID="ddlidentification" Style="width: 175px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                <asp:ListItem>--Give The Rating--</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="Label17" Text="Team Support & Communication" runat="server" />
                            <asp:DropDownList ID="ddlteamsupport" Style="width: 175px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                <asp:ListItem>--Give The Rating--</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <h4>DELIVERY</h4>
                            <br />
                            <asp:Label ID="Label9" Text="Timely Compeletion & Delivery" runat="server" />
                            <asp:DropDownList ID="ddltime" Style="width: 175px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                <asp:ListItem>--Give The Rating--</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="Label12" Text="Transport Arrangement" runat="server" />
                            <asp:DropDownList ID="ddltransporta" Style="width: 175px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                <asp:ListItem>--Give The Rating--</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="Label13" Text="Technical Support" runat="server" />
                            <asp:DropDownList ID="ddltechsupport" Style="width: 175px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                <asp:ListItem>--Give The Rating--</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="Label14" Text="Response To Urgent Requirement" runat="server" />
                            <asp:DropDownList ID="ddlresponse" Style="width: 175px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                <asp:ListItem>--Give The Rating--</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <h4>PRICE</h4>
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label10" Text="Value For Money" runat="server" />
                            <asp:DropDownList ID="ddlvalue" Style="width: 175px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                <asp:ListItem>--Give The Rating--</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <h4>SERVICE</h4>
                            <br />
                            <asp:Label ID="Label11" Text="Resolution of Your Complaints" runat="server" />
                            <asp:DropDownList ID="ddlresolution" Style="width: 175px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                <asp:ListItem>--Give The Rating--</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="Label18" Text="Response to Your Special Requirements" runat="server" />
                            <asp:DropDownList ID="ddlreponse" Style="width: 175px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                <asp:ListItem>--Give The Rating--</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="Label19" Text="Complaint Response Time" runat="server" />
                            <asp:DropDownList ID="ddlcomplaint" Style="width: 175px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                <asp:ListItem>--Give The Rating--</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="Label20" Text="Knowledge Of Our Design Engineer" runat="server" />
                            <asp:DropDownList ID="ddlknowledge" Style="width: 175px;" CssClass="form-control" BackColor="Transparent" runat="server">
                                <asp:ListItem>--Give The Rating--</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-6" style="margin-left: 250px">
                        <div class="form-group">
                            <asp:Button ID="btn" Text="Submit" OnClick="btn_Click" CssClass="btn btn-success col-sm-4" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
             <div class="container-fluid" style="margin-right:20px" >
                    <div class="row" style="width: 600px;">
                         <div class="col-sm-6" style="margin-left:617px;">
                        <div class="form-group">
                            <asp:Button ID="Button1" Text="ExporttoExcel" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" OnClick="Button1_Click" />
                        </div>
                    </div>
                        <asp:GridView ID="Gridview1" runat="server" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="YellowGreen" RowStyle-BackColor="WhiteSmoke" HeaderStyle-Width="50px" HeaderStyle-Height="40px" RowStyle-Height="40px" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="id">

                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" />
                                <asp:BoundField DataField="customerid" HeaderText="customerid" />
                                <asp:BoundField DataField="companyname" HeaderText="companyname" />
                                <asp:BoundField DataField="contactname" HeaderText="contactname" />
                                <asp:BoundField DataField="contactnumber" HeaderText="contactnumber" />
                                <asp:BoundField DataField="designation" HeaderText="designation" />
                                <asp:BoundField DataField="reviewername" HeaderText="reviewername" />
                                <asp:BoundField DataField="reviewerdate" HeaderText="reviewerdate" />
                                <asp:BoundField DataField="meetingSpecification" HeaderText="meetingSpecification" />
                                <asp:BoundField DataField="consistencyQuality" HeaderText="consistencyQuality" />
                                 <asp:BoundField DataField="identificationTraceability" HeaderText="identificationTraceability" />
                                 <asp:BoundField DataField="teamSupport" HeaderText="teamSupport" />
                                 <asp:BoundField DataField="timelyCompletion" HeaderText="timelyCompletion" />
                                 <asp:BoundField DataField="transportArrangment" HeaderText="transportArrangment" />
                                <asp:BoundField DataField="technicalSupport" HeaderText="technicalSupport" />
                                <asp:BoundField DataField="responseUrgent" HeaderText="responseUrgent" />
                                <asp:BoundField DataField="valueMoney" HeaderText="valueMoney" />
                                 <asp:BoundField DataField="resolutionComplaints" HeaderText="resolutionComplaints" />
                                 <asp:BoundField DataField="responseSpecial" HeaderText="responseSpecial" />
                                 <asp:BoundField DataField="complaintResponse" HeaderText="complaintResponse" />
                                <asp:BoundField DataField="knowledgeDesign" HeaderText="knowledgeDesign" />
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

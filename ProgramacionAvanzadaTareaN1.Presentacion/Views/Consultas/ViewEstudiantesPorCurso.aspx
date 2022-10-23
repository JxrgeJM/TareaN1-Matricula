<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewEstudiantesPorCurso.aspx.cs" Inherits="ProgramacionAvanzadaTareaN1.Presentacion.Views.Consultas.ViewEstudiantesPorCurso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Estudiantes Matriculados Por Curso</h3>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-10">
                <label class="mr-1">Cuatrimestre:</label>
                <asp:DropDownList ID="DropDownListPeriodo" runat="server" Width="100px" CssClass="form-control form-control-sm mr-2" >
                    <asp:ListItem Value="32022" Text="032022" Selected="True" />
                </asp:DropDownList>
                <label class="mr-1">Curso:</label>
                <asp:DropDownList ID="DropDownCurso" runat="server" Width="300px" DataValueField="Id" 
                    DataTextField="Nombre" CssClass="form-control form-control-sm mr-2" AutoPostBack="true" 
                    OnSelectedIndexChanged="DropDownCurso_SelectedIndexChanged" >
                </asp:DropDownList>
            </div>
        </div>
         <div class="row mt-2">
            <div class="col-md-12">
                <asp:GridView ID="GridViewMatriculados" CssClass="table"
                    runat="server" AllowPaging="True" PageSize="10" 
                    AutoGenerateColumns="False" ForeColor="#333333" 
                    GridLines="None" Width="100%" CellSpacing="1"  
                    DataKeyNames="Identificacion"
                    EmptyDataText="Sin estudiantes matriculados."
                    OnPageIndexChanging="GridViewMatriculados_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="Identificacion" HeaderText="Identificación" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Apellido1" HeaderText="1° Apellido" />
                        <asp:BoundField DataField="Apellido2" HeaderText="2° Apellido" />
                        <asp:BoundField DataField="FNacimiento" HeaderText="Nacimiento" DataFormatString="{0:d}"/>
                        <asp:BoundField DataField="FIngreso" HeaderText="Fecha Ingreso" DataFormatString="{0:d}"/>
                    </Columns>
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#0082C8" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E1E1E1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

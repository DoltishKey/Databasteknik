<!DOCTYPE html>
<html lang="sv">
    %include('head.tpl')
    <body>
        %include('nav.tpl')
        <div class="container-fluid ">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <h1>Kontaktperson</h1>
                    <ul class="nav nav-tabs nav-justified">
                         <li role="navigation" class="active"><a href="/security">Saknar kontaktperson</a></li>
                         <li role="navigation"><a href="/security_search">Scenschema kontaktperson</a></li>
                         <li role="navigation"><a href="#">Schema säkerhetsansvarig</a></li>
                    </ul>

                    <table class="table">
                        <tr>
                            <th>Band</th>
                            <th>Antal medlemmar</th>
                            <th>Ledig personal</th>

                        </tr>
                        %for band in bands:
                            <tr>
                                <td>{{band[1]}}</td>
                                <td>{{band[0]}}</td>
                                <td>
                                    <from>
                                        <select class="form-control" id="stil">
                                            <option>Kalle</option>
                                            <option>Nisse</option>
                                            <option>Pelle</option>
                                        </select>
                                    </form>
                                </td>
                                <td><button type="button" class="btn btn-success assign_security">Tilldela</button></td>
                            </tr>
                        %end
                    </table>
                </div>
            </div>
        </div>

        %include('footer.tpl')
    </body>
</html>

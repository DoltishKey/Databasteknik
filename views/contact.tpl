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
                         <li role="navigation" class="active"><a href="/contact">Saknar kontaktperson</a></li>
                         <li role="navigation"><a href="/contact_by_band">Kontaktpersoner för band</a></li>
                         <li role="navigation"><a href="#">Schema säkerhetsansvarig</a></li>
                    </ul>

                    <table class="table">
                        <tr>
                            <th>Band</th>
                            <th>Antal medlemmar</th>
                            <th>Personal / antal medlemmar</th>

                        </tr>
                        %for band in bands:
                            <tr>
                                <td>{{band[1]}}</td>
                                <td>{{band[0]}}</td>
                                <td>
                                    <form class="form-inline" action="/do_assign_contact/{{band[2]}}" method="post">
                                        <select class="form-control" id="stil" name="selected_candidate">
                                            %for candidate in candidates:
                                                <option value="{{candidate[0]}}">{{candidate[1]}} - ({{candidate[2]}})</option>
                                            %end
                                        </select>
                                        <button type="submit" class="btn btn-success assign_security">Tilldela</button>
                                    </form>
                                </td>
                            </tr>
                        %end
                    </table>
                </div>
            </div>
        </div>

        %include('footer.tpl')
    </body>
</html>

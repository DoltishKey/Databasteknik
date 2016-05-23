<!DOCTYPE html>
%from bottle import request
<html lang="sv">
    %include('head.tpl')
    <body>
        %include('nav.tpl')
        <div class="container-fluid ">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <h1>Kontaktperson</h1>
                    <ul class="nav nav-tabs nav-justified">
                         <li role="navigation"><a href="/contact">Saknar kontaktperson</a></li>
                         <li role="navigation" class="active"><a href="/contact_by_band">Kontaktpersoner för band</a></li>
                         <li role="navigation"><a href="/contact_staff">Kontaktpersoner</a></li>
                    </ul>
                    <div class="row">
                        <table class="table">
                            <tr>
                                <th>Band</th>
                                <th>Antal medlemmar</th>
                                <th>Kontaktperson</th>


                            </tr>
                            %for info in kontakt_info:
                                <tr>
                                    <td>{{info[3]}}</td>
                                    <td>{{info[4]}}</td>
                                    <td>{{info[0]}} <button type="button" class="btn btn-default get_security_info" data-container="body" data-toggle="popover" data-placement="right" data-html="true" data-content="Persnr: {{info[1]}}  <br />Tele: {{info[5]}}">Info</button></td>
                                    <td>
                                        <form class="form-inline change_staff_contact" form action="/update_contact/{{info[2]}}" method="post">
                                            <select class="form-control" name="new_contact">
                                                %for candidate in candidates:
                                                    %if int(candidate[0]) == int(info[1]):
                                                        <option value="{{candidate[0]}}" selected="selected">{{candidate[1]}} - ({{candidate[2]}})</option>
                                                    %else:
                                                        <option value="{{candidate[0]}}">{{candidate[1]}} - ({{candidate[2]}})</option>
                                                    %end
                                                %end
                                            </select>
                                            <button type="submit" class="btn btn-success save_contact">Spara</button>
                                        </form>
                                        <button type="button" class="btn btn-primary change_contact">Byt ansvarig</button>
                                    </td>
                                    <td>
                                        <form action="/remove_contact/{{info[2]}}" method="post">
                                            <button type="submit" class="btn btn-danger remove_contact">Ta bort ansvar</button>
                                        </form>
                                    </td>
                                </tr>
                            %end
                        </table>
                    </div>
                </div>
            </div>
        </div>
        %include('footer.tpl')
    </body>
</html>

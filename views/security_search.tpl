<!DOCTYPE html>
%from bottle import request
<html lang="sv">
    %include('head.tpl')
    <body>
        %include('nav.tpl')
        <div class="container-fluid ">
                <div class="col-md-8 col-md-offset-2">
                    <h1>Säkerhetsansvar</h1>
                    <ul class="nav nav-tabs nav-justified">
                         <li role="navigation"><a href="/security">Säkerhetsansvar fattas</a></li>
                         <li role="navigation" class="active"><a href="/security_search">Scenschema säkerhetsansvar</a></li>
                         <li role="navigation"><a href="/schedule_security">Schema säkerhetsansvarig</a></li>
                    </ul>
                    <div class="row">
                        <h4>Se säkhetsansvariga på:</h4>
                        <form>
                            <div class="form-group col-md-2">
                                <label class="checkbox">
                                    <input type="checkbox" id="inlineCheckbox1" value="option1"> Stora
                                </label>
                                <label class="checkbox">
                                    <input type="checkbox" id="inlineCheckbox2" value="option2"> Mellan
                                </label>
                                <label class="checkbox">
                                    <input type="checkbox" id="inlineCheckbox3" value="option3"> Lilla
                                </label>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="from_time">Från kl:</label>
                                <input type="text" class="form-control" id="from_time" placeholder="Från kl">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="to_time">Till kl:</label>
                                <input type="email" class="form-control" id="to_time" placeholder="Till kl">
                            </div>
                            <div class="form-group col-md-12">
                                <button type="submit" class="btn btn-primary">Se säkerhetsansvariga</button>
                            </div>
                        </form>
                    </div>
                    <div class="row">
                        <table class="table">
                            <tr>
                                <th>Scen</th>
                                <th>Dag</th>
                                <th>Startid</th>
                                <th>Slutid</th>
                                <th>Säkerhetsansvarig</th>
                                <th>Byt ansvarig till / erfarenhet</th>
                                <th></th>

                            </tr>
                            %from datetime import datetime, timedelta
                            %for staff in security:
                                <tr>
                                    <td>{{staff[2]}}</td>
                                    <td>{{staff[4].date()}}</td>
                                    <td>{{(staff[4].time()).hour}}:00</td>
                                    <td>{{(staff[4] + timedelta(hours = 4)).hour}}:00</td>
                                    <td>{{staff[0]}} <button type="button" class="btn btn-default get_security_info" data-container="body" data-toggle="popover" data-placement="right" data-html="true" data-content="Persnr: {{staff[1]}}">Info</button></td>
                                    <td>
                                        <form class="form-inline" action="/update_security/{{staff[3]}}" method="post">
                                            <input type="hidden" value="{{staff[4]}}" name="starttime">
                                            <select class="form-control from-inline" name="new_person">
                                                %members= []
                                                %for person in staff_members:
                                                    %if person[1] == staff[1] and person[4] == staff[4]:
                                                        %members.append(person[1])
                                                        <option value="{{person[1]}}" selected="selected">{{person[0]}}, {{person[5]}} år</option>
                                                    %elif person[4] == staff[4]:
                                                        %members.append(person[1])
                                                    %end
                                                %end
                                                %for person in staff_members:
                                                    %if person[1] not in members and person[4] != staff[4]:
                                                        %members.append(person[1])
                                                        <option value="{{person[1]}}">{{person[0]}}, {{person[5]}} år</option>
                                                    %end
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

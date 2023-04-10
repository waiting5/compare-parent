layui.use(['table','layer','form'],function () {
    const table = layui.table;
    const layer = layui.layer;
    const $ = layui.$;
    const fieldTable = table.render({
        elem: '#field-compare'
        ,height: 'full-20'
        ,toolbar: 'default'
        ,url: '/queryList' //数据接口
        ,page: true //开启分页
        ,cols: [[ //表头
            {type: 'checkbox', fixed: 'left'},
            {field: 'compareId', title: '比对ID', width:80, hide:true},
            {field: 'tableId', title: '比对表ID', width:80, hide:true},
            {field: 'interfaceId', title: '比对接口ID', width:80, hide:true}
            ,{field: 'tableName', title: '表名', width:120}
            ,{field: 'tableField', title: '表字段', width:120}
            ,{field: 'tableDesc', title: '表描述', width:200}
            ,{field: 'interfaceName', title: '接口名', width: 200}
            ,{field: 'interfaceDesc', title: '接口描述', width: 200}
            ,{field: 'interfaceField', title: '接口字段', width: 120}
            ,{field: 'fieldDesc', title: '字段描述', width: 200}
            ,{field: 'compareDetail', title: '对比详情', width: 200,hide: true}
        ]],
    })

    table.on('toolbar(compare)',function (obj) {
        const id = obj.config.id;
        const checkStatus = table.checkStatus(id);
        switch(obj.event){
            case 'add':
                layer.open({
                    type:1
                    ,title: '新增'
                    ,area:['500px','500px']
                    ,content:$("#openForm")
                    ,cancel: function(index){
                        layer.close(index)
                        return false;
                    }
                    ,success:function (){
                        form.val('compareForm', {})
                    }
                })
                break;
            case 'delete':
                layer.msg('删除');
                break;
            case 'update':
                console.info(checkStatus.data)
                layer.open({
                    type:1
                    ,title: '编辑'
                    ,area:['500px','500px']
                    ,content:$("#openForm")
                    ,cancel: function(index){
                        layer.close(index)
                        return false;
                    }
                    ,success:function (){
                        form.val('compareForm', checkStatus.data[0])
                    }
                })
                break;
        };
    })
    var form = layui.form;
    //提交
    form.on('submit(formDemo)', function(data){
        const request = data.field;
        // layer.msg(JSON.stringify(data.field));
        const compareId = request.compareId
        console.info(request)
        if(compareId == ''){
            request.compareId=0;
        }
        console.info(compareId)
        $.ajax({
            url:'/save',
            type:'POST',
            contentType:'application/json;charset=UTF-8',
            data:data.field,
            dataType: 'json',
            success:function (resp){
                console.log(resp)
            }
        })
        return false;
    });
})
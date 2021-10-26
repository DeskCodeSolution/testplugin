package com.testplugin.deskcode;

import android.util.Log;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "EchoPlugin")
public class EchoPluginPlugin extends Plugin {

    private EchoPlugin implementation = new EchoPlugin();

    @PluginMethod
    public void echo(PluginCall call) {
      Log.e("echo","PluginCall");
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        call.resolve(ret);
    }
}

package com.example.image_to_clipboard

import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.net.Uri
import androidx.core.content.FileProvider
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.File
    
class ImageToClipboardPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var context: Context
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        channel = MethodChannel(binding.binaryMessenger, "image_to_clipboard")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "copyImageToClipboard") {
            val path = call.argument<String>("path")
            if (path != null) {
                val copyResult = copyImageToClipboard(path)
                result.success(copyResult)
            } else {
                result.error("INVALID_PATH", "Image path is null or invalid", null)
            }
        } else {
            result.notImplemented()
        }
    }

    private fun copyImageToClipboard(path: String): String? {
        val file = File(path)
        val uri: Uri = FileProvider.getUriForFile(context, context.packageName + ".provider", file)
        val clipData = ClipData.newUri(context.contentResolver, "Image", uri)
        val clipboard = context.getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
        clipboard.setPrimaryClip(clipData)
        return "Image copied to clipboard"
    }
}

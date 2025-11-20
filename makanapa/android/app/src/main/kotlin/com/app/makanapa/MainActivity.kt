package com.app.makanapa

import android.content.Intent
import android.net.Uri
import android.provider.MediaStore
import androidx.core.content.FileProvider
import com.app.makanapa.ImageMediaHelper.createImageFile
import com.app.makanapa.ImageMediaHelper.imageUriToFile
import com.app.makanapa.ImageMediaHelper.processCameraFile
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.IOException

class MainActivity : FlutterActivity(){
    private val CHANNEL = "com.makanapa.app/image_channels"
    private val PICK_IMAGE_REQUEST = 1 // Request code for the Intent
    private val CAPTURE_IMAGE_REQUEST = 12346
    private var currentPhotoPath: String? = null
    // To hold the result callback for MethodChannel
    private var methodResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            // Store the result callback
            methodResult = result
            if (call.method == "openGallery") {
                openGalleryIntent()
            }else if (call.method == "openCamera") {
                openCameraIntent()
            } else {
                result.notImplemented()
            }
        }
    }

    private fun openGalleryIntent() {
        val intent = Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI)
        startActivityForResult(intent, PICK_IMAGE_REQUEST)
    }


    private fun openCameraIntent() {
        val takePictureIntent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)

        val photoFile: File? = try {
            createImageFile(context).apply {
                currentPhotoPath = absolutePath
            }
        } catch (ex: IOException) {
            null
        }

        // Continue only if the File was successfully created
        photoFile?.also {
            try{
                val photoURI: Uri = FileProvider.getUriForFile(
                    this,
                    "com.app.makanapa.fileprovider", // MUST match the authority in AndroidManifest.xml
                    it
                )
                // Save the file path so we can retrieve the image later
                currentPhotoPath = it.absolutePath
                takePictureIntent.putExtra(MediaStore.EXTRA_OUTPUT, photoURI)
                startActivityForResult(takePictureIntent, CAPTURE_IMAGE_REQUEST)
            }catch(e: Exception){
                methodResult?.error("NO_CAMERA_APP", "No application found to handle camera intent.", null)
            }
        }

        /*
        if (takePictureIntent.resolveActivity(packageManager) != null) {

        } else {
            // Camera app not found
            methodResult?.error("NO_CAMERA_APP", "No application found to handle camera intent.", null)
        }*/
    }

    // B. Handle the result of the gallery intent
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == PICK_IMAGE_REQUEST && resultCode == RESULT_OK) {
            data?.data?.let { uri ->
                imageUriToFile(
                    context = context,
                    uri = uri,
                )?.let { file ->
                    methodResult?.success(file.absolutePath)
                }
            } ?: methodResult?.error("PICK_ERROR", "Image URI is null", null)
        } else if (requestCode == PICK_IMAGE_REQUEST && resultCode == RESULT_CANCELED) {
            methodResult?.success(null) // User cancelled, return null to Flutter
        }else if (requestCode == CAPTURE_IMAGE_REQUEST) {
            if (resultCode == RESULT_OK) {
                // The camera app saved the image to the file path we provided
                processCameraFile(currentPhotoPath ?: "")?.let {file ->
                    methodResult?.success(file.absolutePath)
                }
            } else if (resultCode == RESULT_CANCELED) {
                methodResult?.success(null)
            }
        }
        // Reset the result callback
        // Clean up and reset
        currentPhotoPath = null
        methodResult = null
    }




}

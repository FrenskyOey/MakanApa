package com.app.makanapa

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Matrix
import android.media.ExifInterface
import android.net.Uri
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.io.InputStream
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

object ImageMediaHelper {
    fun imageUriToFile(context: Context, uri: Uri): File? {
        return uriToFile(context = context, uri = uri)
    }

    @Throws(IOException::class)
    fun createImageFile(context: Context): File {
        val timeStamp: String = SimpleDateFormat("yyyyMMdd_HHmmss").format(Date())
        val storageDir: File? = context.getExternalFilesDir(android.os.Environment.DIRECTORY_PICTURES)

        return File.createTempFile(
            "RAW_AVATAR_${timeStamp}_",
            ".jpg",
            storageDir
        )
    }

    private fun getExifMetadata(context: Context, uri: Uri): MutableMap<String, String> {
        val metadata = mutableMapOf<String, String>()

        val inputStream = context.contentResolver.openInputStream(uri)
            ?: return metadata // Return empty metadata if stream can't be opened

        val exif = ExifInterface(inputStream)

        val exifTags = arrayOf(
            ExifInterface.TAG_ORIENTATION,
        )

        for (tag in exifTags) {
            exif.getAttribute(tag)?.let { attribute ->
                metadata[tag] = attribute
            }
        }

        inputStream.close()
        return metadata
    }

    private fun correctImageOrientation(bitmap: Bitmap, orientation: Int): Bitmap {
        val matrix = Matrix()
        when (orientation) {
            ExifInterface.ORIENTATION_ROTATE_90 -> matrix.postRotate(90f)
            ExifInterface.ORIENTATION_ROTATE_180 -> matrix.postRotate(180f)
            ExifInterface.ORIENTATION_ROTATE_270 -> matrix.postRotate(270f)
            ExifInterface.ORIENTATION_TRANSVERSE -> matrix.postRotate(-90f)
            ExifInterface.ORIENTATION_TRANSPOSE -> matrix.postRotate(90f)
            ExifInterface.ORIENTATION_FLIP_VERTICAL -> matrix.postRotate(180f)
        }

        return Bitmap.createBitmap(bitmap, 0, 0, bitmap.width, bitmap.height, matrix, true)
    }

    private fun uriToFile(
        context: Context,
        uri: Uri
    ): File? {
        return try {
            val metadata = getExifMetadata(context, uri)
            val inputStream: InputStream = context.contentResolver.openInputStream(uri)
                ?: return null
            val locale = Locale.getDefault()
            val timeStamps = SimpleDateFormat("yyyyMMdd", locale).format(Date())
            val timeMillis = System.currentTimeMillis().toString()
            val rawFileName = "RAW_${timeStamps}_$timeMillis"
            val extension = ".jpeg"
            val tempFile = File(context.cacheDir, rawFileName + extension)
            FileOutputStream(tempFile).use { inputStream.copyTo(it) }
            return  processImage(tempFile, metadata)
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }

    fun processCameraFile(
        imagePath : String
    ): File? {
        return try {
            val metaData = mutableMapOf<String, String>()
            metaData[ExifInterface.TAG_ORIENTATION] = ExifInterface.ORIENTATION_NORMAL.toString()
            return processImage(File(imagePath), mutableMapOf<String, String>())
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }

    private fun processImage(photoFile: File, metadata: Map<String, String>): File {
        val rawBitmap = BitmapFactory.decodeFile(photoFile.absolutePath)
        val orientation = metadata[ExifInterface.TAG_ORIENTATION]?.toIntOrNull()
            ?: ExifInterface.ORIENTATION_NORMAL
        val correctedBitmap = correctImageOrientation(rawBitmap, orientation)
        val optimizedName = "OPT_${photoFile.nameWithoutExtension}.jpeg".replace("RAW_", "")
        val optimizedFile = File(photoFile.parent, optimizedName)
        saveBitmapToFile(optimizedFile, correctedBitmap)
        if (photoFile.exists()) photoFile.delete()
        return optimizedFile
    }

    private fun saveBitmapToFile(file: File, bitmap: Bitmap) {
        try {
            FileOutputStream(file).use { out ->
                bitmap.compress(Bitmap.CompressFormat.JPEG, 100, out)
            }
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }
}
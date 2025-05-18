package  com.gurwinderdevx.bagisto.mlkit.customviews

import com.google.mlkit.common.MlKitException
import com.gurwinderdevx.bagisto.mlkit.customviews.FrameMetadata
import com.gurwinderdevx.bagisto.mlkit.customviews.GraphicOverlay
import java.nio.ByteBuffer

/**
 * An interface to process the images with different vision detectors and custom image models.
 */
interface VisionImageProcessor {
    /**
     * Processes a bitmap image.
     */
    /*  fun processBitmap(bitmap: Bitmap?, graphicOverlay: GraphicOverlay)
  */
    /**
     * Processes ByteBuffer image data, e.g. used for Camera1 live preview case.
     */
    @Throws(MlKitException::class)
    fun processByteBuffer(
        data: ByteBuffer?, frameMetadata: FrameMetadata?, graphicOverlay: GraphicOverlay
    )

    /**
     * Stops the underlying machine learning model and release resources.
     */
    fun stop()
}
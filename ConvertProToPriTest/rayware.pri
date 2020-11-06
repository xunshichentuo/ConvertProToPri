QT += qml quick opengl serialport testlib xml websockets network
CONFIG += c++11
QT.testlib.CONFIG -= console

CONFIG += resources_big

#Application version
VERSION_MAJOR = 2
VERSION_MINOR = 6
VERSION_REVISION = 6
VERSION_BUILD = 1

DEFINES += "VERSION_MAJOR=$$VERSION_MAJOR"\
       "VERSION_MINOR=$$VERSION_MINOR"\
       "VERSION_REVISION=$$VERSION_REVISION"\
       "VERSION_BUILD=$$VERSION_BUILD"

DEFINES += QT_MESSAGELOGCONTEXT

QMAKE_INFO_PLIST = $$PWD/Moonray/MacDeployment/Info.plist

#Target version
VERSION = $${VERSION_MAJOR}.$${VERSION_MINOR}.$${VERSION_REVISION}.$${VERSION_BUILD}


HEADERS += \
    $$PWD/Moonray/Actions/AutoOrient/Components/DentalModel/DentalModel.h \
    $$PWD/Moonray/Actions/AutoOrient/Components/SurgicalGuide/SurgicalGuide.h \
    $$PWD/Moonray/Actions/AutoOrient/autoorient.h \
    $$PWD/Moonray/Actions/ExecutableRunner/executablerunner.h \
    $$PWD/Moonray/Actions/FeatureFlags/featureflags.h \
    $$PWD/Moonray/Actions/MeshModifier/Repair/mobiusstriprepair.h \
    $$PWD/Moonray/Actions/OpenWith/fileeventhandler.h \
    $$PWD/Moonray/Actions/ProcessManager/processmanager.h \
    $$PWD/Moonray/Actions/SaveAndLoadPlatform/SavePlatform/Components/meshcompressor.h \
    $$PWD/Moonray/Actions/SaveAndLoadPlatform/SavePlatform/platform.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/EncryptionLibrary/qaesencryption.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/EncryptionLibrary/sprfileencryption.h \
    $$PWD/Moonray/Actions/SupportGenerator/geomincludesheader.h \
    $$PWD/Moonray/Actions/UserStateController/usersettingsfileconstants.h \
    $$PWD/Moonray/Actions/UserStateController/userstatecontroller.h \
    $$PWD/Moonray/Resin/Components/ResinsList/materialdevelopmentresins.h \
    $$PWD/Moonray/Resin/Components/ResinsList/pro55resinlist.h \
    $$PWD/Moonray/Slicer/crushbitmap.h \
    $$PWD/Moonray/Slicer/genslices.h \
    $$PWD/Moonray/Slicer/geometricfunctions.h \
    $$PWD/Moonray/Slicer/loop.h \
    $$PWD/Moonray/Slicer/modelloader.h \
    $$PWD/Moonray/Slicer/segment.h \
    $$PWD/Moonray/Slicer/slice.h \
    $$PWD/Moonray/Slicer/slicecontext.h \
    $$PWD/Moonray/Slicer/slicerutils.h \
    $$PWD/Moonray/Slicer/slicerv2.h \
    $$PWD/Moonray/Slicer/sliceset.h \
    $$PWD/Moonray/Slicer/triangle3d.h \
    $$PWD/Moonray/Slicer/triangulate.h \
    $$PWD/Moonray/printjob.h \
    $$PWD/Moonray/Renderer/openglrenderer.h \
    $$PWD/Moonray/Renderer/openglcamera.h \
    $$PWD/Moonray/Renderer/renderercontainer.h \
    $$PWD/Moonray/Renderer/rendererqmlitem.h \
    $$PWD/Moonray/Renderer/qmlcameratransformation.h \
    $$PWD/Moonray/Renderer/qmlmodeltransformation.h \
    $$PWD/Moonray/Renderer/modelboundingbox.h \
    $$PWD/Moonray/Renderer/qmladdmodel.h \
    $$PWD/Moonray/Renderer/qmluitransformation.h \
    $$PWD/Moonray/Renderer/myconstants.h \
    $$PWD/Moonray/Renderer/qmlmouseclick.h \
    $$PWD/Moonray/Actions/RayCaster/BBox.h \
    $$PWD/Moonray/Actions/RayCaster/BVH.h \
    $$PWD/Moonray/Actions/RayCaster/IntersectionInfo.h \
    $$PWD/Moonray/Actions/RayCaster/Log.h \
    $$PWD/Moonray/Actions/RayCaster/Object.h \
    $$PWD/Moonray/Actions/RayCaster/raycastresult.h \
    $$PWD/Moonray/Actions/RayCaster/Sphere.h \
    $$PWD/Moonray/Actions/RayCaster/Stopwatch.h \
    $$PWD/Moonray/Actions/RayCaster/triangle.h \
    $$PWD/Moonray/Actions/RayCaster/Vector3.h \
    $$PWD/Moonray/Networking/clientdevice.h \
    $$PWD/Moonray/Networking/myglwidget.h \
    $$PWD/Moonray/Networking/server.h \
    $$PWD/Moonray/printingthread.h \
    $$PWD/Moonray/SoftwareUpdaters/softwareupdater.h \
    $$PWD/Moonray/SoftwareUpdaters/Mac/userupdaterpreferences.h \
    $$PWD/Moonray/basiclogging.h \
    $$PWD/Moonray/Actions/Gimbal/gimbal.h \
    $$PWD/Moonray/Actions/RayCaster/BvhRay.h \
    $$PWD/Moonray/Actions/Gimbal/Components/axis.h \
    $$PWD/Moonray/Actions/Gimbal/Components/gimbalaxes.h \
    $$PWD/Moonray/Actions/Gimbal/Math/rotationmath.h \
    $$PWD/Moonray/Actions/Gimbal/Math/boundingpointmath.h \
    $$PWD/Moonray/Actions/Gimbal/Components/InteractionManager/Components/fixedrotationstate.h \
    $$PWD/Moonray/Actions/Gimbal/Components/InteractionManager/Components/gimbalmodeltransformation.h \
    $$PWD/Moonray/Actions/Gimbal/Components/InteractionManager/Components/gimbalmousehandler.h \
    $$PWD/Moonray/Actions/Gimbal/Components/InteractionManager/interactionmanager.h \
    $$PWD/Moonray/Renderer/MeshRenderer/meshrenderer.h \
    $$PWD/Moonray/Renderer/MeshRenderer/meshrenderer_unittests.h \
    $$PWD/Moonray/Renderer/MeshRenderer/Components/OpenGLManager/openglmanager.h \
    $$PWD/Moonray/Renderer/MeshRenderer/Components/meshmaterial.h \
    $$PWD/Moonray/Renderer/MeshRenderer/Components/OpenGLManager/openglmanager_unittests.h \
    $$PWD/Moonray/Renderer/MeshRenderer/Components/OpenGLManager/Components/openglbuffersmanager.h \
    $$PWD/Moonray/Renderer/MeshRenderer/Components/OpenGLManager/Components/openglbuffersmanager_unittests.h \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/TextRendererManager/textrenderermanager.h \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/TextRendererManager/TextRenderers/fronttextrenderer.h \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/TextRendererManager/TextRenderers/hingetextrenderer.h \
    $$PWD/Moonray/Renderer/PlatformRendererManager/platformrenderermanager.h \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/platformrenderer.h \
    $$PWD/Moonray/Renderer/MeshRenderer/Components/cameraandshader.h \
    $$PWD/Moonray/Actions/MeshImporter/meshimporter_unittests.h \
    $$PWD/Moonray/Actions/MeshImporter/meshimporter.h \
    $$PWD/Moonray/Actions/MeshImporter/Importers/ObjImporter/objreader.h \
    $$PWD/Moonray/Actions/MeshImporter/Importers/StlImporter/stlreader.h \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/PlatformLinesManager/platformlinesmanager.h \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/PlatformLinesManager/platformlinerenderer.h \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/PlatformLinesManager/horizontalplatformlinerenderer.h \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/PlatformLinesManager/verticalplatformlinerenderer.h \
    $$PWD/Moonray/Actions/Gimbal/Components/gimbalaxisrenderer.h \
    $$PWD/Moonray/Renderer/MeshRenderer/renderingtestmanager.h \
    $$PWD/Moonray/Actions/RayCaster/raycaster.h \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/meshqueries.h \
    $$PWD/Moonray/Actions/MeshModifier/Components/boundingbox.h \
    $$PWD/Moonray/Actions/MeshModifier/meshqueries_unittests.h \
    $$PWD/Moonray/Actions/SelectBase/Components/selectbasearrowrenderer.h \
    $$PWD/Moonray/Actions/SelectBase/selectbasemanager.h \
    $$PWD/Moonray/Actions/SelectBase/Components/selectbasemousehandler.h \
    $$PWD/Moonray/Renderer/MeshRenderer/UserImportedMesh/Components/userimportedmesh.h \
    $$PWD/Moonray/Renderer/MeshRenderer/UserImportedMesh/userimportedmeshmanager.h \
    $$PWD/Moonray/Actions/MeshModifier/Components/transformation.h \
    $$PWD/Moonray/Renderer/MeshRenderer/UserImportedMesh/Components/Supports/userimportedmeshsupports.h \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/CollisionWallsManager/collisionwall.h \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/CollisionWallsManager/collisionwallsmanager.h \
    $$PWD/Moonray/Renderer/MeshRenderer/UserImportedMesh/Components/Supports/singleanchor.h \
    $$PWD/Moonray/Renderer/MeshRenderer/UserImportedMesh/Components/Supports/userimportedmeshsingleanchorsupports.h \
    $$PWD/Moonray/Actions/EditSupports/editsupportsmanager.h \
    $$PWD/Moonray/Actions/EditSupports/Components/addsupportrenderer.h \
    $$PWD/Moonray/Actions/OpenWith/winopenfilewitheventhandler.h \
    $$PWD/Moonray/Actions/OpenWith/sharedmemorylistener.h \
    $$PWD/Moonray/runguard.h \
    $$PWD/Moonray/Actions/OpenWith/sharedmemorywriter.h \
    $$PWD/Moonray/Actions/OpenWith/sharedmemoryliterals.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SupportSurfels.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/boundingbox.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SGParameters.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SupportSurfelConstructor.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Surfels.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Triangle.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/trianglesoup.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Array3D.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/CutStl.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/DLPMain.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/GeomInterface.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/LDNIPixels.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/stdafx.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Array2D.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/CommonDefine.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font_Build.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font_Geometry.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font_SVector.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font_Truetype.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font3d.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/LineSegmentSampler.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/matrix.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Pixels.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/PNGFileReader.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Point2D.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/STLSurfelConstructor.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SupportPixels.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SupportSurfels2PixelsIterator.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Surfel.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Surfels2PixelsIterator.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/TransMatrix.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/TriangleSampler.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Vector.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/vertex.h \
    $$PWD/Moonray/Actions/SupportGenerator/supportgenerator.h \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/MeshErrorDetection/Components/TopoMesh.h \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/MeshErrorDetection/Components/DetectProblem.h \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/MeshErrorDetection/mesherror.h \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/MeshErrorDetection/meshproperties.h \
    $$PWD/Moonray/Actions/MeshModifier/Repair/meshrepair.h \
    $$PWD/Moonray/applicationinfo.h \
    $$PWD/Moonray/Actions/MeshModifier/Repair/baseextrusion.h \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/DetectUpperLowerJaw.h \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/SupportDetection.h \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/supportanalysis.h \
    $$PWD/Moonray/Renderer/MeshRenderer/UserImportedMesh/Components/mousehandler.h \
    $$PWD/Moonray/Actions/MeshModifier/Math/meshmath.h \
    $$PWD/Moonray/Actions/MeshModifier/Math/overlaymath.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprWriter/sprwriter.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprFile/sprfile.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/sprunittester.h \
    $$PWD/Moonray/Actions/UnitTestingFramework/testrunner.h \
    $$PWD/Moonray/Actions/UnitTestingFramework/unittestrunner.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprWriter/Components/xmlwriter.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/sprfileconstants.h \
    $$PWD/Moonray/Actions/MeshExporter/meshexporter.h \
    $$PWD/Moonray/Actions/MeshExporter/Components/asciistlexporter.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprFile/Components/inputparsingfunctions.h \
    $$PWD/Moonray/Actions/MeshImporter/Importers/StlImporter/Components/stlfilereader.h \
    $$PWD/Moonray/Actions/MeshImporter/Importers/StlImporter/Components/stlstringreader.h \
    $$PWD/Moonray/Renderer/MeshRenderer/Components/meshstrings.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/ioapi.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/JlCompress.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/minizip_crypt.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quaadler32.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quachecksum32.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quacrc32.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quagzipfile.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quaziodevice.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quazip_global.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quazip.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quazipdir.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quazipfile.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quazipfileinfo.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quazipnewinfo.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/unzip.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/zip.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/sprcompressor.h \
    $$PWD/Moonray/Actions/MeshExporter/Components/objexporter.h \
    $$PWD/Moonray/Actions/SaveAndLoadPlatform/LoadPlatform/loadplatform.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprFile/Components/metadatareader.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprFile/Components/imagefilereader.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprWriter/Components/metadatawriter.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprWriter/Components/imagefilewriter.h \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprFile/Components/modelfilereader.h \
    $$PWD/Moonray/Actions/SaveAndLoadPlatform/SavePlatform/saveplatform.h \
    $$PWD/Moonray/Actions/RayWare-login-module/Rayware/Components/lease.h \
    $$PWD/Moonray/Actions/RayWare-login-module/Rayware/raywaredashboardcontroller.h \
    $$PWD/Moonray/Actions/RayWare-login-module/Printer/Components/printmanager.h \
    $$PWD/Moonray/Actions/RayWare-login-module/Printer/Components/printerdashboardcontroller.h \
    $$PWD/Moonray/Actions/RayWare-login-module/Printer/Components/imageuploader.h \
    $$PWD/Moonray/Actions/RayWare-login-module/Printer/Pro/prodashboardcontroller.h \
    $$PWD/Moonray/Actions/RayWare-login-module/Components/config.h \
    $$PWD/Moonray/Actions/RayWare-login-module/Components/dashboardcontroller.h \
    $$PWD/Moonray/Actions/RayWare-login-module/Components/jsonhelper.h \
    $$PWD/Moonray/Actions/RayWare-login-module/Components/LoginManager.h \
    $$PWD/Moonray/Actions/RayWare-login-module/Components/replytimeout.h \
    $$PWD/Moonray/Actions/RayWare-login-module/Components/Subscription/displayedsubscriptionkeywords.h \
    $$PWD/Moonray/Actions/RayWare-login-module/Components/Subscription/subscription.h \
    $$PWD/Moonray/Resin/Components/ResinsList/moonrayresinslist.h \
    $$PWD/Moonray/Resin/Components/OldVersionCompatibility/resinversionconverter.h \
    $$PWD/Moonray/Resin/Components/OldVersionCompatibility/resinidqueries.h \
    $$PWD/Moonray/Resin/Components/resinutilityfunctions.h \
    $$PWD/Moonray/Resin/resin.h \
#    $$PWD/Moonray/Resin/Tests/resintests.h \
    $$PWD/Moonray/Resin/Components/ResinsList/proresinslist.h \
    $$PWD/Moonray/FactoryProjectionSettings/Components/LinearInterpolation.h \
    $$PWD/Moonray/FactoryProjectionSettings/Grayscale/GrayscaleData.h \
    $$PWD/Moonray/FactoryProjectionSettings/Grayscale/GrayScale.h \
    $$PWD/Moonray/FactoryProjectionSettings/OcularCorrection/OcularCorrectionData.h \
    $$PWD/Moonray/Renderer/MeshRenderer/UserImportedMesh/Components/meshcalculationthread.h \
    $$PWD/Moonray/Actions/PlaneCut/planecutmanager.h \
    $$PWD/Moonray/Actions/PlaneCut/Components/planecutrenderer.h \
    $$PWD/Moonray/Actions/PlaneCut/planecutter.h \
    $$PWD/Moonray/SlicesMetaData/slicesmetadata.h \
    $$PWD/Moonray/SlicesMetaData/Tests/slicesmetadatatests.h \
    $$PWD/Moonray/Actions/PrintTimeCalculator/printtimeandvolumecalculator.h \
    $$PWD/Moonray/Renderer/PrinterPlatform/printerplatform.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/trianglesoup_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/boundingbox_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Triangle_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Surfels_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SupportSurfels_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SupportSurfelConstructor_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/STLPixels_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SGParameters_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/GeomInterface_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/DLPMain_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/vertex_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/stdafx_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/matrix_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Vector_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/TriangleSampler_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/TransMatrix_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Surfels2PixelsIterator_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Surfel_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SupportSurfels2PixelsIterator_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SupportPixels_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/STLSurfelConstructor_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Resource_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Pixels_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/PNGFileReader_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/LineSegmentSampler_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/LDNIPixels_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/CutStl_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/CommonDefine_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Array3D_old.h \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Array2D_old.h \
    $$PWD/Moonray/Actions/ActionTimer/actiontimer.h \
    $$PWD/Moonray/Actions/SupportGenerator/supportsettingscontroller.h \
    $$PWD/Moonray/Actions/ProgressBar/progressbarmanager.h \
    $$PWD/Moonray/Actions/ProgressBar/progressbarpercents.h \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/RawScan.h	\
    $$PWD/Moonray/Actions/MeshModifier/Analysis/DentalModel.h \
    $$PWD/Moonray/Networking/Components/sshcmdthread.h \
    $$PWD/Moonray/Translate.h \
    $$PWD/Moonray/stringconstants.h \
    $$PWD/Moonray/global.h

SOURCES += \
    $$PWD/Moonray/main.cpp \
    $$PWD/Moonray/Actions/AutoOrient/Components/DentalModel/DentalModel.cpp \
    $$PWD/Moonray/Actions/AutoOrient/Components/SurgicalGuide/SurgicalGuide.cpp \
    $$PWD/Moonray/Actions/AutoOrient/autoorient.cpp \
    $$PWD/Moonray/Actions/ExecutableRunner/executablerunner.cpp \
    $$PWD/Moonray/Actions/FeatureFlags/featureflags.cpp \
    $$PWD/Moonray/Actions/MeshModifier/Repair/mobiusstriprepair.cpp \
    $$PWD/Moonray/Actions/OpenWith/fileeventhandler.cpp \
    $$PWD/Moonray/Actions/ProcessManager/processmanager.cpp \
    $$PWD/Moonray/Actions/SaveAndLoadPlatform/SavePlatform/Components/meshcompressor.cpp \
    $$PWD/Moonray/Actions/SaveAndLoadPlatform/SavePlatform/saveplatform.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/EncryptionLibrary/qaesencryption.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/EncryptionLibrary/sprfileencryption.cpp \
    $$PWD/Moonray/Actions/UserStateController/userstatecontroller.cpp \
    $$PWD/Moonray/Resin/Components/ResinsList/materialdevelopmentresins.cpp \
    $$PWD/Moonray/Resin/Components/ResinsList/pro55resinlist.cpp \
    $$PWD/Moonray/Slicer/slicerutils.cpp \
    $$PWD/Moonray/Slicer/slicerv2.cpp \
    $$PWD/Moonray/imageprovider.cpp \
    $$PWD/Moonray/Slicer/crushbitmap.cpp \
    $$PWD/Moonray/Slicer/genslices.cpp \
    $$PWD/Moonray/Slicer/geometricfunctions.cpp \
    $$PWD/Moonray/Slicer/loop.cpp \
    $$PWD/Moonray/Slicer/modelloader.cpp \
    $$PWD/Moonray/Slicer/segment.cpp \
    $$PWD/Moonray/Slicer/slice.cpp \
    $$PWD/Moonray/Slicer/slicecontext.cpp \
    $$PWD/Moonray/Slicer/sliceset.cpp \
    $$PWD/Moonray/Slicer/triangle3d.cpp \
    $$PWD/Moonray/Slicer/triangulate.cpp \
    $$PWD/Moonray/printjob.cpp \
    $$PWD/Moonray/Renderer/openglcamera.cpp \
    $$PWD/Moonray/Renderer/openglrenderer.cpp \
    $$PWD/Moonray/Renderer/renderercontainer.cpp \
    $$PWD/Moonray/Renderer/rendererqmlitem.cpp \
    $$PWD/Moonray/Renderer/qmlcameratransformation.cpp \
    $$PWD/Moonray/Renderer/qmlmodeltransformation.cpp \
    $$PWD/Moonray/Renderer/modelboundingbox.cpp \
    $$PWD/Moonray/Renderer/qmladdmodel.cpp \
    $$PWD/Moonray/Renderer/qmluitransformation.cpp \
    $$PWD/Moonray/Renderer/qmlmouseclick.cpp \
    $$PWD/Moonray/Actions/RayCaster/BBox.cpp \
    $$PWD/Moonray/Actions/RayCaster/BVH.cpp \
    $$PWD/Moonray/Networking/clientdevice.cpp \
    $$PWD/Moonray/Networking/myglwidget.cpp \
    $$PWD/Moonray/Networking/server.cpp \
    $$PWD/Moonray/printingthread.cpp \
    $$PWD/Moonray/SoftwareUpdaters/softwareupdater.cpp \
    $$PWD/Moonray/SoftwareUpdaters/Mac/userupdaterpreferences.cpp \
    $$PWD/Moonray/basiclogging.cpp \
    $$PWD/Moonray/Actions/Gimbal/gimbal.cpp \
    $$PWD/Moonray/Actions/Gimbal/Math/rotationmath.cpp \
    $$PWD/Moonray/Actions/Gimbal/Math/boundingpointmath.cpp \
    $$PWD/Moonray/Actions/Gimbal/Components/gimbalaxes.cpp \
    $$PWD/Moonray/Actions/Gimbal/Components/InteractionManager/Components/fixedrotationstate.cpp \
    $$PWD/Moonray/Actions/Gimbal/Components/InteractionManager/Components/gimbalmousehandler.cpp \
    $$PWD/Moonray/Actions/Gimbal/Components/InteractionManager/interactionmanager.cpp \
    $$PWD/Moonray/Renderer/MeshRenderer/meshrenderer.cpp \
    $$PWD/Moonray/Renderer/MeshRenderer/meshrenderer_unittests.cpp \
    $$PWD/Moonray/Renderer/MeshRenderer/Components/OpenGLManager/openglmanager.cpp \
    $$PWD/Moonray/Renderer/MeshRenderer/Components/OpenGLManager/openglmanager_unittests.cpp \
    $$PWD/Moonray/Renderer/MeshRenderer/Components/OpenGLManager/Components/openglbuffersmanager.cpp \
    $$PWD/Moonray/Renderer/MeshRenderer/Components/OpenGLManager/Components/openglbuffersmanager_unittests.cpp \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/TextRendererManager/textrenderermanager.cpp \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/TextRendererManager/TextRenderers/fronttextrenderer.cpp \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/TextRendererManager/TextRenderers/hingetextrenderer.cpp \
    $$PWD/Moonray/Renderer/PlatformRendererManager/platformrenderermanager.cpp \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/platformrenderer.cpp \
    $$PWD/Moonray/Actions/MeshImporter/meshimporter_unittests.cpp \
    $$PWD/Moonray/Actions/MeshImporter/meshimporter.cpp \
    $$PWD/Moonray/Actions/MeshImporter/Importers/ObjImporter/objreader.cpp \
    $$PWD/Moonray/Actions/MeshImporter/Importers/StlImporter/stlreader.cpp \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/PlatformLinesManager/platformlinesmanager.cpp \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/PlatformLinesManager/platformlinerenderer.cpp \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/PlatformLinesManager/horizontalplatformlinerenderer.cpp \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/PlatformLinesManager/verticalplatformlinerenderer.cpp \
    $$PWD/Moonray/Actions/Gimbal/Components/gimbalaxisrenderer.cpp \
    $$PWD/Moonray/Renderer/MeshRenderer/renderingtestmanager.cpp \
    $$PWD/Moonray/Actions/RayCaster/raycaster.cpp \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/meshqueries.cpp \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/meshqueries_unittests.cpp \
    $$PWD/Moonray/Actions/SelectBase/Components/selectbasearrowrenderer.cpp \
    $$PWD/Moonray/Actions/SelectBase/selectbasemanager.cpp \
    $$PWD/Moonray/Actions/SelectBase/Components/selectbasemousehandler.cpp \
    $$PWD/Moonray/Renderer/MeshRenderer/UserImportedMesh/Components/userimportedmesh.cpp \
    $$PWD/Moonray/Renderer/MeshRenderer/UserImportedMesh/userimportedmeshmanager.cpp \
    $$PWD/Moonray/Renderer/MeshRenderer/UserImportedMesh/Components/Supports/userimportedmeshsupports.cpp \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/CollisionWallsManager/collisionwall.cpp \
    $$PWD/Moonray/Renderer/PlatformRendererManager/Components/CollisionWallsManager/collisionwallsmanager.cpp \
    $$PWD/Moonray/Renderer/MeshRenderer/UserImportedMesh/Components/Supports/userimportedmeshsingleanchorsupports.cpp \
    $$PWD/Moonray/Actions/EditSupports/editsupportsmanager.cpp \
    $$PWD/Moonray/Actions/EditSupports/Components/addsupportrenderer.cpp \
    $$PWD/Moonray/Actions/OpenWith/winopenfilewitheventhandler.cpp \
    $$PWD/Moonray/Actions/OpenWith/sharedmemorylistener.cpp \
    $$PWD/Moonray/runguard.cpp \
    $$PWD/Moonray/Actions/OpenWith/sharedmemorywriter.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SupportSurfelConstructor.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SGParameters.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/BoundingBox.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Matrix.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/STLSurfelConstructor.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SupportSurfels.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Surfels.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Triangle.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/TriangleSoup.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Vector.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Array3D.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/CutStl.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/DLPMain.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/LDNIPixels.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/TransMatrix.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Array2D.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font_Build.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font_Geometry.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font_Truetype.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font3d.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/LineSegmentSampler.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Pixels.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Point2D.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/stdafx.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SupportPixels.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SupportSurfels2PixelsIterator.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Surfels2PixelsIterator.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/TriangleSampler.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Vertex.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/STLPixels.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/supportgenerator.cpp \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/MeshErrorDetection/mesherror.cpp \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/MeshErrorDetection/Components/DetectProblem.cpp \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/MeshErrorDetection/Components/TopoMesh.cpp \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/MeshErrorDetection/Components/sample.cpp \
    $$PWD/Moonray/Actions/MeshModifier/Repair/meshrepair.cpp \
    $$PWD/Moonray/Actions/MeshModifier/Repair/baseextrusion.cpp \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/SupportDetection.cpp \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/supportanalysis.cpp \
    $$PWD/Moonray/Renderer/MeshRenderer/UserImportedMesh/Components/mousehandler.cpp \
    $$PWD/Moonray/Actions/MeshModifier/Math/meshmath.cpp \
    $$PWD/Moonray/Actions/MeshModifier/Math/overlaymath.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprWriter/sprwriter.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprFile/sprfile.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/sprunittester.cpp \
    $$PWD/Moonray/Actions/UnitTestingFramework/unittestrunner.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprWriter/Components/xmlwriter.cpp \
    $$PWD/Moonray/Actions/MeshExporter/meshexporter.cpp \
    $$PWD/Moonray/Actions/MeshExporter/Components/asciistlexporter.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprFile/Components/inputparsingfunctions.cpp \
    $$PWD/Moonray/Actions/MeshImporter/Importers/StlImporter/Components/stlfilereader.cpp \
    $$PWD/Moonray/Actions/MeshImporter/Importers/StlImporter/Components/stlstringreader.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/JlCompress.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/qioapi.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quaadler32.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quacrc32.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quagzipfile.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quaziodevice.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quazip.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quazipdir.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quazipfile.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quazipfileinfo.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quazipnewinfo.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/unzip.c \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/zip.c \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/sprcompressor.cpp \
    $$PWD/Moonray/Actions/MeshExporter/Components/objexporter.cpp \
    $$PWD/Moonray/Actions/SaveAndLoadPlatform/LoadPlatform/loadplatform.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprFile/Components/metadatareader.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprFile/Components/imagefilereader.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprWriter/Components/metadatawriter.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprWriter/Components/imagefilewriter.cpp \
    $$PWD/Moonray/Actions/SprFileReaderAndWriter/SprFile/Components/modelfilereader.cpp \
    $$PWD/Moonray/Actions/RayWare-login-module/Rayware/Components/lease.cpp \
    $$PWD/Moonray/Actions/RayWare-login-module/Rayware/raywaredashboardcontroller.cpp \
    $$PWD/Moonray/Actions/RayWare-login-module/Printer/Components/imageuploader.cpp \
    $$PWD/Moonray/Actions/RayWare-login-module/Printer/Components/printmanager.cpp \
    $$PWD/Moonray/Actions/RayWare-login-module/Printer/Components/printerdashboardcontroller.cpp \
    $$PWD/Moonray/Actions/RayWare-login-module/Printer/Pro/prodashboardcontroller.cpp \
    $$PWD/Moonray/Actions/RayWare-login-module/Components/dashboardcontroller.cpp \
    $$PWD/Moonray/Actions/RayWare-login-module/Components/jsonhelper.cpp \
    $$PWD/Moonray/Actions/RayWare-login-module/Components/LoginManager.cpp \
    $$PWD/Moonray/Actions/RayWare-login-module/Components/replytimeout.cpp \
    $$PWD/Moonray/Actions/RayWare-login-module/Components/Subscription/displayedsubscriptionkeywords.cpp \
    $$PWD/Moonray/Actions/RayWare-login-module/Components/Subscription/subscription.cpp \
    $$PWD/Moonray/Resin/Components/ResinsList/moonrayresinslist.cpp \
    $$PWD/Moonray/Resin/Components/OldVersionCompatibility/resinversionconverter.cpp \
    $$PWD/Moonray/Resin/Components/OldVersionCompatibility/resinidqueries.cpp \
    $$PWD/Moonray/Resin/Components/resinutilityfunctions.cpp \
    $$PWD/Moonray/Resin/resin.cpp \
#    $$PWD/Moonray/Resin/Tests/resintests.cpp \
    $$PWD/Moonray/Resin/Components/ResinsList/proresinslist.cpp \
    $$PWD/Moonray/FactoryProjectionSettings/Components/LinearInterpolation.cpp \
    $$PWD/Moonray/FactoryProjectionSettings/Grayscale/GrayscaleData.cpp \
    $$PWD/Moonray/FactoryProjectionSettings/Grayscale/GrayScale.cpp \
    $$PWD/Moonray/FactoryProjectionSettings/OcularCorrection/OcularCorrectionData.cpp \
    $$PWD/Moonray/Renderer/MeshRenderer/UserImportedMesh/Components/meshcalculationthread.cpp \
    $$PWD/Moonray/Actions/PlaneCut/planecutmanager.cpp \
    $$PWD/Moonray/Actions/PlaneCut/Components/planecutrenderer.cpp \
    $$PWD/Moonray/Actions/PlaneCut/planecutter.cpp \
    $$PWD/Moonray/SlicesMetaData/slicesmetadata.cpp \
    $$PWD/Moonray/SlicesMetaData/Tests/slicesmetadatatests.cpp \
    $$PWD/Moonray/Actions/PrintTimeCalculator/printtimeandvolumecalculator.cpp \
    $$PWD/Moonray/Renderer/PrinterPlatform/printerplatform.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Vector_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/TriangleSoup_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Triangle_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Surfels_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SupportSurfels_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SupportSurfelConstructor_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/STLSurfelConstructor_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/STLPixels_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SGParameters_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Matrix_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/LDNIPixels_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/DLPMain_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/BoundingBox_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/stdafx_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Vertex_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/TriangleSampler_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/TransMatrix_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Surfels2PixelsIterator_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SupportSurfels2PixelsIterator_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SupportPixels_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Pixels_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/LineSegmentSampler_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/CutStl_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Array3D_old.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Array2D_old.cpp \
    $$PWD/Moonray/Actions/ActionTimer/actiontimer.cpp \
    $$PWD/Moonray/Actions/SupportGenerator/supportsettingscontroller.cpp \
    $$PWD/Moonray/Actions/ProgressBar/progressbarmanager.cpp \
    $$PWD/Moonray/Actions/MeshModifier/Analysis/RawScan.cpp \
    $$PWD/Moonray/Networking/Components/sshcmdthread.cpp      \
    $$PWD/Moonray/Translate.cpp \
    $$PWD/Moonray/global.cpp

macx {


HEADERS += Networking/MacSSH/macsshclient.h \
                Actions/OpenWith/openfilewitheventhandler.h \
                SoftwareUpdaters/Mac/AutoUpdater.h \
                SoftwareUpdaters/Mac/CocoaInitializer.h \
                SoftwareUpdaters/Mac/SparkleAutoUpdater.h

SOURCES +=   Networking/MacSSH/macsshclient.cpp \
                Actions/OpenWith/openfilewitheventhandler.cpp \
                SoftwareUpdaters/Mac/AutoUpdater.cpp \
                SoftwareUpdaters/Mac/CocoaInitializer.mm \
                SoftwareUpdaters/Mac/SparkleAutoUpdater.mm


    LIBS += $$PWD/Moonray/Frameworks/libz.1.dylib
    LIBS += $$PWD/Moonray/Networking/libssh.4.4.2.dylib
    LIBS += -F$$PWD/Moonray/Updaters/Sparkle/ -framework Sparkle
    LIBS += -framework AppKit
    ICON = logo_icon.icns
    #QMAKE_INFO_PLIST = $$PWD/Moonray/Info.plist

    CHI_SLICER_DEPENDENCIES.files = $$PWD/Moonray/Slicer/ExternalExecutables/Mac/Frameworks/libomp.dylib
    CHI_SLICER_DEPENDENCIES.path = Contents/Frameworks
    QMAKE_BUNDLE_DATA += CHI_SLICER_DEPENDENCIES

    CHI_SLICER_EXECUTABLE.files = $$PWD/Moonray/Slicer/ExternalExecutables/Mac/DLPSlicerSingleMac
    CHI_SLICER_EXECUTABLE.path = Contents/MacOS
    QMAKE_BUNDLE_DATA += CHI_SLICER_EXECUTABLE

    PRINTOS_UPDATE_DEPENDENCIES.files = $$PWD/Moonray/ExternalExecutables/PrintOS/MoonrayUI
    PRINTOS_UPDATE_DEPENDENCIES.path = Contents/MacOS
    QMAKE_BUNDLE_DATA += PRINTOS_UPDATE_DEPENDENCIES

    PRINTOS_RLEASE_NOTES_DEPENDENCIES.files = $$PWD/Moonray/ExternalExecutables/PrintOS/MoonrayUIMessage
    PRINTOS_RLEASE_NOTES_DEPENDENCIES.path = Contents/MacOS
    QMAKE_BUNDLE_DATA += PRINTOS_RLEASE_NOTES_DEPENDENCIES
}


#TARGET = RayWare


win32 {
    HEADERS +=  $$PWD/Moonray/Networking/WinSSH/libsshwin64wrapper.h \
                $$PWD/Moonray/Networking/WinSSH/winsshclient.h \
                $$PWD/Moonray/SoftwareUpdaters/Windows/winautoupdater.h \
                $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/zconf.h \
                $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/zlib.h

    SOURCES +=  $$PWD/Moonray/Networking/WinSSH/winsshclient.cpp \
                $$PWD/Moonray/Networking/WinSSH/libsshwin64wrapper.cpp \
                $$PWD/Moonray/SoftwareUpdaters/Windows/winautoupdater.cpp

    LIBS += -lopengl32
    LIBS += -L$$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/zlib -lzlib
    RC_ICONS += $$PWD/Moonray/logo_icon.ico
    LIBS += -L$$PWD/Moonray/Updaters/WinSparkle -lWinSparkle
    DEFINES += QUAZIP_STATIC
    DEFINES += WIN32_LEAN_AND_MEAN

    LIBS += -lDbgHelp
    QMAKE_LFLAGS_RELEASE = /INCREMENTAL:NO /DEBUG
}


INCLUDEPATH += $$PWD/Moonray/glm
INCLUDEPATH += $$PWD/Moonray/

DISTFILES += \
    $$PWD/Moonray/Actions/SupportGenerator/Components/SupportGenerationNew/Geom/arial.ttf \
    $$PWD/Moonray/Icons/SprintRayLogo.png \
    $$PWD/Moonray/squirclevertexshader.vert \
    $$PWD/Moonray/squirclefragment.frag \
    $$PWD/Moonray/pvmshader.vert \
    $$PWD/Moonray/basicfragshader.frag \
    $$PWD/Moonray/sprintray_icon.icns \
    $$PWD/Moonray/Geom/Geom.pri \
    $$PWD/Moonray/logo_highres.png \
    $$PWD/Moonray/phong.frag \
    $$PWD/Moonray/phong.vert \
    $$PWD/Moonray/Renderer/phong.frag \
    $$PWD/Moonray/Renderer/phong.vert \
    $$PWD/Moonray/Icons/MaterialIcons-Regular.ttf \
    $$PWD/Moonray/Icons/moonrayd.svg \
    $$PWD/Moonray/Icons/moonrays.svg \
    $$PWD/Moonray/Icons/pro.svg \
    $$PWD/Moonray/Icons/moonrayd-white.svg \
    $$PWD/Moonray/Icons/moonrays-white.svg \
    $$PWD/Moonray/Icons/pro-white.svg \
    $$PWD/Moonray/PlaneCut-Pro95Platform.stl

INCLUDEPATH += $$PWD/Moonray/libssh/libssh
DEPENDPATH += $$PWD/Moonray/libssh/libssh

INCLUDEPATH += $$PWD/Moonray/Updaters/Sparkle/Sparkle.framework/Versions/A/Headers
DEPENDPATH += $$PWD/Moonray/Updaters/Sparkle

RESOURCES += \
    $$PWD/Moonray/qml.qrc \
    $$PWD/Moonray/ExternalExecutables

TRANSLATIONS += \
    $$PWD/Moonray/Translations/lang_zh_CN.ts \
    $$PWD/Moonray/Translations/lang_en_US.ts

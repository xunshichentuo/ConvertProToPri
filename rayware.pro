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

QMAKE_INFO_PLIST = $$PWD/MacDeployment/Info.plist

#Target version
VERSION = $${VERSION_MAJOR}.$${VERSION_MINOR}.$${VERSION_REVISION}.$${VERSION_BUILD}


HEADERS += \
    Actions/AutoOrient/Components/DentalModel/DentalModel.h \
    Actions/AutoOrient/Components/SurgicalGuide/SurgicalGuide.h \
    Actions/AutoOrient/autoorient.h \
    Actions/ExecutableRunner/executablerunner.h \
    Actions/FeatureFlags/featureflags.h \
    Actions/MeshModifier/Repair/mobiusstriprepair.h \
    Actions/OpenWith/fileeventhandler.h \
    Actions/ProcessManager/processmanager.h \
    Actions/SaveAndLoadPlatform/SavePlatform/Components/meshcompressor.h \
    Actions/SaveAndLoadPlatform/SavePlatform/platform.h \
    Actions/SprFileReaderAndWriter/EncryptionLibrary/qaesencryption.h \
    Actions/SprFileReaderAndWriter/EncryptionLibrary/sprfileencryption.h \
    Actions/SupportGenerator/geomincludesheader.h \
    Actions/UserStateController/usersettingsfileconstants.h \
    Actions/UserStateController/userstatecontroller.h \
    Resin/Components/ResinsList/materialdevelopmentresins.h \
    Resin/Components/ResinsList/pro55resinlist.h \
    Slicer/crushbitmap.h \
    Slicer/genslices.h \
    Slicer/geometricfunctions.h \
    Slicer/loop.h \
    Slicer/modelloader.h \
    Slicer/segment.h \
    Slicer/slice.h \
    Slicer/slicecontext.h \
    Slicer/slicerutils.h \
    Slicer/slicerv2.h \
    Slicer/sliceset.h \
    Slicer/triangle3d.h \
    Slicer/triangulate.h \
    printjob.h \
    Renderer/openglrenderer.h \
    Renderer/openglcamera.h \
    Renderer/renderercontainer.h \
    Renderer/rendererqmlitem.h \
    Renderer/qmlcameratransformation.h \
    Renderer/qmlmodeltransformation.h \
    Renderer/modelboundingbox.h \
    Renderer/qmladdmodel.h \
    Renderer/qmluitransformation.h \
    Renderer/myconstants.h \
    Renderer/qmlmouseclick.h \
    Actions/RayCaster/BBox.h \
    Actions/RayCaster/BVH.h \
    Actions/RayCaster/IntersectionInfo.h \
    Actions/RayCaster/Log.h \
    Actions/RayCaster/Object.h \
    Actions/RayCaster/raycastresult.h \
    Actions/RayCaster/Sphere.h \
    Actions/RayCaster/Stopwatch.h \
    Actions/RayCaster/triangle.h \
    Actions/RayCaster/Vector3.h \
    Networking/clientdevice.h \
    Networking/myglwidget.h \
    Networking/server.h \
    printingthread.h \
    SoftwareUpdaters/softwareupdater.h \
    SoftwareUpdaters/Mac/userupdaterpreferences.h \
    basiclogging.h \
    Actions/Gimbal/gimbal.h \
    Actions/RayCaster/BvhRay.h \
    Actions/Gimbal/Components/axis.h \
    Actions/Gimbal/Components/gimbalaxes.h \
    Actions/Gimbal/Math/rotationmath.h \
    Actions/Gimbal/Math/boundingpointmath.h \
    Actions/Gimbal/Components/InteractionManager/Components/fixedrotationstate.h \
    Actions/Gimbal/Components/InteractionManager/Components/gimbalmodeltransformation.h \
    Actions/Gimbal/Components/InteractionManager/Components/gimbalmousehandler.h \
    Actions/Gimbal/Components/InteractionManager/interactionmanager.h \
    Renderer/MeshRenderer/meshrenderer.h \
    Renderer/MeshRenderer/meshrenderer_unittests.h \
    Renderer/MeshRenderer/Components/OpenGLManager/openglmanager.h \
    Renderer/MeshRenderer/Components/meshmaterial.h \
    Renderer/MeshRenderer/Components/OpenGLManager/openglmanager_unittests.h \
    Renderer/MeshRenderer/Components/OpenGLManager/Components/openglbuffersmanager.h \
    Renderer/MeshRenderer/Components/OpenGLManager/Components/openglbuffersmanager_unittests.h \
    Renderer/PlatformRendererManager/Components/TextRendererManager/textrenderermanager.h \
    Renderer/PlatformRendererManager/Components/TextRendererManager/TextRenderers/fronttextrenderer.h \
    Renderer/PlatformRendererManager/Components/TextRendererManager/TextRenderers/hingetextrenderer.h \
    Renderer/PlatformRendererManager/platformrenderermanager.h \
    Renderer/PlatformRendererManager/Components/platformrenderer.h \
    Renderer/MeshRenderer/Components/cameraandshader.h \
    Actions/MeshImporter/meshimporter_unittests.h \
    Actions/MeshImporter/meshimporter.h \
    Actions/MeshImporter/Importers/ObjImporter/objreader.h \
    Actions/MeshImporter/Importers/StlImporter/stlreader.h \
    Renderer/PlatformRendererManager/Components/PlatformLinesManager/platformlinesmanager.h \
    Renderer/PlatformRendererManager/Components/PlatformLinesManager/platformlinerenderer.h \
    Renderer/PlatformRendererManager/Components/PlatformLinesManager/horizontalplatformlinerenderer.h \
    Renderer/PlatformRendererManager/Components/PlatformLinesManager/verticalplatformlinerenderer.h \
    Actions/Gimbal/Components/gimbalaxisrenderer.h \
    Renderer/MeshRenderer/renderingtestmanager.h \
    Actions/RayCaster/raycaster.h \
    Actions/MeshModifier/Analysis/meshqueries.h \
    Actions/MeshModifier/Components/boundingbox.h \
    Actions/MeshModifier/meshqueries_unittests.h \
    Actions/SelectBase/Components/selectbasearrowrenderer.h \
    Actions/SelectBase/selectbasemanager.h \
    Actions/SelectBase/Components/selectbasemousehandler.h \
    Renderer/MeshRenderer/UserImportedMesh/Components/userimportedmesh.h \
    Renderer/MeshRenderer/UserImportedMesh/userimportedmeshmanager.h \
    Actions/MeshModifier/Components/transformation.h \
    Renderer/MeshRenderer/UserImportedMesh/Components/Supports/userimportedmeshsupports.h \
    Renderer/PlatformRendererManager/Components/CollisionWallsManager/collisionwall.h \
    Renderer/PlatformRendererManager/Components/CollisionWallsManager/collisionwallsmanager.h \
    Renderer/MeshRenderer/UserImportedMesh/Components/Supports/singleanchor.h \
    Renderer/MeshRenderer/UserImportedMesh/Components/Supports/userimportedmeshsingleanchorsupports.h \
    Actions/EditSupports/editsupportsmanager.h \
    Actions/EditSupports/Components/addsupportrenderer.h \
    Actions/OpenWith/winopenfilewitheventhandler.h \
    Actions/OpenWith/sharedmemorylistener.h \
    runguard.h \
    Actions/OpenWith/sharedmemorywriter.h \
    Actions/OpenWith/sharedmemoryliterals.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SupportSurfels.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/boundingbox.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SGParameters.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SupportSurfelConstructor.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Surfels.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Triangle.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/trianglesoup.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Array3D.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/CutStl.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/DLPMain.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/GeomInterface.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/LDNIPixels.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/stdafx.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Array2D.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/CommonDefine.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font_Build.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font_Geometry.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font_SVector.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font_Truetype.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font3d.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/LineSegmentSampler.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/matrix.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Pixels.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/PNGFileReader.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Point2D.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/STLSurfelConstructor.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SupportPixels.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SupportSurfels2PixelsIterator.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Surfel.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Surfels2PixelsIterator.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/TransMatrix.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/TriangleSampler.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Vector.h \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/vertex.h \
    Actions/SupportGenerator/supportgenerator.h \
    Actions/MeshModifier/Analysis/MeshErrorDetection/Components/TopoMesh.h \
    Actions/MeshModifier/Analysis/MeshErrorDetection/Components/DetectProblem.h \
    Actions/MeshModifier/Analysis/MeshErrorDetection/mesherror.h \
    Actions/MeshModifier/Analysis/MeshErrorDetection/meshproperties.h \
    Actions/MeshModifier/Repair/meshrepair.h \
    applicationinfo.h \
    Actions/MeshModifier/Repair/baseextrusion.h \
    Actions/MeshModifier/Analysis/DetectUpperLowerJaw.h \
    Actions/MeshModifier/Analysis/SupportDetection.h \
    Actions/MeshModifier/Analysis/supportanalysis.h \
    Renderer/MeshRenderer/UserImportedMesh/Components/mousehandler.h \
    Actions/MeshModifier/Math/meshmath.h \
    Actions/MeshModifier/Math/overlaymath.h \
    Actions/SprFileReaderAndWriter/SprWriter/sprwriter.h \
    Actions/SprFileReaderAndWriter/SprFile/sprfile.h \
    Actions/SprFileReaderAndWriter/sprunittester.h \
    Actions/UnitTestingFramework/testrunner.h \
    Actions/UnitTestingFramework/unittestrunner.h \
    Actions/SprFileReaderAndWriter/SprWriter/Components/xmlwriter.h \
    Actions/SprFileReaderAndWriter/sprfileconstants.h \
    Actions/MeshExporter/meshexporter.h \
    Actions/MeshExporter/Components/asciistlexporter.h \
    Actions/SprFileReaderAndWriter/SprFile/Components/inputparsingfunctions.h \
    Actions/MeshImporter/Importers/StlImporter/Components/stlfilereader.h \
    Actions/MeshImporter/Importers/StlImporter/Components/stlstringreader.h \
    Renderer/MeshRenderer/Components/meshstrings.h \    
    Actions/SprFileReaderAndWriter/CompressionLibrary/ioapi.h \
    Actions/SprFileReaderAndWriter/CompressionLibrary/JlCompress.h \
    Actions/SprFileReaderAndWriter/CompressionLibrary/minizip_crypt.h \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quaadler32.h \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quachecksum32.h \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quacrc32.h \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quagzipfile.h \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quaziodevice.h \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quazip_global.h \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quazip.h \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quazipdir.h \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quazipfile.h \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quazipfileinfo.h \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quazipnewinfo.h \
    Actions/SprFileReaderAndWriter/CompressionLibrary/unzip.h \
    Actions/SprFileReaderAndWriter/CompressionLibrary/zip.h \
    Actions/SprFileReaderAndWriter/CompressionLibrary/sprcompressor.h \
    Actions/MeshExporter/Components/objexporter.h \
    Actions/SaveAndLoadPlatform/LoadPlatform/loadplatform.h \
    Actions/SprFileReaderAndWriter/SprFile/Components/metadatareader.h \
    Actions/SprFileReaderAndWriter/SprFile/Components/imagefilereader.h \
    Actions/SprFileReaderAndWriter/SprWriter/Components/metadatawriter.h \
    Actions/SprFileReaderAndWriter/SprWriter/Components/imagefilewriter.h \
    Actions/SprFileReaderAndWriter/SprFile/Components/modelfilereader.h \
    Actions/SaveAndLoadPlatform/SavePlatform/saveplatform.h \
    Actions/RayWare-login-module/Rayware/Components/lease.h \
    Actions/RayWare-login-module/Rayware/raywaredashboardcontroller.h \
    Actions/RayWare-login-module/Printer/Components/printmanager.h \
    Actions/RayWare-login-module/Printer/Components/printerdashboardcontroller.h \
    Actions/RayWare-login-module/Printer/Components/imageuploader.h \
    Actions/RayWare-login-module/Printer/Pro/prodashboardcontroller.h \
    Actions/RayWare-login-module/Components/config.h \
    Actions/RayWare-login-module/Components/dashboardcontroller.h \
    Actions/RayWare-login-module/Components/jsonhelper.h \
    Actions/RayWare-login-module/Components/LoginManager.h \
    Actions/RayWare-login-module/Components/replytimeout.h \
    Actions/RayWare-login-module/Components/Subscription/displayedsubscriptionkeywords.h \
    Actions/RayWare-login-module/Components/Subscription/subscription.h \
    Resin/Components/ResinsList/moonrayresinslist.h \
    Resin/Components/OldVersionCompatibility/resinversionconverter.h \
    Resin/Components/OldVersionCompatibility/resinidqueries.h \
    Resin/Components/resinutilityfunctions.h \
    Resin/resin.h \
#    Resin/Tests/resintests.h \
    Resin/Components/ResinsList/proresinslist.h \
    FactoryProjectionSettings/Components/LinearInterpolation.h \
    FactoryProjectionSettings/Grayscale/GrayscaleData.h \
    FactoryProjectionSettings/Grayscale/GrayScale.h \
    FactoryProjectionSettings/OcularCorrection/OcularCorrectionData.h \
    Renderer/MeshRenderer/UserImportedMesh/Components/meshcalculationthread.h \
    Actions/PlaneCut/planecutmanager.h \
    Actions/PlaneCut/Components/planecutrenderer.h \
    Actions/PlaneCut/planecutter.h \    
    SlicesMetaData/slicesmetadata.h \
    SlicesMetaData/Tests/slicesmetadatatests.h \
    Actions/PrintTimeCalculator/printtimeandvolumecalculator.h \
    Renderer/PrinterPlatform/printerplatform.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/trianglesoup_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/boundingbox_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Triangle_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Surfels_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SupportSurfels_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SupportSurfelConstructor_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/STLPixels_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SGParameters_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/GeomInterface_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/DLPMain_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/vertex_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/stdafx_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/matrix_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Vector_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/TriangleSampler_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/TransMatrix_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Surfels2PixelsIterator_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Surfel_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SupportSurfels2PixelsIterator_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SupportPixels_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/STLSurfelConstructor_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Resource_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Pixels_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/PNGFileReader_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/LineSegmentSampler_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/LDNIPixels_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/CutStl_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/CommonDefine_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Array3D_old.h \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Array2D_old.h \
    Actions/ActionTimer/actiontimer.h \
    Actions/SupportGenerator/supportsettingscontroller.h \
    Actions/ProgressBar/progressbarmanager.h \
    Actions/ProgressBar/progressbarpercents.h \
    Actions/MeshModifier/Analysis/RawScan.h	\
    Actions/MeshModifier/Analysis/DentalModel.h \
    Networking/Components/sshcmdthread.h \
    Translate.h \
    stringconstants.h \
    global.h

SOURCES += main.cpp \
    Actions/AutoOrient/Components/DentalModel/DentalModel.cpp \
    Actions/AutoOrient/Components/SurgicalGuide/SurgicalGuide.cpp \
    Actions/AutoOrient/autoorient.cpp \
    Actions/ExecutableRunner/executablerunner.cpp \
    Actions/FeatureFlags/featureflags.cpp \
    Actions/MeshModifier/Repair/mobiusstriprepair.cpp \
    Actions/OpenWith/fileeventhandler.cpp \
    Actions/ProcessManager/processmanager.cpp \
    Actions/SaveAndLoadPlatform/SavePlatform/Components/meshcompressor.cpp \
    Actions/SaveAndLoadPlatform/SavePlatform/saveplatform.cpp \
    Actions/SprFileReaderAndWriter/EncryptionLibrary/qaesencryption.cpp \
    Actions/SprFileReaderAndWriter/EncryptionLibrary/sprfileencryption.cpp \
    Actions/UserStateController/userstatecontroller.cpp \
    Resin/Components/ResinsList/materialdevelopmentresins.cpp \
    Resin/Components/ResinsList/pro55resinlist.cpp \
    Slicer/slicerutils.cpp \
    Slicer/slicerv2.cpp \
    imageprovider.cpp \
    Slicer/crushbitmap.cpp \
    Slicer/genslices.cpp \
    Slicer/geometricfunctions.cpp \
    Slicer/loop.cpp \
    Slicer/modelloader.cpp \
    Slicer/segment.cpp \
    Slicer/slice.cpp \
    Slicer/slicecontext.cpp \
    Slicer/sliceset.cpp \
    Slicer/triangle3d.cpp \
    Slicer/triangulate.cpp \
    printjob.cpp \
    Renderer/openglcamera.cpp \
    Renderer/openglrenderer.cpp \
    Renderer/renderercontainer.cpp \
    Renderer/rendererqmlitem.cpp \
    Renderer/qmlcameratransformation.cpp \
    Renderer/qmlmodeltransformation.cpp \
    Renderer/modelboundingbox.cpp \
    Renderer/qmladdmodel.cpp \
    Renderer/qmluitransformation.cpp \
    Renderer/qmlmouseclick.cpp \
    Actions/RayCaster/BBox.cpp \
    Actions/RayCaster/BVH.cpp \
    Networking/clientdevice.cpp \
    Networking/myglwidget.cpp \
    Networking/server.cpp \
    printingthread.cpp \
    SoftwareUpdaters/softwareupdater.cpp \    
    SoftwareUpdaters/Mac/userupdaterpreferences.cpp \
    basiclogging.cpp \
    Actions/Gimbal/gimbal.cpp \
    Actions/Gimbal/Math/rotationmath.cpp \
    Actions/Gimbal/Math/boundingpointmath.cpp \
    Actions/Gimbal/Components/gimbalaxes.cpp \
    Actions/Gimbal/Components/InteractionManager/Components/fixedrotationstate.cpp \
    Actions/Gimbal/Components/InteractionManager/Components/gimbalmousehandler.cpp \
    Actions/Gimbal/Components/InteractionManager/interactionmanager.cpp \
    Renderer/MeshRenderer/meshrenderer.cpp \
    Renderer/MeshRenderer/meshrenderer_unittests.cpp \
    Renderer/MeshRenderer/Components/OpenGLManager/openglmanager.cpp \
    Renderer/MeshRenderer/Components/OpenGLManager/openglmanager_unittests.cpp \
    Renderer/MeshRenderer/Components/OpenGLManager/Components/openglbuffersmanager.cpp \
    Renderer/MeshRenderer/Components/OpenGLManager/Components/openglbuffersmanager_unittests.cpp \
    Renderer/PlatformRendererManager/Components/TextRendererManager/textrenderermanager.cpp \
    Renderer/PlatformRendererManager/Components/TextRendererManager/TextRenderers/fronttextrenderer.cpp \
    Renderer/PlatformRendererManager/Components/TextRendererManager/TextRenderers/hingetextrenderer.cpp \
    Renderer/PlatformRendererManager/platformrenderermanager.cpp \
    Renderer/PlatformRendererManager/Components/platformrenderer.cpp \
    Actions/MeshImporter/meshimporter_unittests.cpp \
    Actions/MeshImporter/meshimporter.cpp \
    Actions/MeshImporter/Importers/ObjImporter/objreader.cpp \
    Actions/MeshImporter/Importers/StlImporter/stlreader.cpp \
    Renderer/PlatformRendererManager/Components/PlatformLinesManager/platformlinesmanager.cpp \
    Renderer/PlatformRendererManager/Components/PlatformLinesManager/platformlinerenderer.cpp \
    Renderer/PlatformRendererManager/Components/PlatformLinesManager/horizontalplatformlinerenderer.cpp \
    Renderer/PlatformRendererManager/Components/PlatformLinesManager/verticalplatformlinerenderer.cpp \
    Actions/Gimbal/Components/gimbalaxisrenderer.cpp \
    Renderer/MeshRenderer/renderingtestmanager.cpp \
    Actions/RayCaster/raycaster.cpp \
    Actions/MeshModifier/Analysis/meshqueries.cpp \
    Actions/MeshModifier/Analysis/meshqueries_unittests.cpp \
    Actions/SelectBase/Components/selectbasearrowrenderer.cpp \
    Actions/SelectBase/selectbasemanager.cpp \
    Actions/SelectBase/Components/selectbasemousehandler.cpp \
    Renderer/MeshRenderer/UserImportedMesh/Components/userimportedmesh.cpp \
    Renderer/MeshRenderer/UserImportedMesh/userimportedmeshmanager.cpp \
    Renderer/MeshRenderer/UserImportedMesh/Components/Supports/userimportedmeshsupports.cpp \
    Renderer/PlatformRendererManager/Components/CollisionWallsManager/collisionwall.cpp \
    Renderer/PlatformRendererManager/Components/CollisionWallsManager/collisionwallsmanager.cpp \
    Renderer/MeshRenderer/UserImportedMesh/Components/Supports/userimportedmeshsingleanchorsupports.cpp \
    Actions/EditSupports/editsupportsmanager.cpp \
    Actions/EditSupports/Components/addsupportrenderer.cpp \
    Actions/OpenWith/winopenfilewitheventhandler.cpp \
    Actions/OpenWith/sharedmemorylistener.cpp \
    runguard.cpp \
    Actions/OpenWith/sharedmemorywriter.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SupportSurfelConstructor.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SGParameters.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/BoundingBox.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Matrix.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/STLSurfelConstructor.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SupportSurfels.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Surfels.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Triangle.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/TriangleSoup.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Vector.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Array3D.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/CutStl.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/DLPMain.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/LDNIPixels.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/TransMatrix.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Array2D.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font_Build.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font_Geometry.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font_Truetype.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Font3d.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/LineSegmentSampler.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Pixels.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Point2D.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/stdafx.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SupportPixels.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/SupportSurfels2PixelsIterator.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Surfels2PixelsIterator.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/TriangleSampler.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/Vertex.cpp \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/STLPixels.cpp \
    Actions/SupportGenerator/supportgenerator.cpp \
    Actions/MeshModifier/Analysis/MeshErrorDetection/mesherror.cpp \
    Actions/MeshModifier/Analysis/MeshErrorDetection/Components/DetectProblem.cpp \
    Actions/MeshModifier/Analysis/MeshErrorDetection/Components/TopoMesh.cpp \
    Actions/MeshModifier/Analysis/MeshErrorDetection/Components/sample.cpp \
    Actions/MeshModifier/Repair/meshrepair.cpp \
    Actions/MeshModifier/Repair/baseextrusion.cpp \
    Actions/MeshModifier/Analysis/SupportDetection.cpp \
    Actions/MeshModifier/Analysis/supportanalysis.cpp \
    Renderer/MeshRenderer/UserImportedMesh/Components/mousehandler.cpp \
    Actions/MeshModifier/Math/meshmath.cpp \
    Actions/MeshModifier/Math/overlaymath.cpp \
    Actions/SprFileReaderAndWriter/SprWriter/sprwriter.cpp \
    Actions/SprFileReaderAndWriter/SprFile/sprfile.cpp \
    Actions/SprFileReaderAndWriter/sprunittester.cpp \
    Actions/UnitTestingFramework/unittestrunner.cpp \
    Actions/SprFileReaderAndWriter/SprWriter/Components/xmlwriter.cpp \
    Actions/MeshExporter/meshexporter.cpp \
    Actions/MeshExporter/Components/asciistlexporter.cpp \
    Actions/SprFileReaderAndWriter/SprFile/Components/inputparsingfunctions.cpp \
    Actions/MeshImporter/Importers/StlImporter/Components/stlfilereader.cpp \
    Actions/MeshImporter/Importers/StlImporter/Components/stlstringreader.cpp \
    Actions/SprFileReaderAndWriter/CompressionLibrary/JlCompress.cpp \
    Actions/SprFileReaderAndWriter/CompressionLibrary/qioapi.cpp \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quaadler32.cpp \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quacrc32.cpp \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quagzipfile.cpp \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quaziodevice.cpp \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quazip.cpp \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quazipdir.cpp \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quazipfile.cpp \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quazipfileinfo.cpp \
    Actions/SprFileReaderAndWriter/CompressionLibrary/quazipnewinfo.cpp \
    Actions/SprFileReaderAndWriter/CompressionLibrary/unzip.c \
    Actions/SprFileReaderAndWriter/CompressionLibrary/zip.c \
    Actions/SprFileReaderAndWriter/CompressionLibrary/sprcompressor.cpp \
    Actions/MeshExporter/Components/objexporter.cpp \
    Actions/SaveAndLoadPlatform/LoadPlatform/loadplatform.cpp \
    Actions/SprFileReaderAndWriter/SprFile/Components/metadatareader.cpp \
    Actions/SprFileReaderAndWriter/SprFile/Components/imagefilereader.cpp \
    Actions/SprFileReaderAndWriter/SprWriter/Components/metadatawriter.cpp \
    Actions/SprFileReaderAndWriter/SprWriter/Components/imagefilewriter.cpp \
    Actions/SprFileReaderAndWriter/SprFile/Components/modelfilereader.cpp \
    Actions/RayWare-login-module/Rayware/Components/lease.cpp \
    Actions/RayWare-login-module/Rayware/raywaredashboardcontroller.cpp \
    Actions/RayWare-login-module/Printer/Components/imageuploader.cpp \
    Actions/RayWare-login-module/Printer/Components/printmanager.cpp \
    Actions/RayWare-login-module/Printer/Components/printerdashboardcontroller.cpp \
    Actions/RayWare-login-module/Printer/Pro/prodashboardcontroller.cpp \
    Actions/RayWare-login-module/Components/dashboardcontroller.cpp \
    Actions/RayWare-login-module/Components/jsonhelper.cpp \
    Actions/RayWare-login-module/Components/LoginManager.cpp \
    Actions/RayWare-login-module/Components/replytimeout.cpp \
    Actions/RayWare-login-module/Components/Subscription/displayedsubscriptionkeywords.cpp \
    Actions/RayWare-login-module/Components/Subscription/subscription.cpp \
    Resin/Components/ResinsList/moonrayresinslist.cpp \
    Resin/Components/OldVersionCompatibility/resinversionconverter.cpp \
    Resin/Components/OldVersionCompatibility/resinidqueries.cpp \
    Resin/Components/resinutilityfunctions.cpp \
    Resin/resin.cpp \
#    Resin/Tests/resintests.cpp \
    Resin/Components/ResinsList/proresinslist.cpp \
    FactoryProjectionSettings/Components/LinearInterpolation.cpp \
    FactoryProjectionSettings/Grayscale/GrayscaleData.cpp \
    FactoryProjectionSettings/Grayscale/GrayScale.cpp \
    FactoryProjectionSettings/OcularCorrection/OcularCorrectionData.cpp \
    Renderer/MeshRenderer/UserImportedMesh/Components/meshcalculationthread.cpp \
    Actions/PlaneCut/planecutmanager.cpp \
    Actions/PlaneCut/Components/planecutrenderer.cpp \
    Actions/PlaneCut/planecutter.cpp \
    SlicesMetaData/slicesmetadata.cpp \
    SlicesMetaData/Tests/slicesmetadatatests.cpp \
    Actions/PrintTimeCalculator/printtimeandvolumecalculator.cpp \
    Renderer/PrinterPlatform/printerplatform.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Vector_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/TriangleSoup_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Triangle_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Surfels_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SupportSurfels_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SupportSurfelConstructor_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/STLSurfelConstructor_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/STLPixels_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SGParameters_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Matrix_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/LDNIPixels_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/DLPMain_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/BoundingBox_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/stdafx_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Vertex_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/TriangleSampler_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/TransMatrix_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Surfels2PixelsIterator_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SupportSurfels2PixelsIterator_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/SupportPixels_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Pixels_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/LineSegmentSampler_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/CutStl_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Array3D_old.cpp \
    Actions/SupportGenerator/Components/SupportGenerationOld/Geom_old/Array2D_old.cpp \
    Actions/ActionTimer/actiontimer.cpp \
    Actions/SupportGenerator/supportsettingscontroller.cpp \
    Actions/ProgressBar/progressbarmanager.cpp \
    Actions/MeshModifier/Analysis/RawScan.cpp \
    Networking/Components/sshcmdthread.cpp      \
    Translate.cpp \
    global.cpp

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


    LIBS += $$PWD/Frameworks/libz.1.dylib
    LIBS += $$PWD/Networking/libssh.4.4.2.dylib
    LIBS += -F$$PWD/Updaters/Sparkle/ -framework Sparkle
    LIBS += -framework AppKit
    ICON = logo_icon.icns
    #QMAKE_INFO_PLIST = $$PWD/Info.plist

    CHI_SLICER_DEPENDENCIES.files = $$PWD/Slicer/ExternalExecutables/Mac/Frameworks/libomp.dylib
    CHI_SLICER_DEPENDENCIES.path = Contents/Frameworks
    QMAKE_BUNDLE_DATA += CHI_SLICER_DEPENDENCIES

    CHI_SLICER_EXECUTABLE.files = $$PWD/Slicer/ExternalExecutables/Mac/DLPSlicerSingleMac
    CHI_SLICER_EXECUTABLE.path = Contents/MacOS
    QMAKE_BUNDLE_DATA += CHI_SLICER_EXECUTABLE

    PRINTOS_UPDATE_DEPENDENCIES.files = $$PWD/ExternalExecutables/PrintOS/MoonrayUI
    PRINTOS_UPDATE_DEPENDENCIES.path = Contents/MacOS
    QMAKE_BUNDLE_DATA += PRINTOS_UPDATE_DEPENDENCIES

    PRINTOS_RLEASE_NOTES_DEPENDENCIES.files = $$PWD/ExternalExecutables/PrintOS/MoonrayUIMessage
    PRINTOS_RLEASE_NOTES_DEPENDENCIES.path = Contents/MacOS
    QMAKE_BUNDLE_DATA += PRINTOS_RLEASE_NOTES_DEPENDENCIES
}


TARGET = RayWare


win32 {
    HEADERS +=  Networking/WinSSH/libsshwin64wrapper.h \
                Networking/WinSSH/winsshclient.h \
                SoftwareUpdaters/Windows/winautoupdater.h \
                Actions/SprFileReaderAndWriter/CompressionLibrary/zconf.h \
                Actions/SprFileReaderAndWriter/CompressionLibrary/zlib.h

    SOURCES +=  Networking/WinSSH/winsshclient.cpp \
                Networking/WinSSH/libsshwin64wrapper.cpp \
                SoftwareUpdaters/Windows/winautoupdater.cpp

    LIBS += -lopengl32
    LIBS += -L$$PWD/Actions/SprFileReaderAndWriter/CompressionLibrary/zlib -lzlib
    RC_ICONS += logo_icon.ico
    LIBS += -L$$PWD/Updaters/WinSparkle -lWinSparkle
    DEFINES += QUAZIP_STATIC
    DEFINES += WIN32_LEAN_AND_MEAN

    LIBS += -lDbgHelp
    QMAKE_LFLAGS_RELEASE = /INCREMENTAL:NO /DEBUG
}


INCLUDEPATH += $$PWD/glm
INCLUDEPATH += $$PWD/

DISTFILES += \
    Actions/SupportGenerator/Components/SupportGenerationNew/Geom/arial.ttf \
    Icons/SprintRayLogo.png \
    squirclevertexshader.vert \
    squirclefragment.frag \
    pvmshader.vert \
    basicfragshader.frag \
    sprintray_icon.icns \
    Geom/Geom.pri \
    logo_highres.png \
    phong.frag \
    phong.vert \
    Renderer/phong.frag \
    Renderer/phong.vert \
    Icons/MaterialIcons-Regular.ttf \
    Icons/moonrayd.svg \
    Icons/moonrays.svg \
    Icons/pro.svg \
    Icons/moonrayd-white.svg \
    Icons/moonrays-white.svg \
    Icons/pro-white.svg \
    PlaneCut-Pro95Platform.stl

INCLUDEPATH += $$PWD/libssh/libssh
DEPENDPATH += $$PWD/libssh/libssh

INCLUDEPATH += $$PWD/Updaters/Sparkle/Sparkle.framework/Versions/A/Headers
DEPENDPATH += $$PWD/Updaters/Sparkle

RESOURCES += \
    qml.qrc \
    $$PWD/ExternalExecutables

TRANSLATIONS += \
    Translations/lang_zh_CN.ts \
    Translations/lang_en_US.ts

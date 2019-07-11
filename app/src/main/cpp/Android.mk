LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
OPENCV_ANDROID_SDK := $(LOCAL_PATH)/../../../../OpenCV-sdk
EIGEN3_DIR := $(LOCAL_PATH)/../../../../Eigen3Lib

ifndef OPENCV_ANDROID_SDK
  $(error Please specify environmental variable OPENCV_ANDROID_SDK to OpenCV Android SDK directory)
endif

OPENCV_INSTALL_MODULES := on
include $(OPENCV_ANDROID_SDK)/native/jni/OpenCV.mk

ifndef EIGEN3_DIR
  $(error Please specify environmental variable EIGEN3_DIR to Eigen 3 directory)
endif

LOCAL_MODULE := face-lib
LOCAL_SRC_FILES += $(LOCAL_PATH)/face-lib.cpp $(LOCAL_PATH)/FaceRecognitionLib/Facebase.cpp
LOCAL_SRC_FILES += $(LOCAL_PATH)/FaceRecognitionLib/Eigenfaces.cpp $(LOCAL_PATH)/FaceRecognitionLib/Fisherfaces.cpp
LOCAL_SRC_FILES += $(LOCAL_PATH)/FaceRecognitionLib/PCA.cpp $(LOCAL_PATH)/FaceRecognitionLib/LDA.cpp
LOCAL_C_INCLUDES += $(EIGEN3_DIR)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/FaceRecognitionLib/RedSVD/include
LOCAL_LDLIBS += -llog -ldl
LOCAL_CPPFLAGS += -std=gnu++11 -frtti -fexceptions

include $(BUILD_SHARED_LIBRARY)

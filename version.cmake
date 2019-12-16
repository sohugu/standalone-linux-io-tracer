set(IOTRACE_VERSION_MAIN 19)
set(IOTRACE_VERSION_MAJOR 9)
set(IOTRACE_VERSION_MINOR 0)
set(IOTRACE_VERSION ${IOTRACE_VERSION_MAIN}.${IOTRACE_VERSION_MAJOR}.${IOTRACE_VERSION_MINOR})

execute_process(
    COMMAND git log --pretty=format:%h -n 1
    OUTPUT_VARIABLE IOTRACE_VERSION_LABEL
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
    ERROR_QUIET
)

message(STATUS "IOTRACE VERSION: ${IOTRACE_VERSION}")
if (IOTRACE_VERSION_LABEL)
    message(STATUS "IOTRACE LABEL: ${IOTRACE_VERSION_LABEL}")
endif()

# Generate version file
file(
    WRITE ${CMAKE_CURRENT_BINARY_DIR}/VERSION
    "IOTRACE_VERSION_MAIN=${IOTRACE_VERSION_MAIN}\n"
)
file(
    APPEND ${CMAKE_CURRENT_BINARY_DIR}/VERSION
    "IOTRACE_VERSION_MAJOR=${IOTRACE_VERSION_MAJOR}\n"
)
file(
    APPEND ${CMAKE_CURRENT_BINARY_DIR}/VERSION
    "IOTRACE_VERSION_MINOR=${IOTRACE_VERSION_MINOR}\n"
)
if (IOTRACE_VERSION_LABEL)
    file(
        APPEND ${CMAKE_CURRENT_BINARY_DIR}/VERSION
        "IOTRACE_VERSION_LABEL=${IOTRACE_VERSION_LABEL}\n"
    )
endif()

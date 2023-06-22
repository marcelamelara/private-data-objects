# ------------------------------------------------------------------------------
# Copyright 2023 Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------------------------

FROM pdo_services_base

# -----------------------------------------------------------------
# set up the PDO sources
# -----------------------------------------------------------------
ARG REBUILD 0

ARG PDO_DEBUG_BUILD=0
ENV PDO_DEBUG_BUILD=${PDO_DEBUG_BUILD}

ARG PDO_LEDGER_TYPE=ccf
ENV PDO_LEDGER_TYPE=${PDO_LEDGER_TYPE}

ARG PDO_INTERPRETER=wawaka
ENV PDO_INTERPRETER=${PDO_INTERPRETER}

ARG WASM_MEM_CONFIG=MEDIUM
ENV WASM_MEM_CONFIG=${WASM_MEM_CONFIG}

# copy the source files into the image
WORKDIR /project/pdo
COPY --chown=${UNAME}:${UNAME} repository /project/pdo/src

# copy the tools because we want to be able to
# use them even without a mount point after the
# container is created
WORKDIR /project/pdo/tools
COPY --chown=${UNAME}:${UNAME} tools/*.sh ./

# built it!
RUN /project/pdo/tools/build_services.sh

# Network ports for running services
EXPOSE 7001 7002 7003 7004 7005
EXPOSE 7101 7102 7103 7104 7105
EXPOSE 7201 7202 7203 7204 7205

ARG PDO_HOSTNAME
ENV PDO_HOSTNAME=$PDO_HOSTNAME

ARG PDO_LEDGER_URL
ENV PDO_LEDGER_URL=$PDO_LEDGER_URL

# Note that the entry point when specified with exec syntax
# can be extended through the docker run interface far more
# easily than if you use the other specification format of
# a single string
WORKDIR /project/pdo
ENTRYPOINT ["/project/pdo/tools/start_services.sh"]
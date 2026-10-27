# install stage

FROM python:3.10-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir --user -r requirements.txt


# run stage

FROM python:3.10-slim AS runner

WORKDIR /app

# copy from previous stage
COPY --from=builder /root/.local /root/.local

COPY . /app/

RUN groupadd -r webservice && useradd --no-log-init -r -g webservice webservice
RUN chown -R webservice:webservice /app
USER webservice:webservice
ENV PATH=/root/.local/bin:$PATH

EXPOSE 8050
CMD ["python", "GraphAnalysis.py", "obj_dependency_data.csv"]
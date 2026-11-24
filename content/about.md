+++
title = "About"
slug = "about"
+++

Hello! I'm Ivan. I'm a Senior Golang Developer.

I've worked in backend and web development since 2014, with over 12 years of experience,
including more than 4 years with Go and 8 years with PHP. I specialize in high-load services,
PostgreSQL, and media processing. I take technical projects from architecture to production.

## What I do now

Since August 2022, I've worked at Ozon Tech, developing high-load Go services for uploading
and processing product media. Our domain handles 95% of all Ozon media content, stores
around 1 PB of images, and processes up to 7,000 tasks per second at peak load.

Some of my results:

* Designed sharding for the main service's largest PostgreSQL table. Migrated 6.14 billion rows
  into 32 shards without downtime or data loss, freeing 2.5 TB in the original database.
  Normalized the schema and introduced dual writes and data reconciliation.
  Reduced read API p99 latency from 430 to 200 ms (53%).
* Centralized product rich content processing in the Media domain and moved communication
  to asynchronous messaging through Kafka. Designed the architecture for moving the remaining
  media attributes, allowing further development without cross-domain projects.
  Built a JSON parser that benchmarks 5–7 times faster than the previous implementation.
* Designed and launched a Go service for bulk synchronization of product media attributes.
  Support can now update data in bulk without developer involvement or one-off scripts.
* Implemented deduplication of concurrent image uploads, reducing S3 upload volume by 8%
  and saving 140 TB per year.
* Used pprof and heap profiles to fix a memory leak in an image processing service.
  Average memory use fell fourfold, and pods stopped crashing due to OOM errors.
* Introduced external host classification backed by Redis and an outbound rate limiter,
  reducing HTTP 429 and host unavailability errors by 60% by limiting load on source hosts.

## Technical leadership and teamwork

After the team shrank from seven to three people, I took technical responsibility for a domain
of four services and served as acting tech lead for four months. As the technical owner,
I coordinate requirements and architecture with other teams and oversee implementation and launch.
During on-call shifts, I provide round-the-clock support with a response time of up to five minutes.

I introduced AI practices for task decomposition, incremental implementation, and reviews
with subagents, moving from key decisions to details. This helped the team catch more edge cases
and problems before production. I've mentored three colleagues and onboard new developers.

## Skills

* **Languages:** Go, PHP.
* **APIs and messaging:** gRPC, Protobuf, REST, Swagger, Apache Kafka.
* **Databases and storage:** PostgreSQL, Redis, S3/Ceph.
* **Infrastructure and CI/CD:** GitLab, Docker, Kubernetes.
* **Monitoring and diagnostics:** Grafana, Prometheus, Jaeger, Graylog, pprof.
* **Image processing:** libvips.
* **English:** approximately Intermediate (B1).

## Previous experience

* **03.2021–08.2022 — Laboratory 365, Lead PHP Developer.**
  Cloud platform for non-destructive testing laboratories.
* **09.2019–03.2021 — Freelance PHP Developer.** Worked with international clients.
* **06.2019–09.2019 — Telebreeze, Lead PHP Developer.** Cloud video delivery platform.
* **07.2018–06.2019 — Laboratory 365, Lead PHP Developer.**
  Cloud platform for non-destructive testing laboratories.
* **02.2018–07.2018 — Career break.** Self-directed programming studies and travel.
* **07.2017–02.2018 — Freelance PHP Developer.** Personalized education service mindguid.com.
* **01.2016–07.2017 — Studio 15, PHP Developer.** Custom website development.
* **04.2015–12.2015 — Artline Group, PHP Developer.** Online stores.
* **05.2014–04.2015 — AVVI, PHP Developer.** Online stores.

## Education

Tomsk Polytechnic University:

* **2012** — Master's degree in Renewable Energy Sources.
* **2010** — Bachelor's degree in Electrical Power Engineering.

## Contact

Email me at [mailbox@iskovpin.ru](mailto:mailbox@iskovpin.ru).
You can also reach me on [Telegram](https://t.me/skovpin).

[Current résumé (in Russian)](/ru/resume/).

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621286;
	b=WNsKkg7k8ivWiS8lpAPfuLqarigT/Ax1SrLJV/Wc/N2t5/9DmIz8jWFwu9ENubcJAT71
	 +JOHCOX5w9N01FMb3AFehFqtoPyk+AUuTk/xr8WzijwfsNaCpFDzWvkRThbIeldSpgqMr
	 3kcs7AR4oC4SA/f+YIO1MiXcPdul83GQmqTV23bWjt2h7fjcmNZe7A9hAi3RcRrUrG7cR
	 gJaX2ReVTLDfBRons3QURwUnPf+b5acrZY7CnYoAeaePLrfIY59hR6SzaOVBi4Oouo9RN
	 y9iOYMwPBeqgOTP8Fx0KJJT89O9BHLNWC8DYK8UfOHMyzxw3Z4LnzV+RjePoYl05ciQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621286;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aqBsrURfnNgLPESd3cSZXIp/Av1gSlble1TAYBdxJnI=;
	b=Yup8U+X5W+ejoLx+SD+H6WevgTSmfLG2N8CWhx1obaVCh6Q6u+3BYqI+FwFnOXmeXGqh
	 ZIfmHRFt4qvGyxoZT3/46OAlpFA1UFVjotRBoitOCQ3KiqYV8cAeFWFHat+44zfBJzSqx
	 RFioPlIV1aRQ1HFSXjtg6FjMhff2f5+C6+NCcIY0cJT4n+d9We2w6DMQkYaVv9/1DCYiK
	 jMxwLPs+M3JjiWahHadg946ZYjRr0SwwAmV71y11vMNRD4u+qvpytvBYn+OmpN8Ri2q9S
	 zgxIW4fK+fDyAed5Ibw6DwPGZPIVTQ7m0Gf46bx7M0V6G7i9VOehPOG035Qjkpz+aEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fJ1mUC+n;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C8560A2604
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C8560A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fJ1mUC+n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795621286; x=1827157286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f2UtMa53cfQWa+1CugcZdZtoSQ05QKL8AUqcuBJ0Z6o=;
  b=fJ1mUC+ndu9JjyMOjTl2biUe1gBKE7pm05MNYe0CcF1Rh7aKM2Hp3Psx
   5P4tw9n7MFhhzPNgubmRkj5o8KQmRKrKZ/ozzBBnFOuhuyjutik05Sop1
   Cm1p0rPvJajQwEd2Cnsd/qVPbuAhvxsB+SIKmR9CaD6i7eA/DGEKcKMCN
   NKFJzisL3bc1d71CoKhu913Acphjbgv3fRhY8q8cHKspTmdepCR3gCBib
   vIle+ZJ8RiUchLS/IGjKsmJot+oLkVcVGGhb1Pa4ZnmO4orEt6epARoVe
   VgIQ1CrI+rRpLx5r3p1LoZZgYkw7kuYRGAZ+0TgCrvlVkDaTJMEza1OC2
   Q==;
X-CSE-ConnectionGUID: kJDKujZOSduIF9XlPM2FdQ==
X-CSE-MsgGUID: O6akgbyVSNuJFzIRp4I7ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4408783"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4408783"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 07:35:34 -0800
X-CSE-ConnectionGUID: Sd4bcTWlT0KUVxcvc2JcOg==
X-CSE-MsgGUID: eVqi4fPfTo+Krmh3dpq0VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11884790"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2026 07:26:26 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1F16AA6; Wed, 25 Nov 2026 16:26:23 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>
Subject: [PATCH 8/9] thunderbolt: stream: Introduce USB4STREAM coupling
Date: Wed, 25 Nov 2026 16:26:21 +0100
Message-ID: <20261125152623.456054-9-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261125152623.456054-1-mika.westerberg@linux.intel.com>
References: <20261125152623.456054-1-mika.westerberg@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mika Westerberg (Intel)" <westeri@kernel.org>

When there are multiple hosts involved like host1 <-> host2 <-> host3,
and there is need to forward one stream to another through the middle
host (host2), the simplest way is to run something like:

  # dd if=/dev/tbstream0 of=/dev/tbstream1

However, that involves copying the frames to the userspace and back, and
this is just for one direction (in case of tool such as dd, a custom
application may do this in both directions simultaneously).

We can avoid all this by making a tunnel directly between the leaf
hosts. This does not involve the middle host CPU at all on the data
path. This is called USB4STREAM coupling. It is configured on the middle
host via ConfigFS as before but it will not result a /dev/tbstreamX to
be created:

  # cd /sys/kernel/config/thunderbolt/stream/coupling
  # mkdir -p 0-1.0_0-3.0/data
  # cd 0-1.0_0-3.0/data
  # echo -1 > 0-1.0/in_hopid
  # echo -1 > 0-1.0/out_hopid
  # echo -1 > 0-3.0/in_hopid
  # echo -1 > 0-3.0/out_hopid

Once the XDomains are connected this will create a DMA tunnel directly
between XDomains 0-1 and 0-3 using the HopIDs configured above. Then the
hosts at both ends can use their stream exactly as before.

To get rid of the coupling run rmdir similarly to regular streams:

  # cd /sys/kernel/config/thunderbolt/stream/coupling
  # rmdir -p 0-1.0_0-3.0/data

Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 .../ABI/testing/configfs-thunderbolt_stream   |  82 ++
 drivers/thunderbolt/stream.c                  | 888 +++++++++++++++++-
 2 files changed, 960 insertions(+), 10 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-thunderbolt_stream b/Documentation/ABI/testing/configfs-thunderbolt_stream
index cbecb3d8db50..d4af0596b602 100644
--- a/Documentation/ABI/testing/configfs-thunderbolt_stream
+++ b/Documentation/ABI/testing/configfs-thunderbolt_stream
@@ -96,3 +96,85 @@ Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:
 		Interrupt throttling rate in ns. Lower values can give
 		better latency. The default is 8192 ns.
+
+What:		/sys/kernel/config/thunderbolt/stream/coupling
+Date:		Feb 2027
+KernelVersion:	v7.5
+Contact:	Mika Westerberg <westeri@kernel.org>
+Description:
+		Fixed directory for coupled streams. If this host is
+		connected to two other hosts, for example A <-> B <-> C
+		where B is this host, then B can forward streams between A
+		and C through the routers in its domain.
+
+What:		/sys/kernel/config/thunderbolt/stream/coupling/<pair>
+Date:		Feb 2027
+KernelVersion:	v7.5
+Contact:	Mika Westerberg <westeri@kernel.org>
+Description:
+		Configuration group for a pair of stream services that are
+		coupled together. The <pair> name consists of the two
+		service names separated by "_", for instance
+		"0-1.0_0-3.0". The two must be different and belong to the
+		same domain. The order does not matter and the same two
+		services can be paired only once.
+
+		A service can be part of several pairs, so streams of one
+		host can be forwarded to more than one other host.
+
+		Like with the non-coupled streams the group can be created
+		before either of the two hosts is connected. The couplings
+		below it are established once both of them show up.
+
+What:		/sys/kernel/config/thunderbolt/stream/coupling/<pair>/$name
+Date:		Feb 2027
+KernelVersion:	v7.5
+Contact:	Mika Westerberg <westeri@kernel.org>
+Description:
+		Creates a new coupled stream with $name. The stream is
+		established once in_hopid and out_hopid of both sides
+		have been filled in. If the two hosts announce the
+		HopIDs of a stream with this name they are filled in
+		automatically. Likewise the HopIDs of each side are
+		announced to the host on that side, so it is enough to
+		configure this end.
+
+		There will be no /dev/tbstreamX device for coupled
+		streams.
+
+		Removing the directory tears the tunnel down and this is
+		also the only way to get rid of a coupling.
+
+What:		/sys/kernel/config/thunderbolt/stream/coupling/<pair>/$name/<xdomain>.<service>
+Date:		Feb 2027
+KernelVersion:	v7.5
+Contact:	Mika Westerberg <westeri@kernel.org>
+Description:
+		Holds the HopIDs of one side of the coupling. Both sides are
+		always present, named after the two stream services of
+		<pair>.
+
+What:		/sys/kernel/config/thunderbolt/stream/coupling/<pair>/$name/<xdomain>.<service>/in_hopid
+Date:		Feb 2027
+KernelVersion:	v7.5
+Contact:	Mika Westerberg <westeri@kernel.org>
+Description:
+		In HopID the host on this side of the coupling uses to send
+		packets to this host. It needs to match the out_hopid that
+		host has configured for the stream, and if that host
+		announces it in its XDomain properties it is picked up from
+		there. You can pass -1 for automatic allocation.
+
+		Once both HopIDs are filled in for both services the
+		tunnel will be established. Writing 0 to any of the
+		attributes will tear it down.
+
+What:		/sys/kernel/config/thunderbolt/stream/coupling/<pair>/$name/<xdomain>.<service>/out_hopid
+Date:		Feb 2027
+KernelVersion:	v7.5
+Contact:	Mika Westerberg <westeri@kernel.org>
+Description:
+		Out HopID this host uses to send packets to the host on
+		this side of the coupling. It needs to match the in_hopid
+		that host has configured for the stream. Otherwise this
+		behaves like in_hopid above.
diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index 2661f563b99c..fb6d25694c20 100644
--- a/drivers/thunderbolt/stream.c
+++ b/drivers/thunderbolt/stream.c
@@ -197,6 +197,83 @@ struct tbstream_group {
 	struct list_head dev_list;
 };
 
+/**
+ * struct tbstream_coupling_host - One of the two hosts of a coupling group
+ * @name: Name of the stream service connecting to the host
+ * @stream: The stream if the host is connected, %NULL otherwise
+ */
+struct tbstream_coupling_host {
+	const char *name;
+	struct tbstream *stream;
+};
+
+/**
+ * struct tbstream_coupling_side - One side of a coupling
+ * @group: ConfigFS group, named after the service of that side
+ * @coupling: Coupling this side belongs to
+ * @host: Host this side is facing
+ * @in_hopid: HopID the host on this side uses to send packets to us
+ * @out_hopid: HopID we use to send packets to the host on this side
+ * @in_hopid_alloc: Allocated @in_hopid, %0 if not allocated
+ * @out_hopid_alloc: Allocated @out_hopid, %0 if not allocated
+ */
+struct tbstream_coupling_side {
+	struct config_group group;
+	struct tbstream_coupling *coupling;
+	const struct tbstream_coupling_host *host;
+	int in_hopid;
+	int out_hopid;
+	int in_hopid_alloc;
+	int out_hopid_alloc;
+};
+
+/**
+ * struct tbstream_coupling - Coupled stream between two other hosts
+ * @group: ConfigFS group for the coupling, named after the stream
+ * @cg: Coupling group this coupling belongs to
+ * @side_a: Side facing &tbstream_coupling_group.host_a
+ * @side_b: Side facing &tbstream_coupling_group.host_b
+ * @enabled: The tunnel has been established
+ * @list: Couplings are linked through this in @cg->coupling_list
+ *
+ * This is the ConfigFS directory for a single stream that is forwarded
+ * between the two hosts of @cg. Protected by @cg->lock.
+ */
+struct tbstream_coupling {
+	struct config_group group;
+	struct tbstream_coupling_group *cg;
+	struct tbstream_coupling_side side_a;
+	struct tbstream_coupling_side side_b;
+	bool enabled;
+	struct list_head list;
+};
+
+/**
+ * struct tbstream_coupling_group - ConfigFS group for a pair of connections
+ * @group: ConfigFS group
+ * @host_a: Host named by the first half of the group name
+ * @host_b: Host named by the second half of the group name
+ * @lock: Lock protecting this structure and the couplings below it. May be
+ *	  held while taking &tb.lock so must not be taken the other way
+ *	  around.
+ * @coupling_list: List of couplings
+ * @list: Coupling groups are linked through this in @tbstream_coupling_list
+ *
+ * This is the ConfigFS directory for a pair of connections to two other
+ * hosts. There can be several &struct tbstream_coupling linked through
+ * @coupling_list. When a host is not connected the configuration below
+ * @coupling_list is kept until it comes back. Reference count managed
+ * through @group.
+ */
+struct tbstream_coupling_group {
+	struct config_group group;
+	struct tbstream_coupling_host host_a;
+	struct tbstream_coupling_host host_b;
+	struct mutex lock;
+	struct list_head coupling_list;
+	struct list_head list;
+};
+
 /**
  * struct tbstream - Stream service private data
  * @kref: Reference count
@@ -217,6 +294,13 @@ static DEFINE_IDA(tbstream_indices);
 static DEFINE_MUTEX(tbstream_lock);
 static LIST_HEAD(tbstream_list);
 
+/*
+ * Protects tbstream_coupling_list. If you need to take both
+ * tbstream_lock and this one, take this first.
+ */
+static DEFINE_MUTEX(tbstream_coupling_lock);
+static LIST_HEAD(tbstream_coupling_list);
+
 /* Serializes tbstream_get()/put() */
 static DEFINE_MUTEX(tbstream_kref_lock);
 
@@ -1667,6 +1751,41 @@ to_tbstream_group(struct config_group *group)
 	return container_of(group, struct tbstream_group, group);
 }
 
+static bool
+tbstream_coupling_group_has_service(const struct tbstream_coupling_group *cg,
+				    const char *name)
+{
+	return !strcmp(cg->host_a.name, name) || !strcmp(cg->host_b.name, name);
+}
+
+/* tbstream_coupling_lock must be held */
+static bool
+tbstream_coupling_service_has_name(const char *svc_name, const char *name,
+				   const struct tbstream_coupling_group *skip)
+{
+	struct tbstream_coupling_group *tmp;
+
+	list_for_each_entry(tmp, &tbstream_coupling_list, list) {
+		struct tbstream_coupling *coupling;
+
+		if (tmp == skip)
+			continue;
+		if (!tbstream_coupling_group_has_service(tmp, svc_name))
+			continue;
+
+		guard(mutex)(&tmp->lock);
+
+		list_for_each_entry(coupling, &tmp->coupling_list, list) {
+			struct config_item *item = &coupling->group.cg_item;
+
+			if (!strcmp(config_item_name(item), name))
+				return true;
+		}
+	}
+
+	return false;
+}
+
 static struct config_group *
 tbstream_dev_make_group(struct config_group *group, const char *name)
 {
@@ -1681,6 +1800,14 @@ tbstream_dev_make_group(struct config_group *group, const char *name)
 	if (strlen(name) > TB_PROPERTY_KEY_SIZE)
 		return ERR_PTR(-ENAMETOOLONG);
 
+	/* Both would announce the same property directory */
+	scoped_guard(mutex, &tbstream_coupling_lock) {
+		const char *svc_name = config_item_name(&group->cg_item);
+
+		if (tbstream_coupling_service_has_name(svc_name, name, NULL))
+			return ERR_PTR(-EEXIST);
+	}
+
 	sdev = kzalloc_obj(*sdev);
 	if (!sdev)
 		return ERR_PTR(-ENOMEM);
@@ -1763,15 +1890,21 @@ static const struct config_item_type tbstream_dev_group_type = {
 	.ct_item_ops = &tbstream_item_ops,
 };
 
-static bool tbstream_valid_service_name(const char *name)
+static bool tbstream_valid_service_name(const char *name,
+					unsigned int *domain)
 {
-	unsigned int domain, index;
+	unsigned int d, index;
 	int len = 0;
 	u64 route;
 
-	if (sscanf(name, "%u-%llx.%u%n", &domain, &route, &index, &len) != 3)
+	if (sscanf(name, "%u-%llx.%u%n", &d, &route, &index, &len) != 3)
+		return false;
+	if (len != strlen(name))
 		return false;
-	return len == strlen(name);
+
+	if (domain)
+		*domain = d;
+	return true;
 }
 
 static struct config_group *
@@ -1780,7 +1913,7 @@ tbstream_make_group(struct config_group *group, const char *name)
 	struct tbstream_group *sg;
 	struct tbstream *stream;
 
-	if (!tbstream_valid_service_name(name))
+	if (!tbstream_valid_service_name(name, NULL))
 		return ERR_PTR(-EINVAL);
 
 	sg = kzalloc_obj(*sg);
@@ -1833,6 +1966,732 @@ static struct tbstream_group *tbstream_group_find(struct tbstream *stream)
 	return to_tbstream_group(to_config_group(item));
 }
 
+static inline struct tbstream_coupling_side *
+tbstream_coupling_side_from_item(struct config_item *item)
+{
+	struct config_group *group = to_config_group(item);
+
+	return container_of(group, struct tbstream_coupling_side, group);
+}
+
+/* cg->lock must be held */
+static struct tb_xdomain *
+tbstream_coupling_side_xdomain(struct tbstream_coupling_side *side)
+{
+	struct tbstream *stream = side->host->stream;
+
+	return stream ? tb_service_parent(stream->svc) : NULL;
+}
+
+/* cg->lock must be held */
+static void
+tbstream_coupling_side_update_properties(const struct tbstream_coupling_side *side,
+					 int in_hopid, int out_hopid)
+{
+	struct tbstream *stream = side->host->stream;
+	const char *name = config_item_name(&side->coupling->group.cg_item);
+
+	if (!stream)
+		return;
+
+	if (!service_update_properties(stream->svc, name, in_hopid, out_hopid))
+		tb_service_properties_changed(stream->svc);
+}
+
+/* cg->lock must be held */
+static bool
+tbstream_coupling_side_ready(const struct tbstream_coupling_side *side)
+{
+	return side->host->stream && side->in_hopid_alloc &&
+	       side->out_hopid_alloc;
+}
+
+/* cg->lock must be held */
+static bool tbstream_coupling_ready(const struct tbstream_coupling *coupling)
+{
+	return tbstream_coupling_side_ready(&coupling->side_a) &&
+	       tbstream_coupling_side_ready(&coupling->side_b);
+}
+
+/* cg->lock must be held */
+static int tbstream_coupling_enable(struct tbstream_coupling *coupling)
+{
+	struct tbstream_coupling_side *a = &coupling->side_a;
+	struct tbstream_coupling_side *b = &coupling->side_b;
+	int ret;
+
+	if (coupling->enabled)
+		return 0;
+	if (!tbstream_coupling_ready(coupling))
+		return 0;
+
+	ret = tb_xdomains_enable_paths(tbstream_coupling_side_xdomain(a),
+				       a->in_hopid_alloc, a->out_hopid_alloc,
+				       tbstream_coupling_side_xdomain(b),
+				       b->in_hopid_alloc, b->out_hopid_alloc);
+	if (ret)
+		return ret;
+
+	coupling->enabled = true;
+	return 0;
+}
+
+/* cg->lock must be held */
+static void tbstream_coupling_disable(struct tbstream_coupling *coupling)
+{
+	struct tbstream_coupling_side *a = &coupling->side_a;
+	struct tbstream_coupling_side *b = &coupling->side_b;
+
+	if (!coupling->enabled)
+		return;
+
+	tb_xdomains_disable_paths(tbstream_coupling_side_xdomain(a),
+				  a->in_hopid_alloc, a->out_hopid_alloc,
+				  tbstream_coupling_side_xdomain(b),
+				  b->in_hopid_alloc, b->out_hopid_alloc);
+	coupling->enabled = false;
+}
+
+/* cg->lock must be held */
+static int
+tbstream_coupling_side_alloc_in_hopid(struct tbstream_coupling_side *side,
+				      int hopid)
+{
+	struct tb_xdomain *xd = tbstream_coupling_side_xdomain(side);
+	int ret;
+
+	/* Already allocated */
+	if (hopid > 0 && hopid == side->in_hopid_alloc)
+		return 0;
+	if (hopid < 0 && side->in_hopid_alloc)
+		return 0;
+	if (!hopid) {
+		if (side->in_hopid_alloc)
+			tb_xdomain_release_in_hopid(xd, side->in_hopid_alloc);
+		side->in_hopid_alloc = 0;
+		side->in_hopid = hopid;
+		return 0;
+	}
+	ret = tb_xdomain_alloc_in_hopid(xd, hopid);
+	if (ret < 0)
+		return ret;
+	if (hopid > 0 && hopid != ret) {
+		tb_xdomain_release_in_hopid(xd, ret);
+		return -EBUSY;
+	}
+	if (side->in_hopid_alloc)
+		tb_xdomain_release_in_hopid(xd, side->in_hopid_alloc);
+	side->in_hopid_alloc = side->in_hopid = ret;
+	return 0;
+}
+
+/* cg->lock must be held */
+static int
+tbstream_coupling_side_alloc_out_hopid(struct tbstream_coupling_side *side,
+				       int hopid)
+{
+	struct tb_xdomain *xd = tbstream_coupling_side_xdomain(side);
+	int ret;
+
+	if (hopid > 0 && hopid == side->out_hopid_alloc)
+		return 0;
+	if (hopid < 0 && side->out_hopid_alloc)
+		return 0;
+	if (!hopid) {
+		if (side->out_hopid_alloc)
+			tb_xdomain_release_out_hopid(xd, side->out_hopid_alloc);
+		side->out_hopid_alloc = 0;
+		side->out_hopid = hopid;
+		return 0;
+	}
+	ret = tb_xdomain_alloc_out_hopid(xd, hopid);
+	if (ret < 0)
+		return ret;
+	if (hopid > 0 && hopid != ret) {
+		tb_xdomain_release_out_hopid(xd, ret);
+		return -EBUSY;
+	}
+	if (side->out_hopid_alloc)
+		tb_xdomain_release_out_hopid(xd, side->out_hopid_alloc);
+	side->out_hopid_alloc = side->out_hopid = ret;
+	return 0;
+}
+
+static ssize_t
+tbstream_coupling_side_store_hopid(struct tbstream_coupling_side *side,
+				   const char *buf, size_t count, bool in,
+				   int *hopidp)
+{
+	struct tbstream_coupling *coupling = side->coupling;
+	const char *pair = config_item_name(&coupling->cg->group.cg_item);
+	const char *name = config_item_name(&coupling->group.cg_item);
+	int ret, hopid;
+
+	ret = kstrtoint(buf, 0, &hopid);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&coupling->cg->lock);
+
+	/*
+	 * The HopIDs of a running coupling cannot be changed but
+	 * writing 0 tears it down.
+	 */
+	if (coupling->enabled) {
+		if (hopid)
+			return -EBUSY;
+		tbstream_coupling_disable(coupling);
+	}
+
+	/* The XDomain is not present yet so just store the HopID */
+	if (!tbstream_coupling_side_xdomain(side)) {
+		*hopidp = hopid;
+		return count;
+	}
+
+	if (in)
+		ret = tbstream_coupling_side_alloc_in_hopid(side, hopid);
+	else
+		ret = tbstream_coupling_side_alloc_out_hopid(side, hopid);
+	if (ret)
+		return ret;
+
+	ret = tbstream_coupling_enable(coupling);
+	if (ret) {
+		pr_warn("%s/%s: failed to enable coupling\n", pair, name);
+		/* Keep the HopIDs allocated so that next write retries */
+	}
+
+	tbstream_coupling_side_update_properties(side, side->in_hopid_alloc,
+						 side->out_hopid_alloc);
+	return ret ? ret : count;
+}
+
+static ssize_t
+tbstream_coupling_side_in_hopid_show(struct config_item *item, char *buf)
+{
+	struct tbstream_coupling_side *side =
+		tbstream_coupling_side_from_item(item);
+
+	guard(mutex)(&side->coupling->cg->lock);
+	return sysfs_emit(buf, "%d\n", side->in_hopid);
+}
+
+static ssize_t
+tbstream_coupling_side_in_hopid_store(struct config_item *item,
+				      const char *buf, size_t count)
+{
+	struct tbstream_coupling_side *side =
+		tbstream_coupling_side_from_item(item);
+
+	return tbstream_coupling_side_store_hopid(side, buf, count, true,
+						  &side->in_hopid);
+}
+CONFIGFS_ATTR(tbstream_coupling_side_, in_hopid);
+
+static ssize_t
+tbstream_coupling_side_out_hopid_show(struct config_item *item, char *buf)
+{
+	struct tbstream_coupling_side *side =
+		tbstream_coupling_side_from_item(item);
+
+	guard(mutex)(&side->coupling->cg->lock);
+	return sysfs_emit(buf, "%d\n", side->out_hopid);
+}
+
+static ssize_t
+tbstream_coupling_side_out_hopid_store(struct config_item *item,
+				       const char *buf, size_t count)
+{
+	struct tbstream_coupling_side *side =
+		tbstream_coupling_side_from_item(item);
+
+	return tbstream_coupling_side_store_hopid(side, buf, count, false,
+						  &side->out_hopid);
+}
+CONFIGFS_ATTR(tbstream_coupling_side_, out_hopid);
+
+static struct configfs_attribute *tbstream_coupling_side_attrs[] = {
+	&tbstream_coupling_side_attr_in_hopid,
+	&tbstream_coupling_side_attr_out_hopid,
+	NULL,
+};
+
+static const struct config_item_type tbstream_coupling_side_type = {
+	.ct_owner = THIS_MODULE,
+	.ct_attrs = tbstream_coupling_side_attrs,
+};
+
+/* cg->lock must be held */
+static void
+tbstream_coupling_side_release_hopids(struct tbstream_coupling_side *side)
+{
+	struct tb_xdomain *xd;
+
+	xd = tbstream_coupling_side_xdomain(side);
+	if (!xd)
+		return;
+
+	tbstream_coupling_side_update_properties(side, 0, 0);
+
+	if (side->out_hopid_alloc) {
+		tb_xdomain_release_out_hopid(xd, side->out_hopid_alloc);
+		side->out_hopid_alloc = 0;
+	}
+	if (side->in_hopid_alloc) {
+		tb_xdomain_release_in_hopid(xd, side->in_hopid_alloc);
+		side->in_hopid_alloc = 0;
+	}
+}
+
+static void tbstream_coupling_item_release(struct config_item *item)
+{
+	struct config_group *g = to_config_group(item);
+	struct tbstream_coupling *coupling = container_of(g,
+		struct tbstream_coupling, group);
+
+	configfs_remove_default_groups(&coupling->group);
+	kfree(coupling);
+}
+
+static struct configfs_item_operations tbstream_coupling_item_ops = {
+	.release = tbstream_coupling_item_release,
+};
+
+static const struct config_item_type tbstream_coupling_type = {
+	.ct_owner = THIS_MODULE,
+	.ct_item_ops = &tbstream_coupling_item_ops,
+};
+
+static inline struct tbstream_coupling_group *
+to_tbstream_coupling_group(struct config_group *group)
+{
+	return container_of(group, struct tbstream_coupling_group, group);
+}
+
+/* coupling->cg->lock must be held */
+static void tbstream_coupling_attach_side(struct tbstream_coupling_side *side)
+{
+	struct tbstream_coupling *coupling = side->coupling;
+	const char *pair = config_item_name(&coupling->cg->group.cg_item);
+	const char *name = config_item_name(&coupling->group.cg_item);
+	struct tb_service *svc = side->host->stream->svc;
+	int ret;
+
+	/*
+	 * If the user did not configure this side, see if the host on
+	 * it announces the HopIDs of this stream and use those.
+	 */
+	if (side->in_hopid <= 0 && side->out_hopid <= 0)
+		service_get_hopids(svc, name, &side->in_hopid,
+				   &side->out_hopid);
+
+	/*
+	 * The HopIDs were released when the host went away so allocate
+	 * them again using the configured values.
+	 */
+	if (side->in_hopid) {
+		ret = tbstream_coupling_side_alloc_in_hopid(side, side->in_hopid);
+		if (ret) {
+			pr_warn("%s/%s: failed to allocate in HopID %d\n",
+				pair, name, side->in_hopid);
+			return;
+		}
+	}
+	if (side->out_hopid) {
+		ret = tbstream_coupling_side_alloc_out_hopid(side, side->out_hopid);
+		if (ret) {
+			pr_warn("%s/%s: failed to allocate out HopID %d\n",
+				pair, name, side->out_hopid);
+			return;
+		}
+	}
+
+	/*
+	 * Announce the HopIDs to the host as well in case user
+	 * configured them.
+	 */
+	tbstream_coupling_side_update_properties(side, side->in_hopid_alloc,
+						 side->out_hopid_alloc);
+
+	if (tbstream_coupling_enable(coupling))
+		pr_warn("%s/%s: failed to establish coupling\n", pair, name);
+}
+
+/* tbstream_group.cg_subsys->su_mutex must be held */
+static bool tbstream_dev_service_has_name(const char *svc_name,
+					  const char *name)
+{
+	struct tbstream_group *sg;
+	struct config_item *item;
+	bool found = false;
+
+	item = config_group_find_item(&tbstream_group, svc_name);
+	if (!item)
+		return false;
+
+	sg = to_tbstream_group(to_config_group(item));
+	scoped_guard(mutex, &sg->lock) {
+		struct tbstream_dev *sdev;
+
+		list_for_each_entry(sdev, &sg->dev_list, list) {
+			struct config_item *sitem = &sdev->group.cg_item;
+
+			if (!strcmp(config_item_name(sitem), name)) {
+				found = true;
+				break;
+			}
+		}
+	}
+
+	config_item_put(item);
+	return found;
+}
+
+/* tbstream_coupling_lock must be held */
+static bool
+tbstream_coupling_host_has_name(const struct tbstream_coupling_group *cg,
+				const struct tbstream_coupling_host *host,
+				const char *name)
+{
+	return tbstream_coupling_service_has_name(host->name, name, cg) ||
+	       tbstream_dev_service_has_name(host->name, name);
+}
+
+/* tbstream_coupling_lock must be held */
+static bool
+tbstream_coupling_name_taken(const struct tbstream_coupling_group *cg,
+			     const char *name)
+{
+	return tbstream_coupling_host_has_name(cg, &cg->host_a, name) ||
+	       tbstream_coupling_host_has_name(cg, &cg->host_b, name);
+}
+
+static void tbstream_coupling_init_side(struct tbstream_coupling *coupling,
+					struct tbstream_coupling_side *side,
+					const struct tbstream_coupling_host *host)
+{
+	side->coupling = coupling;
+	side->host = host;
+	config_group_init_type_name(&side->group, host->name,
+				    &tbstream_coupling_side_type);
+	configfs_add_default_group(&side->group, &coupling->group);
+}
+
+static struct config_group *
+tbstream_coupling_make_group(struct config_group *group, const char *name)
+{
+	struct tbstream_coupling_group *cg = to_tbstream_coupling_group(group);
+	struct tbstream_coupling *coupling;
+
+	/* The name is used as a property directory name as well */
+	if (strlen(name) > TB_PROPERTY_KEY_SIZE)
+		return ERR_PTR(-ENAMETOOLONG);
+
+	guard(mutex)(&tbstream_coupling_lock);
+
+	if (tbstream_coupling_name_taken(cg, name))
+		return ERR_PTR(-EEXIST);
+
+	coupling = kzalloc_obj(*coupling, GFP_KERNEL);
+	if (!coupling)
+		return ERR_PTR(-ENOMEM);
+
+	coupling->cg = cg;
+	INIT_LIST_HEAD(&coupling->list);
+	config_group_init_type_name(&coupling->group, name,
+				    &tbstream_coupling_type);
+
+	/*
+	 * Both sides are always present as sub-directories named after
+	 * the services they belong to.
+	 */
+	tbstream_coupling_init_side(coupling, &coupling->side_a, &cg->host_a);
+	tbstream_coupling_init_side(coupling, &coupling->side_b, &cg->host_b);
+
+	scoped_guard(mutex, &cg->lock) {
+		list_add_tail(&coupling->list, &cg->coupling_list);
+		/*
+		 * If the host is already connected see if we can attach
+		 * coupling to it now.
+		 */
+		if (cg->host_a.stream)
+			tbstream_coupling_attach_side(&coupling->side_a);
+		if (cg->host_b.stream)
+			tbstream_coupling_attach_side(&coupling->side_b);
+	}
+
+	return &coupling->group;
+}
+
+static void tbstream_coupling_detach(struct tbstream_coupling *coupling)
+{
+	tbstream_coupling_disable(coupling);
+	tbstream_coupling_side_release_hopids(&coupling->side_b);
+	tbstream_coupling_side_release_hopids(&coupling->side_a);
+}
+
+static void tbstream_coupling_drop_item(struct config_group *group,
+					struct config_item *item)
+{
+	struct tbstream_coupling_group *cg = to_tbstream_coupling_group(group);
+	struct config_group *g = to_config_group(item);
+	struct tbstream_coupling *coupling =
+		container_of(g, struct tbstream_coupling, group);
+
+	scoped_guard(mutex, &cg->lock) {
+		tbstream_coupling_detach(coupling);
+		list_del(&coupling->list);
+	}
+
+	config_item_put(item);
+}
+
+static struct configfs_group_operations tbstream_coupling_group_ops = {
+	.make_group = tbstream_coupling_make_group,
+	.drop_item = tbstream_coupling_drop_item,
+};
+
+static void tbstream_coupling_group_item_release(struct config_item *item)
+{
+	struct tbstream_coupling_group *cg =
+		to_tbstream_coupling_group(to_config_group(item));
+
+	tbstream_put(cg->host_b.stream);
+	tbstream_put(cg->host_a.stream);
+	kfree(cg->host_b.name);
+	kfree(cg->host_a.name);
+	kfree(cg);
+}
+
+static struct configfs_item_operations tbstream_coupling_group_item_ops = {
+	.release = tbstream_coupling_group_item_release,
+};
+
+static const struct config_item_type tbstream_coupling_group_type = {
+	.ct_owner = THIS_MODULE,
+	.ct_group_ops = &tbstream_coupling_group_ops,
+	.ct_item_ops = &tbstream_coupling_group_item_ops,
+};
+
+/*
+ * The coupling group name is "<service>_<service>", for example
+ * "0-1.0_0-3.0". Splits it into the names of @cg->host_a and
+ * @cg->host_b and validates both halves.
+ */
+static int tbstream_coupling_split_name(struct tbstream_coupling_group *cg,
+					const char *name)
+{
+	unsigned int domain_a, domain_b;
+	const char *sep;
+
+	sep = strchr(name, '_');
+	if (!sep)
+		return -EINVAL;
+
+	cg->host_a.name = kmemdup_nul(name, sep - name, GFP_KERNEL);
+	cg->host_b.name = kstrdup(sep + 1, GFP_KERNEL);
+	if (!cg->host_a.name || !cg->host_b.name)
+		return -ENOMEM;
+
+	if (!tbstream_valid_service_name(cg->host_a.name, &domain_a) ||
+	    !tbstream_valid_service_name(cg->host_b.name, &domain_b))
+		return -EINVAL;
+
+	/* A host cannot be coupled to itself */
+	if (!strcmp(cg->host_a.name, cg->host_b.name))
+		return -EINVAL;
+
+	/* The path is programmed through this domain so both need to be here */
+	if (domain_a != domain_b)
+		return -EINVAL;
+
+	return 0;
+}
+
+/* tbstream_coupling_lock must be held */
+static bool
+tbstream_coupling_pair_exists(const struct tbstream_coupling_group *cg)
+{
+	const struct tbstream_coupling_group *tmp;
+
+	list_for_each_entry(tmp, &tbstream_coupling_list, list) {
+		if (!strcmp(tmp->host_a.name, cg->host_b.name) &&
+		    !strcmp(tmp->host_b.name, cg->host_a.name))
+			return true;
+	}
+
+	return false;
+}
+
+static struct tbstream_coupling_host *
+tbstream_coupling_find_host(struct tbstream_coupling_group *cg,
+			    const char *svc_name)
+{
+	if (sysfs_streq(cg->host_a.name, svc_name))
+		return &cg->host_a;
+	if (sysfs_streq(cg->host_b.name, svc_name))
+		return &cg->host_b;
+	return NULL;
+}
+
+static int tbstream_coupling_group_add(struct tbstream_coupling_group *cg,
+				       const char *name)
+{
+	int ret;
+
+	ret = tbstream_coupling_split_name(cg, name);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&tbstream_coupling_lock);
+
+	/* The same two services can be paired only once */
+	if (tbstream_coupling_pair_exists(cg))
+		return -EEXIST;
+
+	/* Attach the streams that are already around */
+	scoped_guard(mutex, &tbstream_lock) {
+		struct tbstream *stream;
+
+		list_for_each_entry(stream, &tbstream_list, list) {
+			struct tbstream_coupling_host *host;
+
+			host = tbstream_coupling_find_host(cg,
+					dev_name(&stream->svc->dev));
+			if (host && !host->stream)
+				host->stream = tbstream_get(stream);
+		}
+	}
+
+	config_group_init_type_name(&cg->group, name,
+				    &tbstream_coupling_group_type);
+	list_add_tail(&cg->list, &tbstream_coupling_list);
+	return 0;
+}
+
+static struct config_group *
+tbstream_coupling_group_make_group(struct config_group *group, const char *name)
+{
+	struct tbstream_coupling_group *cg;
+	int ret;
+
+	cg = kzalloc_obj(*cg, GFP_KERNEL);
+	if (!cg)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&cg->lock);
+	INIT_LIST_HEAD(&cg->coupling_list);
+	INIT_LIST_HEAD(&cg->list);
+
+	ret = tbstream_coupling_group_add(cg, name);
+	if (ret) {
+		kfree(cg->host_b.name);
+		kfree(cg->host_a.name);
+		kfree(cg);
+		return ERR_PTR(ret);
+	}
+
+	return &cg->group;
+}
+
+static void tbstream_coupling_group_drop_item(struct config_group *group,
+					      struct config_item *item)
+{
+	struct tbstream_coupling_group *cg =
+		to_tbstream_coupling_group(to_config_group(item));
+
+	scoped_guard(mutex, &tbstream_coupling_lock)
+		list_del(&cg->list);
+
+	config_item_put(item);
+}
+
+static struct configfs_group_operations tbstream_coupling_dir_ops = {
+	.make_group = tbstream_coupling_group_make_group,
+	.drop_item = tbstream_coupling_group_drop_item,
+};
+
+static const struct config_item_type tbstream_coupling_dir_type = {
+	.ct_owner = THIS_MODULE,
+	.ct_group_ops = &tbstream_coupling_dir_ops,
+};
+
+static struct config_group tbstream_coupling_dir;
+
+static struct tbstream_coupling_side *
+tbstream_coupling_side(struct tbstream_coupling *coupling,
+		       const struct tbstream_coupling_host *host)
+{
+	if (host == &coupling->cg->host_a)
+		return &coupling->side_a;
+	return &coupling->side_b;
+}
+
+/* tbstream_coupling_lock must be held */
+static void tbstream_coupling_attach_stream(struct tbstream *stream)
+{
+	const char *name = dev_name(&stream->svc->dev);
+	struct tbstream_coupling_group *cg;
+
+	list_for_each_entry(cg, &tbstream_coupling_list, list) {
+		struct tbstream_coupling_host *host;
+		struct tbstream_coupling *coupling;
+
+		guard(mutex)(&cg->lock);
+
+		host = tbstream_coupling_find_host(cg, name);
+		if (!host)
+			continue;
+		if (WARN_ON(host->stream))
+			continue;
+
+		host->stream = tbstream_get(stream);
+
+		list_for_each_entry(coupling, &cg->coupling_list, list) {
+			struct tbstream_coupling_side *side;
+
+			side = tbstream_coupling_side(coupling, host);
+			tbstream_coupling_attach_side(side);
+		}
+	}
+}
+
+/* cg->lock must be held */
+static void
+tbstream_coupling_group_detach_host(struct tbstream_coupling_group *cg,
+				    struct tbstream_coupling_host *host)
+{
+	struct tbstream_coupling *coupling;
+
+	list_for_each_entry_reverse(coupling, &cg->coupling_list, list) {
+		struct tbstream_coupling_side *side;
+
+		tbstream_coupling_disable(coupling);
+		/* Release the ones for the host that is gone */
+		side = tbstream_coupling_side(coupling, host);
+		tbstream_coupling_side_release_hopids(side);
+	}
+
+	tbstream_put(host->stream);
+	host->stream = NULL;
+}
+
+/* tbstream_coupling_lock must be held */
+static void tbstream_coupling_detach_stream(struct tbstream *stream)
+{
+	struct tbstream_coupling_group *cg;
+
+	list_for_each_entry(cg, &tbstream_coupling_list, list) {
+		guard(mutex)(&cg->lock);
+
+		if (cg->host_a.stream == stream)
+			tbstream_coupling_group_detach_host(cg, &cg->host_a);
+		else if (cg->host_b.stream == stream)
+			tbstream_coupling_group_detach_host(cg, &cg->host_b);
+	}
+}
+
 static void tbstream_group_attach_stream(struct tbstream *stream)
 {
 	struct tbstream_group *sg;
@@ -1898,9 +2757,11 @@ static int tbstream_probe(struct tb_service *svc)
 	stream->svc = tb_service_get(svc);
 	INIT_LIST_HEAD(&stream->list);
 
-	scoped_guard(mutex, &tbstream_lock)
-		list_add_tail(&stream->list, &tbstream_list);
-
+	scoped_guard(mutex, &tbstream_coupling_lock) {
+		scoped_guard(mutex, &tbstream_lock)
+			list_add_tail(&stream->list, &tbstream_list);
+		tbstream_coupling_attach_stream(stream);
+	}
 	tbstream_group_attach_stream(stream);
 	tb_service_set_drvdata(svc, stream);
 	return 0;
@@ -1910,9 +2771,12 @@ static void tbstream_remove(struct tb_service *svc)
 {
 	struct tbstream *stream = tb_service_get_drvdata(svc);
 
+	scoped_guard(mutex, &tbstream_coupling_lock) {
+		tbstream_coupling_detach_stream(stream);
+		scoped_guard(mutex, &tbstream_lock)
+			list_del(&stream->list);
+	}
 	tbstream_group_detach_stream(stream);
-	scoped_guard(mutex, &tbstream_lock)
-		list_del(&stream->list);
 	tbstream_put(stream);
 }
 
@@ -2008,6 +2872,10 @@ static int __init tbstream_init(void)
 		goto err_free_dir;
 
 	config_group_init(&tbstream_group);
+	config_group_init_type_name(&tbstream_coupling_dir, "coupling",
+				    &tbstream_coupling_dir_type);
+	configfs_add_default_group(&tbstream_coupling_dir, &tbstream_group);
+
 	ret = tb_configfs_register_group(&tbstream_group);
 	if (ret)
 		goto err_unregister_dir;
-- 
2.50.1


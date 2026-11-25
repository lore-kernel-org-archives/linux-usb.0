Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620672;
	b=vysbs/apauLECVyZ8ypJSF+MpbdUNNK3LXbsw4+G4ZzW1K9KuSIG4s4T7XifKFUehBUF
	 RH8irGID198H1eOH7Gl6+SCLtRz2HNXSiJ1lxW6CN6scx+7R8IqJfdeVIBLK9/OsJJesL
	 AjyBh7/vkihVXv9JTO4MhbbglCD71pofoOQ4vGpNajkfJAbEb48XjnR63JMn3PwGqgR7J
	 /OaCTv0bLO2sKBIMU96jt9LLnGYbiV9se/yP+mF71bGSPeNeknPYO5271Q0VNKbW3gRfv
	 rarZrvYgXhyEjnjnSI6MdCOS+RSs1kZcJcCEz4KHWRw6jHDiWfJGaBQYYDkDBvpkp0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620672;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oGKGKKT711RuUe86ZabOCR5VtzD/T3EZ7RTXDxz53po=;
	b=mewtA8ywp0uBC2FndWBULdiZSi4nx5yrt0+a9/uROsrccPHIR2ZHxS5pOQnt8hIEaE0C
	 D+YKaxIjyBD/9N0OdRLZ9kxos1TdecvNvxyTDsTi3GU7UjQwCdfJgsrfmWoAp4iQxvp71
	 ksJ9KBJBgVmjX7q5EtVS1Q+lyw0fgxjlKnHcgYDe3krfHqIEiiRS49COiweCBTMT5rago
	 6n1gSBsoGfn5yxavoFY27HcqOLR7k5lKukKqREvPzIPU43tGXXqJL11rQ3oRhpmBt+5a0
	 sG4ItfasTGgnOG4r/frHPgvqODWeOUmgRuSmvyIzCmPwcy96wmbtid6St43G5OiA35g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VWFQcebl;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5859606A334
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5859606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VWFQcebl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795620672; x=1827156672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MBBsBOld3G0JHtrAL2oAaitq5fHbwV1w9E2ioigdHZs=;
  b=VWFQcebliEa1aNDJ9x2jNjSEE+puRSKwkwlijMGC/TquT3/QGT9/sqUh
   LTUoh71GSqA3B3vVUeVs+PWk+vJhSy/GCzZ8qNAeTzLXaUiE++I98pleJ
   gVVbWmMcrzbmRvpzKO+4QgSsIKBK7D/5+B2JzJ/DmRNv05duxwuMKluhG
   weo2uCVvK0vmX1S2IuqV9f1pqE3hDqaQdszsl7z8yx2ikryJer6GfjRZg
   rZnbDGPSRhpwkxk5piFUk5YAqKK9tK3k6e8S2E207LDK5VGWAShkb5mba
   hTS9yetxTgs5djwcbYOyFR5jHIEhkyTNbsrcCtU/Y6BaIeRFgGPeALM4q
   A==;
X-CSE-ConnectionGUID: a/98By3nRjaEAO8WoC7xwA==
X-CSE-MsgGUID: vIqL2S9PRRi8RuJCgcyX5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4408249"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4408249"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 07:26:28 -0800
X-CSE-ConnectionGUID: GAlZst1vRlaeTJOKstonng==
X-CSE-MsgGUID: lQiJvSGYQuKFpUbeD5mtug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13938533"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 25 Nov 2026 07:26:24 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0FE899E; Wed, 25 Nov 2026 16:26:23 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>
Subject: [PATCH 3/9] thunderbolt: stream: Keep better track of the HopIDs
Date: Wed, 25 Nov 2026 16:26:16 +0100
Message-ID: <20261125152623.456054-4-mika.westerberg@linux.intel.com>
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

Currently if a HopID is already taken and we try to allocate that with
previous HopID already set like this (HopID 10 is already allocated)

  # echo 9 > in_hopid
  # echo 10 > in_hopid

In the second echo we release 9 but since allocation of 10 fails we
return -EBUSY and leave 9 as ->in_hopid. If at this point the stream is
removed with rmdir we release 9 again which results WARN() from
ida_free().

Make this work better so that we keep track of what we actually have
allocated and keep the configured value as separate.

Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/stream.c | 77 +++++++++++++++++++++++++-----------
 1 file changed, 53 insertions(+), 24 deletions(-)

diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index c9e1987a6924..2b73f585ccff 100644
--- a/drivers/thunderbolt/stream.c
+++ b/drivers/thunderbolt/stream.c
@@ -128,6 +128,8 @@ struct tbstream_ring {
  * @index: Unique identifier for the character device
  * @in_hopid: In HopID
  * @out_hopid: Out HopID
+ * @in_hopid_alloc: Allocated @in_hopid, %0 if not allocated
+ * @out_hopid_alloc: Allocated @out_hopid, %0 if not allocated
  * @ring_size: Size of the rings
  * @throttling: Interrupt throttling rate in ns
  * @busy_poll: Instead of interrupts, busy poll the rings
@@ -145,6 +147,11 @@ struct tbstream_ring {
  * @close_received is used on write side to notify the writer that the
  * other side sent CLOSE. @closed on the other hand is used on the read
  * side to make read(2) return EOF to the caller.
+ *
+ * @in_hopid and @out_hopid are the values configured by the user and
+ * stay (except %-1 which will be replaced by an automatically allocated
+ * HopID). @in_hopid_alloc and @out_hopid_alloc are the currently
+ * allocated values based on those.
  */
 struct tbstream_dev {
 	struct config_group group;
@@ -154,6 +161,8 @@ struct tbstream_dev {
 	int index;
 	int in_hopid;
 	int out_hopid;
+	int in_hopid_alloc;
+	int out_hopid_alloc;
 	unsigned int ring_size;
 	unsigned int throttling;
 	bool busy_poll;
@@ -308,10 +317,10 @@ static void tbstream_dev_release(struct kref *kref)
 	if (sdev->stream) {
 		struct tb_xdomain *xd = tbstream_dev_xdomain(sdev);
 
-		if (sdev->out_hopid > 0)
-			tb_xdomain_release_out_hopid(xd, sdev->out_hopid);
-		if (sdev->in_hopid > 0)
-			tb_xdomain_release_in_hopid(xd, sdev->in_hopid);
+		if (sdev->out_hopid_alloc)
+			tb_xdomain_release_out_hopid(xd, sdev->out_hopid_alloc);
+		if (sdev->in_hopid_alloc)
+			tb_xdomain_release_in_hopid(xd, sdev->in_hopid_alloc);
 
 		tbstream_put(sdev->stream);
 	}
@@ -344,7 +353,7 @@ static inline int tbstream_dev_valid(const struct tbstream_dev *sdev)
 
 	if (!tbstream_valid(stream))
 		return -ENXIO;
-	if (sdev->in_hopid <= 0 || sdev->out_hopid <= 0)
+	if (!sdev->in_hopid_alloc || !sdev->out_hopid_alloc)
 		return -EINVAL;
 	return 0;
 }
@@ -660,10 +669,10 @@ static int tbstream_dev_start(struct tbstream_dev *sdev)
 	}
 	sdev->rx_ring.ring = ring;
 
-	ret = tb_xdomain_enable_paths(xd, sdev->out_hopid,
-				     sdev->tx_ring.ring->hop,
-				     sdev->in_hopid,
-				     sdev->rx_ring.ring->hop);
+	ret = tb_xdomain_enable_paths(xd, sdev->out_hopid_alloc,
+				      sdev->tx_ring.ring->hop,
+				      sdev->in_hopid_alloc,
+				      sdev->rx_ring.ring->hop);
 	if (ret)
 		goto err_free_rx;
 
@@ -736,9 +745,9 @@ static void tbstream_dev_stop(struct tbstream_dev *sdev)
 
 	xd = tbstream_dev_xdomain(sdev);
 	if (xd) {
-		tb_xdomain_disable_paths(xd, sdev->out_hopid,
+		tb_xdomain_disable_paths(xd, sdev->out_hopid_alloc,
 					 sdev->tx_ring.ring->hop,
-					 sdev->in_hopid,
+					 sdev->in_hopid_alloc,
 					 sdev->rx_ring.ring->hop);
 	}
 
@@ -1331,7 +1340,8 @@ static int tbstream_dev_update_properties(struct tbstream_dev *sdev)
 
 	ret = service_update_properties(stream->svc,
 					config_item_name(&sdev->group.cg_item),
-					sdev->in_hopid, sdev->out_hopid);
+					sdev->in_hopid_alloc,
+					sdev->out_hopid_alloc);
 	if (!ret)
 		tb_service_properties_changed(stream->svc);
 
@@ -1344,9 +1354,15 @@ static int tbstream_dev_alloc_in_hopid(struct tbstream_dev *sdev, int hopid)
 	struct tb_xdomain *xd = tbstream_dev_xdomain(sdev);
 	int ret;
 
-	if (sdev->in_hopid > 0 && sdev->in_hopid != hopid)
-		tb_xdomain_release_in_hopid(xd, sdev->in_hopid);
+	/* Already allocated */
+	if (hopid > 0 && hopid == sdev->in_hopid_alloc)
+		return 0;
+	if (hopid < 0 && sdev->in_hopid_alloc)
+		return 0;
 	if (!hopid) {
+		if (sdev->in_hopid_alloc)
+			tb_xdomain_release_in_hopid(xd, sdev->in_hopid_alloc);
+		sdev->in_hopid_alloc = 0;
 		sdev->in_hopid = hopid;
 		return 0;
 	}
@@ -1361,7 +1377,9 @@ static int tbstream_dev_alloc_in_hopid(struct tbstream_dev *sdev, int hopid)
 		tb_xdomain_release_in_hopid(xd, ret);
 		return -EBUSY;
 	}
-	sdev->in_hopid = ret;
+	if (sdev->in_hopid_alloc)
+		tb_xdomain_release_in_hopid(xd, sdev->in_hopid_alloc);
+	sdev->in_hopid_alloc = sdev->in_hopid = ret;
 	return 0;
 }
 
@@ -1370,9 +1388,14 @@ static int tbstream_dev_alloc_out_hopid(struct tbstream_dev *sdev, int hopid)
 	struct tb_xdomain *xd = tbstream_dev_xdomain(sdev);
 	int ret;
 
-	if (sdev->out_hopid > 0 && sdev->out_hopid != hopid)
-		tb_xdomain_release_out_hopid(xd, sdev->out_hopid);
+	if (hopid > 0 && hopid == sdev->out_hopid_alloc)
+		return 0;
+	if (hopid < 0 && sdev->out_hopid_alloc)
+		return 0;
 	if (!hopid) {
+		if (sdev->out_hopid_alloc)
+			tb_xdomain_release_out_hopid(xd, sdev->out_hopid_alloc);
+		sdev->out_hopid_alloc = 0;
 		sdev->out_hopid = hopid;
 		return 0;
 	}
@@ -1383,7 +1406,9 @@ static int tbstream_dev_alloc_out_hopid(struct tbstream_dev *sdev, int hopid)
 		tb_xdomain_release_out_hopid(xd, ret);
 		return -EBUSY;
 	}
-	sdev->out_hopid = ret;
+	if (sdev->out_hopid_alloc)
+		tb_xdomain_release_out_hopid(xd, sdev->out_hopid_alloc);
+	sdev->out_hopid_alloc = sdev->out_hopid = ret;
 	return 0;
 }
 
@@ -1597,8 +1622,8 @@ tbstream_dev_attach_stream(struct tbstream_dev *sdev, struct tbstream_group *sg)
 			tbstream_dev_alloc_out_hopid(sdev, sdev->out_hopid);
 	}
 
-	service_update_properties(stream->svc, name, sdev->in_hopid,
-				  sdev->out_hopid);
+	service_update_properties(stream->svc, name, sdev->in_hopid_alloc,
+				  sdev->out_hopid_alloc);
 	tb_service_properties_changed(stream->svc);
 
 	/* Notify any openerers that the stream is now attached */
@@ -1617,10 +1642,14 @@ static void tbstream_dev_detach_stream(struct tbstream_dev *sdev)
 			return;
 		sdev->stream = NULL;
 		xd = tb_service_parent(stream->svc);
-		if (sdev->out_hopid > 0)
-			tb_xdomain_release_out_hopid(xd, sdev->out_hopid);
-		if (sdev->in_hopid > 0)
-			tb_xdomain_release_in_hopid(xd, sdev->in_hopid);
+		if (sdev->out_hopid_alloc) {
+			tb_xdomain_release_out_hopid(xd, sdev->out_hopid_alloc);
+			sdev->out_hopid_alloc = 0;
+		}
+		if (sdev->in_hopid_alloc) {
+			tb_xdomain_release_in_hopid(xd, sdev->in_hopid_alloc);
+			sdev->in_hopid_alloc = 0;
+		}
 	}
 
 	service_update_properties(stream->svc, name, 0, 0);
-- 
2.50.1


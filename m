Received: from esa.hc5016-32.iphmx.com (esa.hc5016-32.iphmx.com [207.54.81.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D809B38F925;
	Sun,  2 Aug 2026 23:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.81.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785713546; cv=none; b=FwA7enRCThVi9moOCnnnFM2xw7GgGtuAalhdJN/meW1z5eBh2Zij4OofaHX1Ir6KDFwxd2iDKxYv+4aaWsGftnQQ6xakHW9dCHyyd+/ylUWYoFW4LT/v1TMfI8dqLuURjR/+Q4b3K0cM3MX8mYfMRkxIIHH2R3Th3AVt1/S0idc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785713546; c=relaxed/simple;
	bh=btWmGqEZ8QceDr+T2z03WHRhyE02ky2StMGbf/dgUrc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dUs9xQL3dnqLf/vD5CTY2VTWqFob6641DRZk12Zu8RXHP9THtLqg0ex0ZlNjrxMai+yWjKWvhQJaarBneR5T7kMgzf80O8f8hUsvlnDWTKyn6ooEN+ePgI00H7YavWj+dwvmCzdcp4ikpZamOam/ZsKVlv4Z9O8DnMFImX8BHlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com; spf=pass smtp.mailfrom=harman.com; dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b=cfc4+Oym; arc=none smtp.client-ip=207.54.81.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b="cfc4+Oym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=harman.com; i=@harman.com; q=dns/txt; s=CES-HARMAN1;
  t=1785713545; x=1817249545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TAD/ToNq9HLEt7BxieHIzpKrFaLmv8RAYarwWiboUOo=;
  b=cfc4+OymnYIPODH+xvh45Jjg8jfCNZkXr3t8bjjaYCnU5eUYCL0JqyjP
   FwGUM6T01TOyOefsem1IXrWdgiIbkaEs7Iho7i3EoeNUmi4RDqllhLsWU
   WhKrxDRTjXX4Gt3SHuT0qyJW13biPjQT5gUYFl9eNO1LwQJbG5yNygVwr
   m6MhnUYgqhszeYDE/JSQEnP/6+cT/PJyJR8Gw3GPY78Qk8l0LYRMn7pfT
   EcFScCEoGyatsyvsG4PTbzbY6+MxBFRFukYnDe2c7zggg70HT7f7QG2Je
   YI7LGzHYNh4BIBWecYEFpxJeMr++3a3KBv4+QyuurENkDaU+OA9kWWho+
   w==;
X-CSE-ConnectionGUID: wjzAAacYRf6GRKZ1sEQx0A==
X-CSE-MsgGUID: R/Ej/5QxQPyJhCneXeSjIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="118025934"
X-IronPort-AV: E=Sophos;i="6.25,201,1779163200"; 
   d="scan'208";a="118025934"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO INMDWSHYB10.ad.harman.com) ([199.27.113.4])
  by esa1.hc5016-32.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 19:31:14 -0400
Received: from INMDWSHYB09.ad.harman.com (10.92.6.246) by
 INMDWSHYB10.ad.harman.com (10.92.6.249) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 3 Aug 2026 05:01:11 +0530
Received: from awsmblx423bs002.localdomain (10.63.34.68) by
 INMDWSHYB09.ad.harman.com (10.92.6.254) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Mon, 3 Aug 2026 05:01:11 +0530
Received: by awsmblx423bs002.localdomain (Postfix, from userid 530975)
	id 6749880059; Sun,  2 Aug 2026 23:31:11 +0000 (UTC)
From: Akshay Gujar <Akshay.Gujar@harman.com>
To: <gregkh@linuxfoundation.org>
CC: <Akshay.Gujar@harman.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <naveen.v@harman.com>, <oneukum@suse.com>,
	<stern@rowland.harvard.edu>
Subject: [PATCH v6 1/3] driver core: add device_enumeration_failure_notify() helper
Date: Sun, 2 Aug 2026 23:31:06 +0000
Message-ID: <20260802233108.70950-2-Akshay.Gujar@harman.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20260802233108.70950-1-Akshay.Gujar@harman.com>
References: <20260802233108.70950-1-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hotpluggable buses may detect that a device is physically present, but
enumeration can fail early due to protocol-level errors. Such failures
are currently only visible via kernel log messages, with no structured
notification to userspace.

Introduce device_enumeration_failure_notify(), a helper in the driver
core that emits a KOBJ_CHANGE uevent with

  DEVICE_ENUMERATION_FAILURE=<failed_id>

The emitting device and the identifier are separate arguments because
the device being enumerated usually does not exist yet. The event is
emitted from a device the bus driver has already registered, and the
identifier names the port or slot that failed.

Signed-off-by: Akshay Gujar <Akshay.Gujar@harman.com>
---
 drivers/base/core.c    | 35 +++++++++++++++++++++++++++++++++++
 include/linux/device.h |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4d026682944f2..af6901799df58 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3830,6 +3830,41 @@ int device_add(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(device_add);
 
+/**
+ * device_enumeration_failure_notify - notify userspace of enumeration failure
+ * @dev: device to emit the uevent from
+ * @failed_id: bus-specific identifier of the port or slot that failed to
+ *             enumerate, e.g. the port device name for USB
+ *
+ * Emit a KOBJ_CHANGE uevent from @dev carrying
+ * DEVICE_ENUMERATION_FAILURE=@failed_id.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ *
+ * See Documentation/ABI/testing/sysfs-uevent for more details.
+ */
+int device_enumeration_failure_notify(struct device *dev,
+				      const char *failed_id)
+{
+	char *envp[2] = { NULL, NULL };
+	int ret;
+
+	if (!failed_id || !*failed_id)
+		return -EINVAL;
+
+	envp[0] = kasprintf(GFP_KERNEL, "DEVICE_ENUMERATION_FAILURE=%s",
+			    failed_id);
+
+	if (!envp[0])
+		return -ENOMEM;
+
+	ret = kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, envp);
+	kfree(envp[0]);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(device_enumeration_failure_notify);
+
 /**
  * device_register - register a device with the system.
  * @dev: pointer to the device structure
diff --git a/include/linux/device.h b/include/linux/device.h
index 7b2baffdd2f55..7dc9b2316ea24 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1394,4 +1394,6 @@ static inline bool device_link_test(const struct device_link *link, u32 flags)
 #define MODULE_ALIAS_CHARDEV_MAJOR(major) \
 	MODULE_ALIAS("char-major-" __stringify(major) "-*")
 
+int device_enumeration_failure_notify(struct device *dev, const char *failed_id);
+
 #endif /* _DEVICE_H_ */
-- 
2.19.0


Received: from esa.hc5016-32.iphmx.com (esa.hc5016-32.iphmx.com [207.54.87.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09390429CF7;
	Wed, 15 Jul 2026 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.87.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115749; cv=none; b=eQ/if7YRVLIZFCyj3HYnahSr3WbOylBKsSCTMim9x5aIUS29hPdGhLns58LXri2mq85ksnVOA58fldkdYrJYzfGXOTKjGnxYGt8Sms0oNCoQ4okF8exHwsonacF92F8cswjXoSzBbklGHVAo5H2kvj+yw1DmCpplmW9uw3pQoy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115749; c=relaxed/simple;
	bh=UJVVeVyl4YQZsDiVjfInSyoglxJpsYizul6Y08XFjbk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nzaaopQCUToSqUs9FJXMkMGAeSNXZM9Xgpuy6aJcF+hoaI4b6ZVvWbaF4Nih2Er3l1RjlJnEQ8ezvS6tJ45qM5f4Ia2+s9YxYqOXqnHCOEDqXMyK6ijx22wA++NxdVVYXc4Jpysvn53xU8IzBXu1DxL4zVhRDtn38VDNkLtmqIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com; spf=pass smtp.mailfrom=harman.com; dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b=W44FiWfz; arc=none smtp.client-ip=207.54.87.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b="W44FiWfz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=harman.com; i=@harman.com; q=dns/txt; s=CES-HARMAN1;
  t=1784115747; x=1815651747;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eMEDJh7vqsXsRSbuj2OoeYWWmVj5OHLR8CSQcRo473A=;
  b=W44FiWfz9WuS88WKcBJ/FOtQasDTKNb/W5NQ+NrAHbki895dkVvDboG+
   Sc1pFNFUvP9Hfz66WM91ByRFnghYPu+GJrjsqns8DAS1cMVZj/U4/Cop+
   UMWILpFEs+I6H4DP977PmGmgJir5Ux1sbzq/h3iFbnV93CoPoY7kz8WLF
   LEM4DmuAQQ1HEPpxoJK60nbkWn0HrvE+zvVveosrFWcUmC55aarODz4+4
   g2fip4w/zWwB6PWv2PQeA2j99RKRNLtnwLGyzcLQSyiVczI15WIsgnROn
   +yO/eGygZCj8MbG3fenM4RRYfKb9XvMHrKYVa/VSeQfeQSwS46+qgkmX0
   A==;
X-CSE-ConnectionGUID: uwQLzCQjQJ6KjZwG7PA9OA==
X-CSE-MsgGUID: DCxfyKALQ9GAJcUqkCfYqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="121183033"
X-IronPort-AV: E=Sophos;i="6.25,165,1779163200"; 
   d="scan'208";a="121183033"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO INMDWSHYB10.ad.harman.com) ([199.27.113.4])
  by esa8.hc5016-32.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:41:17 -0400
Received: from INMDWSHYB09.ad.harman.com (10.92.6.246) by
 INMDWSHYB10.ad.harman.com (10.92.6.249) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 17:11:15 +0530
Received: from awsmblx423bs002.localdomain (10.63.34.68) by
 INMDWSHYB09.ad.harman.com (10.92.6.254) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 17:11:15 +0530
Received: by awsmblx423bs002.localdomain (Postfix, from userid 530975)
	id 200E28BC04; Wed, 15 Jul 2026 11:41:15 +0000 (UTC)
From: Akshay Gujar <Akshay.Gujar@harman.com>
To: <gregkh@linuxfoundation.org>
CC: <Akshay.Gujar@harman.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <naveen.v@harman.com>, <oneukum@suse.com>,
	<stern@rowland.harvard.edu>
Subject: [PATCH v5 1/3] driver core: add device_enumeration_failure_notify() helper
Date: Wed, 15 Jul 2026 11:40:26 +0000
Message-ID: <20260715114028.3627807-2-Akshay.Gujar@harman.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20260715114028.3627807-1-Akshay.Gujar@harman.com>
References: <20260715114028.3627807-1-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hotpluggable buses may detect that a device is physically present,
but enumeration can fail early due to protocol-level errors. Such
failures are currently only visible via kernel log messages, with no
structured notification to userspace.

Introduce device_enumeration_failure_notify(), a helper in the driver
core that emits a KOBJ_CHANGE uevent with

  DEVICE_ENUMERATION_FAILURE=<dev_name>

This helper is intended for use by bus drivers such as USB and PCI.

Signed-off-by: Akshay Gujar <Akshay.Gujar@harman.com>
---
 drivers/base/core.c    | 44 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/device.h |  2 ++
 2 files changed, 46 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4d026682944f2..6694a0c30f61b 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3830,6 +3830,50 @@ int device_add(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(device_add);
 
+/**
+ * device_enumeration_failure_notify - notify userspace of enumeration failure
+ * @dev: device that failed to enumerate a connected child
+ *
+ * Emit a KOBJ_CHANGE uevent with
+ * DEVICE_ENUMERATION_FAILURE=<dev_name>.
+ *
+ * If @dev has not yet emitted its ADD uevent, the event may be sent
+ * from the parent device instead.
+ *
+ * The caller must hold a reference to @dev.
+ *
+ * See Documentation/ABI/testing/sysfs-uevent for more details.
+ */
+void device_enumeration_failure_notify(struct device *dev)
+{
+	char *envp[2] = { NULL, NULL };
+	struct device *uevent_dev;
+
+	if (!dev)
+		return;
+
+	/*
+	 * If enumeration fails before @dev has emitted its ADD uevent, the
+	 * device may still be in an early state (e.g. without a bus or class
+	 * assigned). Emit the event from the parent device instead, while
+	 * including DEVICE_ENUMERATION_FAILURE=<dev_name>.
+	 *
+	 * The caller holds a reference to @dev, so dev->parent remains valid.
+	 */
+	uevent_dev = dev->kobj.state_add_uevent_sent ? dev : dev->parent;
+	if (!uevent_dev)
+		return;
+
+	envp[0] = kasprintf(GFP_KERNEL, "DEVICE_ENUMERATION_FAILURE=%s",
+			    dev_name(dev));
+	if (!envp[0])
+		return;
+
+	kobject_uevent_env(&uevent_dev->kobj, KOBJ_CHANGE, envp);
+	kfree(envp[0]);
+}
+EXPORT_SYMBOL_GPL(device_enumeration_failure_notify);
+
 /**
  * device_register - register a device with the system.
  * @dev: pointer to the device structure
diff --git a/include/linux/device.h b/include/linux/device.h
index 7b2baffdd2f55..39393c76c7ac7 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1394,4 +1394,6 @@ static inline bool device_link_test(const struct device_link *link, u32 flags)
 #define MODULE_ALIAS_CHARDEV_MAJOR(major) \
 	MODULE_ALIAS("char-major-" __stringify(major) "-*")
 
+void device_enumeration_failure_notify(struct device *dev);
+
 #endif /* _DEVICE_H_ */
--
2.19.0


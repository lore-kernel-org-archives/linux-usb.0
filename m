Received: from forward103b.mail.yandex.net (forward103b.mail.yandex.net [178.154.239.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C0A441627
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 14:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787062241; cv=none; b=ude/1oSsi2J5DQ1BHppYaOWj9LSJNCHqg1M1YaDSpFdmMoFHndcUuGuTVTMWROT/Z03T7wUAzODowYNP7l3c1gBD3qUsN/M2/k86EjNxBny3U31j8AzO2D71KlfJLos3lnRkzEAqtHmYdgxkzE1NI1ffgWLdsrKZZcpXZ1uIfKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787062241; c=relaxed/simple;
	bh=ZKWXn3Z2ntqGWP2Xq9wpWw1Ak80qeqxcY1bdqr7l/B4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rvqQRV1WXzUzrufhzzcmAWc5DrsDaYKCFielvekAvZVUeAQl0VF1Q66bDWVxkgBicw6hKpqcRKZJ3B49+3Jc5Mse0R2a54ibfu/mZmgmWEOQZUEWyUMW5if3Z2Th242Dz7NmFXGe9u/ROijZg+m/gl+HM2cHcoaoWh/cak6qBPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=nGMJqWjk; arc=none smtp.client-ip=178.154.239.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="nGMJqWjk"
Received: from mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:69d:0:640:32f2:0])
	by forward103b.mail.yandex.net (postfix) with ESMTPS id 8051CC0030;
	Tue, 18 Aug 2026 17:10:29 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net (smtp) with ESMTPSA id SAWBJjKdD8c0-y7MPcTbq;
	Tue, 18 Aug 2026 17:10:29 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1787062229; bh=/wbdkqWpVe0nUhJF/Ne3SXG1DRDzfeRPNlOV5D7Kz1c=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=nGMJqWjk8AZ+kFyzgiqEAKsDMLACZYRxUIprelNoGR4VHNemB0vP4y+KrLN2/biMn
	 wsRUkWt2w0PIEm0dP7huHgIPiSxgTzkpY3yJyCu9rLvw3KhQ21dONG2QJL0/fDaOzW
	 z75t5ib31DXGHBqE7COMpol/0uD1nOnth+RabyAo=
Authentication-Results: mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] usb: core: sysfs: use string choices helpers
Date: Tue, 18 Aug 2026 17:09:51 +0300
Message-ID: <20260818140951.2656522-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use convenient 'str_yes_no()' and 'str_enabled_disabled()'
helpers instead of hardcoded strings where appropriate.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/usb/core/sysfs.c | 43 +++++++++++++---------------------------
 1 file changed, 14 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index d22dc78457d7..11f6f3fb0259 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -18,6 +18,7 @@
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/quirks.h>
+#include <linux/string_choices.h>
 #include <linux/of.h>
 #include "usb.h"
 
@@ -303,9 +304,9 @@ static DEVICE_ATTR_RO(urbnum);
 static ssize_t ltm_capable_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
-	if (usb_device_supports_ltm(to_usb_device(dev)))
-		return sysfs_emit(buf, "%s\n", "yes");
-	return sysfs_emit(buf, "%s\n", "no");
+	bool ltm = usb_device_supports_ltm(to_usb_device(dev));
+
+	return sysfs_emit(buf, "%s\n", str_yes_no(ltm));
 }
 static DEVICE_ATTR_RO(ltm_capable);
 
@@ -482,15 +483,9 @@ static DEVICE_ATTR_RW(level);
 static ssize_t usb2_hardware_lpm_show(struct device *dev,
 				      struct device_attribute *attr, char *buf)
 {
-	struct usb_device *udev = to_usb_device(dev);
-	const char *p;
-
-	if (udev->usb2_hw_lpm_allowed == 1)
-		p = "enabled";
-	else
-		p = "disabled";
+	bool lpm = to_usb_device(dev)->usb2_hw_lpm_allowed;
 
-	return sysfs_emit(buf, "%s\n", p);
+	return sysfs_emit(buf, "%s\n", str_enabled_disabled(lpm));
 }
 
 static ssize_t usb2_hardware_lpm_store(struct device *dev,
@@ -575,21 +570,16 @@ static ssize_t usb3_hardware_lpm_u1_show(struct device *dev,
 				      struct device_attribute *attr, char *buf)
 {
 	struct usb_device *udev = to_usb_device(dev);
-	const char *p;
-	int rc;
+	bool u1;
 
-	rc = usb_lock_device_interruptible(udev);
-	if (rc < 0)
+	if (usb_lock_device_interruptible(udev) < 0)
 		return -EINTR;
 
-	if (udev->usb3_lpm_u1_enabled)
-		p = "enabled";
-	else
-		p = "disabled";
+	u1 = udev->usb3_lpm_u1_enabled;
 
 	usb_unlock_device(udev);
 
-	return sysfs_emit(buf, "%s\n", p);
+	return sysfs_emit(buf, "%s\n", str_enabled_disabled(u1));
 }
 static DEVICE_ATTR_RO(usb3_hardware_lpm_u1);
 
@@ -597,21 +587,16 @@ static ssize_t usb3_hardware_lpm_u2_show(struct device *dev,
 				      struct device_attribute *attr, char *buf)
 {
 	struct usb_device *udev = to_usb_device(dev);
-	const char *p;
-	int rc;
+	bool u2;
 
-	rc = usb_lock_device_interruptible(udev);
-	if (rc < 0)
+	if (usb_lock_device_interruptible(udev) < 0)
 		return -EINTR;
 
-	if (udev->usb3_lpm_u2_enabled)
-		p = "enabled";
-	else
-		p = "disabled";
+	u2 = udev->usb3_lpm_u2_enabled;
 
 	usb_unlock_device(udev);
 
-	return sysfs_emit(buf, "%s\n", p);
+	return sysfs_emit(buf, "%s\n", str_enabled_disabled(u2));
 }
 static DEVICE_ATTR_RO(usb3_hardware_lpm_u2);
 
-- 
2.55.0


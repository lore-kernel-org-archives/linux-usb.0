Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2FA17A309;
	Tue,  3 Mar 2026 08:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525867; cv=none; b=o9+kGaWHjbpuCoOKkJ13GGlydNoSgDdMzvI//LmSj+vJfApf+Tsi0RY2ecmpscNqb0rkEQ3Hbmslz5/IWiVZWoE/sEfw2JiHFzgh1luFpML6JuH95Gpzz7KRVBDne1YY8CimQcqmat4y8XXzEt5Oe0KUS+EDTVK/ny5nEhLP45U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525867; c=relaxed/simple;
	bh=ELzSUoQGftVo078WhF3sDWAlWbu/RZVUHNZWQfair3k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X/XQmGGtL7yXPWX8ZBHYEUFVEPJnGLP6B+Y+sEFbPh6V7xkxWM+FTAhrzJTOYmPf0R7LNIlyWjDqj5vksbAoE8oTNdsgajqP2HgBRwyPZmV0VocBmGqHdnZ208S6WTNASfA7LJRBxIaw/ve+nItGUQcIMiiRtF05qAJoJJlvC1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PzGXErz8; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PzGXErz8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3F
	wlhv0Wvez68Jaw4iMlP9Lk7lgs6wyYL2UBodaiBo8=; b=PzGXErz8WZpcr0vjzO
	DqAWewo3X8myaJ9GpT57HTTfZ5yukcks23bsh92FR/HYewz1RzKlVGhbHFi5XoGY
	HP9hhx3p2xxLbgub4/XReIu0ceBFYu4Mc/h39Mrigo+jT/EfsJsc5fZrOFmgnLax
	OPOOuSDeHezgVlOyX5zO6bQCI=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCXrHcUmaZpUslFQA--.22953S2;
	Tue, 03 Mar 2026 16:17:25 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] usbip: tools: Add usbip host driver availability check
Date: Tue,  3 Mar 2026 16:17:20 +0800
Message-Id: <20260303081720.84868-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXrHcUmaZpUslFQA--.22953S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr4kuFyfJw4ruF4rGw45KFg_yoWrWF17pF
	WUtFyFkrW8WFsxXwsrtF1fAFW8KwsFq3y0gF1xJw15ursFy347W3sxtFnYkay3GayUXF9F
	yFs0q3srGFyUGw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jn9N3UUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC9BVvG2mmmRWv7wAA3W

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

Currently, usbip_generic_driver_open() doesn't verify that the required
kernel module (usbip-host or usbip-vudc) is actually loaded.
The function returns success even when no driver is present,
leading to usbipd daemon run success without driver loaded.

So add a check function to ensure usbip host driver has been loaded.

Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 tools/usb/usbip/libsrc/usbip_device_driver.c |  2 ++
 tools/usb/usbip/libsrc/usbip_host_common.c   | 31 ++++++++++++++++++++
 tools/usb/usbip/libsrc/usbip_host_common.h   |  2 ++
 tools/usb/usbip/libsrc/usbip_host_driver.c   |  2 ++
 4 files changed, 37 insertions(+)

diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
index 927a151fa9aa..6da000fab26d 100644
--- a/tools/usb/usbip/libsrc/usbip_device_driver.c
+++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
@@ -147,6 +147,8 @@ static int usbip_device_driver_open(struct usbip_host_driver *hdriver)
 struct usbip_host_driver device_driver = {
 	.edev_list = LIST_HEAD_INIT(device_driver.edev_list),
 	.udev_subsystem = "udc",
+	.bus_type = "platform",
+	.drv_name = USBIP_DEVICE_DRV_NAME,
 	.ops = {
 		.open = usbip_device_driver_open,
 		.close = usbip_generic_driver_close,
diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
index ca78aa368476..900370095b61 100644
--- a/tools/usb/usbip/libsrc/usbip_host_common.c
+++ b/tools/usb/usbip/libsrc/usbip_host_common.c
@@ -164,6 +164,31 @@ static void usbip_exported_device_destroy(struct list_head *devs)
 	}
 }
 
+/* Check if the usbip host driver is available in sysfs */
+static int check_driver_available(struct usbip_host_driver *hdriver)
+{
+	char driver_path[SYSFS_PATH_MAX];
+	struct stat st;
+	int ret;
+
+	if (!hdriver->drv_name || !hdriver->bus_type)
+		return 0;
+
+	//Check if the usbip-host or usbip-vudc driver directory exists in sysfs.
+	snprintf(driver_path, sizeof(driver_path), "%s/%s/%s/%s/%s",
+		SYSFS_MNT_PATH, SYSFS_BUS_NAME, hdriver->bus_type,
+		SYSFS_DRIVERS_NAME, hdriver->drv_name);
+
+	ret = stat(driver_path, &st);
+	if (ret == 0 && S_ISDIR(st.st_mode)) {
+		dbg("driver '%s' is available", hdriver->drv_name);
+		return 1;
+	}
+
+	return 0;
+}
+
+
 int usbip_generic_driver_open(struct usbip_host_driver *hdriver)
 {
 	int rc;
@@ -174,6 +199,12 @@ int usbip_generic_driver_open(struct usbip_host_driver *hdriver)
 		return -1;
 	}
 
+	//Check if the required driver is actually available.
+	if (!check_driver_available(hdriver)) {
+		err("please load '%s' kernel module", hdriver->drv_name);
+		goto err;
+	}
+
 	rc = refresh_exported_devices(hdriver);
 	if (rc < 0)
 		goto err;
diff --git a/tools/usb/usbip/libsrc/usbip_host_common.h b/tools/usb/usbip/libsrc/usbip_host_common.h
index f46967c0aa18..cf9bd60846cf 100644
--- a/tools/usb/usbip/libsrc/usbip_host_common.h
+++ b/tools/usb/usbip/libsrc/usbip_host_common.h
@@ -40,6 +40,8 @@ struct usbip_host_driver {
 	/* list of exported device */
 	struct list_head edev_list;
 	const char *udev_subsystem;
+	const char *bus_type;
+	const char *drv_name;
 	struct usbip_host_driver_ops ops;
 };
 
diff --git a/tools/usb/usbip/libsrc/usbip_host_driver.c b/tools/usb/usbip/libsrc/usbip_host_driver.c
index 573e73ec36bd..e8f9d2ee2497 100644
--- a/tools/usb/usbip/libsrc/usbip_host_driver.c
+++ b/tools/usb/usbip/libsrc/usbip_host_driver.c
@@ -41,6 +41,8 @@ static int usbip_host_driver_open(struct usbip_host_driver *hdriver)
 struct usbip_host_driver host_driver = {
 	.edev_list = LIST_HEAD_INIT(host_driver.edev_list),
 	.udev_subsystem = "usb",
+	.bus_type = "usb",
+	.drv_name = USBIP_HOST_DRV_NAME,
 	.ops = {
 		.open = usbip_host_driver_open,
 		.close = usbip_generic_driver_close,
-- 
2.34.1


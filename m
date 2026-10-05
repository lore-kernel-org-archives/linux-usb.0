Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8C1379EE6
	for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2026 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791186762; cv=none; b=pDE2cNE94+e7zn9DifNYjPA2vgFGeofm1Z9YaiAQictLe5YL0FJwGoKOyC0WJpcuS/8tfnI9eRgwQEo3mQg0exzcFzpog+X/PUIC1zwwDUxstgeExwtOccmu/Xng82EGAkQR3fu7QJfc1qShYKHNeaTpxvWNWEkrsLQsm1qzAB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791186762; c=relaxed/simple;
	bh=82r4qovijQ1dYl4fpF5dysLdPQXbMGcexIEnsSETYVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Znj9s120KyzGWJBH9dgrX+oAYcqgHhHtYPPG45yYiEhO9pEQ+BQ6dSplhh6AYHteAZhPxvtYndF5QinHau9AX1zldOiKVkxGp4+h8/PU9rz1fefKHiGdZh0JPesnMvahIFVNC2yStseJAFG/enprupW8s2kj4vUfgCCkDHcp95k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CelSwl3R; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CelSwl3R"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3453dd0dso255148266b.0
        for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2026 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791186759; x=1791791559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hkbmmu29f4ESmjhS/R6fVuQiC+U9d5xHF0gJ/jLHU0E=;
        b=CelSwl3RTr8JSTz99vh2oPK3bQgXmhmwggJLgEX2LDuOAtB+rgsW4E1jjgCzwkp7oK
         5JQaMJcpkvSPxwZzWWTqqfWqTxwqTcf0cVC6aqWG2YV59psGQonjjZwWTn3vMkiqAHsn
         e1Te0XEyVb3AZpJ22AovJzkgxQHnfe0jyW882MY6xEXBdnTICOfOV2qZYlN3KTJp5bGs
         ZjhgXtmRGgBz9TvCPWn40PSobRl/HmZNp0c67u8jkcaSiEPG4jQEfSnjjAUZY8fMUAO9
         22VZZR/KW7NTFRQkK0LO2V/PgDtuSX9C9koMoGqEN/2G5MdeXu0E5VweHVliFa56jnxA
         eBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791186759; x=1791791559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hkbmmu29f4ESmjhS/R6fVuQiC+U9d5xHF0gJ/jLHU0E=;
        b=18BSMwSV7RUaigozDSa1Zmnz7vWqDw+gNHWFXt36bBkFPqDCOx0Kr6OMb0zdsttsCe
         DQXakkFpt484sHV9wC5dsyHDauts0JelgNomY6dvQF1khGTxrNSFbBHDz9gnsn4Yjlf2
         ZTZWBrvMpTJLdZJEyBbBkOXTmveeU1O+9DlosQLjSVj4BsnLw8iPD1vsTJWk/YA6yhpk
         U3e5OQsAVqAvbaQTuzoGYrkypfYk3Is1AOCLrdoNcqagR06zfDohC8X+HIMUtG3RymFR
         tQxaQQ5QeAPRBmcbeBcxpE6Y4NIxeywzVlSD/NtAcyVEB7wOD0OxqOxh0siTBgJQITiq
         REYw==
X-Forwarded-Encrypted: i=1; AKwUvBxpeWBxMOGTmbTOZM0F1yigcytfI06YCtxqD/vFVniiV4wuROnOopOpnHCxhQ5Z7ME8oYdVbPPTC0Q=@vger.kernel.org
X-Gm-Message-State: AFuF++naEI3i6pguljCeq8ExDG6/ve1NkzRl4ta0KTotYH2tlOGEWtDf
	WZXdscId7x6OIQrzxJpB+H/3gnJWNQ3xa+QA0eFTlVksQxgsAsZhokaI
X-Gm-Gg: AYBFou1t3bpNPSrG1K8td4QLIe0Hgmkf7naagC5EFam003xZlwrmh6jlbNCiJLXhsSm
	jUn1DbwHCRBsHnklK+1PoNuj8wPwvKaV5rXBI5Mf1sA+7yXv78rhzk8iJpuco2x6GAyOtb+fDsw
	maiKYGM3Lo6Rzy+KjhAeB1MKarFF/UyjIK/+QM/BdayW0pFQNoJ9wkAbQRvBO1YO9Qyvxi/rOAZ
	OBQLAa/4+hDiOUM7Kn+oY4LQw/bCQGfPBeouXyfPzepxmOH2WgOAL9yQym2tKzV+fPMlYgfDB8Z
	CgekWwAaOd2MeN7BTy6m45igdYJUVOzztkLjS8LlIDz0KDmlTiTGo0g/g2Cbs5hlNTGnXi8mX8N
	z3Ia5p7Q0LaL5kUyO9r5faTHc5VlGtuXeZmzDSaI4M3lHgRGqAo3IMt9yF/d3jvOoamzmQWETgs
	mtmJbctXnbWkq71zq+ZR0ftRgNnkaGh/wXbIDJmSbCyuub6oUHJnydFARQkUhiIOu2wAk3eNOcB
	kg8nbJySwQ/39b+Qlnw
X-Received: by 2002:a17:907:398f:b0:c29:f199:5fa7 with SMTP id a640c23a62f3a-c2e4af87abemr808224266b.44.1791186759326;
        Mon, 05 Oct 2026 00:52:39 -0700 (PDT)
Received: from gentoo (m-37-0-164-22.cust.tele2.lt. [37.0.164.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3157ec8c0esm21330266b.44.2026.10.05.00.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:52:39 -0700 (PDT)
From: Rokas Juras <asrokasjuras@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] rndis_host: enable RX aggregation for OnePlus Nord CE 2
Date: Mon,  5 Oct 2026 10:48:52 +0300
Message-ID: <20261005074852.76818-1-asrokasjuras@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB tethering on the OnePlus Nord CE 2 (IV2201, USB ID 22d9:2766)
running Android 13 has download speeds of approximately 2mbps
with the default 2048-byte receive limit.

The phone's published RNDIS code only enables packet batching
when the computer reports a receive limit above 2048 bytes.
Testing shows that increasing this limit to 2560 bytes
restores normal speeds.

Add a quirk for USB device 22d9:2766 to use and advertise a
receive buffer of at least 16 KiB. This fits the phone code's default
batch of ten packets at a 1500-byte MTU.

Tested on 7.3.0-rc5 with the affected phone, including reconnecting
USB tethering. Download speeds with the change exceed 100mpbs.

Fixes: 7e99eeddb35c ("rndis_host: support WM6 devices as modems")
Link: https://github.com/OnePlusOSS/android_kernel_oneplus_mt6877/blob/3c1e3d432d0c35afa7fded974b50fa6617219e0f/drivers/usb/gadget/function/f_rndis.c#L538-L551
Link: https://github.com/OnePlusOSS/android_kernel_oneplus_mt6877/blob/3c1e3d432d0c35afa7fded974b50fa6617219e0f/drivers/usb/gadget/function/u_ether.c#L869-L874
Assisted-by: LLM
Signed-off-by: Rokas Juras <asrokasjuras@gmail.com>
---
 drivers/net/usb/rndis_host.c   | 21 +++++++++++++++++++++
 include/linux/usb/rndis_host.h |  5 +++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/rndis_host.c b/drivers/net/usb/rndis_host.c
index 37d4865f5..b001bc834 100644
--- a/drivers/net/usb/rndis_host.c
+++ b/drivers/net/usb/rndis_host.c
@@ -345,6 +345,11 @@ generic_rndis_bind(struct usbnet *dev, struct usb_interface *intf, int flags)
 
 	dev->rx_urb_size = dev->hard_mtu + (dev->maxpacket + 1);
 	dev->rx_urb_size &= ~(dev->maxpacket - 1);
+
+	/* some devices require a receive limit above 2048 for RX aggregation */
+	if (dev->driver_info->data & RNDIS_DRIVER_DATA_RX_AGGREGATION)
+		dev->rx_urb_size = max_t(size_t, dev->rx_urb_size, 16 * 1024);
+
 	u.init->max_transfer_size = cpu_to_le32(dev->rx_urb_size);
 
 	net->netdev_ops = &rndis_netdev_ops;
@@ -612,6 +617,17 @@ static const struct driver_info	rndis_info = {
 	.tx_fixup =	rndis_tx_fixup,
 };
 
+static const struct driver_info	rndis_rx_aggregation_info = {
+	.description =	"RNDIS device",
+	.flags =	FLAG_ETHER | FLAG_POINTTOPOINT | FLAG_FRAMING_RN | FLAG_NO_SETINT,
+	.data =		RNDIS_DRIVER_DATA_RX_AGGREGATION,
+	.bind =		rndis_bind,
+	.unbind =	rndis_unbind,
+	.status =	rndis_status,
+	.rx_fixup =	rndis_rx_fixup,
+	.tx_fixup =	rndis_tx_fixup,
+};
+
 static const struct driver_info	rndis_poll_status_info = {
 	.description =	"RNDIS device (poll status before control)",
 	.flags =	FLAG_ETHER | FLAG_POINTTOPOINT | FLAG_FRAMING_RN | FLAG_NO_SETINT,
@@ -649,6 +665,11 @@ static const struct driver_info	rndis_info_lowpower = {
 
 static const struct usb_device_id	products [] = {
 {
+	/* OnePlus Nord CE 2 */
+	USB_DEVICE_AND_INTERFACE_INFO(0x22d9, 0x2766,
+				      USB_CLASS_WIRELESS_CONTROLLER, 1, 3),
+	.driver_info = (unsigned long)&rndis_rx_aggregation_info,
+}, {
 	/* 2Wire HomePortal 1000SW */
 	USB_DEVICE_AND_INTERFACE_INFO(0x1630, 0x0042,
 				      USB_CLASS_COMM, 2 /* ACM */, 0x0ff),
diff --git a/include/linux/usb/rndis_host.h b/include/linux/usb/rndis_host.h
index 489cfb1d0..3eaf57a9b 100644
--- a/include/linux/usb/rndis_host.h
+++ b/include/linux/usb/rndis_host.h
@@ -182,8 +182,9 @@ struct rndis_keepalive_c {	/* IN (optionally OUT) */
 #define FLAG_RNDIS_PHYM_WIRELESS	0x0002
 
 /* Flags for driver_info::data */
-#define RNDIS_DRIVER_DATA_POLL_STATUS	1	/* poll status before control */
-#define RNDIS_DRIVER_DATA_DST_MAC_FIXUP	2	/* device ignores configured MAC address */
+#define RNDIS_DRIVER_DATA_POLL_STATUS		1	/* poll status before control */
+#define RNDIS_DRIVER_DATA_DST_MAC_FIXUP		2	/* device ignores configured MAC address */
+#define RNDIS_DRIVER_DATA_RX_AGGREGATION	4	/* needs RX limit > 2048 */
 
 extern void rndis_status(struct usbnet *dev, struct urb *urb);
 extern int
-- 
2.55.0


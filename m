Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277449;
	b=vlh2HrflgEsdEMSZhZ3K0ql3gc1Ky0ex6nNUQ4cr9csR3ozxGDwv3iL03H0bJRXPRWzQ
	 nWfOsINNerg5hW7ZlvKGWXCKOksTSyLXBbwtfnkpDOncfYhA8KBQf6XUr8EhThr3QL8Wb
	 YQKhK5L/b6pNfAfOe/FWzLtOSUeOlxe9+vqvO7P2IbCtf5sKORlWDn0xXz5XD58O/4r8R
	 1oVb6YN2h5uNtTGLtAc6Kr9inxudKwx6vWXGChTm/29iKvS7TwIOipZcKNILbKeU1eM/V
	 qbOYWU8cfKk5T6TZbveJ9f/1qBU0H4YRziJg39ncesles9xa3mQghj7KDQQwTGZKGtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PrkOtc/OC2AOG+d6nHrznRI3kYXg0qTtORwpIqtDkPQ=;
	b=NMUU7SIe24InjBQ2S+gQQxlDpqOUysOArjj1qmVifyIpvzr2K2tyldbHdm84gl/peQSH
	 eelX2qU/6EIxn6w79D/cUrXzxk4eIeF97ZlkZaeKXCNPTouT++/ZyDIEU+DDrshPrQhb8
	 RuGB0Qc53RKsuT6AOSKWQWvqCCCRYSPjG2FGElts//DLGhPTLZBWcm+fQ6URytgb63nqK
	 5TRVPegdiwatSe907SC/ajjo57vXAcpubo9eykhuCurR80jHOxIk8hRBO6CXt3HUXQd1g
	 lV1+szLxsePqIF3pXjx0TTiGDE5qOUpNqb75qXqKI1MIFNCfsGtoxSoJ6OYi9TcKMDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aKnyin6A;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4922606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4922606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aKnyin6A
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53665358476so14391081cf.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 18:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794277448; x=1794882248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrkOtc/OC2AOG+d6nHrznRI3kYXg0qTtORwpIqtDkPQ=;
        b=aKnyin6APAKufozj8dG1UjPebu0006Nlpvnz+VA1zBbADA+c/oYEXb0kaT2alYARcW
         Grs+j4cN8T94Okbv6b3A4XOKlyhG5JtBFP+EClEvpG0B3lE0uNi7Ssn+CTPd6ERxjK49
         1fkoFoVaNlsWeyO3G5+/dKaIpsgJLGG+2vbURfo4fyss9/GuBv5Hq/6HwN7rkAR84rb9
         6Mob0mj9FHlvb24jnTZ2Q4jO+SqOWd0x1QF+BxM6sT/A3NMURMzwvhKaQgjRGFb/RuI1
         NXYCwEtAFwhm+toCe5l7k7ZN98HdYJQNCcDXFZZnvSRwl7F19yU2w5PluOWQa7PcTPzp
         xjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277448; x=1794882248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrkOtc/OC2AOG+d6nHrznRI3kYXg0qTtORwpIqtDkPQ=;
        b=pwiBD/PPJMHUw8b8BrVZ2y1KPCaW9vtGsjIcvXmTB0QMsZlasBnx/XTN8rdU5xqDgl
         +gE7keAZsChyar9ywoYWgg3mgodsb0j44RnqObQWfofmslnEGV1H7BqgIzVntR5Q1NeY
         8/dsAxhK2NoPPj4Gk0O+rZL6M6K51tG1ys8UhEo+6Nz0q+JREx2l8PC99w9ePq17JO6h
         5AqtwNDUptLAMtFfH4qoppQaPpGkzGCDa4Rbqb+Gi7gsbV0TeQ8/EnsNiw9YN0HbYhaA
         e8ogfGlpkS25mrTSHou2GiUGF0YMAbIhDtwWsfHM3kkKnbEBOKNj+aKVWG2NEKcSJHsx
         Wcbg==
X-Forwarded-Encrypted: i=1; AL+hErFUuMzLrhGmCUqYywDw28LTw0CSBQpYM6w14fV0svivwTDCbaJ1BnPnT1LnFdNqIS3JdesdVv8LlfI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Uw66Wh4jWbBPlWY7pX44rNcljEDNR82+/rZBGMna+IxTB46Br
	v9eelbWFu9eyGjGBHCF5W5n+tyBeoFO+T94ttDc2sCabBTxN6TIunNu6
X-Gm-Gg: AYBFou1yeLzSxU/sY/kYZSL7BtbWGckrNPBXSswDwj5qhYShfuamSA9TT/0EXa2RHep
	71W6IFkRnNnJVEkxRsAe7KAX8JHp4Q5XMG24e93MVkWTt8nAdbiR/vt8MAFrcEmcXZ63bTJjmUv
	PWfsPd0cLhV5jj4qCgtG4r12Z1txZfNw+PR3RyfLQ05dvopo7fhYKQV9WjfOj3IMD4RsPAU1/6h
	iNVL88CD28nqzfTolQwOyHxfEXey1DDLINFUGqVDi8QQZlDkKuV2KOaYO/L1m41t/ra1e0PYOWa
	SrPl5LnuXSsQ3jM/nIGNBkvi6Lr12l9maC/bfWMvOSfLMwPeCAJ7R2wjcUWOMmfw1aTtmZ7/it+
	Sx4IQWTFUj1ygwppIulRWDiVRMFwXZY1nN9p36tF1XSjs0ws5K4Mq4NdUSuwUjWTFQZqV4KIlG8
	sjL/Oh3omOR7t93wtytvu4bWeprnqssjYLLN8bzY+DFSxvBXtIk083+zyzYgu4ny+q9KKMqizy6
	5Dscf0zBowRLiRpWAgYqh3ywUI6gL/J98X5ysLHsCPNWGwDQzc2xef/Ac0qd5gR9qAHcLwa3o0x
	qKQXB3rcHjKNxxEFflhnXiI20ZSh3ESf8Jn2VdCnAJ1/xl+FrkPvuR1tnlyY7HF7kmU=
X-Received: by 2002:ac8:5a42:0:b0:54b:8145:dd3f with SMTP id d75a77b69052e-555283f0ae2mr18654381cf.17.1794277447716;
        Mon, 09 Nov 2026 18:24:07 -0800 (PST)
Received: from nerdopolis2.mynetworksettings.com ([2600:4040:5e70:4900:9dc4:9216:4f52:6891])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550bf2cf01sm12069621cf.25.2026.11.09.18.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:24:07 -0800 (PST)
From: Adam Simonelli <adamsimonelli@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adam Simonelli <adamsimonelli@gmail.com>
Subject: [[PATCH v3]] USB: visor add vendor/device IDs for PalmSource devices from the PalmUSBD.inf file in Palm Desktop 6.2
Date: Mon,  9 Nov 2026 21:23:51 -0500
Message-ID: <20261110022351.302989-1-adamsimonelli@gmail.com>
X-Mailer: git-send-email 2.55.0
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

PalmUSBD.inf from Palm Desktop 6.2's driver defines two PalmSource
devices. While PalmSource only developed the PalmOS, and never made
actualy hardware, as it was Palm Inc. made the Palm hardware, there
is a bootable ROM containing PalmOS 6.1 that can be booted into RAM
on the Tungsten T3. When this ROM is running, when plugged in, the
device will then present the PalmSource vendorid that is defined in
the INI filem and the deviceid then becomes PALMSOURCE_DEVICE_1_ID
the PALMSOURCE_DEVICE_2_ID is also defined for completeness.

Signed-off-by: Adam Simonelli <adamsimonelli@gmail.com>
---
Changes since v1:
 * Fix compile error when changing from 
   PALMSOURCE_DEVICES_2_ID to PALMSOURCE_DEVICE_2_ID
Changes since v2:
 * Add note for what changed in v2

 drivers/usb/serial/visor.c | 6 ++++++
 drivers/usb/serial/visor.h | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/serial/visor.c b/drivers/usb/serial/visor.c
index 5706c46c49c2..18c586d552d7 100644
--- a/drivers/usb/serial/visor.c
+++ b/drivers/usb/serial/visor.c
@@ -75,6 +75,10 @@ static const struct usb_device_id id_table[] = {
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID),
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_1_ID),
+		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_2_ID),
+		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID),
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID),
@@ -133,6 +137,8 @@ static const struct usb_device_id id_table_combined[] = {
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TREO_650) },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TUNGSTEN_Z_ID) },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID) },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_1_ID) },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_2_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_3_5_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID) },
diff --git a/drivers/usb/serial/visor.h b/drivers/usb/serial/visor.h
index 622d639ce74e..0f86bd06c4fe 100644
--- a/drivers/usb/serial/visor.h
+++ b/drivers/usb/serial/visor.h
@@ -32,6 +32,10 @@
 #define PALM_ZIRE_ID			0x0070
 #define PALM_M100_ID			0x0080
 
+#define PALMSOURCE_VENDOR_ID		0x13e8
+#define PALMSOURCE_DEVICE_1_ID		0x0600
+#define PALMSOURCE_DEVICE_2_ID		0xff00
+
 #define GSPDA_VENDOR_ID		0x115e
 #define GSPDA_XPLORE_M68_ID		0xf100
 
-- 
2.55.0


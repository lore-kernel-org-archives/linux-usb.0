Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794006482;
	b=HiqvoznlViLkcCIaa79JTEypuQpkEKhzuWeyvNrKtu2g1OJOmMy5gYMfEVaXgRGITCdY
	 OX745HKR1otDcxOv2ZvlkJEhP8CZ5GlLsQqZtqpME8jNij8oJS8RXluDAfc/yUXeuzzCc
	 46btSlecBhyNoUQI3t0BOBKactQMoBcmm9uMq0bWMeyGvrII/xig2IRseydhL8AXwrt92
	 qUV6QVf/qb1YuONWoi5qcE/jnyxFPQw3yKeKriCmYF4csaPBEVqxGH8HX6hNDykw4PpAa
	 MILMqi8IHXxm+/wCGL8Xp/Pf+25st8OqbbipI/M82UfQiy6CWPw1z6sXuwYjUV5jkKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794006482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DRx7HVaOdJE7DvS2IBVEJ4TVt3eGJMgIXn5m4zK8mAM=;
	b=15Sy+DGMUPESdemT3O+L0GnrbGlWq4YV/dnyXLnzqKDwI6kLJ12kSrAH5fn/c+or1NoB
	 R7VdsZWW1R9nns8Ag6/Oy1G5pNLkaJUdk+dd6b8AiQ7VruM+WTL66pKJkISv+Vbo+bj9N
	 hqtBe1BDQ0x0MA6xNZ3RjvsPAcsdvoogx5/B2i8vDMiKZLayuyQGGFM7sN4kiIFbK9qhv
	 HNyURsQj/H4yhJ4qMwofX/C2gZGVkhzwHO/9XO8dcheJAUkbl4A4dZdoxpx6RuEMv9wKP
	 RvPvOewL5u/GLAhpn79ovQHF9AQMPt2hfUkyfUMl7BnIvtUxA+8WvFs/yVBPjBHrxWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HjJqVZtl;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5D6606A32D
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 23:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5D6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HjJqVZtl
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91e7af9a67fso8215986d6.2
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 15:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794006481; x=1794611281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRx7HVaOdJE7DvS2IBVEJ4TVt3eGJMgIXn5m4zK8mAM=;
        b=HjJqVZtlFEWd/sWH8uevBdwfrw9NRuoctSSBB9Rxonsv7NiCS2NC2/akzy7DcPquI5
         69wSJ2gVJlOx+dutT5/GyotxxWLffpU1ltvogRdJmAKqbxW5dXNppTZ1nsywoEvqJXtv
         IF2P6tdcTfBSzbS9vkvo4sPtS/WqvIgsjm6DcUm6rb6q5TD8lHQjRWqrpFB3FLqOIbOl
         g3Pb/cykxOaS6Des/x4uryz7EPCaCHfYTOVL8DCKZYQIyIbPlBZgDvEAEinypmspRQgE
         jtinVtO6UubOLmbG6VC21xzihdP8rBH5CV07FVgfGb3vi3xAEornoF3ooryNBe8wqivh
         s9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794006481; x=1794611281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRx7HVaOdJE7DvS2IBVEJ4TVt3eGJMgIXn5m4zK8mAM=;
        b=TCQD8s+335N+6lil4XbMTZ9Njxy94Wo3IsYXv+bRm/zV6CUTn2EA//pLLNLhLEqKG4
         x/KyBIXjFyLQ/PpyjPVvtPPrHpE3DbQuQTA4uAK4422dzOwddtTVsdIRkpIOnJ6u1Moc
         /HWs1E3CGcVzfzQlYKJ/OJEPKTL33+Wcp3bzWJn046T42Yn6zGbWn6OisnUojyCiiuhG
         TUXzE7FKm7QJgs19krmXFS1h4MsD+HypkGTdTYYnNCy0vJLL/ssTLLNm6JzrIkbHkSMC
         ZSVyWrSQtqjmrBybLy0TPb5+ROfSpc1h5FID6gxqxUwdTUJ5B6Evj6lhHrflWqkIWNKt
         j0Lw==
X-Forwarded-Encrypted: i=1; AL+hErFWRVXXL+MHDl9lvG9aVkMtVezAowuBi6FokRU2sUchKyLwhMEPm6wIw6peMIUF9DJtFS34yAAkQiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VXaJsKAs3CJGIeJOZQVuJybthstCDjj9mrxgHNAusLWoBmop1
	/nQje/FY4h/8MyYzbC9XdtQOrUhjVAVMqmd5OPXufe9CIMYEsM9KIjSVbvLkgkNO
X-Gm-Gg: AYBFou1OPewIA7lNEz1JuJSDzz+HsiNVrGE0jVx1KmM6SN52+r9Vgulv8U6vBcOKB0z
	lyHoCHRKFfKaIb2+ZFOCseHdn7apXiDD7/yxdVmia+uAqrj/DTBDAln7JUQTusLxQS+bbftofR4
	5pOt8TDaEgRLTqeMLC3tytpKUpE32DO9tea3RHOD9gVOJ8MjPyB3x40K7HslQ+CVSukr4QvkcQh
	mUgVclLsnJu+fBAtTLHH4MZvCBbV/NWmMuUq44+Li2W1pyoI3CDNSOGK87zArSlwoSIlXgND4Z0
	wsVruwIhB4HRMtp6RSuegrd+SAPOHExsAPJPrqK1GfWIMLn6Ud88CASQcRTJoekAF/qsq+gX0Md
	Et2ZE5Jq42AVqbI1sCp8UTa0pa3XTmuoRc5pbh9/9mRbn87rhOXz6O8t8wmNFYJVG31YFCSwLR4
	Gl7vfZaEWguDchpkscuyhu0sEbzF5MWSoK3IBdaWdMW4e/9+1DbmOQ3v2BC7rZiRwyhkwxqmGOy
	4z2qj65KBgnAJRURMrhouvslPs6vvXqspLLn1znlEKAsO9MXn1o/tsY/9C9BGL0R4VgH7DfUS6D
	9VtKUTjMGyo05vAnMR+lZG3aumq3scAJxG1pqxDXN+1OTP07wW7QzDkTn9JW9cnJjew=
X-Received: by 2002:a05:6214:cac:b0:91e:98f4:5da4 with SMTP id 6a1803df08f44-91ea932d46fmr59699546d6.5.1794006481196;
        Fri, 06 Nov 2026 15:08:01 -0800 (PST)
Received: from nerdopolis2.mynetworksettings.com ([2600:4040:5e70:4900:f826:3fc4:9d57:a627])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea675224bsm31195606d6.0.2026.11.06.15.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:08:00 -0800 (PST)
From: Adam Simonelli <adamsimonelli@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adam Simonelli <adamsimonelli@gmail.com>
Subject: [PATCH] USB: visor add vendor/device IDs for PalmSource devices from the PalmUSBD.inf file in Palm Desktop 6.2
Date: Fri,  6 Nov 2026 18:07:55 -0500
Message-ID: <20261106230755.2652311-1-adamsimonelli@gmail.com>
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
the INI filem and the deviceid then becomes PALMSOURCE_DEVICES_1_ID
the PALMSOURCE_DEVICES_2_ID is also defined for completeness.

Signed-off-by: Adam Simonelli <adamsimonelli@gmail.com>
---
 drivers/usb/serial/visor.c | 6 ++++++
 drivers/usb/serial/visor.h | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/serial/visor.c b/drivers/usb/serial/visor.c
index 5706c46c49c2..5a289c566ba6 100644
--- a/drivers/usb/serial/visor.c
+++ b/drivers/usb/serial/visor.c
@@ -75,6 +75,10 @@ static const struct usb_device_id id_table[] = {
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID),
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_1_ID),
+		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_2_ID),
+		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID),
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID),
@@ -133,6 +137,8 @@ static const struct usb_device_id id_table_combined[] = {
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TREO_650) },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TUNGSTEN_Z_ID) },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID) },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_1_ID) },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_2_ID) },
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


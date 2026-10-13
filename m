Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A14754B1AE
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 22:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791929989; cv=none; b=AKkrtrbx6edcf4bK4wSYrIR7leMVD4auRPxBDvI8UsPhCp4wPtLS9n/PJzRs3eI/0CHsO4kpVBYjDMo80eBtZ6VMUR00JPzk0k19eFE1kb8PVeCIo+BPC/YA7VZTyeAbtGvsOqCKS1ZpaK7bLzUFqTrFnFQq/BZgVM9jz/5y4wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791929989; c=relaxed/simple;
	bh=7VkaerexEeI8zcF/nNWfy47wXbOkreu5fSnh6W+Euqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NiRa3cwfNMLGzWTNl9oaxNnhDMLq/9tizNHmy8twhnCZF49Jhndgp4soqlB11JXk0xg0tPacTUE/m0vs9RpXtfuPvpPf4mG8bnbE7jaKPowd/Xl/WDMF7BhtrXQLhNKdTEqn2BXZDqQ1q9h1TKgl8SNowVl3vi4BRQmjc/jJGAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6IeIX3i; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6IeIX3i"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso3311979f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 15:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791929986; x=1792534786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJCvvcXnjulsu3Fybx4oszO41CYe/kjgy90pQyiI1SY=;
        b=U6IeIX3i6gEr9+65oyGYr2avQUrr+Lq4ibRh22tULfT1C74a0jeAMiyk9TI7RuDxcu
         Z+mVyZVPTbqbQtsBkvPOrvGEWcmgZDuFkTfRckLShfD+5aqhBPFIs0EiR5++c2/B73fw
         jRKFxhl8y2OficwAlQ108eFvZzjPwR6JAH+7PTCjIeUxICVb1hAPtMcrt8niX3zlK7ir
         HQWyUgLQlbXlitIZrjIw5avp85jOzLGxbhn6VU+Yszzipkd3AK59v3jTe/4ZDfJX6VS/
         aHXoUAlRNKjW2EjETyYQYvqmMaCJdrttu70/lA9C3ueUo0nCC2Gf3+b+S57P2pHV5USp
         gMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791929986; x=1792534786;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kJCvvcXnjulsu3Fybx4oszO41CYe/kjgy90pQyiI1SY=;
        b=Wy1edoll0eGNz00DFY25cO1V/jnwjmvDcRn4tDowewYQT+mEh1/sHFQR2jHadLS1py
         O8gkS8yfnrW5p0gvggXvZJ8AZyl0evdrmrPjP4lDx2yKln4nSVF1ccfSjbpitdu7vKx4
         GnsWUELSsBgXKE5oKwazHj+NksqztRJL/5rEt7y8EbD7Umv7hcoxIjaaJPnghrUe/rmk
         zDN5k/XiK4MHdsIYACU1wqYvC+Ghd6Bw18IAm+pqqWmPCu2EGKDAXyuW1mUC/CAsxfby
         1Xryw1/pjkohUm5QObZ3xBUtf4Me4WRdoWEgiTJQhK8m0tPPLGkqJOuBhBPEL/0916eS
         buaA==
X-Gm-Message-State: AFq9FYLz/XKeaowYbgbStw63LIzb9NFuKkw4onKQ9Ppsg1oMMTMXsQHR
	BIQhu4QJDEaZVvO1gF2Mqk6hFke5qz8HAIRqtw/4gikM3bXwtLxeN80X1bvJ6P+E
X-Gm-Gg: AYBFou3bpObLDoA5Cey57F4SyppUzDyllQV86u8AbJA19R0EKKZ0ptkATXfUCO2ZA6D
	r8Ji30KF9K/ySYSQikN6Uy7OzOJCuLa+QsV4QsW2Y+dJpW66gcE7RUurdMGQ9G3muX93jsg6ClF
	2U+EPk2o/gK++kLMYL8j7Oz4+l/ODgYpOxZnMcyqb9EAgOBvpSNbsBgo86qzuRZtUpx/emA9N7j
	0pO3lr3llcsKE7JQhLsSnYU318YmFiwaiPtyD1kCnlVjRwKpX2zWGo/GxpzQzLWJg+4Mmn9GHAQ
	nOiRy1fPU6u2UgMJBziYVVH9bItoSndHFDC6sDZ97zAbp+u7yF2cFmmXfP/2WuUeGhUid0YnRay
	mFGAstqLUTD4pZPoTaS0mFBDsOhX3/F6t4mIzmIcQ4oBlwWqSk3QE70XwJLPdL3URqtIQaW4YmF
	01FBAprri8A3QH3oZ+B6KI+EJXAeLeDRPs/wDYj1QDBx9g3h5i9IHiYH9iMIkjyYRQfl00xaAJE
	92pwgyPbzDfDlQZgaq9Rn3s1s8Ft5ef6b937JbxmQg21YWIqedHyBFlSjq5G55aRmL0/UxS/at9
	xZOmtsPomxDckJnGMRFyDMgkQuDXORYgjmsXRD8i5nRl3usLreSO2YYKosrqyoyHRKjKOQ6cHrN
	uWmK5VFgjfBNHFgQOZpj7s0DnAQFRRHEADbyyh3PUllqssbkcTy5DLfz4SJFZoBOU91Y//H0Wel
	NvXf0xRaPCTBY9EA==
X-Received: by 2002:a5d:59c3:0:b0:48c:7082:ebb with SMTP id ffacd0b85a97d-48dbaaef693mr27374574f8f.42.1791929985579;
        Tue, 13 Oct 2026 15:19:45 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:412d:e9fb:680d:a947:4b50:d9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0514ab1sm9849738f8f.0.2026.10.13.15.19.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 15:19:45 -0700 (PDT)
From: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
To: linux-usb@vger.kernel.org
Cc: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	usb-storage@lists.one-eyed-alien.net,
	Olivier Kaloudoff <olivier.kaloudoff@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
Date: Wed, 14 Oct 2026 00:19:44 +0200
Message-ID: <20261013221944.41598-1-olivier.kaloudoff@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ASMedia chip detection in uas_use_uas_driver() assumes that every
device with idVendor/idProduct 174c:5106 or 174c:55aa reporting a
config.MaxPower of 0 is an ASM1153 with working UAS.

ASMT135x bridges (iProduct "ASMT135x") share the same 174c:55aa id and
also report MaxPower == 0, so they take the "ASM1153, do nothing"
path — but their UAS implementation is broken:

- The first READ(16) issued by sd probing times out after 30 s;
  enumeration only completes after a uas_eh_abort_handler plus a full
  uas_eh_host_reset_handler cycle:

    scsi 3:0:0:0: Direct-Access  ASMT  ASMT135x  0  PQ: 0 ANSI: 6
    sd 3:0:0:0: [sdb] tag#26 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN
    sd 3:0:0:0: [sdb] tag#26 CDB: Read(16) 88 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00
    scsi host3: uas_eh_host_reset_handler start
    usb 6-2: reset SuperSpeed USB device number 2 using xhci_hcd
    scsi host3: uas_eh_host_reset_handler success

- Under concurrent load the bridge stalls: all inflight commands (20+
  UAS tags in the captured incident, mixed READ(16)/WRITE(16)) hit the
  30 s UAS timeout in the same event, forcing repeated abort/reset
  cycles and eventually a USB disconnect.  Writes dropped mid-flight
  during these resets returned zeros to the filesystem (observed as
  XFS metadata corruption on the mounted volume).

- Sequential-write throughput is ~45 MiB/s under UAS versus ~136 MiB/s
  after disabling UAS (usb-storage BOT mode), which is fully stable:
  several tens of GiB written without a single error.

- Bulk reads of healthy LBA ranges do work under UAS (~190 MiB/s, no
  errors); the failure pattern is command-timeout at enumeration and
  under queue depth / write load, not a broken transfer path.

Since 174c:55aa is shared across several ASMedia bridges and enclosure
rebrandings, distinguish the ASMT135x by its product string — the same
approach used for the HIKSEMI MD202 check a few lines below.  The
product strings of working bridges using the same id ("ASM1053E",
"ASM1153", "ASM1153E", "ASM1351", vendor rebrands such as "YZWY_TECH")
do not contain "ASMT135", so the match is safe.

Verified on an ORICO enclosure (iManufacturer "ASMT", iProduct
"ASMT135x", bcdDevice 1.00) attached through an Alpine Ridge TB3 dock:
with the equivalent usb-storage quirks parameter (174c:55aa:u) the
device is completely stable.

Cc: stable@vger.kernel.org
Signed-off-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
---
lsusb -v for the affected ASMT135x bridge (Bus 006 Dev 002) and the
second, unaffected 174c:55aa bridge on the same host (Bus 010,
iProduct "YZWY_TECH", keeps working UAS):

Couldn't open device, some information will be missing

Bus 006 Device 002: ID 174c:55aa ASMedia Technology Inc. ASM1051E SATA 6Gb/s bridge, ASM1053E SATA 6Gb/s bridge, ASM1153 SATA 3Gb/s bridge, ASM1153E SATA 6Gb/s bridge
Negotiated speed: SuperSpeed (5Gbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass            0 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0 
  bMaxPacketSize0         9
  idVendor           0x174c ASMedia Technology Inc.
  idProduct          0x55aa ASM1051E SATA 6Gb/s bridge, ASM1053E SATA 6Gb/s bridge, ASM1153 SATA 3Gb/s bridge, ASM1153E SATA 6Gb/s bridge
  bcdDevice            1.00
  iManufacturer           2 ASMT
  iProduct                3 ASMT135x
  iSerial                 1 123456789053
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0079
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xc0
      Self Powered
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           4
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     98 USB Attached SCSI
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-in pipe (0x03)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-out pipe (0x04)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Status pipe (0x02)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorTCouldn't open device, some information will be missing
ype         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        Command pipe (0x01)

Bus 010 Device 003: ID 174c:55aa ASMedia Technology Inc. ASM1051E SATA 6Gb/s bridge, ASM1053E SATA 6Gb/s bridge, ASM1153 SATA 3Gb/s bridge, ASM1153E SATA 6Gb/s bridge
Negotiated speed: SuperSpeed (5Gbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.00
  bDeviceClass            0 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0 
  bMaxPacketSize0         9
  idVendor           0x174c ASMedia Technology Inc.
  idProduct          0x55aa ASM1051E SATA 6Gb/s bridge, ASM1053E SATA 6Gb/s bridge, ASM1153 SATA 3Gb/s bridge, ASM1153E SATA 6Gb/s bridge
  bcdDevice            1.00
  iManufacturer           2 Min Yi USB Device  
  iProduct                3 YZWY_TECH
  iSerial                 1 123456789020
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0079
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xc0
      Self Powered
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           4
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     98 USB Attached SCSI
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-in pipe (0x03)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-out pipe (0x04)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Status pipe (0x02)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        Command pipe (0x01)

 drivers/usb/storage/uas-detect.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/storage/uas-detect.h b/drivers/usb/storage/uas-detect.h
index 4d3b49e5b87a..f0d9748b0194 100644
--- a/drivers/usb/storage/uas-detect.h
+++ b/drivers/usb/storage/uas-detect.h
@@ -78,6 +78,8 @@ static int uas_use_uas_driver(struct usb_interface *intf,
 	 * ASM1051 - with broken (*) uas support
 	 * ASM1053 - with working uas support, but problems with large xfers
 	 * ASM1153 - with working uas support
+ * ASMT135x - broken uas support, shares the ASM1153 MaxPower == 0
+ *            signature, identify it by its product string
 	 *
 	 * Devices with these chips re-use a number of device-ids over the
 	 * entire line, so the device-id is useless to determine if we're
@@ -99,7 +101,10 @@ static int uas_use_uas_driver(struct usb_interface *intf,
 			(le16_to_cpu(udev->descriptor.idProduct) == 0x5106 ||
 			 le16_to_cpu(udev->descriptor.idProduct) == 0x55aa)) {
 		if (udev->actconfig->desc.bMaxPower == 0) {
-			/* ASM1153, do nothing */
+			if (udev->product && strstr(udev->product, "ASMT135"))
+				/* ASMT135x, broken uas */
+				flags |= US_FL_IGNORE_UAS;
+			/* else ASM1153, do nothing */
 		} else if (udev->speed < USB_SPEED_SUPER) {
 			/* No streams info, assume ASM1051 */
 			flags |= US_FL_IGNORE_UAS;
-- 
2.47.3


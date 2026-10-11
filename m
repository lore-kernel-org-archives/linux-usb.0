Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7566D3043DC
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 16:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791736989; cv=none; b=IkulZzTYo0avMLHcRZb+TEOB1Z00xUSgAKA2+ZIV1KA3BKc6RPdQqKB2bFBgllmoNKfQY0Ao55Y2Q83Mldo3YwEXrRdp73G+SEmMz5tp9JH1JuCLKtExk1L7ROQEQeswDu5+lX1h50RVKwWi8BsrA/cldwBJIFD1lt7Oest2Vek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791736989; c=relaxed/simple;
	bh=cU/gUlsLLwB339/fDTTyfKcJEdRaFmRgBBnG6MkP31M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YBVOMKExb27DhifC9SoDx82Ytzqes/C3Kxr8zppe1Da48fqVUQokveJI0da2ZwSnHp4nTZ7taUOAdvXSqPoqzmNhrPbasZpqHg1OXbLNFqonkQdoddE9Y0wnQ5Ar3rAIdtZxpZvOUSqBFhYtK5mm0Zx7REdbr3JRyY8AbINVfMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfGHzwpM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfGHzwpM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d05d51553so6615945e9.2
        for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 09:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791736985; x=1792341785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jnO5cEOxBNPfI5JuFShxvNtaox149SufgB+yyjvmbYE=;
        b=GfGHzwpMDpHhhB5yQCDVT4CCh9vcYG7Y/srumydJHcqZILIQYcKrcwMeHPn/iGp+t9
         ZjQ5Qjdpssobzy0simxWAhwJgtZYF3AAPQbSq/5lWlL7lUOqrlVMJ5BcMsg+7fO0/8Wu
         Lgr7ePOCk4311BnNAYSw088YoDNWKy2RLyzbqbWBc0JNqZZU+8lkQJufTNnC3feTuBip
         fVF+IPcoISAYGpJVhXMhMDJD9tse8CXEi2omxPNS5RI4018PPBLY7VgC25AAyAmSHko/
         tkgRx+MeoFVQf6j4nzUhKeqCcGJ0BRX82MZkHGvuwiaU70SNjGilgf0U/OxeH6TX94j2
         kMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791736985; x=1792341785;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jnO5cEOxBNPfI5JuFShxvNtaox149SufgB+yyjvmbYE=;
        b=fDB2vysyBAjio1DcfBuchTOYqHo7XYs76Bt046dUPtQi2SJxAe0Yn9TgxIEoTslYr5
         UsMv3t+f3a7A9vQGBFBgWniHyphWdlSdFPcd9DgeS0hy2569jUgR1w2KwWWrLdOSqLOq
         ukP5r2cNKLVY5TcEBNITLHVDt8EZeQZ0PqTf/efXJowhwyZd6CzJtONNsU/KeocQnx+j
         264CVTjJ65IwUsCNRagtyRKXhjPaCSmpSegJ2EkBbfAy2CBMD+QSraHfQfEg2n2IUGOR
         ioR4NvIMUmBsHVvfVNZ9cJ5e35lB6fS21Pcjql9B3QDMXdWyBt88tUT8V99I99agdrSY
         R71g==
X-Gm-Message-State: AFq9FYIi1UcUgrQa9nWxL50QKacihtcKZ3xyrQhXd/tC3RtvJ9+GNn7T
	n1GTN7aFTIO4knmP8HTHpY5xRq32gszHFGL1EO43vwWH5Vx0bsm7mOwAXZ7R1w==
X-Gm-Gg: AYBFou2ukV+K3vz+N8/MlKDMTVG95l1Pylj/3pSpY/Ot8ZSRZ8l/5mYovmWGWQbqwsw
	jryHT135Mtv7rbqakZisyzplGsUyvLXn5u7gvPwbgY1awlsyQu7YEmmar0tG5tLQWN7ZTCqRBx3
	RvlawMA7tXDDrO9q1ZEA0esRN/xEl6SBU5Z3a4auLnOQpmRPwR8bR9yfSPJf1tFEPql99I26t5q
	/O54HyWqaZWdVEfFF+YwZeo/mXhcN9lPayrlHBkkx8FEoBSpeDyhpCRjXCcq3wnnUxCwuOM6AOv
	IBZ/xCwzmQxMZTxszIqlUPJlkLZQZpukWu0/vSD69t+CVdyI9AOUFSPmPXlu81sJvmVljVDOL3n
	CQsQCDLsnHl+ho+BH8dryPZ8De7XsUzOqtCatvyy0aJF76xyW/zT4+ZPjz22tjv5ksvKcB7ouZe
	kZB1C80bzrKTyznME3x3f70DvNTDaFwRjDUZ+z0SW368nberWxRpOU0AjtGCO3lPsTOEfTlljRi
	FmD+cMt8hi3bMshdaXzBu6ypb0LdpoohkhuM+m0rbD2HzLyLjz0/toLyEmkbhwCpH7QHB6X9kVL
	hbxOV8mt0FvlemxRUiByI1TZg3hhMyRMDd1zsarNMgziqMyvGw6X72krS5EKELj4wnpnJkk3+vU
	Kxv13Ns1cH70HIZWXjj9Ez20122LsvPlVNR4+/Vw680CIITKnrd3uVpsXh+yuQjr6N38b48WnKj
	a5bEIqbKPf4FrYEKRJpAjqE9bpEhQJ
X-Received: by 2002:a05:600c:6215:b0:49f:ff32:8044 with SMTP id 5b1f17b1804b1-4a18e47a88fmr119013045e9.7.1791736985302;
        Sun, 11 Oct 2026 09:43:05 -0700 (PDT)
Received: from localhost.localdomain (240.21.205.77.rev.sfr.net. [77.205.21.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19303d518sm186975245e9.0.2026.10.11.09.43.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 09:43:04 -0700 (PDT)
From: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
To: linux-usb@vger.kernel.org
Cc: hdegoede@redhat.com,
	stern@rowland.harvard.edu,
	Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
Subject: [PATCH] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
Date: Sun, 11 Oct 2026 18:42:59 +0200
Message-ID: <20261011164259.30572-1-olivier.kaloudoff@gmail.com>
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

Newer ASMT135x bridges (iProduct "ASMT135x") share the same 174c:55aa
id and also report MaxPower == 0, so they take the "ASM1153, do
nothing" path — but their UAS implementation is broken:

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
rebrandings, distinguish the ASMT135x by the product string — the same
approach used for the HIKSEMI MD202 check a few lines below.  The
product strings of working ASM1053/ASM1153 devices ("ASM1053E",
"ASM1153", "ASM1153E", vendor rebrands such as "YZWY_TECH") do not
contain "135", so matching the ASMT135x family string is safe.

Verified on an ORICO enclosure (iManufacturer "ASMT", iProduct
"ASMT135x", bcdDevice 1.00) attached through an Alpine Ridge TB3 dock:
with the equivalent usb-storage quirks parameter (174c:55aa:u) the
device is completely stable.

Reported-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
Signed-off-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
---
 drivers/usb/storage/uas-detect.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

lsusb -v output for the affected device (Bus 006) and a second
174c:55aa bridge on the same host (Bus 010, "YZWY_TECH", unaffected):

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

diff --git a/drivers/usb/storage/uas-detect.h b/drivers/usb/storage/uas-detect.h
index 0000000..0000000 100644
--- a/drivers/usb/storage/uas-detect.h
+++ b/drivers/usb/storage/uas-detect.h
@@ -99,7 +99,17 @@
 			(le16_to_cpu(udev->descriptor.idProduct) == 0x5106 ||
 			 le16_to_cpu(udev->descriptor.idProduct) == 0x55aa)) {
 		if (udev->actconfig->desc.bMaxPower == 0) {
-			/* ASM1153, do nothing */
+			/*
+			 * ASMT135x bridges share this signature but hang
+			 * under UAS: commands stall until the 30 s UAS
+			 * timeout, already during device probing, and a
+			 * queue of inflight commands wedges the bridge
+			 * entirely.  Identify them by product string,
+			 * same as the MD202 check below.
+			 */
+			if (udev->product && strstr(udev->product, "135"))
+				flags |= US_FL_IGNORE_UAS;
+			/* else ASM1153, do nothing */
 		} else if (udev->speed < USB_SPEED_SUPER) {
 			/* No streams info, assume ASM1051 */
 			flags |= US_FL_IGNORE_UAS;
-- 
2.43.0

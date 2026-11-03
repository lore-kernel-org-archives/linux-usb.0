Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793675243;
	b=kyOtzmrhtO18B7KSZpPNuRGbCa0Gf3fBDNA+sJEF+xei5Yl0t/sSlvPHtG2boa75jbjQ
	 ki0NU5W75yWSM1kkiP4Bps9KBJoHVZKkC8I1hJB4QPJGRAqWQqgDCWu8KsuM/XS/f3K+F
	 4GRpKGuEmD3UIaH6xPMbHUTEXpLfjhwGv3OaSDKaCoZvYrbSFfcVxbKPkv0iT/Zk0vlIt
	 YqCQ/7AOa23yjo6lTRq2nfp97tCpNyhPATM+0VTUV1EvzPIwZNPCmK7RvvXX5ayz934dr
	 eT1lDrrd/DCnFB0LX13yknL4Irqf7TwQbL/Tt5vJS3NJGDgSafaTx0+aVSw8pslqFbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=he3xvNHF+hWEae01fq/goQe46EZGAHoNyi6iFnm3wLg=;
	b=q8MVmumxsCpPVUOL6OPL1EVKteW863BhcbVY3gX95rspk7m1VcGBOPlb6qBs7UPfRc0H
	 eB/3HtVSs8OHAqOUinObVVU1vO5TEebwGJ71K6ZubTiYLf3HwutLAuVmiHRoZRxB3rYYO
	 uBqph0jVVgd3b0ewkaCaYz9YV+Y54+x8TZobSchFq4yf7Ml1ucOnGNrSbK7atGwul+27e
	 DyK19KnR1i7AszjMKEqEoyuMsa9e5SMF62vf5gZxEdSfJwsjE2FOJzcpFHBJEgP/5XUyM
	 w3acXE0SIJPgX4XHm6B0+BIXTZlz6JX+lQ2gbdas6eTqC4Yw4/SJkcs2L6aNKucfXMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pz7xMRIu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC57606A33C
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 03:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DC57606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pz7xMRIu
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so4928575a12.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 19:07:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793675241; cv=none;
        d=google.com; s=arc-20260327;
        b=NjzZcemHlc8qPMgFE0SO7ud3/t+TGb+80GdgN8fWWQff/2IiSeHfJWYZuPkRaXt5fM
         ohzs7ogbkVOhtRx111vC6w7Dwio044RzmDwMlmRs8vCiGmvIMiUqZl316TxE15l911ve
         tKuaSGFsBWm8mYCE1r3nXC40E0Z/Q+kqoGO9sj32IkQhP/2cmjm6rRBSI0/m5Mj94CDX
         EuTh79XboDhR0gZay6CaoTICrgNsWQQIq8F0r7flgyFoXEdOlHE7SfQC45suYaolkIgp
         IuBnB52kuu/PFX+xsLRgH0IJn6ZrvVFRIHEOlgEKnCIt5whCs7REeUlP4Deq+fhcrIxX
         QQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=he3xvNHF+hWEae01fq/goQe46EZGAHoNyi6iFnm3wLg=;
        fh=7lgYMxklTq8QRyR8m5NWMqCmLsUx3SZD6bEXnI1ucI0=;
        b=p9z759xvx/wBQY4TY09C0BnDiWR3NWBEVkEJDx9CpzB1nHQgdZv5nS+Clb7IOchdfh
         yrcrOMSzTK6eGjUqgTAiZpdAvko+koUBzzhIKnjjpsgZtTGmhKFUpp/pJevMQuKZL1rO
         b7S6dae86HizwwW2gfL/6mMk5bCqaiTBtrdSX4THz4ES9OHqZZBc6savIXde/n9M8gmC
         /4uowOAOaUZL426R+4phmfTPeoxAWR1AsFajtiK4ayWshflKH8MQ4AmlUHfU/5IufJFO
         wr25lFHSCdEK2fTD6POSsf5dG4AO+b/5o+MEq1PqDXp6AdbTgxoSYPq3uykZ6StjAqR3
         rlDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793675241; x=1794280041; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=he3xvNHF+hWEae01fq/goQe46EZGAHoNyi6iFnm3wLg=;
        b=Pz7xMRIudQ11ZLXBQOjOfNrX1WZhWkTURqst0kjAFv013so9A4cM0ORukSiBvSTi8y
         CE3Xed3sMrPhJtJTk9PMAZjVac+lcmx5tGnPPDSDrDd9lT5FkCwAofAZkNgXdEI3KMRr
         bo9oxWZ1jkEZuiQ5Q8vvbpw1w2w7kxM3BLO764L4h8Kz7j7q2AsH7xXUHya4na/bdZoq
         JF9Uz/zpF/F96zukqgo9S5Q0VWpSb7A9oN11X6W/RoGDlOilVPw99yF/Mt/xvZTX9l0n
         wnxWSUhUneeGFEyy6Y6TxH1qLEoFtrsbfa+PKsroAWo1p3uFPYAylcMBlLc7gvrRWuDu
         +itQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793675241; x=1794280041;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=he3xvNHF+hWEae01fq/goQe46EZGAHoNyi6iFnm3wLg=;
        b=yWQ+eRo4ymYwqbcggtpqQ61OC5cGiOPIFczd0li87aqgpYFs59ERf7GErE7WcCVy1A
         S/HrR8t4IFta+Tsu4gveVy9wAY26SDLYqA8ZXHs+vpsjhimqUJVDFGQSqCjxo3VICwyw
         KGBaAqFDZJBVVsTiYVHSHw49FWk5L8gF0FC2ZegqEKWiLH1GnfOSKPNjrXG5bz0MmJyz
         VDPEsYbNOjNfsYQKMQsHqSU8JqdyPfSX+nM2CioMvuX53HvM4YApLvuNjMS1lkIyA/Zk
         jTUER4LRJqiDsHRUZlcxlG9Cqv+oP33AOWzrUunRaakYYNFL8mSK8oRG/71pGpc078L1
         Tc/A==
X-Forwarded-Encrypted: i=1; AKwUvBz1YfX6wQ3ZHdDdYCLH9MgqGBmCEk1+YAFRoP3UrxZuJIz6tsV5TRyELNpy8mdj0njqGhcZVYZVOpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dMdm3wrc2EAX65oBuCe9SX0twmgSyjwkP7ND6LpRTqn1uu9Hk
	C5mX/3gYQS5CmZNauKi9ZLymskT6bkwU3tzcNVhC99S3VWnD6u0kAU2tCg5zJDxvJj7F+6JM7Qv
	J2BX4XryscOfFZIWOEIDjEhEwT9EHQSc=
X-Gm-Gg: AYBFou2hScve0pU+IteC5dqeu4uQtUDvd9krXZjlL1PpEjWCXAGLi2nkxwZ4MxBBTBF
	aQonNBXC2hf5bQIRShPaTzXdcCrE/Kj2IsDAdxgKY+z4p4ZcxA188/GIQPFT/LW5TTs5HNghfaP
	RFUI4WUD05se7Getb4/50tcNd8mQNPFR6OjFRhyBUuHGa+6Vf49pRmE6u6zEG8PksCOExdrjyj9
	J4JMSxTly6ZRCRHFa+SKfJCBASNpK2kpTZ6Myw3fzKWv8gJftmvNHw71GQkX5k/gAtXUmFuRKF/
	/zco3u948LPD3APXp3AHdQhRUr3ukRSssrt6MMXvqSKyw2Wx37sGlvGCXKYQZob2GPRi920qXLJ
	O0n2wL7org6zQZyrz1odsqJTe6r/M5dIvkJjelx60KaBwMPjpX9rCzRzbeLgAtlSxaCw7EuRhIt
	fKMo1T4fgEnIPc
X-Received: by 2002:a05:6402:4287:b0:6ac:87bc:8b16 with SMTP id
 4fb4d7f45d1cf-6b4d62c30f8mr8173527a12.44.1793675240491; Mon, 02 Nov 2026
 19:07:20 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Tue, 3 Nov 2026 06:07:31 +0300
X-Gm-Features: AclHuK9tGz_HxYylUGCzXxevP4a_c9XKcSj7qzRRWb_S3SOZRhjTz2tj6KT4xcA
Message-ID: <CAMnMt5ZQe6HvLBWuc4fcF=pcatqUD4bZff6QSj2FxaKjpGWXiQ@mail.gmail.com>
Subject: [PATCH] usb-storage: add US_FL_MAX_SECTORS_2048 and quirk for USB
 Disk 2.0 (346d:5678)
To: Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In drivers/usb/storage/scsiglue.c, the host template sets
.max_sectors = 240 (120 KB) for USB Mass Storage devices. While USB3
devices are granted up to 2048 sectors (1024 KB), USB 2.0 devices
unconditionally inherit the conservative 240 sectors limit dating back
to early IDE bridge quirks.

For modern high-speed USB 2.0 flash drives such as 346d:5678
(USB Disk 2.0), this 120 KB ceiling unnecessarily fragments I/O
requests. For example, a 1 MB sequential transfer is broken into 9
separate SCSI commands and URBs, incurring excessive interrupt overhead
and preventing flash controllers from utilizing larger erase/page write
buffers.

Introduce the US_FL_MAX_SECTORS_2048 quirk flag (and quirk character 'z')
which allows setting max_hw_sectors to 2048 (1024 KB) on verified
capable devices. Add an unusual_devs entry for ID 346d:5678.

Non-quirked USB 2.0 devices continue to use their default 240 sectors
limit, and USB 3.0 devices continue to receive 2048 sectors via their
speed check, ensuring no performance impact or regression on other
devices.

Im tested on very common cheap USB 2.0 128GB (chipset FC2279 BA7 - price 4$)

Benchmark fio results on actual device (346d:5678) on Linux kernel:
- Sequential write (1M bs): 10.2 MiB/s -> 13.2 MiB/s (+29.4% improvement)
- Sequential read  (1M bs): 24.4 MiB/s -> 26.4 MiB/s (+8.2% improvement)
- Average write latency:    97.8 ms   -> 75.9 ms   (-22.4% reduction)
- I/O requests / interrupts: 556       -> 60        (~89% reduction)
- 4K random read / write:   unaffected, zero regression

Signed-off-by: Herman Semenoff <GermanAizek@aizekgroup.ru>
Signed-off-by: Herman Semenoff <GermanAizek@yandex.ru>
---
 drivers/usb/storage/scsiglue.c     | 6 ++++--
 drivers/usb/storage/unusual_devs.h | 7 +++++++
 drivers/usb/storage/usb.c          | 6 +++++-
 include/linux/usb_usual.h          | 2 ++
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index 97de28e85562..2a732e6354e5 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -111,10 +111,12 @@ static int sdev_configure(struct scsi_device
*sdev, struct queue_limits *lim)
  * let the queue segment size sort out the real limit.
  */
  lim->max_hw_sectors = 0x7FFFFF;
- } else if (us->pusb_dev->speed >= USB_SPEED_SUPER) {
+ } else if (us->pusb_dev->speed >= USB_SPEED_SUPER ||
+   (us->fflags & US_FL_MAX_SECTORS_2048)) {
  /*
  * USB3 devices will be limited to 2048 sectors. This gives us
- * better throughput on most devices.
+ * better throughput on most devices. High-speed devices with
+ * the MAX_SECTORS_2048 quirk also use 2048 sectors.
  */
  lim->max_hw_sectors = 2048;
  }
diff --git a/drivers/usb/storage/unusual_devs.h
b/drivers/usb/storage/unusual_devs.h
index ac22fa318734..b3ff758d4e9c 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -2418,6 +2418,13 @@ UNUSUAL_DEV(  0x3340, 0xffff, 0x0000, 0x0000,
  USB_SC_DEVICE,USB_PR_DEVICE,NULL,
  US_FL_MAX_SECTORS_64 ),

+/* Reported by Herman Semenoff <GermanAizek@aizekgroup.ru>
<GermanAizek@yandex.ru> */
+UNUSUAL_DEV(0x346d, 0x5678, 0x0000, 0x9999,
+ "USB",
+ "Disk 2.0",
+ USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+ US_FL_MAX_SECTORS_2048),
+
 /* Reported by Cyril Roelandt <tipecaml@gmail.com> */
 UNUSUAL_DEV(  0x357d, 0x7788, 0x0114, 0x0114,
  "JMicron",
diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
index 823a4b2e9033..2577db523208 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -570,7 +570,8 @@ void usb_stor_adjust_quirks(struct usb_device
*udev, u64 *fflags)
  US_FL_INITIAL_READ10 | US_FL_WRITE_CACHE |
  US_FL_NO_ATA_1X | US_FL_NO_REPORT_OPCODES |
  US_FL_MAX_SECTORS_240 | US_FL_NO_REPORT_LUNS |
- US_FL_ALWAYS_SYNC | US_FL_NO_SAME);
+ US_FL_ALWAYS_SYNC | US_FL_NO_SAME |
+ US_FL_MAX_SECTORS_2048);

  p = quirks;
  while (*p) {
@@ -659,6 +660,9 @@ void usb_stor_adjust_quirks(struct usb_device
*udev, u64 *fflags)
  case 'y':
  f |= US_FL_ALWAYS_SYNC;
  break;
+ case 'z':
+ f |= US_FL_MAX_SECTORS_2048;
+ break;
  /* Ignore unrecognized flag characters */
  }
  }
diff --git a/include/linux/usb_usual.h b/include/linux/usb_usual.h
index 712363c7a2e8..cd246a42e603 100644
--- a/include/linux/usb_usual.h
+++ b/include/linux/usb_usual.h
@@ -88,6 +88,8 @@
  /* Cannot handle WRITE_SAME */ \
  US_FLAG(SENSE_AFTER_SYNC, 0x80000000) \
  /* Do REQUEST_SENSE after SYNCHRONIZE_CACHE */ \
+ US_FLAG(MAX_SECTORS_2048, 0x0000000100000000ULL) \
+ /* Sets max_sectors to 2048 */ \

 #define US_FLAG(name, value) US_FL_##name = value ,
 enum { US_DO_ALL_FLAGS };
-- 
2.55.0

base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c

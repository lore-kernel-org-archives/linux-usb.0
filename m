Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FA254B1B1
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 16:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997142; cv=none; b=cesYhxxK3tcmYUffdPhzssFHsXmmkaKajPV5irTcFCtuXeszXA1x67cz2eLgp2pvlB/LonzHD++8RptTJNmuNxVOjdU4tUdOxrakBFTTxIW9/mTAXQiV0F8HOLd0zTCWiIdUk+6LcqQ4JESMUaAloPSX4J2kcpvwWnhGbhypDds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997142; c=relaxed/simple;
	bh=wsKKe1abKSPrhu9iyZJMEGTFefY63GXOz3LP4YR8Egc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ju+2SzuNLYra7HmqIr6YmxxZSFsrcq2KehTQvrUtq7JRsLHJtiqxO28X2IxUu7MbGKgaKkCDz45gI0R4Xq4qLRRu7zksy1OAMmTvf5qAmvaWM36Fc2cjLIk9A100smCSrNOQFWjY7VeiEtMLmFx1LcsjRViM2WGh5qgKAzR18eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXUNsQjm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXUNsQjm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so15582955e9.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 09:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791997139; x=1792601939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C8fBlAp2z+aZBAqOX2JhqzLP2hcIpXKFMGxJYCC88GM=;
        b=ZXUNsQjmWokdUf+Jf0nqDUbHGHqryDIOcSzCtb9p0aAbLnvVPgiTrIIultOQ1MsJ9A
         ClgMvBrvb6zZt6Bt08qjch20KG18SrcIFRk8OFJ8u9MXiS35YFObBhhLi2jKlKnuY7fZ
         g1y9BxpRm7upc43xW8Q2+BvXEULfFWxCeXxNfTW8GF4rmmLOGEWyey+hjHxx1w3o7LrT
         CqtsdOG9JnSZC3hWlZYzd3E2nh+AvG9OxIyEKLksAm1dTqPeqYQ5NAoU1ZSVO9NzRSiP
         jh4A+ZQa5qkfMCyZJs8ZEmCFCk+8smG5Qe6RPZz90kXbNyPV99u/gUhRczIfrZuFCaJg
         1J6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791997139; x=1792601939;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8fBlAp2z+aZBAqOX2JhqzLP2hcIpXKFMGxJYCC88GM=;
        b=PufF4gj4BI3GK1VnsVQP0R/iiozrj7ErfvzoBcr4PeGoo+SIV0PY+OokEZPZNcGzMH
         4xL7yrgaygbSecp9VKwOO+1IALHqI/OBhoHaNklOJMbpCQfAKY5aayQ7QSeudXcxo6KH
         Y+AJTexUWx9x0Me3YW1BLYV1i/wDHVmyA3wknl3GyK6vAg+SZq3Pi0zTMQDRZRhvB8TM
         EtCkOoEqr2833jd5hLVxQh9qj2J3ozvfvtIwpLvcEb7+x44DQl+DFaETh+5uZKpDki2I
         RvTnIS9X1fAoz9bAuTuHSK6LCd+mCIPxWW40yhZVaU0rmbZx8soYnmc/o/oWWs7WZc0y
         KfUA==
X-Gm-Message-State: AFq9FYK2nVatEFca3GZlWPpZpffoBP7nHluUWcb5eHg8usev7CkwLKhf
	D7g3t0fKIpwuPsolxRMdoGV3TdgOF6zYTJUAcXyw7lhukqejp+/Wo6fwk4M8imHH
X-Gm-Gg: AYBFou2E7SfP4407fvDLq3PlTrg+IMMhhbqifVLq8+Vu7g+2R1+RSoY0ajQ4Z0fE6TM
	wjSnOJhNvrorHNhATSWJYk5TUa7xyuJtMzOVYr4p1MfbAc9/2ZU92wOllqaYheqCKtw4HdWEiJv
	VqXvAfhT0YPRFUfmMrJOANnXtcdBS69pkNjOCGCHeIxYrMlFe/QPy+AaLOSXbLwK6pmnb9CcH82
	1Z9xTA3ozMIEJdvl56A6tXBO1tW6csAz2RyxTLvjARi+6lwgYv0X4fmOStaFmhKCS2tsc57MvD7
	3hWz3bFJWr7JGtnpEhd6lzqVDZlnHmTHZMznP1sWPs0VQIi6B4kRWWMb7EJxHtdZ6nC/3ELnO/Q
	XbTcBHAOzhwES4OwgulK0HbHCMXE4H7bo2wrADTA2VlYXEIxcNHq85VuhcVyIhfsUQ/JdOmhdse
	j+a7KFI4XFL7hBvHewOogcEiBfYlkmFM2VBbKJiSoOiyJr+qKD4O9G4xEbOOWPO/ED1ad/MS0F1
	yp/j7KYQSrL4U+u70y8fMGWkPddXmGzkTwzwS3Nx/FuU8VUCUiWeVWtn1p7iUH8eIRpuHDGrmk3
	JJ2rJAfpmXKlh3EtYsSnBP80sPg+Gk+Lec5Cd+HAjrVAaPOjQW/oCP7pQgY7xO3Jg93Z9UN9CLw
	udkacphIIjOP6YnlPQTYoCfKK6QYZGOFvL9LobyRYeq8kL5nRYqJ4IidQYLO74xsU8V6sxTakS5
	I=
X-Received: by 2002:a05:600c:154b:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-4a18e4d0be2mr320839625e9.23.1791997139296;
        Wed, 14 Oct 2026 09:58:59 -0700 (PDT)
Received: from localhost.localdomain ([37.167.99.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdbace19sm3736615e9.14.2026.10.14.09.58.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 09:58:58 -0700 (PDT)
From: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
To: linux-usb@vger.kernel.org
Cc: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	usb-storage@lists.one-eyed-alien.net,
	Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
Subject: [PATCH v3] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
Date: Wed, 14 Oct 2026 18:57:41 +0200
Message-ID: <20261014165741.35758-1-olivier.kaloudoff@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261013221944.41598-1-olivier.kaloudoff@gmail.com>
References: <20261013221944.41598-1-olivier.kaloudoff@gmail.com>
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

Signed-off-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
---
v3: add braces around the if-body (per Greg KH).
v2: fix the comment block: added lines were missing the leading
    tab, breaking the *-alignment with the rest of the block.

 drivers/usb/storage/uas-detect.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/storage/uas-detect.h b/drivers/usb/storage/uas-detect.h
index 4d3b49e5b..523a17cf0 100644
--- a/drivers/usb/storage/uas-detect.h
+++ b/drivers/usb/storage/uas-detect.h
@@ -78,6 +78,8 @@ static int uas_use_uas_driver(struct usb_interface *intf,
 	 * ASM1051 - with broken (*) uas support
 	 * ASM1053 - with working uas support, but problems with large xfers
 	 * ASM1153 - with working uas support
+	 * ASMT135x - broken uas support, shares the ASM1153 MaxPower == 0
+	 *            signature, identify it by its product string
 	 *
 	 * Devices with these chips re-use a number of device-ids over the
 	 * entire line, so the device-id is useless to determine if we're
@@ -99,7 +101,11 @@ static int uas_use_uas_driver(struct usb_interface *intf,
 			(le16_to_cpu(udev->descriptor.idProduct) == 0x5106 ||
 			 le16_to_cpu(udev->descriptor.idProduct) == 0x55aa)) {
 		if (udev->actconfig->desc.bMaxPower == 0) {
-			/* ASM1153, do nothing */
+			if (udev->product && strstr(udev->product, "ASMT135")) {
+				/* ASMT135x, broken uas */
+				flags |= US_FL_IGNORE_UAS;
+			}
+			/* else ASM1153, do nothing */
 		} else if (udev->speed < USB_SPEED_SUPER) {
 			/* No streams info, assume ASM1051 */
 			flags |= US_FL_IGNORE_UAS;
-- 
2.47.3


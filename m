Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFE9385D66
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 05:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993469; cv=none; b=gy7rjImlpYZlJPUpmcNfC4ZOfnyPGuH3RlSvX5KgtQzGxBYMLxqEmwvwx/U5jgXz2p9nH1cDNRxjaH2rxnwuS8gh2IVYWx4B11o9fKRFc4aoaAblPJksBDh1AXbHBg6R2JbmVmhSp7IOUfi3o+X/tSSUd9HKULOET3GmvsD/CV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993469; c=relaxed/simple;
	bh=vjWx689qbeARwGGgPB+QjxwlJP29OTCCH11iiEAaiZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k4koJK26bl4ucSSW+LheVvc/BFa1sqRKa9TvQ7Uxg2PsATh6gR41PEhnJ50eZHDGCSdFzBgRvBWbSLzK3WwlBINZIpSDpUtsmKrEPXSzNjikPIlDMZsnblD4JGloOC9QCM7spD90k8EiM1DNZMjYFtDnz6SLWT68RE7RjdhTgds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OT6ACGoG; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OT6ACGoG"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so1663122a12.0
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 22:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993467; x=1786598267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zrnHL816rlceKPEH+b3G5bh9fGXwY6/iJzzWDpp3Fs=;
        b=OT6ACGoGtQ/t+IIVWjlKUFdP8ojcfk3TAClXeniV2g7JDPUXUxUovnhPnMmIvRsNg8
         NGWX8lEy9pWhLMaT+SIWmZaEnH7sKwqJYMZERGZMVGgWXDmzDDDrAHsIR+mZq/BU+e9F
         ySKrxhBo3JpzoeZzreluId8/lW6NtC5Kiow7HTcj+/hYjvrd7MpKDnCy/Yp24HYW3Etg
         Coe/IOfV4vTBn7b3ZpeszssKKJfFkTRkdIq+2mhBQgFgsNsdOBYJl94KKDZScnTNxEIc
         1E597OVy0bEJfCPcCnOWugcQEwaEs8QDiERTqFkmFSEF9HPy+Gq+zPkxU6oJyEa9vfoY
         xQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993467; x=1786598267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zrnHL816rlceKPEH+b3G5bh9fGXwY6/iJzzWDpp3Fs=;
        b=JEqf481EKXjKP8d3+XjMyrd6yGxym0L60Z1ISpOaVGKQI4rndhdJ5Uhxwr4AE5yffP
         7HRpJdTxsgvfDZkQraalrgq2hg4iSrWxL4snJj4HoglIU/D+j0z+sAjUGJDXHhHTEX2d
         VpG2YUw9gJTUTQG3Q/j/+IsdItp/D8w0P7J04pxiUerZH1pdAI6Dq2Bd1hJJNQd1DX5x
         BD3084ZLHlTIVQDJYom0PYuonfty3Ka6kKd9/47mXPMUhcxFq6cPR/dz3b+eTPODEBt6
         leE20t4R+N0PZUliRO356MdXm0xX2xzujTYvQPyZPNGTBX35okftTSELTzJ6otWdPvv7
         7TzQ==
X-Gm-Message-State: AOJu0YxgsmVILElVHAjSfokJrpOGBptOSedqIWQscu0mgcLjOt0X4BUQ
	XA5mbLOY1giSKtGrR0Su1fY1LSI4ptNJ46zc01eNHvkyWTzboHhPOwVo5Q3sog==
X-Gm-Gg: AR+sD10V7iFxmu0Ak93PHrFHc4VevvHvsZtNhejQn+EO945sJcchxtjITDEQREvdFMf
	OoKAxTbD0rPqnZhGR36s1PmIU7vlKXCzsz2GkSSANr29Cy4oP9rlg4gmbq3mZCuibqowZgX/Wrm
	hrI7C6FwB380uxTnu/3FT3gSMazOXlFNQaEqHtVzzD63Q4g1n58ORZZPOldxEpJwNxhFmuHUEPy
	eh6QzUpBNdY7fmblKMUbdXjyt2V65e1OBVm7GPZytOK7Fsuz8ZBo2RvECZfAHVYqKSaE6m7mc7O
	eXktrUCCbGIYvH0gzOhep7GmCaRl1XyJL8qE3zwhDNiGuKNTAhICnI9vSxOw6NFCKIT0D69ciUZ
	lclfEfvgiJZ3BfxVLO7Q5YGXLADA9pBh2ZdHIVNf04X6mrHP7AeQRZxb+3XMP4sQXp46nsdPdtR
	pM6LlT+wAm/NG46obwF5h0oq+Vp7Erilb+rbh0ikxouTDdcdq6bA7y4ieFvDkn7cSd
X-Received: by 2002:a05:6a20:6a03:b0:3cb:82de:b952 with SMTP id adf61e73a8af0-3cb85de816cmr11307613637.2.1785993467133;
        Wed, 05 Aug 2026 22:17:47 -0700 (PDT)
Received: from Default ([2409:40f4:1038:e01b:68d4:26a8:ff11:f316])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca6482e7sm20485791c88.6.2026.08.05.22.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:17:46 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: linux-usb@vger.kernel.org
Cc: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jeffin Philip <jeffinphilip14@gmail.com>,
	syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com
Subject: [PATCH] usbip: usbip_host: Fix null pointer dereference in rebind_store
Date: Thu,  6 Aug 2026 10:47:26 +0530
Message-ID: <20260806051726.24343-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rebind_store calls do_rebind which dereferences udev without
checking if it is NULL. If busid is registered using match_busid
but the device is not present in the first place, it triggers a
null pointer dereference when we attempt to rebind the device.
Fix this by checking explicitly for udev first and returning
-ENODEV if udev is NULL.

Reported-by: syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=af76b01c9a0f0ab60fb0
Fixes: 4bfb141bc013 ("usbip: usbip_host: fix to hold parent lock for device_attach() calls")
Cc: stable@vger.kernel.org
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
 drivers/usb/usbip/stub_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/usbip/stub_main.c b/drivers/usb/usbip/stub_main.c
index 79110a69d697..dfaedecedb81 100644
--- a/drivers/usb/usbip/stub_main.c
+++ b/drivers/usb/usbip/stub_main.c
@@ -256,6 +256,11 @@ static ssize_t rebind_store(struct device_driver *dev, const char *buf,
 	if (!bid)
 		return -ENODEV;
 
+	if (!bid->udev) {
+		put_busid_priv(bid);
+		return -ENODEV;
+	}
+
 	/* mark the device for deletion so probe ignores it during rescan */
 	bid->status = STUB_BUSID_OTHER;
 	/* release the busid lock */
-- 
2.55.0


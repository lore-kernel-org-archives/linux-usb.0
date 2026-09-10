Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63893486659
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 12:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043513; cv=none; b=M0p+g58bXHHoeaRrJkIoWQdpEo2aZRiT/K+pDmNiRq5RIe+dtT+Uziuz9pmzpQ8xXDNUKJoCPyGk2k2hJIiXm5mnVaZC0MPyzwOsozTQJ8PPObkD8d5qCv+gdHQqJc4m2Lcd+Zm3Lhz7Y84ok0++8zJvDDT1kkcGiAjbRg8DiXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043513; c=relaxed/simple;
	bh=YmVPJmZmJJpy+H6Vad8twxgOfHzx/5SWDC+0B4W79UY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jYe7cB3EXqyBLb2+6A8qdUSJCSwchKt4Iq4hj1qh4GrGB2/iKeVwg03ugAwGRxMvUBcH9+RcJmMTRG7vfQ9T8+TEb5qFTLF3ucILcbYMMKkji5kTdQSfplmQ+R3OpTuB4j9W8N42X8Z1tQxWdFuAxj5kHwfs42XeN/afLdV42Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJ5aRiu+; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJ5aRiu+"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so722455a91.0
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 05:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789043507; x=1789648307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=saSILGaN9dWmcZOtLftRveD8MyTd0A1bzqhRd73xrHQ=;
        b=NJ5aRiu+OzuZQQ6HZnFQN1J+PWapRUdAh0D10O4pl9gkR03lvOPWiwgpAZXdwIOcsT
         tT5pvpfrHEv/KArk6dP8LHX5xBFHxJv4buO6NxYvEB+yEav4/gzPQriYKProAy6MP6py
         N6WnR6WinaRxakBZt0DIiIhQz/2fwF9DYWbwvYtrUTmvEAJCOr4aWXdK1HUEcGeW3LQS
         yhZB95+HGSfh70xdj0BZLSRO2QL3saK0X1pnJh9iOPx1Eog/1aCJ1+5Azf5BNYLc3Iu4
         vaUMsRYHS2H1OYO1eNdaervrA1KPiYg/m4kftKfg8Dt2b5zctA1Hq5+RgyXmDXG1lGdH
         m1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789043507; x=1789648307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=saSILGaN9dWmcZOtLftRveD8MyTd0A1bzqhRd73xrHQ=;
        b=G1IzqLnLVZY9vjUSGhP/JkamJml33yRL3nGtSf5J8sBs/YJrvGTTPZQT0Hn9NjbP+1
         JB89E9mj04n22c4pxzsvxqQYGSiUjjnhM5/vwwfWeSjVxzDW1Ss1tc3P/iDkDJ0HjKCO
         DXH/XybvV7oYS5SzR+SYM2G5Oln/FJAhrrcucUs1OhGKsVRo3TZetNTJxx4pCdhpd6GY
         jPT03+unC2J+lmoiw8qK2KZ5KIpO02nQmgoS/GLjXLywAzdy5udR2ucKp4Q8twMGr0kO
         aeC3kfVRT+6CxrtD+IdiMP3Nyv2sl4Z0dTWziFBX5Sg49ZGQUjBO+YBoQtmONaY/aO/c
         jrnw==
X-Gm-Message-State: AFuF++kM6mdYiMnk0AJrOOaFDUHNVkOIu3pikKatwNDNriI2XOcE/FSt
	JWPGNfT5+nLpCoqrsb31XO7mwHJDE3E7aKzTwt0d+oZ33zVpAbyDigx5rCMyyRMe
X-Gm-Gg: AYBFou0IkqwYh5t155dOgQzNrEhXdEyRtdjut/zfZyvYWkWqxVHswNSxxrImJCle9gS
	1SY1ni2W2/yVFCQx//9BOLzbHfufYyuo51lDgkPVNsf3Jkpi7Yz6ILPLY9ufxkNSS6OlucL2mY4
	NOB7iFpZZ92EheNpoO0se9lotJpWEBSZHzNU7VsvDhGz5Bhavh9W/aIBG+Wif4nX5+8bjvgSgdC
	pU6PXyq05eOs2DVmiVkJuIYuZCXNh3LeSMoyGv2w2Ax6Z2+zZg/zTIhiMwySozFkXR7BpqOzQRC
	6hiCnmAJ3lNAuq8I2obppn2F4KlXoBsXoRk/5O9frKTgwab+DtDJWjtHZLvbmUe6ZwlH+Tx1xqV
	rqC/dX8Ub71H+DQvdr7ft6NaqIxZSSfIL8UAd3O5Y6GJUZ/OxBRrxQda0SrS0VN/6WIULN8gvef
	oSpr4aIxZ6FBM9vlvruCLMXt716Pn535nruJdwT5TaJwfafGnYMzD5ksKhCp5Um207DW7bVl0=
X-Received: by 2002:a17:90b:4ec7:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39d77b770ccmr6323288a91.23.1789043506633;
        Thu, 10 Sep 2026 05:31:46 -0700 (PDT)
Received: from lap-0341.. ([182.176.170.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm52658522eec.17.2026.09.10.05.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:31:46 -0700 (PDT)
From: syedlabeeq <syedlabeeq@gmail.com>
To: linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Cc: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	Syed Labeeq Sajid Bukhari <syedlabeeq@gmail.com>
Subject: [PATCH RESEND] usb: storage: sierra_ms: reject short SWoC info transfers
Date: Thu, 10 Sep 2026 17:31:28 +0500
Message-ID: <20260910123129.16793-1-syedlabeeq@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Syed Labeeq Sajid Bukhari <syedlabeeq@gmail.com>

sierra_get_swoc_info() requests sizeof(struct swoc_info) (60) bytes
from the device via usb_control_msg(), but its callers only treat a
negative return value as failure. A device that answers the
vendor-specific GetSwocInfo request with a short IN transfer is
therefore accepted, leaving the tail of the freshly allocated
(kmalloc(), non-zeroing) swoc_info buffer uninitialized.

truinst_show() subsequently prints swocInfo->rev, swocInfo->LinuxSKU
and swocInfo->LinuxVer from that buffer into the world-readable
(0444) "truinst" sysfs attribute. An emulated/malicious USB device
(VID 0x1199, PID 0x0fff) can exploit this to disclose up to 5 bytes
of stale kernel heap memory (kmalloc-64) to unprivileged userspace,
once per sysfs read, indefinitely. On kernels built without
init_on_alloc this leaks recently freed heap contents.

Only accept the transfer when the full structure was received.
sierra_ms_init() already retries failed queries, so well-behaved
devices are unaffected.

Fixes: 32fe5e393455 ("USB Storage Sierra: TRU-Install feature update")
Cc: stable@vger.kernel.org
Signed-off-by: Syed Labeeq Sajid Bukhari <syedlabeeq@gmail.com>
---
Resend: the first posting was whitespace-mangled by a webmail client;
no code changes.
 drivers/usb/storage/sierra_ms.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/storage/sierra_ms.c b/drivers/usb/storage/sierra_ms.c
index 177fa6cd143ab2837640c26f8336781ddd3cf9cb..8755fda42eed2afd3235283e990a35aac14cb829 100644
--- a/drivers/usb/storage/sierra_ms.c
+++ b/drivers/usb/storage/sierra_ms.c
@@ -76,6 +76,12 @@
 			(void *) swocInfo,		/* void *data        */
 			sizeof(struct swoc_info),	/* __u16 size 	     */
 			USB_CTRL_SET_TIMEOUT);		/* int timeout 	     */
+	/*
+	 * A short IN transfer leaves the tail of swocInfo uninitialized;
+	 * only a full transfer is valid.
+	 */
+	if (result != sizeof(struct swoc_info))
+		return -EIO;
 
 	swocInfo->LinuxSKU = le16_to_cpu(swocInfo->LinuxSKU);
 	swocInfo->LinuxVer = le16_to_cpu(swocInfo->LinuxVer);
-- 
2.43.0

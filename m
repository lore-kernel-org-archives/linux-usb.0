Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7FB49B200
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049043; cv=none; b=O7Xkam/5cduRdkEJvI2jlns/gKszh+odM2W3v6nu0C62ZYqN7Kw5MYWUdSs/BTi/PFE2nHymz5zeKUMHfQVQ9ryVAHT+qP2F/l2k7N6xOIC+12PeYLpcr88nSeWDQa0Nz+of565YX6I5ndY76jaXPDBufFKC27fRt1gvEdIqQz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049043; c=relaxed/simple;
	bh=Cy750GzBll6bROKUYBd0OY8+u3cY55k9qpgc+XdvLXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QISe0qCn2HnDmTjj00jMLpBsE5iBWpOGstMEuJ1FR0oJu/nwZfGvhAIm/lZ1OOqPFnwfdQXULYrRHv4XjGkgAli81v+MY6NCBUNx59JBApENH4Y8zsOMGNVYaGkBxDDpoFBL7o2RNkN0f5qnI4G1imWeMuR4IcVXNXKb3cXj6ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNXoMw1N; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNXoMw1N"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-478c01da5cbso1957429fac.3
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 07:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049040; x=1789653840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9J+JrWjpvpXQUYfZhH1A5CtyfDunCqzubZiL0OyBK0=;
        b=SNXoMw1Ngx1GVRVhR90VK0v5EE3K+hwfXIh8Zetmc3KWHsFLBu6+44b0OhF1cRdgGC
         E5u0bK0iYfhvfHXOqFD+nLBOsV9SqJWTadWr3ymV76Ergr02zPpGYhpD5rlUbuX+N6+4
         IbGQ9JMw1l+dmT9VhYbJCNkOywy9tM9U216catIE3bfIhyZuBls9jGETHFtbDJa9xGEK
         dFj1lIbmBjoJr/IW/+dkVlBIWQTVYDF0zYJ5r3YWYzhq7x5/sVa7fEU4ww9SdqO0Sbut
         d7eLm+Ti3BaDIPpDwlSWVZSb510jQP5dXGdcydlnJBfRM7oablBlT62PxTCsJYj8AJWI
         /mgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049040; x=1789653840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9J+JrWjpvpXQUYfZhH1A5CtyfDunCqzubZiL0OyBK0=;
        b=QqoNDL1cJVk4Gq0kfxs0UE93Vv2SW8UnuUD9DoW6MK/7tWTa3m6aXS+S9nsG6hiPco
         4a0JWF1mq7ie9uLywjBOyyf2uKdHElCuHGgeOkh9EWgXu+VdGfI7SM0h48Kkk7MrmLrY
         IyXxfDF+ctz8RtYvTlU+izdcGVpwcf9XKU1j+iN7rUh+Q6wdB5gidFrR3ZZm2+YuTS/d
         3G6PPeok6nobxaQbrZe2W11SOnXJNBowJ/k2Y7AaivI6wsPQPmkIsi/f/E8/ZdbQ5PUI
         UUJT1iJ30ezRE9GYjj0mnzeKLtzzF6skAFVHIeJBtvu7eHvJ50kUS63ZtRntDsHesvxh
         zwdA==
X-Gm-Message-State: AFuF++luZqxUEhtDQ3ft9i+vIfT7jdL71HdRNQNYY2jjwzfSDAo/XnbM
	+HRI6Z+6u5LgcXtgVYG4aYmkzhVqLyntweJJI5btgQsnVDCoUmw2d5WZEbJeuLeV
X-Gm-Gg: AYBFou3qWXS6iPmrFcTjoEZjij5dc/i/lX/ONnc0ZoMrICOzh3JhmmQyPpyIuJy5vFX
	Mt19H43YAH6vBTfzwM7u4k9qQxZQrBofsMXh8KUDLKTHE2AdQs70CKo6FOtQXOqFB1Rt7MwXZmj
	+szi6ta6DSSQaACly96cbxsm5aP6chxZijx7Pt2zUgf3A6GM4G3w20pCOT0Pyk0SEp39GU6GvlC
	nIvvhZmv4s19Te/ryN2GNBvVklhmODv1Tn2iFeeKc4Gqb8sDEPGJuiKFGmxJafYauH9fH5t9JyM
	9psogeI8cg0HekOZR2e1gvviCXddH3lQkj0cm2OxAzHsL4FWlrbq/EHrRV9sVyFt+l5HEHEHbAS
	Ja9FUPL7uOLGXul7YGDrHdCW/a2xpERRsDCCq/Lavzufu1YYzwuHgu7WC6gRt2HV1OfYkeqXpJo
	0GnbOpk00mna7jdRMhujPii7UH+NqlZsiAkKOBcXPyKw9YzRJ/BxrYyquvJfV5BvGg+SYsQaA=
X-Received: by 2002:a05:6820:1c9a:b0:6bd:ea89:939e with SMTP id 006d021491bc7-6bdea89a1ffmr6977235eaf.55.1789049040098;
        Thu, 10 Sep 2026 07:04:00 -0700 (PDT)
Received: from lap-0341.. ([182.176.170.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33517b57ac8sm39405426eec.28.2026.09.10.07.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:03:59 -0700 (PDT)
From: Syed Labeeq Sajid Bukhari <syedlabeeq@gmail.com>
To: linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Cc: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	Syed Labeeq Sajid Bukhari <syedlabeeq@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: storage: sierra_ms: reject short SWoC info transfers
Date: Thu, 10 Sep 2026 19:03:43 +0500
Message-ID: <20260910140343.49371-1-syedlabeeq@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Assisted-by: Kimi:K2 [Kimi Code CLI]
---
v2: add blank line before the comment block; add Assisted-by tag.
    No functional change.
 drivers/usb/storage/sierra_ms.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/sierra_ms.c b/drivers/usb/storage/sierra_ms.c
index 177fa6cd143ab2837640c26f8336781ddd3cf9cb..d8fe9561b2b5f4cce6aa8702309cfc195bc3c891 100644
--- a/drivers/usb/storage/sierra_ms.c
+++ b/drivers/usb/storage/sierra_ms.c
@@ -77,6 +77,13 @@
 			sizeof(struct swoc_info),	/* __u16 size 	     */
 			USB_CTRL_SET_TIMEOUT);		/* int timeout 	     */
 
+	/*
+	 * A short IN transfer leaves the tail of swocInfo uninitialized;
+	 * only a full transfer is valid.
+	 */
+	if (result != sizeof(struct swoc_info))
+		return -EIO;
+
 	swocInfo->LinuxSKU = le16_to_cpu(swocInfo->LinuxSKU);
 	swocInfo->LinuxVer = le16_to_cpu(swocInfo->LinuxVer);
 	return result;
-- 
2.43.0

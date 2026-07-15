Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2AE399375;
	Wed, 15 Jul 2026 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127573; cv=none; b=VHxKxyaZexZ7PyNbaGGvjBHnOfvFKYY751CPJvxyiDK7NDAgId9i5CqFY5JefAdYOXzqh/SBWze81pT+qYkOXChg5JZxgXHQk/Wp1SRZiDbVMN7krHSuWHl8RVZC2ivMXDaYyL/hBwF8zWgRmKGndN3bvDpZEfXyTdzFVMxe4C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127573; c=relaxed/simple;
	bh=wSuhdB2jTqqIKPqSlHSkQuluEtkwJCZw5Ml567sSmLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FEux72vH+/5pMD9Hu2KitOY2g3Wo2Af1jnZ4hLgsgXSyflWARmZpuNnl5ItXrx9fFN5CSdD2Ch6llvjyZgznrzmh2VY9imWhe/x5dwOadTi9R73q2MvVSIXPQv9TT/qiRUFjw2PYIfWO9h9ZIb7d4VnoeTp+opv1GEG9QsYVUtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=YezenFoH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qJ1z7wdK; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="YezenFoH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qJ1z7wdK"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C65097A010F;
	Wed, 15 Jul 2026 10:59:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 15 Jul 2026 10:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1784127570; x=1784213970; bh=rT
	SdxlDCWnDP+0v5UJtoX94EkoEKtYlDrJsTl76YmVE=; b=YezenFoH/0bbC/Umv/
	QEMBdZ+0rHAtEJo9/k+C+h1Feo2fFxufI26pac57M3tsMyK46nXAadIYnz8EE48s
	o/WjK6Qc53jH3hHh/+loF60lVD1HCpHURyoRse7RDn90MATnplQ31SzN5sfJePPR
	oh2cZ9JP4phFT8FXgQxcJQxJGUoO6Wt38nq/9hXWRRyag2iBdUQxO5dL04HyGJ9e
	dhil96mt4IloS6ZooILDvKiW0le3HtmfYzZmkpVlLKiKkF6b4hHlGhm0r1E5ZcaZ
	/aHrgiRPgDp6ZFW0A4PFktd4YkirT+b8oU5AD3ltlEQxRlji0ELCV9V9wzEW2yHA
	YXDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1784127570; x=1784213970; bh=rTSdxlDCWnDP+0v5UJtoX94EkoEK
	tYlDrJsTl76YmVE=; b=qJ1z7wdKtjow+FA4y0iDyq8TdsEb8bx/LWQFC60lxO3j
	XCGjj11clttPVnP7QMjJtreKwf8p2kkRyH2h1CUFZl++ijVDVe+I9ucYsI5zR9gg
	jky7S7UQKOjxCHqP+THaxbZdre5FpqY5TZ/JdyEidl0Zhq3D5JHQBhjXpYsW1Pcm
	twPtpK13kMQhtGS/ntsugxjBYZdFJgCEDtTLl9Dq9ElbaRi9O8pGOmMjmsxWvgUv
	xl5QWoZCMzRzLi2D68pKMs5juZSGnWaCWbwC/N8sUx0jSPhuIO9/nSaLW7DZ+mtK
	MKuzTE+VIpjmPMDhRhefy3QokRPrtifqBM4RDaaizw==
X-ME-Sender: <xms:UqBXag7QTSQPxDNhfd5nh71ehjrE9njvljji3da4yRgqpGpXlO3UKQ>
    <xme:UqBXavs3Fih0cmB-Ml-mu5RYpgkNPKNncJxEb-dX6Q9Wc8KaTIfq7uwxAUphS6b-p
    U-f0gOLRawjZRmP129qtKTiyintKU8jrPHhhi-ZJ_MnppKAQ40>
X-ME-Received: <xmr:UqBXap6NZvoJ1h_RJeMMBpSIQgg1c3KSirJ-jQCiDdC_2qtDQUar1u1tlf3QoesO4tp8D7u7oCowQFM3f4FvH2XlmpWu0wTyMA>
X-ME-Proxy-Cause: dmFkZTE9bagBonHyYITSwKjKR5ITd3VWgVF0iCa68YzMAGQV3HQCttUg7P+b7u2mKAl9gT
    Li3NP1gAn4ZefXGH1kN3W7AL8OUC+5oPyquQo3AWhwBqWw/5FdwBBAeyxZbloflQI0cS8H
    4BmFx6TtM1/0SZRVIw9s13RkPjl6RAitR8T4pjq9o9jfWpSGHTYaM/iHwSxNXOnK0nMmtG
    MB/iTCCDtqellKtjFFqkyNK/JMrWR9uVf7Q+6IpAyU18G87Z/vl0RweOjsT0ujH9S71ogt
    Gnu//bL6Bg7E+obwi9DNYcJUJkdPAujXmUNShKZMIKv7EP3kghwm/aE/CUi6ZcoTF6l8Pk
    eW9BtgT1xuJy1HE/toicRMBZJghMfoKsUys00JbDPuaTNlq4Rd7UFxRNtAV8paF64PnPeR
    yFeSUqp9rnUICqPDSB05bWp/cJvQ/K/LRY2FzeEsTD9GIZAWPNBqluZ4iXiN0NicHajEy8
    ZCMrrSHY4G8xQhBIkMOilujAcf/Pkwpxbv59P9XRedD0VVpWOSmlGWf8P31Itr/O0LM3lj
    D2WvKWqkVsyKXp5+nRzkbWStHW5ID+9VuYzmOPkG+pZ9oOARi4O8xEVEkFFYaPsUGFXIOW
    FwMfeqA0D6mEvReZrGFjVJhquCTBwe+P26/Pp7VKyWk8koAa30Lii8Inf3KQ
X-ME-Proxy: <xmx:UqBXaiWOJKEsINr34XowxlWx5_4yHfv0UVCYCNJILk3rzy6HAt_O0Q>
    <xmx:UqBXaj_XTBx_ZBUT50XCLXQRDQccC5XoP5-gTjUJPb4aDTUxtBYRcA>
    <xmx:UqBXamkmW0Ht6KX_ub84ck40ax6RefyWDAn6OWYwNAOumc-PO0f9wA>
    <xmx:UqBXapVDMNJYMNFb0AHnR8pqozxaTYR76Hz3etyz6A-zo0fZCFGFng>
    <xmx:UqBXah1lZS4S0Sz8zSkKuuqOKClp_Fr7ZmAy--47IFDykjkzl5JT-AeU>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 10:59:29 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Date: Wed, 15 Jul 2026 16:59:05 +0200
Subject: [PATCH] usb: core: sysfs: add lock to bos_descriptors_read()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-usb_core_patches_3-v1-1-53021f5576fd@kroah.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWdukFMHgVQxp2uFHxgWQDhATw
 t2tuvwW7x2kSAKle3FQwi4q85RRXgriMUxPGOmzyVnX2FtZm02j5znBL2HlEeorE66MdrC2b12
 kHC4Jg7x/00f3t27xBV6/JzrPD+cRDAZ2AAAA
X-Change-ID: 20260715-usb_core_patches_3-a4ce9f00d92b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784127567; l=1529;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=wSuhdB2jTqqIKPqSlHSkQuluEtkwJCZw5Ml567sSmLY=;
 b=y0sfD9/G+bhwWaJq+1g1Olh+HaMazT2ruGJDJId/nrMdl8+ch5BMnkQQpNYXNeWozJwTlcv6J
 9nMkY98fG7CDEsCTNhNYM71effYQrx9W+ei18WiJhMP4NZZO8nGKHYO
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

Add a lock to the function bos_descriptors_read().

This function accesses udev->bos, which could be simultaneously freed in
usb_reset_and_verify_device(), a function that is commonly called in
drivers all over the kernel.

Assisted-by: gkh_clanker_t1000
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 drivers/usb/core/sysfs.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index a07866f1060c..d22dc78457d7 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -899,10 +899,15 @@ bos_descriptors_read(struct file *filp, struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct usb_device *udev = to_usb_device(dev);
-	struct usb_host_bos *bos = udev->bos;
+	struct usb_host_bos *bos;
 	struct usb_bos_descriptor *desc;
 	size_t desclen, n = 0;
+	int rc;
 
+	rc = usb_lock_device_interruptible(udev);
+	if (rc < 0)
+		return -EINTR;
+	bos = udev->bos;
 	if (bos) {
 		desc = bos->desc;
 		desclen = le16_to_cpu(desc->wTotalLength);
@@ -911,6 +916,7 @@ bos_descriptors_read(struct file *filp, struct kobject *kobj,
 			memcpy(buf, (void *) desc + off, n);
 		}
 	}
+	usb_unlock_device(udev);
 	return n;
 }
 static const BIN_ATTR_RO(bos_descriptors, 65535); /* max-size BOS */

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260715-usb_core_patches_3-a4ce9f00d92b

Best regards,
--  
Griffin Kroah-Hartman <griffin@kroah.com>


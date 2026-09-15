Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC599285CB9
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 04:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789445271; cv=none; b=t3yFCgI8qTApnOUGtsX1eE9qkveV8j85LjETn7+mJT68SUnNqAZ4KJUG0N2SUxa8bxKsFxERyCVrYixpUxx7V1eUSgtDIZChV8kFHTZhTCy/BWE8L6f8QDwbx/qPjFrREkZA0oHpedEVeUpY3HA6Rq7a3YNTgopdtv588j/DtLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789445271; c=relaxed/simple;
	bh=cKIa06wIrW0ac3Zj9WiXKI6LjS+pD0AlCBrNRRwWLsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ALhk2ylSj8E7J+g0OKxGodkeVExbrs03vihW5YJxkIJuVA04hmTapdi/arffQ4G0bHi8L7Rn/9OYaa7l8AXJB79ZS3kwX/ua7LihjwRKlrwSORtprleDQtFzMH0rA01oQ3eEKzvp5ISQB20hOgZLUchAJpgW8jDboOq00Mq6PzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lr5C/36V; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lr5C/36V"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c83364233eso3552362e0c.0
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 21:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789445269; x=1790050069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xladwkSFDEGqZk+H5BcCxNk/qet3/6nEXAvoznyM27E=;
        b=Lr5C/36VxfQsM4vZANjYl9FOB/gDNyHqLl/hK67DU/KuANB/42kFCj32+IQsPdhPpH
         3fTQv7/hgHuYUG1rvILll0Y+v9K8/ypVTfpsz13Yr1MvwaQ5fpwsdSNR18V6WZSzLOH3
         u06tWR4sVSode4bpbwRKKwWwB1NPHmrHtfXTWpCmUr/k5LVLvbgNY+cRDuIFFLq+DRar
         RKbL08B+AxCNokGwddryZg1BOnHtflbs3Cvd0h2CCXMqxG54kuRX0jVEWGhGMX5Mon5q
         27qt+W9vQ2+rDKliOxOJo7WdKxeAZJenUx5EJ9fH2cgEg3KbSqfXYYzL7eguwOUpLg4i
         oTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789445269; x=1790050069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xladwkSFDEGqZk+H5BcCxNk/qet3/6nEXAvoznyM27E=;
        b=t+PQYYnCGY34iSRY8UWSKa+/A99y1vSNpx7lqU/du0sCTSpd2MkODVb5KpxchGV3LJ
         /Gkk19dlqU+y/xd27X158LBx3DdYWgi7jE0akcYzsjH5MY9LbKo7KWyq7vjYpvyvRTjR
         K/ROJucp7R44LQDpGteg6eaKkCyPASWYgCAc/7aUI96aDNyYjzf/DMRE9AKVdlSY/hDG
         N8OsXVthxrF/jKvq7VvfdXz00+rU4DrNNOCIAUBNdAktIIej+jmYRLgnkylfRoPQdBDK
         FtG3mWkUE/CRV7RkjHRDPH5FOsGN8Jw7LoM+nkWVmszakZgMFtzjElKem4Z57E8GO8S9
         gVIw==
X-Gm-Message-State: AFuF++mNHpYNp3e/ycHo4O+Dd5MxAn4LsNp8BpKWA30KBZ8OlRo1Ovfl
	KJJPyMZS8CbsggAM+MbKOF84unpx2wSsY9gJXoF6INoVPhfsX58bTs3Y
X-Gm-Gg: AYBFou2Mrq9Xap8BJANKhMK+00IhVj8H2o94pMhtwECFrKJvZhyZCGakn/4mh+TON4j
	5HWX7x0WhgOmFe6Oyp1fCuk38WEATQc2YkkUTMPn1sGJYPez7fJ15gjPSJFq/NUX8RNJg01QgGZ
	3A41DyEJiclaREOsdg98fD789ByOy5AZks152u5Fv9CPwbmwNwG4eBf5I6AYo/NXe/cmOkcXKVS
	mXkBPoAgPH4fP7lSnYmT9nSnmEFCXTMpHIeLZB07QyBcF2w0pYG6xu7c+9vTHFHmNnSMJiHLvYz
	yMLh8ZyrkVBJrrnD7JAorABVJP2cwHHt1W6DqZ7EhEL91hDP7+k4IeWt0ssThlDasSGu7maAdTr
	QXJVgcybMqVPKIvcyBTOiHd1sedRQUG42quwRzQHuPdtxCZlvEyku7EsMEv++Rfs6z/u9zhPlXv
	RCDTIdmIvPIkar3+9WdLPqhckZ3gzEjmjBPLN5BKMofFQfriYowf5alKXNdPovrJt9
X-Received: by 2002:a05:6122:21a9:b0:5c2:c0b2:9880 with SMTP id 71dfb90a1353d-5c981adc33fmr6838000e0c.1.1789445268666;
        Mon, 14 Sep 2026 21:07:48 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470d78casm13754001e0c.7.2026.09.14.21.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 21:07:48 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Bingquan Chen <patzilla007@gmail.com>
Subject: [PATCH] usb: gadget: configfs: zero-terminate Unicode property data
Date: Tue, 15 Sep 2026 01:07:25 -0300
Message-ID: <20260915040725.2421387-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unicode extended properties account for a trailing UTF-16 NUL in
data_len.  The show and descriptor paths consequently consume one more
source byte than ext_prop_data_store() allocates, exposing the byte
immediately after the allocation.

Allocate an additional zeroed byte for the source string.  This preserves
the descriptor length, supplies the terminator expected by both consumers,
and prevents the one-byte out-of-bounds read.

Fixes: 7419485f197c ("usb: gadget: configfs: OS Extended Properties descriptors support")
Reported-by: Bingquan Chen <patzilla007@gmail.com>
Link: https://lore.kernel.org/all/20260421141010.5607-1-patzilla007@gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/usb/gadget/configfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 183a25f65a..2041b97ffd 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1351,9 +1351,10 @@ static ssize_t ext_prop_data_store(struct config_item *item,
 
 	if (page[len - 1] == '\n' || page[len - 1] == '\0')
 		--len;
-	new_data = kmemdup(page, len, GFP_KERNEL);
+	new_data = kzalloc(len + 1, GFP_KERNEL);
 	if (!new_data)
 		return -ENOMEM;
+	memcpy(new_data, page, len);
 
 	if (desc->opts_mutex)
 		mutex_lock(desc->opts_mutex);
-- 
2.43.0


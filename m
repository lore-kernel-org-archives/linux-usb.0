Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA823A3815
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 03:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047453; cv=none; b=H0r/InUJEpsb78QkxVYA3APQIJkvirCDZSFri4ZzAeZWAA7trp+QExx7HXWEs9iofZkr4fHT0e6nD7HXpTr8CdV/g/8oR2E/XcfgDDQTUCdHgmfGswRsMQRqaIdZ4qb7Mmd9rKInyAjdPHP5KVO52KOldowo/k2aHbnNjmrOnrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047453; c=relaxed/simple;
	bh=ncRkxkkeAIbVD1Fahz40xlau2ePXTrC1LaSC/1ZaVZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NxC3FwmwmG3tZgZQvnmBedPBejvm3tj95aKhiXXMGa+CzG5j7eX/hCsH6B4OmSvAJw4785V2IeO/6roA6ZdmFEXskgSq8+OakO1hGzpaMqHj9qJr4a7SOyD1gj0ITU6Jr0qn+VH6GbDSkHEuY/CQNh3dtOJ8IWdZXXLfLbb6AHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=armXNzHc; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="armXNzHc"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530de452c33so31056461cf.1
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 20:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790047446; x=1790652246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDp7kCvGQJv7Gj/mubADb200WD9R0dbypDFk/xuiIQw=;
        b=armXNzHchuMt3s6lUUeJUD9lf+AKr1CRTU3NCvj06ezAF054Wg3nEIJiDwPuw817Ok
         7+I+X0WtnPtrwZeGB2Fx9smegxeCS2DmLe95feLbvfZiaKFSSqgpWixfouDQuDc0+6wE
         GCYqO3C4syFsZrCazgk+55BAfqRm/q4ZxXUFUNOKzsLtdgGnW7f8JKvpVUTqyU6/PYXS
         Qsrse8XlJY3o4Ry0+g23PW/Y/OIxPUTbX9+ED4efGOGCYUFVAvB1VeRvs4Ki5lmGL1oG
         1D+F0wRBW7Pc9m/nLMInpoD+aJZbl3iOUCUv5FNqjALVPNV5ww9/KnIUTCGiaCBM8wU7
         +V/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047446; x=1790652246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDp7kCvGQJv7Gj/mubADb200WD9R0dbypDFk/xuiIQw=;
        b=bVk2G/l1Pndu5EeKRWlOQmLmb8WzneuIHExsrKnqKrIKOeVI9KB68vgpSZVUy++qvs
         RkkX1XzXVBq+GFqG7hl2bSedy1Kf6ktRVQL4k7IDw2hYvMshE/ykf604MpnavX2Bo/pV
         Ta9GJopHy2cwBUp0kwpNu156ZWMOJpYzOv9jDYnz4sG86pXrzlJiQwAKPdVofLJutjXJ
         u5+rmnsxy6HJsH3n2fpyE6EyQnR//0HnxVBXmqmD5QRC9p6N6ZbnQ8T0OWslSGjNOkoG
         Y8/FEeSmX3sOk1Z+qJT49S8uYZFIJ5T2Qx6yNZYyXkXijt7WJyDScA0dIaxDYv3Ls1If
         1JHg==
X-Gm-Message-State: AFuF++kY82UbBKeVLRcgYb0sKi6yhalIxReu2AseTOTX4S6JgEHCrsZN
	UFTYZsU2UH9mGXteJPPViOz9s6hlRJt7eJ8qOJ2KC/ZOVJrGvuSFmBI=
X-Gm-Gg: AYBFou34zokdr8A0xjY9E6fLs7WP+JpmGXMOyExa+YNFjZsFYyIuOct+tzwXus2L6CX
	KfcsYmg9Q3sycthkaUx3R8yRKZO+EiKUfCtp9l2FOiRiWobhpCSZVAEM5k7fNje2BuJqFfdPohW
	7mW3nxEHoLB+Tt0I5ny7LPv459TgyeSrHxoJ1lSngbs+uwIt8jHsJDE6vP6gdSfLhs3WuYy6fMP
	tVNaXr7x0VxMj7sLQhY74P4sdmWSwOx+sPpTAJhevutEld2G2E6yVT84g7Su8ODYTrvdUYHedHm
	LRf0j1Ix6f9CTXxVZz58EHiPl/d/uToWan3Av16p3dK9Ib0qs/+x8Rqy4aRvRjX5aCuOQ6JqFeE
	JIwMRNfvL7dmZn2S3FCr175PoPjIRw6Ii1c67E0+vmBbIQRNwSwD2VNbL1KKxta/F6CWiCm0hcg
	PnlplZsv7GdhJQX9T8KKfddvrCeec1DkTZwVcOlwzqO2UjPm+JMQLJhNOD2SEkIafRYRiScOXjL
	x777eWrEvSI/GbCWRTd7nnYg7sARH+tb0hWSa6YwJ8I8A1DDCoLPSA7U9YJQBsq6zmI2y8fGyf6
	nG7vEQqG85m0BlzEk4gTi51h87vq3UZak+sTSoI=
X-Received: by 2002:ac8:5a86:0:b0:531:d21:5021 with SMTP id d75a77b69052e-532d8d35f7dmr36423011cf.13.1790047446387;
        Mon, 21 Sep 2026 20:24:06 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e196ef4csm2429671cf.28.2026.09.21.20.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:24:04 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] usb: mtu3: Prevent dr_work rearm during teardown
Date: Mon, 21 Sep 2026 23:23:59 -0400
Message-ID: <20260922032359.687286-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ssusb_otg_switch_exit() drains otg_sx->dr_work with
cancel_work_sync().  A later queue_work() from ssusb_set_mode()
arms it again.  Callers that outlive the cancel are the role-switch
store, ssusb_id_notifier(), and the manual-DRD debugfs mode file.
The role switch is unregistered on the next line.  The extcon
notifier is devm-managed, and extcon_sync() invokes it after
dropping edev->lock, so unregister is not a barrier.  The mode file
is removed only after ssusb_gadget_exit(), ssusb_host_exit() and
ssusb_rscs_exit().

The late work calls mtu3_stop() or mtu3_start(), writes IPPC
registers and calls pm_runtime_get_sync().  dr_work is embedded in
the devm_kzalloc()ed struct ssusb_mtk.

disable_work_sync() rejects a later queue_work() and drains an item
already pending or running.  Exit does not enable the work again.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 18cfd7b85ced ("usb: mtu3: rebuild role switch flow of extcon")
Cc: stable@vger.kernel.org # 6.10+
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/mtu3/mtu3_dr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index ffa5b9401dad..262922057b13 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -326,6 +326,6 @@ void ssusb_otg_switch_exit(struct ssusb_mtk *ssusb)
 {
 	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
 
-	cancel_work_sync(&otg_sx->dr_work);
+	disable_work_sync(&otg_sx->dr_work);
 	usb_role_switch_unregister(otg_sx->role_sw);
 }

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0

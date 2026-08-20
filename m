Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ECF3D7D8B
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219848; cv=none; b=ImVKcNguzYAjVfhVEvWAz2pYwxgOv1GLQ1RvoCqJKh5AbmqAlZOAk2/bGkkAhU9hxP5ZHdDraDor5twGD1/wMs8YFGI7HliDdcAVLRkkF5oxn2EDPcr0VLis6NmEa5UcjILvCwC3NfCXd3l7xH9kGxPHC501JD5dJrUuRPDAmRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219848; c=relaxed/simple;
	bh=WKBvEnsdTJBmKCzNv2bAc+m7P5UpoFHCP17W9kDPtbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cw6axBRGUDTYSjYM69XwSOACzOKaISd4dmd+NtIrHOMVTQOxYeAq9InL6MOy7CRd4ZV1Ba/gGapXXQdGeMXx5+O33ahHpO5xa80LC3lrjaV//A8ji/0rmO78hhYqRiQM9sRUuzbtcrLO3Zaap4IRJK/0y1hbko3jUSjDgcslhpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JfR+Udtv; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JfR+Udtv"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2748918a91.0
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 02:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787219845; x=1787824645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VKxa3YviLN5cCzfebqP3NL9+RZDJhxjogBm8ItS5b/Y=;
        b=JfR+UdtvSz2DlePMzDJShoUZQniEbULmX/CoFPL40m1agrGRbjwwUuj0O9z+Wsx0OW
         iIxAPxD9DtDl8SIyRMuTl7mgOGX77lV91cO533u/jtopsWo+PRCJ5ZR74cbPMDXsPes6
         F3d9ld4bYoPpktMb/aIGQolzXHixpQNbFvDyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219845; x=1787824645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKxa3YviLN5cCzfebqP3NL9+RZDJhxjogBm8ItS5b/Y=;
        b=s6KQs8uOtQ8NzPgz2LtEcA8wgcG9Ji2pKjd8ymlxuNQQBu/bCVjFlc2Wp9ZKRYP9Qk
         k8SVOCiX7aEyeBduSLvme9V7GZNHGjddoDM5nhJO0KPizLQoaorjy0B712qeFBbUHA8i
         c8M/hD8Q2YU+mEjjVPIWcf8hMh3WLDS7O1dEtMvGb0EvFelAsieSq6lkW1Yh/n7MD1A1
         5xMGfjxe2iqTj8l24MHyl8i4GEivMvBjwzXGdbLMoDL5ARgve8sIn/AWJUOv8eCIaV11
         h2AN+xcor2WxZYzq4hCPrhJU+xVCe648z6k+YDrrYvU1IcvYbEvG5kvwnf7YRSP2Wz02
         mi8A==
X-Forwarded-Encrypted: i=1; AHgh+RrhafHLs7otDNv4qcq+J/Hcmi1qvMPPO2cE+f5mpey/AxJmUoVnqF86uEuIDQIl0UUvOu1yVfUWXmE=@vger.kernel.org
X-Gm-Message-State: AFuF++loOX7x5HdRwdqTnV3qLL76U/mSjnc3iKfFAOa8g7lctMbZfzBP
	m/+kl0C7ewzhDtUN8wr8lBQt+UQ+GSMEfSfvOF3JYMEXC9CBwOKSLIqVUe59a2Zx6Q==
X-Gm-Gg: AR+sD12UGS4NMib0Dr0P4R6G1p4RCozids9cvIUGpug/Dt1uvB6IgJuqgG3HDWFB2bO
	m8I0ZoRYH+V8K56guWVRrIOOANm0vhAOz9GAVCTlZtKWDF78aaAG5/KJRbzDBZqecoEhr391gP6
	zI+AeWdFGMPzn1qx9C/w8LfnPGpgzlfryyObHGqkZ5nseteFsJU1R2HI/jBwN93ryekNcDu1EvQ
	ynHcitC2iNfXG8sb5Z8/PcqqrDP4ptH5K2qwfzwFui+GGUKC0la0C6lZ1hpcQluqhHIuqEgWRSt
	UGf4w75q8bHev3BWgt4ix3Wehc3TEgU/XK8e5J1OOAv7hUrjPrRBI/XsGZgkzXEvO4ug5aXVmRp
	BDco4WRwigKyeakYeFYzQ81/8StEsW0eWpVkFbFGHLD3kYWntyr/yxthD7lQhzoAiTQw9xtbHmN
	RDFYKeP3U6tph/n0GcMLvyjpq/+YzR+lvjpuJ3Z2AydL/ubKpc9lLt77G+fQdTe712gYMm8jm7T
	VfEcExGWMkWu7uAjLuDTSkeBmivW33VSyYpS29eFEl5+6E=
X-Received: by 2002:a17:90b:2f8b:b0:38f:57f0:1f5d with SMTP id 98e67ed59e1d1-395810d73e6mr22203640a91.15.1787219844897;
        Thu, 20 Aug 2026 02:57:24 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:f586:a29c:c825:e01b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fbbb8d5sm6602675a91.14.2026.08.20.02.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:57:24 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH] usb: xhci: Fix HCS_ERST_MAX conversion
Date: Thu, 20 Aug 2026 17:57:13 +0800
Message-ID: <20260820095714.1865096-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This partially reverts commit 6d45e9556d4a11b726e897d86e095b96db4550d8.

HCS_ERST_MAX holds power of 2 value for maximum number of segments.
In the culprit commit, this was incorrectly converted to "shift up 2".
On hardware where this field is zero, this results in xhci_alloc_erst()
calling dma_alloc_coherent() with size = 0, leading to a horrible splat
and non-usable XHCI.

Revert the shift-up-2 to the BIT() macro.

Fixes: 6d45e9556d4a ("usb: xhci: standardize multi bit-field macros")
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This immediately fixes XHCI for me. This was observed on next-20260818
and next-20260819.
---
 drivers/usb/host/xhci-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 7a21ac81f9c8..af8d4b74c4ba 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2301,7 +2301,7 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
 	if (!segs)
 		segs = ERST_DEFAULT_SEGS;
 
-	max_segs = FIELD_GET(HCS_ERST_MAX, xhci->hcs_params2) << 2;
+	max_segs = BIT(FIELD_GET(HCS_ERST_MAX, xhci->hcs_params2));
 	segs = min(segs, max_segs);
 
 	ir = kzalloc_node(sizeof(*ir), flags, dev_to_node(dev));
-- 
2.55.0.860.g4b6b3295ed-goog


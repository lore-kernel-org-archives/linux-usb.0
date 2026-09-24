Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0F5476CCE
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 11:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248939; cv=none; b=qBgsD9+7asG2rayzXzUSfobG1WtxLqSmh7LQw+W88a8/fNnLVbHbhUh1wF4GBIXvC+ojqjE1Fnmxxyam5rFtTjHiRoOUfNp6Z1xIBV6LKZrlPm8fJ9sdy7ypgC2rNVF/nl0Dn4xCUF18F/M3n8HF0FDgKwnHct0MQlsW+o9pQK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248939; c=relaxed/simple;
	bh=MG2Bc3HSziZh5YSiBO1i5BIAIbO837rHWuxb349QBQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eqZ+L2Wcp/Z25uR1I42suZE/Odu3ZVRU3KsR9Pk0KMNAd4rhAW/4GqydmociwM1MndLmTNwpNwg/z+DZvjZZSf/i8ShyPYgUfJSj1FZc5hgVAQ42Rlm1mmbgHgSzIU2Ibwx0SazBKOIPrMdRjhKkfgDZzgkl5qo9qSQcy0sVNMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DP37IDsH; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DP37IDsH"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so518444a91.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 04:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790248937; x=1790853737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VspQI5WMjsdSCk34l3Q9s/IcuI4zoJXws0vCPV44u/M=;
        b=DP37IDsHmffp80JRqliDdkqshyfZaDzf3fmZGl1Nr8yCfy5XvWcmXP8ke3thnaceDE
         jxusDxEzJN1fcUxgYEKzjnPqWZq+UFtH4MijPKFE/L+cCNyaYQuM37x4cxXDFkicMxmB
         fbLcl79c8eU9Bs18PeatLMixv18sWiw00FcRorWmALO6w2TSxoI4C/30YoDs1a3+vYht
         v43RQOWeSuzAXzaXafEWUgSeADwUYOxFnoo5ttXRe2MjaiSB+1CVGXYdUfx/xZ658MPz
         ODnIUg1akm288iybr6JFIWwWXOceGZJXvbI0jkIuilOJEaOXI/an2OQwb/xHr+NexNQ0
         +4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248937; x=1790853737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VspQI5WMjsdSCk34l3Q9s/IcuI4zoJXws0vCPV44u/M=;
        b=aykLr+yM9vqk//fTifFzOR6dRcD+i6k+CQu2JoaxV1I4V1iW1OcVvKF+9DcabuKG8z
         uovGKPSQsG1UGAb5Gm/8XadCNw/VRAIJROcQNXg8xKjCLh9Ply0UKVjmnDrm+0CES9jP
         WLP6q7dJYSmVP+OKTgbYrflhrfbZroM8BY6AQ36mZqIWwoOAVJZWOpkj8kFHbaurXZ1t
         bfNfdrwFYapicMLSGF4/LYZ3TxIbmogaC0VNfkzdTDr+PssfZQv7S1qeTXY/CnYhu1g+
         wulWQ5rifbe2hQycjwsnZtmFmP40iHWWXNJEcaTSenWW4tTauo9KMdMrVUTXChoqaiQQ
         m/EQ==
X-Gm-Message-State: AFuF++n8O7hY6ZCSkU7C7uP9h17UF4D2WPgQ/CfRoQBiC0Fzol7ebHdo
	6+mgGvKhcccxnQ9EmLKIt1IkJzmGO1RNHa7tshauZbpTer5U2/LCS4XD
X-Gm-Gg: AYBFou2rvH03iellz9KAxc50XYp3OBRP01pd4YR+e1DXl5vEJ3dp753hCp5FX9xUEBV
	AwJjCdVfPb8Qc2QAwwLWzUcTfhJx1ANrKybDu2SvPUYJCBDidXOBolq09BMmNmyG1g46qwEzmhQ
	1+AoENUrNkCitHBVRRTwHWG/TNYBzdxseQqAhOi3RPy3xS+tWxrofdp4ZxSaMQKRjOtzmx1RJsc
	6FLBkLCyJ9tjBEE/gc/WluA+4YvAUkMF0y8YOeKu3Od1Mg7EoRLixQYZ+IFYKmXzPWenbSRiKZp
	cHn9dxk5nLLA1CjbmAWjd+grWvGEA+W3surJ8TnqJBQZLwUU9m0dfEwmpoqBoehup8RkT7LzVHf
	7zsc481Zhb+vgls6wBFeKdX8eUhsa19LYJ8Lr0nM4WrVeXFheO4LLDGiJAqTx7msGv6/GOuqo+Z
	ugv2aqvTN3JNNvamB/Skj8xaPZmbe0n4MRnnuB4D/1pxyfSWJ2mv1cHg==
X-Received: by 2002:a17:90b:1a8d:b0:39e:58d8:f899 with SMTP id 98e67ed59e1d1-3a098abd80amr1586783a91.35.1790248932805;
        Thu, 24 Sep 2026 04:22:12 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3b82aasm2569713a12.9.2026.09.24.04.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:22:12 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: gregkh@linuxfoundation.org,
	mathias.nyman@intel.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rosenp@gmail.com,
	kees@kernel.org,
	lgs201920130244@gmail.com,
	avorontsov@ru.mvista.com,
	linux-tegra@vger.kernel.org,
	jckuo@nvidia.com,
	eeodqql09@gmail.com,
	stern@rowland.harvard.edu,
	davidm@egauge.net
Subject: [PATCH 1/3] usb: fhci: release IRQ and MMIO mappings on remove
Date: Thu, 24 Sep 2026 19:21:54 +0800
Message-ID: <20260924112156.1564208-2-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924112156.1564208-1-lgs201920130244@gmail.com>
References: <20260924112156.1564208-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_fhci_probe() creates an IRQ mapping with irq_of_parse_and_map() and an
MMIO mapping with ioremap(). The probe error path releases both mappings,
but fhci_remove() omits the matching cleanup after a successful probe.

After usb_remove_hcd(), dispose hcd->irq with irq_dispose_mapping() and
unmap hcd->regs with iounmap() before usb_put_hcd(). This matches the
resource release order in the probe error path.

Fixes: 236dd4d18f29 ("USB: Driver for Freescale QUICC Engine USB Host Controller")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/host/fhci-hcd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index 71e785f445a3..1c8f6317f6aa 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -756,12 +756,14 @@ static void fhci_remove(struct device *dev)
 	int j;
 
 	usb_remove_hcd(hcd);
+	irq_dispose_mapping(hcd->irq);
 	free_irq(fhci->timer->irq, hcd);
 	gtm_put_timer16(fhci->timer);
 	cpm_muram_free(cpm_muram_offset(fhci->pram));
 	for (j = 0; j < NUM_PINS; j++)
 		qe_pin_free(fhci->pins[j]);
 	fhci_dfs_destroy(fhci);
+	iounmap(hcd->regs);
 	usb_put_hcd(hcd);
 }
 
-- 
2.43.0


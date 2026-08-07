Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788C444E65F
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085814; cv=none; b=bzvE3Hx/aI5wdgO1YI83NlRNYHFkleEm5n9lWK1bhzxmoTjumDUPSOO+dOfMdbeDSl0y0ekvvn1KTw42+tmH9L4DF3VoSpCCX4XexGJ3xbjKuM06hkQT2lgdcFIVCJjEt2DFi2iFnLFyx7Z1D06cyfuZTXTXmTRSP274+bv1pF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085814; c=relaxed/simple;
	bh=WOwt4OMhl2uD+0uwyR8iejjpuq9Iqazk9t/oBC4Snos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4RllYjc99YyS7bOR1/KiIUUlIboyIGQsNdA46T9a3qA2WqBLtYr0fcRAO/C+VDd7RtEl/w+vIld1uGEbFcNJ1fWR5YFsDn6MJuXumRR850tqGv0fS0zlONE4KtOrdHnmWOlyoVWELMppdlcTg7plu7UQ8HrOiQCovJGPU9IdgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuGocW51; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuGocW51"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc97653887so35802125ad.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 23:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786085813; x=1786690613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6h9TCw8eDVvs4kPXVD1hECd88bCZqNFEXcfZGl9xKJ8=;
        b=GuGocW511qvcoivQfekXhh+77w8b/oz5uR9vt7nSWUSYrCaT8D4YeFJSrVmhU2UKL9
         i7dR/Rhms62O8bCBgm3MTa6fixF0FTxDSWxj8r004Wh83+RZeIHDqEJhYb9aYnMdA5yr
         3SSCGMV7EqEnpHrplUmH55ljYO3gWTDTaxxlBHKXji+KWNp7wJB4Ga2ent/HuFpJySsD
         s3SBlgOmlV4xkmbEtPT6v4VMU5ztlCUTkXsqBcpwE/j9mK8u6e8ORn2w5XkZyMGPEO9C
         3sUFKzXGA+6Wp+V5JRPxzda9KVpIQyENHy8/cLmagOROHhIQoOlymErvQabFW5GureEp
         b3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085813; x=1786690613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6h9TCw8eDVvs4kPXVD1hECd88bCZqNFEXcfZGl9xKJ8=;
        b=enRl0I8dvxqnR2jjgKNjdD0tSuVKdl7ebdl+WBHaUWRm0cmB9plaOXcjso902C3Tks
         NiNViSpQIqQLay5sDn9ihqNWucsNNQ2beOhL5OFnXqgxwUKZgbNoFSN2rDfkTiA32o7T
         Rd93ORDJWg3NNnM2iIUXEQcRcmwGiKa00nL7ke07HmgQEgxAeWFS3CxY0z2vG1F8mKcq
         0tGJF+0R1InH+YUNWqCMB5GTDT3WYV96h6j6W5AvdEgnyf61m2kMZZlEMMubFWZokmDm
         f+dS7ruOH7PAuJOT3voAyGkQYcdVU97bwQ/qPz8i08hdoEmVumAC/9WjybYSF72d4Qtd
         IEuw==
X-Forwarded-Encrypted: i=1; AHgh+RoKpkSSf6LI5WQgUxt4pGbZ+ouDFOc0DFNwZyjM73ObE03E80MigOfZasXmsi9dwtXOEes9paBmC6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfeiBL5Z12Hu67hcHRW9wq4JzsfFWGaxbQdmrX5pLKGU6pPQMw
	QU4GNfdhnGZ3oVssEj558IKlXlwZ+5kfxq2lZyntE7oxOWhKMm/nISsW
X-Gm-Gg: AR+sD11jFhh+1Aup5xWK+Xt8CWEQjd6iIQIpX0525d/tIuLwE+Zqu7pPK7r/seCKPjY
	rUlq1IcHmsr5SUX/LlXp+1/Rd1tFMnqFIWdym1uZ91JzFobcnpIyF36kZ7jUH9NgrzTA2X8rR8E
	YpiizjqNxX2SRYFGAkV7A4o12MEJIjCq6XTm0g37Xg12q3QQRr6EnnLtZjYyEq6KH8lAxQf6Ia6
	nwxd5cFOW9XQXCTLb3B2G8TMJkZD8O+KH6+UTtUCPy8iSY07UmQ5yOQrxADFQp+yC9KlPruBAab
	djqZGRF8HnpWR+E59rFNKVAF4e+TLAog0T7s775TV4XUYmgbqeBsmW+VjaSuZM23Q34J4A55KoM
	b4FnpETJKwsvqIdff7mY2yUI0EWl9zO3H3tGLQmf8681kv2K9BJ/1t7KsicSTDsib+5FQKidCq9
	spkHN9tbaqKCWtJ5leoCfr1hroTUsOKiQRg6OA+kyw3BR7zppInR7YiPpBc9ZPfHwO8PzLm7wCH
	0/vUhqzgmpd5GTI/fRUspn7tCeywnooVxUpYFBylTAJlzLBmELB8X1IszGwa+hZumtHFSy6I4aD
	oMzl
X-Received: by 2002:a17:903:240e:b0:2ca:f8ef:33e4 with SMTP id d9443c01a7336-2d0ca9444femr245369825ad.17.1786085812605;
        Thu, 06 Aug 2026 23:56:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccb0b2dsm4420185ad.3.2026.08.06.23.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:56:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 13:56:18 +0700
Message-ID: <20260807065619.30604-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1:
https://lore.kernel.org/all/20260806065254.28204-1-phucduc.bui@gmail.com/
Changes in v2:
 - Update the commit message and error handling.
 - Propagate all errors from platform_get_irq_optional() except -ENXIO,
   instead of only handling -EPROBE_DEFER.

 drivers/usb/chipidea/ci_hdrc_imx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 56d2ba824a0b..7387c9903e80 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -525,6 +525,10 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		data->supports_runtime_pm = true;
 
 	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
+	if (data->wakeup_irq < 0 && data->wakeup_irq != -ENXIO) {
+		ret = data->wakeup_irq;
+		goto err_clk;
+	}
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-- 
2.43.0


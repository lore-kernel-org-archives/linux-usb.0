Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE721FC0
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 08:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151020; cv=none; b=ldJuuDTCS+QdKyqej1BPTaAlKcITfl8jZE1m5tMoRe9wr6PO/YKp0RxUo2Hz6NwuW6ZuGlloOgPYY9nuoXncW40vh5m50QbNho2tGAUPxuhkmqD/Nh41/Yq6gBSSOdbPYZ+wFwOT4irFzIridvQioNJ4M0DroYZRHz5dNpXn3JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151020; c=relaxed/simple;
	bh=OJ4lfeqD9im+Foc6CNC2HRl00ysGMYvZl2GuC3Av6WU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CRz4n1V7QyqKexs6Kw6FN6XnobuHPopHbppx1UYaBf191I7clNg5YWponT3WrX0a6s40N54/nHBF6AcP5VOH+Fe9EmI63B4mJ/BH6lMyoA/0rAuR1r/uMo2oRf/bKVUnquff7CaOvm+zHicjBr+9gUkGWn40doexEJwvLsYZP0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+4ojZun; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+4ojZun"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398a1676000so411961a91.2
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 01:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790151019; x=1790755819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhNFDOl09aEMZ8kpRAqjjIB77iovlB54t187rXigIoI=;
        b=c+4ojZun3mdW6kpPO46BQgosj7IYaOy4GssQXjc1BCueML8yl5S0FLtWNFtKi7/Nxz
         MMxdHDbHhR8/8uBGJMh4Zxf+aVzwDDAi+EYvxBHKoNwp7xgB5N2fJ8McEfgMZYhrAtt0
         7imlxbUr7GNGFxaqqZ9tg52KtjUloTjk1B9125WcX870Vfnh2Jesz8xHjiCEFR+HEX01
         WlNKFgK/M6SpFFqcpwM+Gatowip+cJuaAqBsaOeVsvWfJJlOswuy+JPW57h/CfWe0wYo
         tl/V1yXcBlYnVYMmprLR3zkfhOKuNtcaMmx6iIJmpuSud0h+F57GH0oHssaa8vkJx+1I
         vKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151019; x=1790755819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhNFDOl09aEMZ8kpRAqjjIB77iovlB54t187rXigIoI=;
        b=zRxl2UFA05I3C/giDFNYMiIyZ8AlGAuHJKKRblxdjAtkajXpnDL9pX87Z1Meg/tpjW
         YhbYUfF+eNN2/D1Ivv4NvERTQnLFq+xBUqx0PZ3UIdFkA7tXKNbl4X2Z30pRLVPg/5dS
         0mq+vT8YoMvPqpVBN+xtjedqFgOigvFrVzxBgmEoT27BNnSs1F/ii7oaDcaJngvYWyus
         a1/LZqtDcOav0eEySdFwrUfnOqyG72UE8ucE9S3JNL7tpwjIhUjj+3D/l5TmloUoP2hC
         YKNNuphy1WGirFoyMRMtzY9+GU6Vv/95W4wvK5DlKQ/vOOsJ3xUdpPviG1nS4xPs71eh
         X4IA==
X-Forwarded-Encrypted: i=1; AKwUvBwYBfcYyu1+we8VmuVFjfk/ANGOQ83Y5I9WJIKMMNCRoFcyOVxgBs9CHLdTCzlsPRPW06JJ1Gf3s8o=@vger.kernel.org
X-Gm-Message-State: AFuF++n0OvArijJgYVfxtXLD+y4Uw+NWMfXI4p1W50NPLy4pFIw86t+t
	eP49vk5P2NyhVwifoWJIAAlVWiBQ1nqvk3tx7A/OdgOgcJZm1Tc8p/gJUH0mnnrl
X-Gm-Gg: AYBFou0Lqzl+EOrFU8vuzCf5TkQk1P+31cDdehokM6S/zhmNL8F+p67jrTG+WF/FOF+
	WPhrTKq8r3rNcyCRWKgOEtPmKW8/JbuYklMEdRV4zTaCaVyme8rK8EMKDUJ9jLetzF7u896D9n0
	ekG4Oj+rI4/SqC45sPPETl/pau5UCfyYDlfSv6Ih/j6MwPTmPXAEKht2DLGqWslkgpJsS6AqNdV
	DBK2lGiiSC/AJJe9TftmBM8V918khpESw5ug+pOjlNImm8c8byEj+9xsWSdWpe+7Gh0F9+Ct4+n
	6wY5pLrz3ukLhZL+Qwm1NHmA4tc9x6ueA55D/+E9XxsSgDygzGsYuMzQuZVa0/KimDENF3FGvo4
	a3z01kpcT5/9KwCsO4sT5R1hHSAe4zixsT3Xgj3tzrwKYrS4v17Cye7/LlJymzrLtEPMdWl5oDl
	uw0DxEfr/KP4W/pEJFl47UCwb/KLdoPaoFO1qc0z1BKGOXg93C47YyR8bkLCP5UWbMSDg/jHjI2
	62nJtI6Qff3rVML1AOvsErYnQ==
X-Received: by 2002:a17:90b:1fcf:b0:39e:b7:cbea with SMTP id 98e67ed59e1d1-3a07e5a0e0cmr1492320a91.18.1790151018934;
        Wed, 23 Sep 2026 01:10:18 -0700 (PDT)
Received: from flow.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dbc013fsm4314141a91.5.2026.09.23.01.10.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 01:10:18 -0700 (PDT)
From: By <xiaobai050@gmail.com>
To: Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+665bae0a102933788e1a@syzkaller.appspotmail.com,
	By <xiaobai050@gmail.com>
Subject: [PATCH] usb: dwc3: pci: reject matches without software-node data
Date: Wed, 23 Sep 2026 16:10:06 +0800
Message-ID: <20260923081006.89175-1-xiaobai050@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PCI driver_override bind can reach dwc3_pci_probe() with the dummy ID
from pci_match_device(). Its driver_data is zero, so dwc3_pci_quirks()
passes NULL to device_add_software_node(), which crashes in
software_node_register().

Reject the match before enabling the device or allocating resources.
All static DWC3 PCI IDs provide software-node data.

Build-tested with ARCH=arm64 defconfig and dwc3-pci.o. The runtime
reproducer could not be run in this environment.

Fixes: e492ce9bcaa1 ("usb: dwc3: pci: Register a software node for the dwc3 platform device")
Reported-by: syzbot+665bae0a102933788e1a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=665bae0a102933788e1a
Assisted-by: LLM
Signed-off-by: By <xiaobai050@gmail.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 6c1cbb722..d7fdf6ca6 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -335,6 +335,9 @@ static int dwc3_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	int			ret;
 	struct device		*dev = &pci->dev;
 
+	if (!id->driver_data)
+		return -ENODEV;
+
 	ret = pcim_enable_device(pci);
 	if (ret) {
 		dev_err(dev, "failed to enable pci device\n");
-- 
2.55.0


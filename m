Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BAF448B86
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 09:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046632; cv=none; b=Z/GD2FewmNPUxXZCZHA9s/CLselvN6zhdjB/xXgkTo2er7XVjMBqiS+lRebSYTY4/cfPE0LmjVAQHpgzp8PjZmtGG6vQIHpwgX3S0YfAOBd4XyRnLddgV/W9xgl94nHr6jrT+6rmZ/kzSKLbb/WKcruQX+joyA19VOuUVjYGPt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046632; c=relaxed/simple;
	bh=HcpByxAQDcFBFS1iZYTXysptjWMt0ebtKELnEXEThjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XW6kb0N4F5tIlmpdb84JHdVGZF2II8PWynNkCFSafWrYxXM91JHbQgvd9CB7uXwo/J8Y5EHn8snh87zBypB+dFsgHhhleEdq3t7F4s3s/Zk24ntq6XtMqTiG+9PLsDMKVkspdMPKsQgAFLYLhVs3GAobI4MkWm9wUqlLz9LqLwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pRx8fq79; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRx8fq79"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ce7d2adef4so10942505ad.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 02:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787046630; x=1787651430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZFHBXGZUMkxzk8eLLV1Kkc86VgN87uR+OevDtKNiZQ=;
        b=pRx8fq79UzThhUombIBC52DoYCM/NVCEKqEZBD67SSyFKrCBR6sU1HOvbXEy14mX6R
         TX1UgypMae4vSMlvSJ98RZJ4VLGXlR1jO9YwRIaJcufpW43jxg7mx4dZ5Mx9XRHOpskA
         F9+fFRrfRQtwTGanf2RbZtuoo03J1OlSA+7s3HM0xWM436+uG6rwG/FzF8MRECs4X0y9
         rlnQXYV1Yx9MjMlIhxNwUsr5zQOZH5rigQwdWxQZFD93Ho16Go9AnM7JegqIOBvvCNdv
         e+v2gbHFdxZLH/FqikvYTq7obxfFyqiTgPClTpNh5251SAbZJ9qJWgxri8sT/+ClKd88
         CV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046630; x=1787651430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tZFHBXGZUMkxzk8eLLV1Kkc86VgN87uR+OevDtKNiZQ=;
        b=X+vVYbFibz8imZCrmBrZ2c/D3OdQXBEkNauY04Bz31uPLXq2LxWkyuyVRFHEbdF/FT
         YCxzLssOCH/bXgLBCedM4XRhEDtw+a/yK74ptJLDI1+l5ZBpJMd7JuLIkZpeV+PXwIcr
         ktcT2RD7BYLYpVUh7WXwCwtzODK5ubFf8Ab0x2jX6QLxmsXJD3+4NYOL+aezN3iwYgQY
         vZbjbrbhL7zmD/TwjmNu3NojDUhw7RzZWxBqr1CbsLXb46qBZvtr37sUW1cj0XKz4XzC
         bxs4f7iXFD1Ng8aNHX5dqc+qeNYt2P0YiuhdIH3ddiA5RxHysZoY93m0Vux0pQPpX29k
         AuoA==
X-Forwarded-Encrypted: i=1; AHgh+Rrik3qGH9L3qa0gRNZN4If+auWgPjcEeETnTDiLRJw/az/Oydn84zJa3z3GhpeKi32eDybQH2jXMe8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUavNAlRBkgxQqPadiTbpx6lvyVipASFwe121I4688vK7dtx92
	znDycXP7suSKHzKOLXj+FXOWgdgR1/WFSRLpiZpDg5nHu1/xjkoMXAE=
X-Gm-Gg: AR+sD13qtmTc3vvALAghzkB144GyHZs+c4JeVZAueDi/xPIj/+t/2fRUqNmAYoKS33D
	A4Dxew1Y7fjarm1FOFv/1Z2dcBoKuLt37nIgPn1ylRTan/2ULwhUhi1WIpUKQEf+IPeD9Sr/66S
	o+yYiOeRp0xVaZerppEEJSzXzW/qHwrnu/s1pZQu9iQAa+meo2oiWjiA7GIvmO5w3rsVrpEx3vK
	Sq8KvTk3WpIWULCZr/RjsSzMows9SNCq+n0M+eD4hVaKT7h5M+40GhgWoqPlVn+lSK/tx8FIncT
	5WDDK83st/1xVitj4H/CfmAXxWF05tnwlb11shfukqbGdfvmZZM4lWN8d3yzzEQ4eBwqFNkCSM2
	UqAQdbpkjidxila5SUI4hubKjDw0OSld+d7yZt51Ayl3b8aAh8V7BfI31HJPTm/aSBBuCW2zGQQ
	EfngkmKFqLrSL7mHGntuZMnbtXQ84pU7iFHMA65KYFgGXhwdoWh0O0sllprpwJVYwWD7wDzzZq4
	ZgsigK/NvBS1STLr2D6pu0=
X-Received: by 2002:a17:903:98b:b0:2d3:14c6:2372 with SMTP id d9443c01a7336-2d3b080bf23mr406145225ad.1.1787046629608;
        Tue, 18 Aug 2026 02:50:29 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([14.97.72.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798cb9f5sm18466759eec.13.2026.08.18.02.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:50:29 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Alexander Fischer <alexander.fischer@kait2en.org>,
	Andre Eikmeyer <andre@negmaster.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/3] thunderbolt: Add device links for Apple systems with Icelake thunderbolt
Date: Tue, 18 Aug 2026 05:50:04 -0400
Message-ID: <20260818095010.1857-4-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818095010.1857-1-atharvatiwarilinuxdev@gmail.com>
References: <20260818095010.1857-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ice Lake Thunderbolt NHI That are on some Macs. The NHI and its
associated PCIe Root Ports all sit directly on the Root Complex
with no upstream port. Identify the tunneled PCIe Root Ports by
their PCI IDs and create device links back to the NHI so that
PCIe tunnels can be re-established after sleep.

Tested-by: Alexander Fischer <alexander.fischer@kait2en.org>

Co-developed-by: Andre Eikmeyer <andre@negmaster.com>
Signed-off-by: Andre Eikmeyer <andre@negmaster.com>

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/thunderbolt/pci.c | 42 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index 945e553dc..885fb9966 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -490,6 +490,45 @@ static const struct tb_nhi_ops icl_nhi_ops = {
 	.init_interrupts = nhi_pci_init_msi,
 };
 
+static bool tb_pci_add_links_icl(struct pci_dev *nhi_pdev)
+{
+	struct pci_dev *pdev;
+	const struct device_link *link;
+	bool ret = false;
+
+	for_each_pci_bridge(pdev, nhi_pdev->bus) {
+		if (!pci_is_pcie(pdev) ||
+		    pci_pcie_type(pdev) != PCI_EXP_TYPE_ROOT_PORT)
+			continue;
+
+		switch (pdev->device) {
+		/* Ice Lake Thunderbolt 3 PCIe Root Ports */
+		case 0x8a1d:
+		case 0x8a1f:
+		case 0x8a21:
+		case 0x8a23:
+			break;
+		default:
+			continue;
+		}
+
+		link = device_link_add(&pdev->dev, &nhi_pdev->dev,
+				       DL_FLAG_AUTOREMOVE_SUPPLIER |
+				       DL_FLAG_PM_RUNTIME);
+		if (link) {
+			dev_dbg(&nhi_pdev->dev, "created link from %s\n",
+				dev_name(&pdev->dev));
+			ret = true;
+		} else {
+			dev_warn(&nhi_pdev->dev,
+				 "device link creation from %s failed\n",
+				 dev_name(&pdev->dev));
+		}
+	}
+
+	return ret;
+}
+
 /*
  * During suspend the Thunderbolt controller is reset and all PCIe
  * tunnels are lost. The NHI driver will try to reestablish all tunnels
@@ -512,6 +551,9 @@ bool tb_pci_add_links(struct tb_nhi *nhi)
 	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_NHI:
 	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_NHI:
 		return tb_pci_add_links_discrete(nhi_pdev);
+	case PCI_DEVICE_ID_INTEL_ICL_NHI0:
+	case PCI_DEVICE_ID_INTEL_ICL_NHI1:
+		return tb_pci_add_links_icl(nhi_pdev);
 	default:
 		return false;
 	}
-- 
2.43.0


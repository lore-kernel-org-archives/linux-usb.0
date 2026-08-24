Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8741F38A29A
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 18:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787597020; cv=none; b=C+JjuKzLpBSXDhIUxNN1uIa/Sw871BNT+8evIRZGjbJBuWsgEb1AZva/wxNI18p6k1s6EEv0tZfSBXfBuUeJBAsR80cAXGasI0zj6fzUrV0mxcDI6rjZoTCGdTUz1vv0hBO7sRzl6dN93DGvHEnjz+R4vQBTKWRs6nt/TjSLSDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787597020; c=relaxed/simple;
	bh=HcpByxAQDcFBFS1iZYTXysptjWMt0ebtKELnEXEThjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QK4yOPg2sUhMyCRvZ4ODJiXRoYYbS6dkzWxsmaeOojiTQfUmjx1WXQBCocDvkXZhb0Cebum9XtP3420vIcjE/Qpuf4oTRnjLHjn26CsQSvOazB4/sxXmx1QqAS5RRx9soPjP2orhXif8hj74Z/riQJdSzudAFvwM9UDVYftTRHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgey97YD; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgey97YD"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso3142103a12.1
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 11:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787597017; x=1788201817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZFHBXGZUMkxzk8eLLV1Kkc86VgN87uR+OevDtKNiZQ=;
        b=lgey97YDEg8965CQJz84QcavTNzfP+8hXb7VjEwPj4tp5bv/oScPvsYU19lxC1ofZY
         cc/AgRRzQP9whrZUQE0E0VCZpi0iAfIYjxo3645IEPxW+dDppEiIIzDDAUOgE222b0Ml
         KxiT0ItjXTIimeHA/2pw55qmSdy1wVBrqtRHxFI9j4948Xr0TBz6ev0q+4cGP5C3WRxA
         Ane3aqYmGHzqtWeyQxvLitaaMn8tsOm2SLM1pPNM9n1hOPtrULZ9mVJdWtn/cF/0Sj+G
         1HqZ1QykvzgMQ7VTUWEZcf5hMCmrumMPurA9fScprgSfb4nDwlGMGUllIUp/eJPCVh3J
         TzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787597017; x=1788201817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tZFHBXGZUMkxzk8eLLV1Kkc86VgN87uR+OevDtKNiZQ=;
        b=PWF28MHECAjHJW3M/pHzrZOxd2azMWqRt6bxcopNaOLb4Ip/qyWQO7FJhPBg2/fFMK
         YbmrXu2Wyemasyk6loszc1R5QE0hG76rHecWTsnDxdWyVMSiUg9jT5VCMgw/qjzrlKml
         XVcY2bA60PIGxRXxLyHqquiTmuyFhTMGy70NyxHYmRB4P4kqGkucs+/b23r7a8MN85r7
         R3QQvNWm4yNfhR4S4fGehCRxDr2YbG9+ikbO+RSW6CI5PfkUfL/MQPQoUPNZSY2TvDLq
         Ql+9QN3hsoRUS9PNlZiwUfFRQpA6Pi5Mwv1UmCx5jA6PKHdztzcJR4rmm71Rr9QFGdhK
         en4w==
X-Forwarded-Encrypted: i=1; AHgh+RoHZ0qxa/6CoJY5mxlq8pCxqkY753+stAB/wn5OslnIfy/O1u1uhvmDNLzlIlHeDHNV8uZ0ZZEcnRE=@vger.kernel.org
X-Gm-Message-State: AFuF++na9X3UWvH9T7INOx93DNATnIOhdAry2uQ3luslCgBeth4+h54U
	ngzVyhgsUR9vP0t5m3c5K5PDlrWydkp30UOiiBJIF7bjGgf+nmkGIaA=
X-Gm-Gg: AR+sD110g8xpGclJb8lzc+0P5O2GA7oI0Hn16CwJx5ryMRDA5l0iiDNoIwOQhIp8p/n
	uKxhNHqhCxp/0I6QbfwX36dWgajUeSqS/sdkyVSbr+PHGutKRDwzeYy6RGkN6QEwJ0jQ27sR1I7
	Hf+qJ2k8N6/42axMqkOA3hSh2BFwd3y/QeScDkRsGLOMYBkeVOtcQLnj6amXkF/Cd2mi86P4qoX
	iJs2Z1h/GcNaYJo4tjcQmIscs7wWR/sRQ/cpWLMzE2wKr7BMJ+2LXKbpBSmt2vQOnb1fgTTejZ/
	fDVqYUl0pATrkW25Oy3E84+XOGadnT9x5GoSEDcSLaBfkQiO8E3u6Gt6UCizpCOukRLdm1J4b9f
	vKI6m0ZL8hKoqoKy9aPmZGNX7SOr0vGi0ZRnu3/R9eLCdVZbEj78epLEFraEwh4v1gTuWptLj/j
	/uaw9H0iDsjdoQrZS5s9ox99oZwZAodjAtFM08YE8TNl1QqKAEwha+ZkjXe83/5/BUg7hWCv6nz
	AaQxdsc1xqFAY4ihcB1TCE8
X-Received: by 2002:a05:6a20:7288:b0:3c3:6b6e:8ba0 with SMTP id adf61e73a8af0-3cd3008a6f1mr46462634637.11.1787597016885;
        Mon, 24 Aug 2026 11:43:36 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([223.228.8.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm29781367eec.17.2026.08.24.11.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:43:36 -0700 (PDT)
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
Subject: [PATCH RESEND v9 3/3] thunderbolt: Add device links for Apple systems with Icelake thunderbolt
Date: Mon, 24 Aug 2026 14:42:56 -0400
Message-ID: <20260824184305.1234-4-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824184305.1234-1-atharvatiwarilinuxdev@gmail.com>
References: <20260824184305.1234-1-atharvatiwarilinuxdev@gmail.com>
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


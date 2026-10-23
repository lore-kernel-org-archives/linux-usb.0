Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761349;
	b=t5hamJUsZuW8wwzh1R8HMKUTecgZgjbX7aQHxjz4sLIzmNBlbq60PEpkiw4yg2X8fpiZ
	 t5/NxNxsfuj8E6o2ZAARl1V7brGMEJLLk+WPtTsS3xg0mH52QaWpFLRrCMrmyycQWttOP
	 gRF5cl6uT2KfywowvKHbuqFR/3xfJ2FIj1AuFXwpP+RnYpvlI1Sqk7YDnQVv4rTPLVj0L
	 QStvUVYGg3W3AIJxXSoHXF0faeW4jtDJjTT8KnOO89qDyVPP5eUj+unHcJPns/d9WV0Mh
	 o6jMSgIZMl9QqosG9d+f4vBl6/aGJYxETTflaTQeSuNz4JTRRK0CaAxH1fdc7di1hWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761349;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=uaG8jSX0cwndvkXbli6K51CcuRBe961ZbKPI7O25bZY=;
	b=ICzdn3JNhl6MwJRT/pdQZUqmiPHv3pgriyrQY6EiAK6qvWq61nT1Xvtn+FC0MzW8AnHV
	 22D3RF9RjaGecVbrOuXsOATKX3tMyqyGuKCAcM5AS+shFNmBI0wJ99HrWTiLGh64tNjkX
	 84bA0ZvWye74+PKjy8+klJUz4UZIHjDn5B93E5b7Q27NZUkR8MrPf/gA8ZbpdiF94ceqf
	 XffOGIy2w2sOW6HDy32VxXxrL2TDseDDtv8u3/HaNm36W9yS++91fNEbV49Q2Lw/HOiXL
	 TBvQO84FgHU313pVPZ8rih4k/Vi5AaKkML0LnSd3FigFCdjcMMIEAzhSiVDTRd/BZcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=BDqr90wW;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B10606A323
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B10606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=BDqr90wW
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261023131545epoutp031a62af06ac1b862f7e4ea3df7fa35216~hKvHkcMzu0208302083epoutp03K
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:15:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261023131545epoutp031a62af06ac1b862f7e4ea3df7fa35216~hKvHkcMzu0208302083epoutp03K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792761345;
	bh=uaG8jSX0cwndvkXbli6K51CcuRBe961ZbKPI7O25bZY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=BDqr90wWxTcJZNYqJ8g7KzFoflDOUdRE2GMYLgdY7F+OQn395fdtqrO1yL9E8Sjsz
	 5KuIjhdwiHmOXE2ebV1/a8zrpUv6nXXwPMuVlVqyQycn/YAgW3wU8n4ZVnKsYj84mU
	 L/1N1ZMcRpa58FVHlk7BIX79A7ug1d1ESwDF3dsQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261023131544epcas5p16733dbf6f91b1e351476a6a7f76abbfc~hKvGpgpd30267602676epcas5p1C;
	Fri, 23 Oct 2026 13:15:44 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jB3Rg29Zjz3hhT3; Fri, 23 Oct
	2026 13:15:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261023131542epcas5p4be95a0825acdeecc2198259839459034~hKvFTD8NR0834608346epcas5p4v;
	Fri, 23 Oct 2026 13:15:42 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261023131539epsmtip2472a2f57bab2741b2a79cd9cc299f59b~hKvCet7dw0806808068epsmtip2B;
	Fri, 23 Oct 2026 13:15:39 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v3 0/2] Add USB DWC3 support for Samsung Exynos8855
Date: Fri, 23 Oct 2026 18:44:59 +0530
Message-Id: <20261023131501.3157463-1-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20261023131542epcas5p4be95a0825acdeecc2198259839459034
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261023131542epcas5p4be95a0825acdeecc2198259839459034
References: <CGME20261023131542epcas5p4be95a0825acdeecc2198259839459034@epcas5p4.samsung.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

The Samsung Exynos8855 SoC implements a Synopsys DesignWare USB3 DRD
controller. The DWC3 core on the Exynos8855 is instantiated with the
generic DWC3 platform driver using a flattened model, where the
controller is directly addressable without a separate glue layer.

This is the first Samsung Exynos binding using the flattened
representation, and this series adds the device tree binding and
platform driver support for this configuration.

Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---

Changes in v3:
- Drop the MAINTAINERS patch.
- Drop the samsung,snps-dwc3 generic fallback compatible. The binding
  now uses the SoC specific compatible samsung,exynos8855-dwc3 only.
- Binding file is renamed to match the compatible string.
- Remove the "select" from the binding.
- List the clocks (ref, bus) explicitly and drop the redundant if/then
  block.
- Update the driver patch to use the new compatible string.
- Drop the v2 Reviewed-by (Alim Akhtar) and Acked-by (Thinh Nguyen)
  tags as the patches changed. re-requesting them.
- Link to v2:
  https://lore.kernel.org/all/20260916122229.2604003-1-selvarasu.g@samsung.com/

Changes in v2:
- Commit 2/3: Clarify this is the first Samsung Exynos binding using
  the flattened node representation.
- Commit 3/3: Add the compatible entry in alphabetical order in the
  of_match_table.
- Link to v1:
  https://lore.kernel.org/all/20260903071250.3421499-1-selvarasu.g@samsung.com/

Selvarasu Ganesan (2):
  dt-bindings: usb: Add Samsung Exynos8855 DWC3 controller binding
  usb: dwc3: Add Exynos8855 to the generic platform driver

 .../bindings/usb/samsung,exynos8855-dwc3.yaml | 74 +++++++++++++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c          |  5 +-
 2 files changed, 77 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml

-- 
2.17.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880872;
	b=sKFTvhZaigWnGeFeS8Dw+5P1qLQMiFfe7MZXIMJ7YXJoLL0zzkmc3XinkWquwoLZSbEf
	 BNSdLQgxqOuDKzVWmw1zkqYiINQo+FtJvG39TODI6DVzMdvO1qpeVHEKIM/rBtGKHK0fj
	 J1hvWSiEopnLFVxDCX+K24cbmDcvkEma26h4j/EmIMq4LNoS+cceRSC/CI9+7K5cFZloI
	 YYpGRaf7k9xPWhOVbF75CyGWjKA11oNf0GNKnsKBaB31i9ntvaL0pK24bGsqyIWYBgnuL
	 N6Rkajq+vx+QaBxAB9did825bqscJzW98DpzQx1r2TCgIOLN1tTJayNWWiddzv0YFWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880872;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=wj5nZozJQCUk77xJuRTCNGYRyYXNzGvjve+qA6nxMLQ=;
	b=im0E6l04PFHFs4NxzJPnNzEj+lKSFfZJAp21LPmhEKB3LTZt2V1PrMLAoGEq7zKFcavS
	 e/hqBLGP6QlIgdt6VhjuZrSioCws3X/5ZnbT2OA0dzuFgXWq9Mdnpa3zsD5LH9LD4GMla
	 xHPWjS+Zp0cMJQx2f6gvskVIUcq6jk2MTRojh223nKQshPWSz5Q6NHWeIXAU78mI6vp2r
	 gVMJLQqzP6dP+K7jy/QDAXLbRX17pVqqrRoZso1gdcK6Fkmd56AwzwuWP7S1SpIBd4EZR
	 Fr+noMJgkdrpPf9qkUpNOjaHrX4bxvgzLBvTOdXgTO6LfRi5qvfDUjbGxrAMxy1frVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=KlciE+qb;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D58606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 12:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90D58606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=KlciE+qb
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261105121428epoutp03bc143589d7593998b3a6bd67accacc13~lJSVB7hI_2841428414epoutp03G
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 12:14:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261105121428epoutp03bc143589d7593998b3a6bd67accacc13~lJSVB7hI_2841428414epoutp03G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793880868;
	bh=wj5nZozJQCUk77xJuRTCNGYRyYXNzGvjve+qA6nxMLQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=KlciE+qbCMkaUOkUK4D6Sae2H1DMmlQb8F3DOM9NJiRUnIAt96sAGAs04WIsiH8NW
	 ufxEEtGKMxIIExRcdicKTupmUuDc97jai8wghV/YPgLfT+42Jkb01a9dfTexuuFrlg
	 RJmmnbFbtV+KiyWkOJN9blHkKG3ldOEv86FI7xZY=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261105121427epcas5p228003b6804cbca3ff690f95a0510d951~lJSULzkdS1965619656epcas5p2T;
	Thu,  5 Nov 2026 12:14:27 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jL1Sy6N4wz3hhT7; Thu,  5 Nov
	2026 12:14:26 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261105121426epcas5p4b41cf26c1a951083cb6f31cd29683c4d~lJSSwS8Wu2770827708epcas5p4R;
	Thu,  5 Nov 2026 12:14:26 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261105121423epsmtip1e06534b46800136188631e62189b7cd7~lJSP7nXCS3043930439epsmtip1f;
	Thu,  5 Nov 2026 12:14:22 +0000 (GMT)
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
Subject: [PATCH v5 0/2] Add USB DWC3 support for Samsung Exynos8855
Date: Thu,  5 Nov 2026 17:43:59 +0530
Message-Id: <20261105121401.1661711-1-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20261105121426epcas5p4b41cf26c1a951083cb6f31cd29683c4d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261105121426epcas5p4b41cf26c1a951083cb6f31cd29683c4d
References: <CGME20261105121426epcas5p4b41cf26c1a951083cb6f31cd29683c4d@epcas5p4.samsung.com>
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

Changes in v5:
- Drop the alphabetical reorder of dwc3_generic_of_match and
  just add the new entry, to avoid conflicts with the existing queued
  changes, per Thinh's feedback.
- Drop the Acked-by (Krzysztof Kozlowski) from patch 2 as the patch
  changed. Re-requesting it.
- Link to v4:
  https://lore.kernel.org/all/20261026135715.33071-1-selvarasu.g@samsung.com/

Changes in v4:
- Drop redundant "binding" from the subject.
- Reorder properties, interrupts after clocks, power-domains after
  interrupts.
- Reorder interrupt property in the example as well.
- List clocks with per item descriptions.
- Link to v3:
  https://lore.kernel.org/all/20261023131501.3157463-1-selvarasu.g@samsung.com/

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
  dt-bindings: usb: Add Samsung Exynos8855 DWC3 controller
  usb: dwc3: Add Exynos8855 to the generic platform driver

 .../bindings/usb/samsung,exynos8855-dwc3.yaml | 71 +++++++++++++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c          |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml

-- 
2.17.1


Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1468B400DE8;
	Wed, 12 Aug 2026 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526945; cv=none; b=nB741JMfBsx9P+IAVdBkZ1jiKB+Q+U6OuzKzs/Hczf4xvdLAjOZmnZF21TA4am2mh66A+j17P37T3A/+HM/EyXRUfmjGbSppk/tlpybAnajEnWDse9I4/jVzjjmAFZgUVm8IDRBCJkxdm/p3zrcJaUPvF5Kv2D+RSI9FMu4Hgow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526945; c=relaxed/simple;
	bh=HQevjP1Bk+ZAQOemFL7GBJAq69tQ+wnb040ddwkXxF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ssQULYhKiOqhFxdQeQi3DLy0csTTJjZnR9BVj6sxbS+a3SeQui2dqpcDRO/XFNmNV4sUjk/baatnUgQMOuhY+WBU3iYPcLeYuVp4kknaQY3VICDnJkK/UqYX+mHh+CGH6JFH4dl+yxO2O7GGUkeNgnpUuhSG25acAa3PzGVbVRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=aLiJ5DKI; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="aLiJ5DKI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786526888;
	bh=Lc2uktEckigDbEUVNS6VnRB0pAKeekhCQUwl7diL5eU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=aLiJ5DKI97TMEcgCjCnaCKCIF5WLt3h3Hr7ycNsJdGoq2T5CShdpCpB7lp3VXSlSl
	 Xe2HbPoHB8EhemIy7fiJIlEBMA0m8CbsxifXNIFBW3CHeLNO0KzYzsMiaEk+eBUrQo
	 +AqyV3z/wZYM7r8MBOS5KMzeIrUqUdTDwdYFtGDg=
X-QQ-mid: esmtpsz19t1786526880t1a489ab1
X-QQ-Originating-IP: mifgwaU5rE0wyxfQ7HqmILoA20utuNZcAnGFas03QKA=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Aug 2026 17:27:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16125094110360277280
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Wed, 12 Aug 2026 17:26:12 +0800
Subject: [PATCH 1/6] dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-b4-spacemit-k1-usb2-v1-1-f28cf29e522b@linux.spacemit.com>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786526874; l=935;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=HQevjP1Bk+ZAQOemFL7GBJAq69tQ+wnb040ddwkXxF8=;
 b=txHKNmFk/WnDKiDivXg5PPrgRa9nrZtnLt2YTWh3MaplCXLvanoGkYQHshEcB59xTJkI2EsPw
 5spxlRT8oS9An5Q40UqYp7i5ej1D+Pn0ZxFCcqeIiuNPH3/XpG9iWRe
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NHgT31LhP5vDm3HyzRqsgbXBOy27dbG9cXgXBIAPAv0zwmVIrDvv+MCh
	ZuOgWq4ULHacjauB7jBEALe/J7q0mwIb1Z0yLSrqF2R7X7AmGqT02+SAdBmt11aUqWC5j2H
	H1YVSqXB/OFn5QNCNvyjeuz+QELPMbBKYOaGMjP68Ykv80c2ekBC3sTB048AcUMbTHpyC4q
	z3Expb+S1OwP4e0YI3M4PsP67jm4tDFxUG8cW9jnjJ16wbE8lTG4MqT8GI1F3F51hU3ePlR
	lU7N/W4Bc8Mulh9saIhRnDlTQOQ/StFBMRNFCOehLx4wMmCPYPVQKkTxTEXWaKKsbCc+s4T
	SFf1Tn3ItogSTPPCIjrle1sEY3B/pBIwaa/MHOWVmBstg0TX0FONWrBGGlPnF5+ac2R/knC
	YqittOyjbY4iGaS8bVI4thjPSqr0AIu3NEEpo8GNvD8/7SuL82Dp9DzdMag1ih9s/531J1S
	Fk9BEAP5Ln99v2v80ImRQtP5xhB0ebXTMsC8UIraVakyj1PqeLBcy7ztj+etzrp0uT44EKa
	M2hS6KMdnhQTxXivFFilOh/+KmJZf2p5tvWoBwZMCekvZpCumlnleLB15Kr06wYm3+SuCgK
	XxgWvOVzDo3+UFanyj025DmACXlCDulfNAanZJjT4hA4VBvXZ6b259vvERGR64v8bMb/lE/
	ui41xPiLVGCv3dX0dsQTib6WB5/cb8ijGyS7pB/0H9EPkdUMxSVjTZsFQReDV7N+OFmsPD4
	3CEiDiaJ8lalxrYoEFVJTrKZxMsAZfxhMb1gs+r1t2PWTSbbkUQcdQHHf6Pz5fwSUbeabjI
	q5YTQw1YDHpTpt6gL+Vi6RsZCrcHz7ESZePq2SWx4aD/oQd2Wi3Xce61BQZ6oPOu5Udxqdf
	jEdQCbjoJWHAOg0bVODq3lM4DY8XF7F09e+XbJ7vTd4evsnL324FnZMe7iGA6D1qCTGr355
	/MRXoCDw3YpTrdknDSyg45ZG0JyDFmjChv0K8xSNAgCM++RoXofH9Rc+g3jtVA2JdDTGIPg
	IlXgLmcBkjncmfwq/kWUfqwp/IPxV/iJV0rfzu1nCz8OnjCmFf9acB0id4k0v/ZWPbcC0Xy
	A0mcU9C9NsfuJwDrfPXmakC99yW27SpYg==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

The USB2.0 controller on the SpacemiT K1 SoC is dual-role capable but
has no internal OTG registers, this requires flags which disable
related features set in platform data. Add a compatible string to match
the platform data.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 620b564914d4..6f8d88a0681d 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -25,6 +25,7 @@ properties:
           - nvidia,tegra124-udc
           - nxp,s32g2-usb
           - qcom,ci-hdrc
+          - spacemit,k1-usb2
       - items:
           - enum:
               - nvidia,tegra114-ehci

-- 
2.34.1


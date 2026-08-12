Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D874028FA;
	Wed, 12 Aug 2026 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526956; cv=none; b=c9I+Efr1a6B8EQRb6VymR9SSMVpYycFFJ4GVYxShnxi97tR7t0o8FBKsBkl7/j442mg+aSZBByKoKI0t4K8u6KU49Zozz1CHn4oAo8KHJKgZA+I6rD/ndKblcgarMUbQ0wS9fnf257aYtILDcwMCz55qUxs7+RPSMsWiVK75c70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526956; c=relaxed/simple;
	bh=MpRAtsb89ZpTQlLxHQ9ITceVhO1zFp7m2aej/8/xxEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r2X9dklPLgjl4CSAGeoAVACKOK9I+BEtFXHPZ5lALRh8KX5r/4XLNElVCmqEgWCt5HLmkakbY8k84oPMQxOW0fN+hEv2LqymDb3eJppbftKHtTy096aqLn6ndzctNtzvBoyBYF1Ev3225YpOCjYLa3LTbZDl+KTjjDp3H+sbdRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=NTkk6886; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="NTkk6886"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786526901;
	bh=DdnQi7uIspErf3CglYHsPsOXNgZaPH7GbyYVrcY4z/M=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=NTkk68866o7SlopsKW0vb6kHphWEFmY1reX1B1WzsDk9d5zJp8ATjKhbU5cR4RBDO
	 5QhK405fkSbnBjvQxF7AHEk+SEqA7QawluuGQs6n0d7U5chU7Tu5De2AOI9EAB9eOD
	 riTunwcv1b2aS1xcP5uDmEod12GwUHBFjOhNIpJU=
X-QQ-mid: esmtpsz19t1786526893tf6457763
X-QQ-Originating-IP: G8HrIQpFl5BaTpLlQKM3Aw5AI3ljjOb/JsD6DVLyPpI=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Aug 2026 17:28:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16169041162177916491
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Wed, 12 Aug 2026 17:26:16 +0800
Subject: [PATCH 5/6] riscv: dts: spacemit: enable USB2.0 controllers on
 BananaPi F3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-b4-spacemit-k1-usb2-v1-5-f28cf29e522b@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786526874; l=1044;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=MpRAtsb89ZpTQlLxHQ9ITceVhO1zFp7m2aej/8/xxEU=;
 b=FMXYLVPGavNWnQ/M+MdGUKb8XaNxqQWc05jgYfHLKRBK887cXZ2e2dg5Dvco0GC91MRxVDoAD
 rDNyBUa7QYNBLf/o5t7XqKWO4dNUFnggOouOc3RXYOIrGdb8lXYfRkz
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OaHhCqwLoLqrzX++dvt8s+/RqzWls5LV03GNLKf6you89PsCBbd/zmnt
	gkruFjI2U+3MbYyum+G8mz0ZI7SUbFSNZ33QqOLoP4zMqvUniaEFj2cM/SlnMCLStq8nD3w
	spALFgC2SHv/FOIWBF3nfOaujkoWBjXmVvxC3e5x5tC60KILrklrzVt40FVsac2ChjDRlqQ
	nbZCl+aL9X/xvQqYR2zEddbKa1OjtIvuRH8uhabFr7hyVFZSZnoxaSvKGnylNTLWm8Rodhq
	WlrT3WbuP1kuEWExN0D1b1jCJSWjLBvLYIZYQS9BKXep66anHwbGdKLvYcOcRC4E8LMcUdG
	FasagB3Z9j2+ev+NWmt/aOIXsFq1IryimoU+hW73bN4pS2d6zqexiqVtLlbjjgyRj5/T/6Z
	5o6pDr8pZq02d4Agojgob8mykL8LChIUHOiRWkKygSjpACeqb3gCqGs7I/OSqjDPYb3vMeE
	VSbmUYM5878Y6MqtuOGUo1j4wVHpxfmHJAp0SsBkB+gt3QwPPXtSlFFNP1jk/sBPfcWfonn
	LJfKcDqefZnrF35+Q9bEiSjUVsePG0cti9JuopVybMY2jevUbx23ZwIlGMEh4IBTNFa7z6f
	Ghy3P4UibCvkhtZ4z+59G7uRlmw5lT3DL3zBecVrnYoBIqhlY3ylqOnQOitWndRzY5BGffB
	SEoP7yj+DTmn6Ay3fr9oG0wt/siqdu2kmhXbtNvNGhx++KtNtCdCdfOL8/qUgESVVbl4MZL
	JAEx/9Oi+odN9/Phy0mYni9qr1TY9gmqz6rkIaKeq2L5aa51IufThN3zRCoz1MNlLn21/Hd
	xyBSmRdiB4VNhjRN65qR+NIZVv4GZ+wCFc8kZDXW4A6Q3sNMdyeJ52DSB67Qp7btpehxt6U
	mk7ZjASu1J9iB1xB48nit17mdrHGdM31ZC509MWJ7Y4bm4vJFG/QjJp1BwX5sWq0xL8OVis
	vXTkoMv5gqlRJ+i1+c8zrnBz7yODFTa5c9cbBNU08cnEaPBsqMcBTO2syH/eoIdtkppUs3e
	mGEvvmaJaIsh2gn0FEgOmjhw56MRy++5vO/sPQwhSEE+bwVkWqZrvUjfNTQ9RD8qprR1HpO
	oUw8ozApVP4Z0JX2ba2AGPwERx+Bh4qumaLRdMF6JZ/+df6qWsjaryQkgDjn2P1TIdk69Lw
	FITVUGELBcNX1wZn/vztr6OL18yUWIq4Twxa6rFO5PzW2F4=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

On BananaPi F3, usb2_0 is connected to a Type-C connector at device
mode by default. This port have no VBUS supply capability, thus host
mode only works with self-powered device or hub. User could switch the
role in sysfs.

And the usb2_1 is connected to the USB2.0 pins of the Mini PCIe slot to
support cellular modules.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 72f77e9edd63..fd0f96262009 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -350,6 +350,22 @@ &uart0 {
 	status = "okay";
 };
 
+&usbphy0 {
+	status = "okay";
+};
+
+&usb2_0 {
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
+
+&usb2_1 {
+	status = "okay";
+};
+
 &usbphy2 {
 	status = "okay";
 };

-- 
2.34.1


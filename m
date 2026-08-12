Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782313FE658;
	Wed, 12 Aug 2026 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526947; cv=none; b=eavf06Rg7RuaAVwDs22EDjPKnIHZYZ7xzezYfDT9MZDBOdDzBnz9D5wzaKH+S6GNlSgzKaHhf1qkcFEyreVtXnTVwz7PIyvKFnDMk7sC+VALoD4kl8rwyt3QC2Vww1rOz5tK0GdgnY0lUq7Ox/nhdF37zyAUhqeST0pBQ0j0Tk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526947; c=relaxed/simple;
	bh=+K8VgzxywmFUIjxY4clQKUBveKERwzvX0RcNjc/EX8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLbzSpTvVGa4w+e6DlRW1LwOCwce6dwrLtiFS5tbuQBJBPZkEDHP9fdAslrdyIhuKXY5lOF145hAyjbdscgSiAbmu8OhccfGxsjR5MeZYvPtbt41qPsiq+iMnfrREucb65EztwpBwp1v7HyfIT61/XPV935jW5PHeu4XjNvqo3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=wjW6AZhM; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="wjW6AZhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786526898;
	bh=F5XGTR/1/p7UZ79IdQekx+2Gc+B01cJJFAaBEaKPZKg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=wjW6AZhMMyyIfiYdKpx1kemyLQTBCvZ3pkpe3iptcD6hAudd/rgzYeL6c2MyG3OVD
	 empGg+ga+1FCIKjYKLKIhF4u1m3kKbo7TFLuMyBU2ISPJd++PqumeBEYpqgQp1si45
	 DyI6B1qHQSVIt6/N6lHn2RMKg8/f0+HOFFo39yWg=
X-QQ-mid: esmtpsz19t1786526890t9287317e
X-QQ-Originating-IP: DubCNOQBpC5Qsd7AefZ/6Vu40ZEGCdDF9NuIdoogClU=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Aug 2026 17:28:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16440051225847281482
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Wed, 12 Aug 2026 17:26:15 +0800
Subject: [PATCH 4/6] riscv: dts: spacemit: add USB2.0 controller nodes for
 K1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-b4-spacemit-k1-usb2-v1-4-f28cf29e522b@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786526874; l=2102;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=+K8VgzxywmFUIjxY4clQKUBveKERwzvX0RcNjc/EX8I=;
 b=jhB8Z/r5cWiwJRn88exQbM8EJw4VLgyglgFtIT0WrKA0irHh386XY32FRVzz/w43x2IYpJGS7
 qfBXttnoIceD1JAuCVc5vIox/xjY3z4wF2Evv+RZazMKtuTkaC4tXWM
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MxX5kg4KifQ2cXutadDsHHJgjRqMw125sfPOXOx1Q0bnSBzdBEYTTWQS
	5Yhm28c/TKcpBa7jPGU0dREynb0SuBgQ7f0HX+paBtt6YaubK2BoygDGDwlJNeIHuX8tLlM
	DrXenRxd1sUHmTuktoD5ZW3Qik2O0oQCahLTdsgBciRSE3w14ccBNwY3nZuMrxpzJ1cNnjQ
	1G59GVbgrSaacVpiuG07s0A0/LADJlfX2ed5E8paNNlWJf4cKy0Iz1AXQOp193OZeDfHXQ1
	NezTkwLTxDrHx7LZkip2ZAjdUhsjmjEUwXv2EC2s7H5UkX7pBdl6aOmb2bfKladGo6YyT06
	1VXZodLvZhxDOEkwXcACcdzj2FXhNE55F2xyDkUuL+bDuTUrEcNePGNPEdtULajYdGFz9za
	vX7Tyuj9+KOiFwPrWCe8pdgfzjfr0IKsBbrxzBoZhuAhXzrExFhrRun6dM0fsy331Jc+IIQ
	j98YL+RoHg6EANQav/2qL1CEm2z/k3L7JcRGghwt091zbR3Q1k9hJq8r0vNZ2cfN1vdCr2C
	P1OemLnxPFyW8xLyRW3zaQFfXNJcle4BGwgOeQsgVd+tPgyQl/YFgM2p+yLa2pPYB8JQsrw
	hiRObIOC4RF7KybIjMlTMAdEQBak82bT++zfa25dau5yub6shKhBGqBJWp2meuEU1eqDR8T
	N8fg5ftXNEDixf3NWcnamK6+AnQIBUXbYcK2Md2YDM8vYvGvIqO5j0stkYQPHC4JN4KSW/N
	MCVIwKMUH0+dz/rcD0JP5BvIXkHo0o54XGDD49LVo9WbGrpQygP0eKWQYOKI8MUUi2HA+HD
	lelpn4ZDTV1PsWLrjqIFg5dfHwQcBHIZRrCECvvPjRAWg0+Kb45wAxn1RoAigEFS1jjILk4
	UdW14VhJ46C+xic1tZ5LXAZu/i+8o1uu+6UkX24Yw1PVLiUt//0rS43F0w9UuJM8chKvMpL
	7NgLk0ObhOr/uKzDxjyRbvbp+lE4A/Q/THxCTPv9J4GseYzr+CTcQq51Z++tzw2MusFOuot
	hOBUyYPXI4hF0nXsGTptO19xth8Zynr5DLwJlWh4JPk0x0dOLTgQCKzk0vijci1Yi3/OYNU
	k+P2WNxLuytX7GKoKYcNflQLOO76fzi0+f/6F2CoL5ekY1FoMqZlIha4n0hDrkuUxabkoPG
	5h3juaWuMeseKTmbkqKBpI2hcG2a2VrE3abHpTzxMz/zm5U=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

The SpacemiT K1 SoC has two ChipIdea USB2.0 controllers.
- USB2.0 Dual-Role
- usb2.0 Host Only

Add the controller and PHY nodes.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 08a0f28d011f..aa35a3489250 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -449,6 +449,22 @@ syscon_rcpu2: system-controller@c0888000 {
 			#reset-cells = <1>;
 		};
 
+		usbphy0: phy@c0940000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc0940000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB_AXI>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usbphy1: phy@c09c0000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc09c0000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB_P1>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		usbphy2: phy@c0a30000 {
 			compatible = "spacemit,k1-usb2-phy";
 			reg = <0x0 0xc0a30000 0x0 0x200>;
@@ -1291,6 +1307,30 @@ storage-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
 
+			usb2_0: usb@c0900000 {
+				compatible = "spacemit,k1-usb2";
+				reg = <0x0 0xc0900000 0x0 0x4100>;
+				interrupts = <105>;
+				clocks = <&syscon_apmu CLK_USB_AXI>;
+				resets = <&syscon_apmu RESET_USB_AXI>;
+				phys = <&usbphy0>;
+				phy-names = "usb-phy";
+				dr_mode = "otg";
+				status = "disabled";
+			};
+
+			usb2_1: usb@c0980000 {
+				compatible = "spacemit,k1-usb2";
+				reg = <0x0 0xc0980000 0x0 0x4100>;
+				interrupts = <118>;
+				clocks = <&syscon_apmu CLK_USB_P1>;
+				resets = <&syscon_apmu RESET_USBP1_AXI>;
+				phys = <&usbphy1>;
+				phy-names = "usb-phy";
+				dr_mode = "host";
+				status = "disabled";
+			};
+
 			usb_dwc3: usb@c0a00000 {
 				compatible = "spacemit,k1-dwc3";
 				reg = <0x0 0xc0a00000 0x0 0x10000>;

-- 
2.34.1


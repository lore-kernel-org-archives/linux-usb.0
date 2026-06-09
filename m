Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C8148BD5D
	for <linux-usb@vger.kernel.org>; Tue,  9 Jun 2026 15:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019710; cv=none; b=n0Lk0Wcgi1vk1mE/Q7cT9A1Qk18NPCliUcXXpQcy1io+Mi0UfCPDBgHEXyvdpIPY5wQEmJSvxLaXes1yMfkUf+CkuRY3lpq4BYo3ywj8o0yr82QX5Afx2i0KUeHHv2OlGuRHbq0VbaM7gvdQ297nw1B6OSErjmp6QNOWR9sO5/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019710; c=relaxed/simple;
	bh=r+akAUm4bM9rE41J/eDekmyy7P/IFACAh+hHQwnRRfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QTZ7cY5YwslesDFh6DoW/uIbYK1JNwAsY08Dsd9hiMkp2X61K+bJ2GeE9BjDydjfnE4lpALgwH0KlMlvq26nDXWVzDmxnLCvzMzfNUOiBEs7hgiIS4BdJePr7AL2opWXQV0tvhdZgN2l0HPNQiFJxW6ATf1bqtWou5d/hw/76+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=VP0iU4X0; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="VP0iU4X0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1781019700; bh=k2mNfNUmklU9bFAjBbAD3Iaxi1EmNNL5ROjmhSuGaNU=;
 b=VP0iU4X0YnpJWV9ZE1olCfIxnFo6PNZbXcbM4p7xV+Ti//lyU4/BMCxQSIurnLiMyygaT4yJy
 y0VVqonBlZmQ1NbOOejKdj7SFDbutxdZMV9Mt8H+6qHPQwLd+o6t2Y2zSOuCXb8+x6+/hFo6v6w
 M3Ur4TgGV+5bpoPLiyeeZD3BlQGELelY86DaVUVQxRNcj2J9bLB5fMRxKwADCPefpoLeCM7Kxun
 B9YFZhHoM2ey5v9DHC+9XHdxDipf2KdoRfj41uhLgdP3rsDBz+nLjsiVwXEQVd/10G37iiCJ+Yr
 Wefp6oX3BaJY7Pr3vrp0y6dIGtLK0YEVREzRgVQaE3hg==
X-Forward-Email-ID: 6a2834322d71d6ad28f66e5b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.22
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Geis <pgwipeout@gmail.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 2/2] arm64: dts: rockchip: Fix devices suspend freeze on RK3568/RK3566
Date: Tue,  9 Jun 2026 15:41:23 +0000
Message-ID: <20260609154124.445182-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609154124.445182-1-jonas@kwiboo.se>
References: <20260609154124.445182-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EHCI/OHCI controller depends on clk_usbphy1_480m being enabled, or
the system may freeze when registers are accessed, i.e. during suspend
in ohci_suspend().

Add the missing clk_usbphy1_480m clocks reference to EHCI/OHCI
controllers to ensure the clock is enabled when ECHI/OHCI registers are
accessed to prevent a system freeze.

Fixes suspend pm_test issue with EHCI/OHCI devices due to the missing
clk_usbphy1_480m reference and makes following pm_test modes work:

  echo N > /sys/module/printk/parameters/console_suspend

  echo devices > /sys/power/pm_test
  echo platform > /sys/power/pm_test
  echo processors > /sys/power/pm_test
  echo core > /sys/power/pm_test

  echo mem > /sys/power/state

Fixes: 91c4c3e06a25 ("arm64: dts: rockchip: add usb2 nodes to rk3568 device tree")
Fixes: 78f7186095db ("arm64: dts: rockchip: rename and sort the rk356x usb2 phy handles")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a5832895bd39..c930a6fd6ea0 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -321,44 +321,44 @@ its: msi-controller@fd440000 {
 	};
 
 	usb_host0_ehci: usb@fd800000 {
-		compatible = "generic-ehci";
+		compatible = "rockchip,rk3568-ehci", "generic-ehci";
 		reg = <0x0 0xfd800000 0x0 0x40000>;
 		interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru HCLK_USB2HOST0>, <&cru HCLK_USB2HOST0_ARB>,
-			 <&cru PCLK_USB>;
+			 <&cru PCLK_USB>, <&usb2phy1>;
 		phys = <&usb2phy1_otg>;
 		phy-names = "usb";
 		status = "disabled";
 	};
 
 	usb_host0_ohci: usb@fd840000 {
-		compatible = "generic-ohci";
+		compatible = "rockchip,rk3568-ohci", "generic-ohci";
 		reg = <0x0 0xfd840000 0x0 0x40000>;
 		interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru HCLK_USB2HOST0>, <&cru HCLK_USB2HOST0_ARB>,
-			 <&cru PCLK_USB>;
+			 <&cru PCLK_USB>, <&usb2phy1>;
 		phys = <&usb2phy1_otg>;
 		phy-names = "usb";
 		status = "disabled";
 	};
 
 	usb_host1_ehci: usb@fd880000 {
-		compatible = "generic-ehci";
+		compatible = "rockchip,rk3568-ehci", "generic-ehci";
 		reg = <0x0 0xfd880000 0x0 0x40000>;
 		interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru HCLK_USB2HOST1>, <&cru HCLK_USB2HOST1_ARB>,
-			 <&cru PCLK_USB>;
+			 <&cru PCLK_USB>, <&usb2phy1>;
 		phys = <&usb2phy1_host>;
 		phy-names = "usb";
 		status = "disabled";
 	};
 
 	usb_host1_ohci: usb@fd8c0000 {
-		compatible = "generic-ohci";
+		compatible = "rockchip,rk3568-ohci", "generic-ohci";
 		reg = <0x0 0xfd8c0000 0x0 0x40000>;
 		interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru HCLK_USB2HOST1>, <&cru HCLK_USB2HOST1_ARB>,
-			 <&cru PCLK_USB>;
+			 <&cru PCLK_USB>, <&usb2phy1>;
 		phys = <&usb2phy1_host>;
 		phy-names = "usb";
 		status = "disabled";
-- 
2.54.0


Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721B749251F;
	Tue,  5 May 2026 16:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999529; cv=none; b=MC6+GSSzor4+Y1vAAsUcA3S1GZT7CuOKbaUVsxPguuyU2hmhKfSZHDNmbn0865N9L6dM3V2AkIWubhnIPjrmjHWDY3pfkwIRlbqlfpvuprEb7wojHoMgeOty12BZ6V33V+Y+8rl5g8/rnTBykYPx6rWnzicXNO677rAwaP0cfY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999529; c=relaxed/simple;
	bh=ZL+x5JnSYricNTQBlCdvNn1Bd+MbOL2DnOKdr0McMoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tsG93peYnT0e8lyInlKbp0M9S9jBZckeS2TdXuopa2CLUbv5KTS5VhNQM7vUemobXEe35UMzddDKupzzvpM0f6LHxKk3Vf7Xygw8V0HlvUETWjQ3xqaKYu1YqK+PEqLs3WKxfWt30aOgtqgEhpPgOkAf/tLDTsD5mC1mCS4bBkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=WHnmpUah; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="WHnmpUah"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=xuaZ+lu/0oOjq7MzxlekezwgJbuBqAkQmbRBgUbItoQ=; b=WHnmpUahTQD2zbx3pbPMlCuQiO
	W0Zxi4E+3fdR/BrPjI7J5Yywfj7P2KuNhSV5f4Wta+KSEPWpTcn49K/wIdra8z++l/p6e6DazCGBE
	i951cdIz7W5MLojlC8Br+NS+qVxzvlQjKQiqPj4R9XbwXgyV8IDgdVdPdHZO5Y1QzVTJ+b6qThaTq
	WojXAhJxDz71+F4M0dlssocoOc3lEVgQyJ22I4yYlY6zu7UpQeHw8g0TY7Eb0LNjlCXFRz3DDcAyw
	zCsGVs8UdPpPTs+rh5ADdy4dWQ8eqjwy8QBdd0YJtwOiK9/DK8TxPVe7EQU4YWsNhEmIDz2zpQutP
	wbWatNnQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: gregkh@linuxfoundation.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH] dt-bindings: usb: dwc3: Add compatible for RK3528
Date: Tue,  5 May 2026 18:45:09 +0200
Message-ID: <20260505164509.3254707-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonas Karlman <jonas@kwiboo.se>

The USB dwc3 core on Rockchip RK3528 is the same as the one already
described by the generic snps,dwc3 schema.

Add the compatible for the Rockchip RK3528 variant.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
index fd1b13c0ed6b..0554dbc4b854 100644
--- a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
@@ -26,6 +26,7 @@ select:
       contains:
         enum:
           - rockchip,rk3328-dwc3
+          - rockchip,rk3528-dwc3
           - rockchip,rk3562-dwc3
           - rockchip,rk3568-dwc3
           - rockchip,rk3576-dwc3
@@ -38,6 +39,7 @@ properties:
     items:
       - enum:
           - rockchip,rk3328-dwc3
+          - rockchip,rk3528-dwc3
           - rockchip,rk3562-dwc3
           - rockchip,rk3568-dwc3
           - rockchip,rk3576-dwc3
@@ -135,6 +137,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3528-dwc3
               - rockchip,rk3568-dwc3
               - rockchip,rk3576-dwc3
     then:
-- 
2.47.3


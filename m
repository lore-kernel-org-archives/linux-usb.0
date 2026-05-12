Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9DB42982D;
	Tue, 12 May 2026 11:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778585395; cv=none; b=GAeL2SB+pzI1YPEGzu+n4KwWbEeZ/1fUq4MCr5A7WqcJwtOtkNDdITiT3JNCQxiJPz/2yKYbOTm+efgeOHm366KQ/NeHTW9hL3/nBh1zlua+w9dTiNbs9epaT35xkU8wWF+TliRMl/qoXMK4OeJyVeVStAY1emBg/0LVQYX/QWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778585395; c=relaxed/simple;
	bh=6OL8OdGpDPz+4HNU58wiIY3QUrmZe3CiXsPJRIAZDEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U1ZdHjLFh3o7j2Almnh6C1TqKsBxH73YvJbW9kD8o67BJPWZh5iaXIj+BFGF9pTyr8aO7uccAazNAQxNM8YjZbRj1vjGIyB+O2TKnRxSBEfl6lLK5Z6vDyFQkE7ox4qtdnXWsNqhnqYBPrHES6fVmBXCCBuE77dm1dGbsshNDag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fma9akRs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fma9akRs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1756C2BCF6;
	Tue, 12 May 2026 11:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778585395;
	bh=6OL8OdGpDPz+4HNU58wiIY3QUrmZe3CiXsPJRIAZDEM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fma9akRsvLFG/FT1rh/ZcT4yIVQe1C4czklyI6F1fyVQooxLymgSzSjH1bkzxlQgQ
	 kBxJQoAw7poVe6oQfWwZyglSCdP3upHuTkpc4BRC87FTPDlGKSpa0T0vwvcq73lVpB
	 cEqISg7bE9c95nBf2sH3eWVlW9aR5PSUc/H8NPcajcH6alcLp//sFyl369PmvIIyTD
	 Zd07veqLuFLy5sFfnIfy2frA1x+TWvwNSyo99Gu4YYD8CVu4RIK/ibcRWaRLgx2qr8
	 DiUiW1wL5E4D8KoRpU9FmiDw0H47CNwzrxKOSsRmiYWC1oYOQXP0BX/Gg2s6f2myiN
	 pLmbz5/TW/aCQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFED1CD4F35;
	Tue, 12 May 2026 11:29:54 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Date: Tue, 12 May 2026 13:44:24 +0200
Subject: [PATCH v4 1/2] dt-bindings: usb: cdns3: Add no_drd property
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-b4-no_drd_config-v4-1-7b4e5dc96f81@cadence.com>
References: <20260512-b4-no_drd_config-v4-0-7b4e5dc96f81@cadence.com>
In-Reply-To: <20260512-b4-no_drd_config-v4-0-7b4e5dc96f81@cadence.com>
To: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778586339; l=2180;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=/kNcPspzXZFYJBg5ohgq9BtuLbmn3AUVI191xj7NPV4=;
 b=jOT6HoVOR3goRlmKhYCr203RCP3s5A0sz8h3MZC86tRERzH6mzLZC8vKaEXOwn36S0Pr9fZvV
 mYnFcY+BJC/BbLOoO7FvHSMoJIPnNbqQ7mnkJ7QDTrAZfS2BfxLA0ld
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com

From: Pawel Laszczak <pawell@cadence.com>

Introduce a new boolean property 'no_drd' for Cadence USBSS/USBSSP
controllers.

Some hardware configurations of this controller are designed without
the Dual-Role Device (DRD) register block or have it inaccessible.
In such cases, the driver must skip all OTG/DRD register accesses
to avoid bus errors and cannot rely on hardware-based role switching.

To accommodate these configurations, also relax the requirements for
the 'reg' and 'interrupts' properties, making the 'otg' resources
optional.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index 2d95fb7321af..8c7dc81708fb 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -20,19 +20,21 @@ properties:
     const: cdns,usb3
 
   reg:
+    minItems: 2
     items:
       - description: OTG controller registers
       - description: XHCI Host controller registers
       - description: DEVICE controller registers
 
   reg-names:
+    minItems: 2
     items:
       - const: otg
       - const: xhci
       - const: dev
 
   interrupts:
-    minItems: 3
+    minItems: 2
     items:
       - description: XHCI host controller interrupt
       - description: Device controller interrupt
@@ -41,7 +43,7 @@ properties:
                      cleared by xhci core, this interrupt is optional
 
   interrupt-names:
-    minItems: 3
+    minItems: 2
     items:
       - const: host
       - const: peripheral
@@ -79,6 +81,13 @@ properties:
     description: Enable resetting of PHY if Rx fail is detected
     type: boolean
 
+  no_drd:
+    description:
+      Indicates that the Dual-Role Device (DRD) register block is not
+      implemented or is inaccessible. In this case, the controller
+      must operate in a fixed peripheral or host mode.
+    type: boolean
+
 dependencies:
   port: [ usb-role-switch ]
 

-- 
2.43.0



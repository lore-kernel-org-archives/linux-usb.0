Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13D01EB9E3;
	Fri, 20 Mar 2026 07:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773990962; cv=none; b=tfOc4Pn6EtkhqKjJ5VKWCL5BigvfIK0Y6cSLKpiprxnjXAIjhdlEBiJ1dAiGmQwf7HB5Ga2JuHkdpAdtgGI4rhT1w0R9L50CBth2Yj+4L28HuxNHIdjYFnjK/YQChVXSgumfhoC0a5LlYuvYVEWzpQGVNE2aW27Jg9a4FORR+w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773990962; c=relaxed/simple;
	bh=pA8rjgITY9/9C4neWkUKLPha7/LUfe12GHoN3SZqXs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a5/T7KSUEdQ8X/1NnYkp209mQLmkhLb1Rl0jJYSxJq3Gh7rbzV5QLjX/QGIT3TU3C46UgVtg//6yR6smqFsvGtMOnNC8GskIEp6HHNh8Rlmu2ucKR3hVJcQ2+CJVk9TW+3rXXmevJMzcIhggNHNZ3gb5xmmO1i3LJYOP+sLYlag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1g81gHo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1g81gHo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63326C2BCB0;
	Fri, 20 Mar 2026 07:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773990961;
	bh=pA8rjgITY9/9C4neWkUKLPha7/LUfe12GHoN3SZqXs0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o1g81gHoiHzofIfC3yPIXtZDvAX2QXZyeTZDcqULDe+OBlSZ7XDTNZHAB8N8YFi6t
	 Kex7wxdRW9JpojPqoD3IcXZRHeP4gmUhiPRzbZTOuiD1srY3+4TAsz8bjsFC591Pc8
	 OKsT2EBcy6gjGJIlaCWTc44BtfGQhhLjsI90snap8s6gIRvB9GfnZPRgVDRXf5TgkB
	 PbQLBqu1CQtqSDJvUBERTP8X/KbUQSFmvfC3y2TRPM5Ev/D31Mr+FMYdCewX4c7WR+
	 YgWt+n73xbYvGdXXagSDat/WAD3rnKJM1cWSDhVsapRSCtEIPLIUai6GAtGpVDJum6
	 6EKVUcApuL7lw==
From: Yixun Lan <dlan@kernel.org>
Date: Fri, 20 Mar 2026 07:15:37 +0000
Subject: [PATCH v2 1/2] dt-bindings: usb: dwc3: spacemit: add support for
 K3 SoC
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-02-k3-usb20-support-v2-1-308ea0e44038@kernel.org>
References: <20260320-02-k3-usb20-support-v2-0-308ea0e44038@kernel.org>
In-Reply-To: <20260320-02-k3-usb20-support-v2-0-308ea0e44038@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Junzhong Pan <junzhong.pan@spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549; i=dlan@kernel.org;
 h=from:subject:message-id; bh=pA8rjgITY9/9C4neWkUKLPha7/LUfe12GHoN3SZqXs0=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpvPQj2CwDTa2cSJE0SlNPoppwzSPhGvbE/P3SB
 zYCBslWtiOJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabz0IxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1E5hAAnNT98A/L7MqTpI6ZGi3laPlQZ1v5XiSkHQNYs/DSSOsvuAc0l8Mak
 Sq9REYaAlrxbPx94ARjGAQYaXUHvv0asvDnoEU5+EfIAXMIYzUpY4loxoryA+19bxBqCN+OCOQE
 G/Vxko/I68bG8w5KjRov68L7JPjUoQnRbBimVCsGlI3L/+nrBaGnMurCCnn7aK51ojgCJtO5SAF
 zjaG2R185V4tM/DBmDM//lRetOEbrt5spCCfr48Fxc0qFNjKAj1iwz1Cc8NgDptcpiWV6DRXONc
 LlPgBE93ip8Xs3WZ5oAh+eVEVxJ0LyPX+5pUVj5P8WJA158mmbhGAs8S2E00+cHJgxwGqTgCP35
 kuIBuQKMQb7KLLpJxIF6sr0KtmducDocAL0J5J+wjb9aV6wKOzsVbn6BMQnqeOfr0vk6sypO8e/
 JJYtshlHOo66BR3XkUaMP1RZlM6pqN92o/coiQgAF9jb6PRBpsaduru0UzisRnqQiLNtaAPG3rV
 UXHhCzbMbKOBaqnlmAwl+VS5oG5P+/YydEP1Lm00iZumv+DTh68HqX80Q1P/czuSU/h1HM+dROT
 QNp1ljWjNV9c3ZpSrHhvAbMp+LCqFmBbLV3zAltqnsSz2py6CQbOvqDuddJKsWczJMFWKknUx7I
 Dqzi1jWFu1sQJg1kon2GXTunGoIewI=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add compatible string for DWC3 USB controller found in SpacemiT K3 SoC.

The USB2.0 host controller in K3 SoC actually use DWC3 IP but only support
USB2.0 functionality, thus in the hardware layer, it has only one USB2 PHY.
While in K1 SoC, the USB controller has both USB2 and USB3 Combo PHY
connected, but able to work in a reduced USB2.0 mode which requres only
one USB2 PHY, leaves the USB3 Combo PHY to PCIe controller. So both K1
and K3 SoC are able to work in the USB2.0 mode which requires one PHY.

Explicitly reduce number of phy property to minimal one.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
index 0f0b5e061ca1..cc27b363ca79 100644
--- a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
@@ -27,7 +27,9 @@ allOf:
 
 properties:
   compatible:
-    const: spacemit,k1-dwc3
+    enum:
+      - spacemit,k1-dwc3
+      - spacemit,k3-dwc3
 
   reg:
     maxItems: 1
@@ -42,11 +44,13 @@ properties:
     maxItems: 1
 
   phys:
+    minItems: 1
     items:
       - description: phandle to USB2/HS PHY
       - description: phandle to USB3/SS PHY
 
   phy-names:
+    minItems: 1
     items:
       - const: usb2-phy
       - const: usb3-phy

-- 
2.53.0


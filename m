Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095730;
	b=ssfS/S1o0dUz+tHUSogxXM0MwkUdpo/GYYWrLIZ8KkyMdLla5VUQWcQkexDCj3/Csh4e
	 GSuBrKVkG+cQP5uski+rGL8kNXFgckLrBssY0brKn0B3KnbQaTuvHFwhyoR+bkmzd67/J
	 htPa3RFw6ld7oYk/k6iGIGe8RwRY8iJ1y9/+ZaruOS5OnFl+MWhyrXQTp/RWxbT9wmQ52
	 Dv8psVLv8M2VmsWb6jFvqDCkstQwbDLG/qvVpGpmp4PuDflVKnTlGEJAzPBRFIndYyfqA
	 4f3//YiCfd9FJMQ5AH1nkXsEgAirX67+SkkmyBGegNtfO4XNtgVB06bnhlDwmlSC/GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095730;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=WyrNoNNu/NB86HpPrgRxwPVRhvTuGwuFy/4c8+oY+lk=;
	b=n39yB4ct/Ux8aOk5hymUbHyVmvwslvO5nx2aflgT45DgUsUtN9cAcQcoNmpav30OFe6e
	 AU9TGzWtNPAWWuI4AyRltnXR12CA5qwtC6QbKZ3hjyqgByqCJZMQKRRIXFk6A9oRGoZYd
	 QXog4TVZGOIlVORRkxeLD/gpLFx6tB+b6gRKlADyf9xiiybMFrdQgkNvU/t5zqBs9PV7I
	 sM7j+U1mxn7zLSCIzZBVZXginpbDPQJ/TiMZshHyID6wgrF9luPsNPBpJySoUFsHlnKlj
	 /TZElaVVv4OS8RYFVyIWP0PKGws8a4DyPLI/eRw3mg5CNXz0Mg7Ekm0B6kt9mU9jVag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=xo2k8DeL;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976CF606A325;
	Thu, 19 Nov 2026 13:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 976CF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=xo2k8DeL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795095716;
	bh=WyrNoNNu/NB86HpPrgRxwPVRhvTuGwuFy/4c8+oY+lk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=xo2k8DeLxK1VivPjkHHmit9Akd3zt70WhisY/kY1aBFBivfEFjvIBtGZt3O72WN6k
	 76djxF7/SRiXRuXJPOxcDiJ1nXxEqwuMu7QAAFWGBEKbfoiXM5aKIOB5lDSLqGlGCM
	 mZd8/gFIHRXnJrFlSNPpA8XJsee4J5RBXAlQ0Pi8=
X-QQ-mid: zesmtpgz7t1795095715t5be17480
X-QQ-Originating-IP: Y8sIaLKPPl5t+ErH1LS3S8rlSC2LFGNGgku0BOew9xc=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 21:41:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1261305453111228185
EX-QQ-RecipientCnt: 15
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Thu, 19 Nov 2026 21:41:50 +0800
Subject: [PATCH v6 1/5] dt-bindings: usb: ci-hdrc-usb2: add
 spacemit,k1-usb2 compatible
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-b4-spacemit-k1-usb2-v6-1-4a9add848728@linux.spacemit.com>
References: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
In-Reply-To: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, spacemit@lists.linux.dev, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795095710; l=1574;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=vJgNan3VXHrPIUL1xi2lNNcRCVH0/pu/PtlpRHIGzOA=;
 b=suW/0d+TTe/BTUivj5qmol4YydrbDyr809Icxb//O3zz3N/Bsiv025Y4RuF3cxVHBPVwRhoeo
 In1dQ6pvutWC5NniL5R3uTu5YBEqTjO+m0G7wf1DUurVTSqHjppS9zG
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NNUJeUDV+0gUaRPLzw+7eju6lDXKTdjPAX1h7d5KRtAQrlHREtmmzjxX
	SPdK2pRpz4fKxDbRKi7ATqctWEImNlQCNxAFwuL6y3hlijdB255sfkY++JQm35tLQqsn5l1
	DgJJjL/yO3SALHDQjNB6vUG0yOu4aZYJJs1ftIsda2+vMYkUWOopQeusSFD9x1LjoMXZb6k
	05ZFyOFls2XJapVneXMrYfCmhOrKVkVeEVPGvn2JfmwB0D54QLPPy03h/nFJ+NyJyMUQGDy
	STqVuUhf8mm2oPfJWNxdBrUDPYweiMITc1fOXpv1q2pKjID/qXfEyD3aPOCAnAFx9odfGuc
	4Ca1uGRi7/b7yC9OORX4ipZhmpciZ1ldGWCW5trys34JR4al6AVdWiyO+0dVW65QcxbLIMz
	H5wECJe9oR3ta9APkFLd3AZ/jxiLZw2N9CW+mSROSLowmKLB2NgwZGtph3C0wM1OjNoxB+r
	FM+jlljwQ6QHMFayBF1CA0x9Wy+FaYEgPYYuGVZXlm2x+kBrtlqik+pZcG5zN33aAJ1FfPR
	KcgQ/emSsG3CKBJVDeivRe0Tevhocym7G7eg8ZIvsFfm5/xQmpzHajCGYJAUOva2KqW3BYI
	2MaoPAOibpDSDA0bnHO8LttUW4KOGVSj99bU266AMYTiJLecbQC9XvjqGE/Ud19xDiq+/pj
	yObg08kGSAckNXN2CADuT+iQALYySVL9KIVLwr3ge5/ZgrkZ2Gx33p479ty1DkMYl6hALKq
	hCM5FFmuWnedWzwgoaaL+FvawCznE7xzQDuPzCZeXSyfMW/l6ao7P4DDlFbijJIOP/kUUiO
	yifMRMZUoufsWOG4fxm1etYG4OztoNSprS+KdSuqcs7WJaRfw7dpAOMjQFYEK7MhFFTo/SI
	Ew3tX6Cf+qu6/K04JJQYzLpME0CouFrMGiJHFtGzGl9wt5B6zbAUhuLzIJGNrAQhCuFM8m1
	3dmMtuITkFrYtq3xYNR3NCcF0pi6AspSsePXnVGOP52w3z9LvM/RsrI4XjKVGXMRvwfzoZh
	GGU7/o5z0eE2gU1TWK89ooatLFKHdfM2CV2h8FKh+t+J58jkJcg6kCTc0PMyraOsVmC4wN3
	g==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

The USB2.0 controller on the SpacemiT K1 SoC is dual-role capable but
has no internal OTG registers, this requires flags which disable
related features set in platform data. Add a compatible string to match
the platform data.

Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
work, add constraints for it.

Reviewed-by: Yixun Lan <dlan@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 620b564914d4..5c2b7eb1a6ff 100644
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
@@ -113,6 +114,20 @@ allOf:
           maxItems: 2
         clock-names:
           maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-usb2
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        resets:
+          minItems: 1
+      required:
+        - clocks
+        - resets
 
 unevaluatedProperties: false
 

-- 
2.34.1


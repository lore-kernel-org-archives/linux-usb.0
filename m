Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795227686;
	b=jPhAGq9xLSIbHwzbzbyjXU23m7EfcGWAxc0NMc0aRRex7rQExx5k8AehmrXPbRRqTTSu
	 UthiIRLJ2qezpVPGXEcF+1wgXhpw1aRTvSRrNLcYEJMQZrFCbz3ZKDsaQRgXr/8pMF6np
	 MJD/4tyIjgimpeQXLU8kTBnK/k/ztBmWHsHl784Aef0vAeBBuBewNDe0bCfBrotgkXUTU
	 oPkuo0kM5KHKSjzu+eH+6MocnodSyX3IhPzCX+AzKiQnXJFh4VdAdUuojRJFEbxFtqUbO
	 Uc+9mVZje9Hde5JdhrB9e+GApUw6/5w5mTxKQq7M7fz2Uasz31vS7fzoQbevVhbNg0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795227686;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=7ObmZhTv7nmw/A3Cdo7p/dJF2b0Bc9VtYNFATpl/9O0=;
	b=Ze3XdwFmZr4vox26Bk1adSXkyX8tpa5yYyMv+XKbXJSnlhs3gi6r3KNHQRaaDL3MJM8X
	 GGWW17Z66aoduIglAkQjKRKWoISBlvdaXSWrOVK0sS62Zxi8qahuje7dFuQfKnXxPbG2m
	 ywikSD+//OuoHOb6e2rN3yWXJs7Ui+loTUb2FyrfDuYxTiHiQ4fQiS6v00VhkMp2wtBzt
	 WWpP7uORxf55EqwVj+v8wSQsaqs+S29URGJIgYPuxAv7/wAi1jkITGyIw+sT10r5sN4be
	 qjRDQT/M0fojEaxBUKUDSiKExL7ZD0NglcJWG11XCHgAHpZu0a1ml2LMgsQs4lcBK1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=EBfH1B1S;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDAA606A691;
	Sat, 21 Nov 2026 02:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CDAA606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=EBfH1B1S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=7ObmZhTv7nmw/A3Cdo7p/dJF2b0Bc9VtYN
	FATpl/9O0=; b=EBfH1B1SANPMsfuosz8146ne+MCgwYyyOQEJoJbYsc2X9AHFo3
	ECfMwmXNQ1HWAU+hreDO1zdYhJh48yn3S4UZ8MizJL2L0bswTpNoIfHD2aC+1mBq
	vjTnVxiiyNGfnxDSyKC+ixLsEnE2/z8cnkNu//E2S+RRJPnIewdqKj4FU=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.187.147])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgB3_EAQAAFrSyPiAA--.173S3;
	Sat, 21 Nov 2026 10:21:09 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Thinh.Nguyen@synopsys.com,
	linux-usb@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 1/3] dt-bindings: usb: snps,dwc3: describe two connectors on one HS data bus
Date: Sat, 21 Nov 2026 10:21:02 +0800
Message-ID: <20261121022104.1507987-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121022104.1507987-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052137.32833-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261121022104.1507987-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgB3_EAQAAFrSyPiAA--.173S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKrW3urWUXF13uF17KrW7Arb_yoWxGr4xpF
	ZxtF48JF4vgryfAwnFy3W8CwnYkF4kJrnrtryDWr1UZay3WryrXa1akwnaga4UCF92va4a
	9a4DX3W8X3ZruF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4
	vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUgl19
	UUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARESB2sAn9sRNQADsN

Some designs route two USB Type-C receptacles through one High Speed D+/D-
pair with a GPIO multiplexer, so only one connector drives the controller
at a time.  Each connector needs to be described: which role-switch input
belongs to it and which mux state selects it, because the role switch is
registered per connector and the driver must know the state to program
when that connector asks for a role.

Describe the two connectors as the two endpoints of the High Speed port,
which is what a mux'ed data stream is in the OF graph: port@0 of "ports"
carries endpoint@0 and endpoint@1 under "mux-controls", each with
"usb-role-switch" and the "mux-state" that reaches it.  The mux
controller is referenced with "mux-controls", so an existing "gpio-mux"
controller can be used as is.

The High Speed port definition itself stays optional: a single-connector
controller keeps describing one plain "endpoint", and requiring the two
endpoints together with the rule that their mux states differ only
applies when "mux-controls" is present.  The two states must be opposite,
and the driver rejects a device tree where two connectors claim the same
one.

*** AI-assistance disclosure ***
This patch was prepared with the help of an LLM coding assistant.  The
author reviewed every line and ran the gates quoted in the series notes.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../bindings/usb/snps,dwc3-common.yaml        | 124 +++++++++++++++++-
 1 file changed, 122 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b6538..57e3c1d9ed 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -13,6 +13,89 @@ description:
   Defines the properties of the DWC3 core as being embedded in either an
   vendor-specific implementation or as a standalone component.
 
+$defs:
+  hs-endpoint:
+    $ref: /schemas/graph.yaml#/$defs/endpoint-base
+    unevaluatedProperties: false
+
+    properties:
+      usb-role-switch:
+        type: boolean
+        description:
+          This connector endpoint has its own USB role switch. The switch is
+          registered against this endpoint and looked up with
+          usb_role_switch_at_endpoint().
+
+      mux-state:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description:
+          State of the High Speed data bus multiplexer which connects this
+          connector to the controller.  The two connectors of one controller
+          must use different states; the driver rejects a device tree where
+          two connectors claim the same one.
+
+    dependentRequired:
+      usb-role-switch: [mux-state]
+      mux-state: [usb-role-switch]
+
+  hs-port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    # The two connectors are two mux'ed data streams of the same High Speed
+    # bus, so they are two endpoints of one port, not two ports: "ports"
+    # describes the controller's own data streams (HS in port@0, SS in
+    # port@1), and an endpoint describes one stream multiplexed onto a port.
+    #
+    # Nothing here is mandatory on its own: a single-connector controller
+    # keeps the plain graph port and only describes "endpoint".  The mux
+    # branch of "allOf" requires the two endpoints when "mux-controls" is
+    # present, and the exclusivity below then applies because both endpoints
+    # exist.
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      endpoint@0:
+        $ref: '#/$defs/hs-endpoint'
+        required: [reg, usb-role-switch, mux-state]
+
+      endpoint@1:
+        $ref: '#/$defs/hs-endpoint'
+        required: [reg, usb-role-switch, mux-state]
+
+    if:
+      required: [endpoint@0, endpoint@1]
+    then:
+      # The two connectors must claim opposite mux states.
+      oneOf:
+        - properties:
+            endpoint@0:
+              properties:
+                mux-state:
+                  $ref: /schemas/types.yaml#/definitions/uint32
+                  const: 0
+            endpoint@1:
+              properties:
+                mux-state:
+                  $ref: /schemas/types.yaml#/definitions/uint32
+                  const: 1
+        - properties:
+            endpoint@0:
+              properties:
+                mux-state:
+                  $ref: /schemas/types.yaml#/definitions/uint32
+                  const: 1
+            endpoint@1:
+              properties:
+                mux-state:
+                  $ref: /schemas/types.yaml#/definitions/uint32
+                  const: 0
+
 allOf:
   - $ref: usb-drd.yaml#
   - if:
@@ -26,8 +109,46 @@ allOf:
       $ref: usb.yaml#
     else:
       $ref: usb-xhci.yaml#
+  - if:
+      required: [mux-controls]
+    then:
+      # The mux path is only taken when the controller itself carries
+      # "usb-role-switch": dwc3_get_dr_mode() forces dr_mode back to
+      # peripheral, dwc3_get_extcon() skips the role-switch branch and
+      # dwc3_drd_init() never sets the mux up without it.
+      required: [dr_mode, ports, usb-role-switch]
+      properties:
+        dr_mode:
+          const: otg
+        ports:
+          required: [port@0]
+          properties:
+            port@0:
+              required: ['#address-cells', '#size-cells',
+                         endpoint@0, endpoint@1]
+    else:
+      # Without a mux the High Speed port keeps the generic graph port
+      # binding, so single-endpoint controllers are described as before.
+      # port@0 is referenced here rather than declared once in "ports"
+      # because the graph port forbids properties it does not know
+      # (unevaluatedProperties: false), which would reject the per-connector
+      # "usb-role-switch" and "mux-state" of the dual-connector form.
+      properties:
+        ports:
+          properties:
+            port@0:
+              $ref: /schemas/graph.yaml#/properties/port
 
 properties:
+  mux-controls:
+    maxItems: 1
+    description:
+      Phandle to the multiplexer that selects which of the two connectors
+      drives the controller's shared High Speed data bus, e.g. a
+      "gpio-mux" controller.  Each connector is described by the endpoint@0
+      or endpoint@1 of "port@0", and the endpoint of that connector carries
+      its own role-switch input and the "mux-state" it is reached in.
+
   extcon:
     maxItems: 1
     deprecated: true
@@ -411,7 +532,7 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: '#/$defs/hs-port'
         description: High Speed (HS) data bus.
 
       port@1:
@@ -429,4 +550,3 @@ required:
 
 additionalProperties: true
 ...
-
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267241;
	b=uCuMFngAlyqOvbUjgiBSvSH3kSDoNrD3y8k0aBjrKXqujVGzHSJM/1mrXOovH8RTtGW2
	 2VjgfucIpRcyU5yYJc8fxVZ/HE7JExfdxCea/CwwwoxVAl73Cqpo9gbuv3vivGaSgiMCs
	 iI2S2zz5zFJwrIvn/z3jbbVBuRVFGE7lL4zEuh4t3dIXSVubjMFvATwBSgAVOueAJ/XpA
	 SDC8QD+sipldkNsYjQPSvMl6W995CpZBpOpAfA5Wgb6xsDRGneTG1cf3LeRjH8uT3uLWj
	 75QkH+c9JYVNNt2DQHyvb9jldyTSsJRWomvEcDRW/B5oMdwfuCkSTq3D27A2xKpnNiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267241;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=4lLIbWKR0g2AGGIyo3/1zIWFjXUvApnp2wJj76lYKIM=;
	b=RrEVh34SWivBlDsLn7dyELyxjGxr6bUF/OBATu6GpnEGkw0qd88gE66/LQRhYSQmhDOq
	 2aGFOUu2/bQ0RUZzichXsSXFyrlSpE1m4sX4KLioHe/XnrMEf3yRIb7kosRmm2yGf7GIO
	 lUMePKOehtTLPJogZZILdYiZN50EVJrXflBJWCqbFm37dWihvdKWgN3doczAMFNb5SkLn
	 WQa+IfyDgVSceS9wadDV0CIEtOHLQQlmnwGlDuzrjYfM0lyMZSBoDVSj0LWfV+aKHOgph
	 BHfFXHQx5bgz2FPx23uSwcCQu92g28LmOEywp+JDALDVBnxtGOMB5CXpKQnZbYhdYkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=P3HUQ+KU;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914C1606A337;
	Sat, 21 Nov 2026 13:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 914C1606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=P3HUQ+KU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=4lLIbWKR0g2AGGIyo3/1zIWFjXUvApnp2w
	Jj76lYKIM=; b=P3HUQ+KUYclzOLduPCTM2KRCfw4uoHevsLvc8h9M/QkDZzheGt
	OCHGN4z6VUoaJNKeCkpv5IAvmAWEMOp3TjIUwm0udzPkV7e4eDoweMzIu405HiB6
	VIU/MO0DxYi0md2knwsW/4wDd9mln7m+0P6JsI8FAbXLf/YL7tl5pUoEE=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.187.147])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCnKT6dmgFr9DfkAA--.3095S3;
	Sat, 21 Nov 2026 21:20:31 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 1/3] dt-bindings: usb: snps,dwc3: describe two connectors on one HS data bus
Date: Sat, 21 Nov 2026 21:20:27 +0800
Message-ID: <20261121132029.2379449-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121132029.2379449-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261121022104.1507987-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261121132029.2379449-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCnKT6dmgFr9DfkAA--.3095S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtFyrXF4xCw1rtw1rAr1fWFg_yoWxGw1DpF
	ZxtFs7tF4vgryfZ3s2y3W8Cwna9F4kJrnrKryDGw1UZa13WryrXa13Kw1FgFyUCF92va4a
	934DW3W8X3ZrCFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY
	1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4
	xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCa
	FVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43MxkIecxEwV
	AFwVW5GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bzb1nU
	UUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARESB2sAn9smxQBLsC

Some designs route two USB Type-C receptacles through one High Speed
D+/D- pair with a GPIO multiplexer, so only one connector drives the
controller at a time and the device tree has to say which role-switch
input and which mux state belongs to each of them.

A mux'ed data stream on one bus is an endpoint of that port in the OF
graph, not a port of its own, so the two connectors become endpoint@0
and endpoint@1 of the High Speed port, next to the Super Speed port@1.
Each endpoint carries "usb-role-switch" and the "mux-state" that
reaches it, and the multiplexer is referenced with "mux-controls", so
an existing "gpio-mux" controller is used as is instead of a private
property.

The High Speed port definition stays optional: a single-connector
controller keeps describing one plain "endpoint", the two endpoints
are required only when "mux-controls" is present, and the two states
must be opposite so that the two connectors cannot both claim the same
data path.

*** AI-assistance disclosure ***
This patch was prepared with the help of an LLM coding assistant.  The
author reviewed every line and ran the gates quoted in the series notes.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---

Changes since v10:
 - the version posted as v10 still applied the two-connector definition to
   every user of "port@0" through an unconditional "$ref", and required
   "dr_mode" from a mux user.  Both are gone: "port@0" keeps the generic
   graph port at the top level, and the two endpoints, their
   "usb-role-switch"/"mux-state" and the address/size cells are required by
   the "mux-controls" branch only, so existing single-connector controllers
   such as qcom/sm8250.dtsi validate as before.
 - the High Speed endpoint schema is inlined into "port@0" through
   patternProperties; the local "$defs" section and the "$ref" to it are
   dropped, as Rob asked for in v9.
 - keep driver behaviour out of the binding: the "mux-controls" branch only
   states what the device tree must contain, without naming driver
   functions.
 - do not list "dr_mode" in "required": omitting it already means "otg"
   (usb-drd.yaml, and dwc3_get_dr_mode() for a role-switch controller), so
   requiring it rejected trees that rely on the default.  It stays
   "const: otg" when present, so "host" and "peripheral" are still rejected.
 - require both "usb-role-switch" and "mux-state" on both endpoints, so a
   tree cannot satisfy one branch of the oneOf while omitting the
   properties the driver needs.
 - describe the binding relative to the baseline tree instead of as a diff
   against v8; the v8 changelog referred to a "port@2" and a
   "port-select-gpios" property that never existed upstream.
 .../devicetree/bindings/usb/snps,dwc3-common.yaml  |   99 ++++++++++++++++++++
 1 file changed, 98 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b653824..7a9cb5a115a6 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -26,8 +26,49 @@ allOf:
       $ref: usb.yaml#
     else:
       $ref: usb-xhci.yaml#
+  - if:
+      required: [mux-controls]
+    then:
+      # A multiplexed High Speed bus only makes sense when the controller is
+      # dual-role and both connectors can switch their role independently.
+      required: [ports, usb-role-switch]
+      properties:
+        dr_mode:
+          const: otg
+        ports:
+          required: [port@0]
+          properties:
+            port@0:
+              required: ['#address-cells', '#size-cells',
+                         endpoint@0, endpoint@1]
+              patternProperties:
+                '^endpoint@[01]$':
+                  required: [usb-role-switch, mux-state]
+    else:
+      # Without a mux the High Speed port keeps the generic graph port
+      # binding, so single-connector controllers are described as before and
+      # the per-connector properties have no meaning.
+      properties:
+        mux-controls: false
+        ports:
+          properties:
+            port@0:
+              patternProperties:
+                '^endpoint@[01]$':
+                  properties:
+                    usb-role-switch: false
+                    mux-state: false
 
 properties:
+  mux-controls:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
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
@@ -411,9 +452,65 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        # The High Speed port carries the controller's HS data stream.  Two
+        # receptacles sharing one HS D+/D- pair are two mux'ed data streams of
+        # that one stream, so they are two endpoints of this port and not two
+        # ports.  A single-connector controller describes the plain "endpoint"
+        # of the graph binding and is unaffected.
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description: High Speed (HS) data bus.
 
+        patternProperties:
+          '^endpoint@[01]$':
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              usb-role-switch:
+                type: boolean
+                description:
+                  This connector has its own USB role switch, registered
+                  against this endpoint.
+
+              mux-state:
+                $ref: /schemas/types.yaml#/definitions/uint32
+                enum: [0, 1]
+                description:
+                  State of the High Speed data bus multiplexer which connects
+                  this connector to the controller.  The two connectors of one
+                  controller must use different states.
+
+            required: [reg]
+
+            dependentRequired:
+              usb-role-switch: [mux-state]
+              mux-state: [usb-role-switch]
+
+        if:
+          required: [endpoint@0, endpoint@1]
+        then:
+          # The two connectors must claim opposite mux states.
+          oneOf:
+            - properties:
+                endpoint@0:
+                  properties:
+                    mux-state:
+                      const: 0
+                endpoint@1:
+                  properties:
+                    mux-state:
+                      const: 1
+            - properties:
+                endpoint@0:
+                  properties:
+                    mux-state:
+                      const: 1
+                endpoint@1:
+                  properties:
+                    mux-state:
+                      const: 0
+
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: Super Speed (SS) data bus.


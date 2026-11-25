Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616600;
	b=fdYTiL19AyEddT2MzbQRHaynB0XZWqmrsHIElyfumgDtVOy9Esr78boQTbLTjlrIeOYS
	 kIQOsaAnh9oWQ327qy2sGzPi585VfQ9+YCWMysNx2vJ7MuEfo6qazV2aSF5vrzFawZYav
	 QgIrGvuaka9VBzhdIf0LkRz0+oFIWd4U27f0ILSDqO3tRGLa8vQWzJyXlZphYDJIOuCRx
	 +wpeROUIkVgObREGxb3v+S1NtTA/VnTbbyQX/q//BEnd25pjKfc5uKukohBgJk2eA7TmS
	 WhdpyC0eEN1MglNvOObei3iKiY8bcFfzPrGOY/bO3f4j8+PNCU+pq7k0KtDrYdIBSTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616600;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=i30f6hX0SmcjWXQ8ZaymYdfcTfQG4Jc/z9LJlK4+8tg=;
	b=qs3jE7fSWSgrQqq1LKzCOGJx3tJ1CK1ghQPQCqU57dU/BWkeOfGwBcxnlQzLqhGkmIGM
	 jBwjiVZtDIhfMc0nls4AzvZjhyk/Ucfe3UdGBA6DmEKBywfN+H3k1mr6WR6rbkkeNlhsO
	 qoDwpwY8dwb7oP+pCeRqF/0hC5Fh1rBJdSwnpZIUmdpH6B0/vbPHr+BDModsTRpgOdNjO
	 OzO/vqtFi9WIZo7L+pwCQhjIH094WoeIFPLDezT1uUum6uLInvo3axsW03qzi6ejV4OPQ
	 YjH9rvncd2QXJiVK8rD031x/fzpphQ3snU1ZvP/dcj4uwZtM2CLj7rDFvlB4O36GGLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ATbzr1su;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58076606A321;
	Wed, 25 Nov 2026 14:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58076606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ATbzr1su
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=i30f6hX0SmcjWXQ8ZaymYdfcTfQG4Jc/z9
	LJlK4+8tg=; b=ATbzr1suk5ShxBm3kf60q+EbVKLMrQSoODSBs/sV1VpzzqRicf
	jOiu7JlMQaqRYh2h2YTBgYVPhLf2Yql8NQUyTM9YZk4wL7iSFNg7Zz3xFWzNYCOc
	4AncXCUIPpI7N/pokTpl0Sxw+hLA4PuOrXTLS1G5Xh4O7U5rgcAjHmmyo=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.196])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBXxSlN7wZrtu73AA--.1127S3;
	Wed, 25 Nov 2026 22:23:10 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v16 1/3] dt-bindings: usb: snps,dwc3: describe two connectors on one HS data bus
Date: Wed, 25 Nov 2026 22:23:07 +0800
Message-ID: <20261125142309.3265777-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125142309.3265777-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261125142309.3265777-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgBXxSlN7wZrtu73AA--.1127S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtFyrXF4xCw4xuw48GrW5GFg_yoWxZrW3pF
	ZxtF48tr4q9ryfC3sFyF18Cwn5KF4DJrnrJFnrJr1UZanxWryrXFsxK3sYqFyUCF92va4a
	k34DW3W3X3W7CF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUgm9-UUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARECB2sGHiAuFQAasn

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

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../bindings/usb/snps,dwc3-common.yaml        | 106 +++++++++++++++++-
 1 file changed, 105 insertions(+), 1 deletion(-)

Changes since v15

sashiko reviewed v15 1/3 on 2026-11-25 and reported two low-severity binding
issues, "[Low] dt-bindings: usb: snps,dwc3: incomplete endpoint schema under
port@0" and "[Low] dt-bindings: usb: snps,dwc3: inter-version changelog above
tearline".  Both are accepted; this patch is the only one that changed.

1) Endpoint schema under "port@0".  Accepted.  "port@0" is described through
   the graph "$defs/port-base", which leaves "unevaluatedProperties" open on
   purpose, so a plain "endpoint" of a single-connector controller accepted
   "usb-role-switch" and "mux-state" without any schema recording what they
   mean there.  The "else" branch now puts the generic graph port binding on
   "port@0"; its endpoint schema has "unevaluatedProperties: false", so an
   endpoint of a controller without a mux cannot carry either property.

2) Unit address pattern in the "mux-controls" branch.  Accepted.  The pattern
   that rejects a third endpoint read '^endpoint@([2-9]|[1-9a-f][0-9a-f]+)$',
   which let 'endpoint@a' through ('endpoint@a' to 'endpoint@f' are accepted
   unit addresses in graph.yaml).  It now reads
   '^endpoint@([2-9a-f]|[0-9a-f]{2,})$', the exact complement of
   'endpoint@0'/'endpoint@1' among the addresses graph.yaml accepts, so
   'endpoint@a' and multi-digit addresses such as 'endpoint@10' are rejected
   as well.

3) Revision log position.  Accepted.  The "Changes since v13" log of v15 was
   in the commit message; it is below the "---" tearline of this patch now,
   together with the log above.

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b653824..1f23840fd1f2 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -26,8 +26,84 @@ allOf:
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
+              # A mux'ed High Speed bus has exactly two connectors, as the
+              # two endpoints of this port; a plain "endpoint" or any further
+              # endpoint would be a third data stream and is not described.
+              properties:
+                endpoint: false
+              patternProperties:
+                '^endpoint@[01]$':
+                  required: [usb-role-switch, mux-state]
+                '^endpoint@([2-9a-f]|[0-9a-f]{2,})$': false
+              # The two connectors must claim opposite mux states.  Kept inside
+              # this branch: JSON Schema evaluates "properties" of an absent
+              # property as true, so the same "oneOf" outside the branch would
+              # see both alternatives match when "mux-state" is not used at all.
+              oneOf:
+                - properties:
+                    endpoint@0:
+                      properties:
+                        mux-state:
+                          const: 0
+                    endpoint@1:
+                      properties:
+                        mux-state:
+                          const: 1
+                - properties:
+                    endpoint@0:
+                      properties:
+                        mux-state:
+                          const: 1
+                    endpoint@1:
+                      properties:
+                        mux-state:
+                          const: 0
+    else:
+      # Without a mux the High Speed port keeps the generic graph port
+      # binding, so single-connector controllers are described as before and
+      # the per-connector properties have no meaning.
+      properties:
+        ports:
+          properties:
+            port@0:
+              # "port-base" leaves "unevaluatedProperties" open on a plain
+              # "endpoint" child, so without a mux the generic graph port
+              # binding is used here: its endpoint schema rejects
+              # "usb-role-switch" and "mux-state" instead of taking them
+              # silently.
+              $ref: /schemas/graph.yaml#/properties/port
+              patternProperties:
+                '^endpoint@[01]$':
+                  properties:
+                    usb-role-switch: false
+                    mux-state: false
 
 properties:
+  mux-controls:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
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
@@ -411,9 +487,37 @@ properties:
 
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
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: Super Speed (SS) data bus.
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594358;
	b=BBlcVh4+F1B5m8gWNBp34f6DPHjh4pLAQ/0M2N3bg3hljIYuTzfgufb5nEI1q0nyLenW
	 IR+3x3kr7gLPFUuBPyLPbAkmQQ+P8w/NcjiLWfANhThJ5PWiWspSLdkZNxehLhdkeN6HQ
	 YByThmzCcWZLivFVijzeY9kMKM5D9VtaVsV2IVfSIjcmuPEBy8mu80maWpq14ByiKFjMZ
	 kBr+GHFfpr49wuS5pz8AFx84UselbHOPbEKGa0vedWLtAbw1QVUR5ouIgYOvrIF0Dbhzo
	 UQ5e2PhHh10lTyaCkmvvr74v3bcH73uGeoguuk8/z9WCt+hoJaTsP5ORPcx/55iEJgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594358;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=MIK5lgowHa9HZQL7wgJvDpM5vWQ0IauK2t5++KMPc2I=;
	b=Cs0jv77+ilNdHd6ZPshrRTPBEdviZ8QMOT7a+AIOIkjMxdil0znaCp5dUpdCYq4CVEvT
	 q3YjMYXWo347uXX4UFIpFfqwNjtOknZajaPe6+y8hWwjQ3gNaLALHqn/WXbCBdEitFT6D
	 nZBJ6kZ/E2bf/MtHyfx/ypu+nWJGDwTi/C2gY+gSaBuRIS1hphniu06ZXpT6+TGjTujjw
	 zGUE4DFx8iWvrZ7hjrHe5icvR270ZJmS79QUOJaxwMdpy1AMJGGdeq6XirrTgsoIi5o+0
	 CTVS7OfALxwXVo+k3ApLzt0y9CiDn2MxePJ6zEobeDD1NmpgovVjRKLovIiebep4L2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=V6O2nI7C;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C16606A326;
	Wed, 25 Nov 2026 08:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97C16606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=V6O2nI7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=MIK5lgowHa9HZQL7wgJvDpM5vWQ0IauK2t
	5++KMPc2I=; b=V6O2nI7CFvd4QxIZpsYrTuWoA16elDl7Yh41Z3eU6HH7VHuN9z
	HhIsgKRc5IZ5PKwNLgmYRPGajAIsGboJswH/4adQOhuxze/jwODwXA5u1ESxfKvE
	ki+DqWSeRPPbmA01GLNvSiaDaNXe6JC4MR+eouCqDP+R0nTSf6JcuOWGw=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.196])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAXo0djmAZrB3r2AA--.2433S3;
	Wed, 25 Nov 2026 16:12:27 +0800 (CST)
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
Subject: [PATCH v15 1/3] dt-bindings: usb: snps,dwc3: describe two connectors on one HS data bus
Date: Wed, 25 Nov 2026 16:12:17 +0800
Message-ID: <20261125081219.3661014-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125081219.3661014-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261125081219.3661014-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAXo0djmAZrB3r2AA--.2433S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtFyrXF4xCw4rXr1rXFW7XFb_yoWxGFy8pF
	ZxtFs7tF4qgryfA3srAF18Cwn3KF4kJrnrJrnrGr1UZa13Wr1rXa13K3sYqFyUCF92va4a
	ka4qg3W7Xw17CFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUgm9-UUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/

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

Changes since v13:
 - [sashiko, 2026-11-23, Low] "missing maxItems: 1 on mux-controls".
   Accepted: the shared data bus is driven by one two-state multiplexer, so
   "mux-controls" now says "maxItems: 1" instead of leaving the number of
   mux controllers open.

 - [sashiko, same report, Low] "missing endpoint schema under port@0":
   a plain "port@0/endpoint" could carry undocumented properties and
   "endpoint@2"/"endpoint@3" were not rejected, because the graph port base
   intentionally leaves "unevaluatedProperties" open.  Described where it
   matters, inside the "mux-controls" branch: a mux'ed bus has exactly two
   data streams, so that branch now rejects a plain "endpoint" and any
   "endpoint@2"+.  Single-connector controllers keep the generic graph port
   binding untouched.

 - [sashiko, same report, Low] "contradictory oneOf and redundant mux
   rules".  Accepted; this one was a real logic error.  The "oneOf" that
   requires opposite "mux-state" values evaluated both alternatives as true
   when "mux-state" was absent, so a two-endpoint tree without
   "mux-controls" failed validation.  The "oneOf" now sits in the
   "mux-controls" branch, where both properties are required anyway, and the
   redundant "dependentRequired" and "mux-controls: false" are gone.
---
 .../bindings/usb/snps,dwc3-common.yaml        | 100 +++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b653824..dcfa8c3a81c5 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -26,8 +26,78 @@ allOf:
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
+                '^endpoint@([2-9]|[1-9a-f][0-9a-f]+)$': false
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
@@ -411,9 +481,37 @@ properties:
 
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


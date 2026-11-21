Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267241;
	b=iifwtKSeez6I5C66Frqk0+QqJFdigSN6cjvqQZZBB21TSKJFRM6sYFxL/OmQR0W9JEj1
	 Ai2950tAyopu6eGpSl9fA1nSsOFb6wIOH/yA/zQ04tWnpdzAgHvUD0C+c1fUyjQMV42JO
	 IRwup7I7lJ0Sua+8CJJI+xMpavOrDZsRStSDLk+ACwyghLsU81mdDdEt61RhagaMqX6tp
	 aFYy6rEb4YcEpIlNFbxh0DDuv01IKcF3G+hobnrX3SUN+4F+Ow990IXyK3lR/4CsnR5AB
	 AN6sJaLlDTeH4az+dRmSbFIPoEMOAjbXfORtFGqEJWwXugA+9nh6mFPzteQMbhTOebA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267241;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ev0BQgNOu8wMIz0Mz8ErSO+xcJwac6x7M9MmyhMsR3I=;
	b=BkTYABEiFBizs1a3k8qgdeJxlhZahOLEhF7jRJPMWhMOhE50mT+wTgwH//ecZcJQNv7H
	 CKmPZdoJcN0jQRmNR/In8NLfGUvGZjBeRS4Tn0fAbh3tuUEOjkXw6injy/4YBlx89Ak8/
	 LQK0sS9z3oPPqqYLUtAJF5NQ640Ae0j3JOEEyydRBkEKSUcqSqKFrMfAb8m5ePbzSWZrk
	 mxIE6xjdKi6fKbwW7oRvAkqKBNItcFlYdb0GLO68/5f4vkM48iGVnutVU/z0+1gUZ+2kK
	 klL7K/OkNbnsJxsrLk+lmU56uTIsiS28Xo8eLBhEwX2Ki5HMQ7+UtmDPj9jek7bUs6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=T4Wu5oKg;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9232C606A33A;
	Sat, 21 Nov 2026 13:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9232C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=T4Wu5oKg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=ev0BQgNOu8wMIz0Mz8ErSO+xcJwac6x7M9
	MmyhMsR3I=; b=T4Wu5oKgAjM+5a4vswvSYGkCH73tVFKUOh5v+1feWc054MGk9R
	7ubi8tLmc5lf31BAiiSp7iS9tOcQjiPF7jAvT9R0KvalV5AVVdwCNomXPxyHc3fu
	LnQBU/4eQO2G7aytsvqu95IjFOwoQ+MT2pGKt3GkUzPb3EPxPw4ATR2og=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.187.147])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCnKT6dmgFr9DfkAA--.3095S2;
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
Subject: [PATCH v11 0/3] usb: dwc3: support two connectors sharing one HS data bus
Date: Sat, 21 Nov 2026 21:20:26 +0800
Message-ID: <20261121132029.2379449-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121022104.1507987-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261121022104.1507987-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCnKT6dmgFr9DfkAA--.3095S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JrWxXFW5XF1xXrWkJw1UKFg_yoWxKrWfpF
	Z8ta1SyF1kJrWfAryxA3W8G34ruan3JrZxtFy8t34UAanxWayIqr93K3y5uFyUGF93Xa4a
	9FyDWa4UuFsrAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCY
	02Avz4vE14v_Xr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
	6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUy0edUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARESB2sAn9smxQBKsD

Two USB Type-C receptacles can share one High Speed D+/D- pair if a
multiplexer selects which of them drives the controller.  This series
describes that in the DWC3 binding, adds the endpoint-scoped role-switch
lookup the connectors need, and drives the shared data path from the DWC3
mode worker through the mux controller API.

No runtime testing is claimed for this version: the mux path has not been
exercised on hardware.  The series was reviewed statically and through the
gates listed below.

*** AI-assistance disclosure ***
This series was prepared with the help of an LLM coding assistant.  The
author reviewed every line, checked every quoted claim against the tree,
and ran the gates quoted below; the design decisions and any errors are the
author's.  Each patch repeats this disclosure in its own commit message.

Changes since v10

1) [Medium, on 3/3] "Should dwc3_role_mux_deselect() be called after the
   switch (dwc->current_dr_role) block tears down the active host or gadget
   instance?"

   Accepted.  Deselecting first moves the shared High Speed lines back to
   the mux' idle state while the host or gadget instance that owns them is
   still running.  dwc3_role_mux_deselect() is now called after that switch
   block, i.e. in the same order as __dwc3_set_mode() (host/gadget exit
   first, then the data path switch), and still after
   cancel_work_sync(&dwc->drd_work).

2) [Medium, on 1/3] "Does applying $ref: '#/$defs/hs-port'
   unconditionally to port@0 cause a dtbs_check regression for
   single-connector DWC3 nodes without mux-controls?"

   Accepted, for the shape that v10 posted.  Reproduced with the v10 schema
   bundle: a single-connector node that numbers its endpoint
   ("port@0/endpoint@0" with "reg" only) was rejected with
   "'usb-role-switch' is a required property" and "'mux-state' is a required
   property".  "port@0" keeps the generic graph port at the top level now;
   the two endpoints, their "usb-role-switch"/"mux-state" and the
   address/size cells are required by the "mux-controls" branch of "allOf"
   only, so single-connector controllers are described exactly as before.

   One half of the report did not reproduce: an unnumbered
   "port@0/endpoint" of a non-mux controller was not rejected by the v10
   schema either, because graph.yaml#/$defs/port-base does declare
   "endpoint".  Only the numbered-endpoint shape regressed; both shapes pass
   now.

3) [Low, on 1/3] "should the local $defs be dropped in favor of defining
   the endpoint schema under patternProperties for '^endpoint@[01]$', and
   can the Linux driver implementation details be removed from the
   binding?"

   Accepted.  The endpoint schema is inlined under "port@0" through
   patternProperties, the local "$defs" section and the "$ref" to it are
   gone, and the "mux-controls" branch no longer names driver functions: it
   only states what the device tree must contain.

4) [Low, on 1/3] "Does listing dr_mode in required reject DWC3 nodes with
   mux-controls that omit dr_mode to rely on the default 'otg' mode from
   usb-drd.yaml?"

   Accepted, and reproduced against the v10 schema bundle ("'dr_mode' is a
   required property").  "dr_mode" is no longer listed in "required"; it
   stays "const: otg" when present, so "host" and "peripheral" are still
   rejected.

5) Unchanged: 2/3 (usb: roles: look up role switches attached to a graph
   endpoint).  It got no review comment and is byte-identical to v10.

Known gaps (stated so that nobody has to guess)

- Which physical receptacle corresponds to mux state 0 and which to 1 is not
  proven on hardware yet; the board DTS therefore names them "Receptacle A"
  and "Receptacle B" and does not claim long/short edge.
- "gpio-mux" drives the select lines low in probe
  (devm_gpiod_get_array(dev, "mux", GPIOD_OUT_LOW)), so the level left by
  the firmware is not preserved.  "idle-state" is deliberately omitted: a
  non-AS_IS idle state would drive the wrong state between
  mux_control_deselect() and the following mux_control_select().  Making the
  probe keep the pin as is (GPIOD_ASIS) is a change to drivers/mux/gpio.c and
  affects the ~70 existing gpio-mux users, so it does not belong in this
  series; it needs a separate discussion with the mux maintainer.
- dtbs_check cannot see "idle-state" values: gpio-mux.yaml declares it
  without a type or bounds, so an out-of-range value is only rejected at
  probe time.  The gate below therefore does not claim coverage for it.
- The board DTS is not part of this posting: the Lenovo Legion Y700 Gen 4
  file is not upstream yet and is posted with its own board series.

Gate results (base: v7.4-rc3 = aebb7274476403040d582c61478df8f4a7bf9cd3)

  G1 apply       git apply --check + apply on a pristine check-out of the
                 base above: 3/3 clean, rc=0, no offset/fuzz; resulting
                 blobs snps,dwc3-common.yaml = 7a9cb5a115a6,
                 drd.c = 906cac4f3e6e
  G2 checkpatch  perl scripts/checkpatch.pl --strict --no-signoff --no-tree
                 1/3 0E/0W/0C (115 lines) ; 2/3 0E/0W/0C (63 lines)
                 3/3 0E/0W/0C (624 lines)
  G3 build       make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- W=1
                 drivers/usb/dwc3/ drivers/usb/roles/
                 (CONFIG_MULTIPLEXER=y, CONFIG_USB_ROLE_SWITCH=y)
                 rc=0, 0 warnings, 22 objects (21 dwc3 + 1 roles), all
                 aarch64 relocatables
  G4 binding     make ARCH=arm64 dt_binding_check   (no DT_SCHEMA_FILES)
                 rc=0, no diagnostics; 5420 example DTC [C]
  G5 dtbs_check  make ARCH=arm64 CHECK_DTBS=1 qcom/sm8250-mtp.dtb
                 qcom/sm8650-mtp.dtb qcom/sm8750-mtp.dtb qcom/sm8750-qrd.dtb
                 (no DT_SCHEMA_FILES)
                 patched: 4/4 DTC [C], 0 diagnostics
                 base:    4/4 DTC [C], 0 diagnostics  => 0 new
  G6 samples     dt-validate on the rebuilt schema bundle
                 positive, 0 complaints each:
                   two endpoints, opposite mux-state, dr_mode = "otg"
                   same, with dr_mode omitted (usb-drd.yaml default)
                   single connector, plain "port@0/endpoint", no mux
                   single connector, "port@0/endpoint@0" without role props
                 negatives, all rejected:
                   same mux-state on both endpoints
                   endpoint@1 missing
                   endpoint@1 without usb-role-switch/mux-state
                   mux-controls with dr_mode = "host"
                 control: the v10 schema bundle rejects the two shapes of
                 items 2 and 4 above, the v11 bundle accepts them.
  G7 hardware    not run

  On the command shapes: DT_SCHEMA_FILES is intentionally not used for
  dtbs_check.  It is passed to dt-validate as "-l", which only keeps schemas
  whose $id matches and that still select a node themselves;
  snps,dwc3-common.yaml is a fragment without "select:", so the run reports
  nothing and looks green.  The dtbs_check rule also ends with "|| true", so
  the result is read from the diagnostics in the output, not from the exit
  status.

Qianhui Xu (3):
  dt-bindings: usb: snps,dwc3: describe two connectors on one HS data
    bus
  usb: roles: look up role switches attached to a graph endpoint
  usb: dwc3: select the shared HS data bus with a mux controller

 .../devicetree/bindings/usb/snps,dwc3-common.yaml  |  99 ++++++
 drivers/usb/roles/class.c                          |  45 +++
 drivers/usb/dwc3/core.c                            | 116 +++++++
 drivers/usb/dwc3/core.h                            |  43 +++
 drivers/usb/dwc3/debugfs.c                         |   4 
 drivers/usb/dwc3/drd.c                             | 329 ++++++++++++++++++++
 6 files changed, 632 insertions(+), 4 deletions(-)

-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681639;
	b=iAVObOEsNhfbA8rL6HPCB/R/fDRIhME4LbqPwUs6aCHkq/JeNFE0p/LNaLc1fUM25Fxz
	 Gy8YsPV66PJAeKZdyNzw/HDpLhAvEvEMqW/yravfyyhTsHiKtOcmhNt2aNmvSTrQh7C1s
	 odl8aQRy6VCH4emYFNXR4kG+j2CHgcMvT0pqQyuWctwd6cK++rnhmfEFO7EkkmHbCGhqO
	 w0fVBXsPJgV8lCFo/ppFNHjQAuuIctDk4krwzaNzaxbUe/xYfc6RcDt00mkI2mgmPXYBf
	 w+IKrl96sQHQMpwUx0t9JAgjhc40QstT1AVD29H5QCwKIP8464sX4LreNiub5ScUh7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681639;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=UVP94qkra3NeZRByxo8XfGEpavoS46ZaTdo5vMtYzGw=;
	b=t+KgYqayiJ6LP9ZICtf2PkaNtA4CWo8+jB8NmSnZrslCwIU0cmN353aTDfZX5hvFtmHo
	 G4nq21QdzY0GbvcpLOBce1ZRGoQv6HGpOLcJilVh2z4JRPZwqjRZ7QieMjGDXqsf8mAz9
	 t9QwUntkWlYfhotr2yrgjQssEjpE3KMCTXCsIcUWIYHcOtTJFQlh/qq+ILzHzhxiw89YN
	 jYwH3A0kor/YbmS62+QA2bBYkSKOX8DHVPmrlHWFZBYNWfqCxHqJWNrEdF+wwvGe650CW
	 SuODxF0nDHeMtDiWyCCTiKD3M416LRDCoIKEpT4ZqOQ0iX9VKZDuVokTy/Cfc3A4I1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D731606A31C;
	Thu, 26 Nov 2026 08:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D731606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.207])
	by APP-03 (Coremail) with SMTP id rQCowABncJFW7QdrHy_WAQ--.21303S2;
	Thu, 26 Nov 2026 16:27:02 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Date: Thu, 26 Nov 2026 16:26:58 +0800
Subject: [PATCH v2] dt-bindings: usb: vialab,vl817: derive subnodes from
 usb-hub.yaml
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
Message-Id: <20261126-vl817-uneval-prop-v2-1-9640b58d37db@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0JmbUmnNVRceQ/DotRBxpDStNBoC
 HcXcO/yJe+/v0CiyJTgWiwQKXPi0W+gTgW43vonCX5sDEqqClGdRR4uaMTsKdtBhDgGURulybR
 OVx3CtguROn4fzXvz4zS3L3LTHtqNntM0xs9xmnH3/vUzCilQGydr3bVayhsnZ1NpXek8NOu6f
 gHgcSUaxgAAAA==
X-Change-ID: 20261124-vl817-uneval-prop-9723e7bc36f1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anand Moon <linux.amoon@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>, 
 Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: b4 0.15.0
X-CM-TRANSID:rQCowABncJFW7QdrHy_WAQ--.21303S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF1kuryDGrykuw4xArWUArb_yoW8Wr4xpF
	4akFsrK3Zxt342ga1v9F4xua1rJas8Ars7GrykXa1qga15Aan8Jws8K3s8WF4DWFWxuFW3
	CFWqkF15tws2kaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

Currently the binding for VL817, a USB hub chip, doesn't allow either
OF graph ports or attached devices to exist as subnodes.

Change the parent schema to usb-hub.yaml and set unevaluatedProperties
to false (instead of additionalProperties) to allow subnodes defined in
the hub schema, including OF graph ports and pattern-matched downstream
devices.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Changes in v2:
- Stop to deduplicate properties from usb-*.yaml.
- Squash the remaining 2 patches into one.
- Link to v1: https://patch.msgid.link/20261124-vl817-uneval-prop-v1-0-137c093fb300@iscas.ac.cn
---
 Documentation/devicetree/bindings/usb/vialab,vl817.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
index c815010ba9c2e..1900444bec31c 100644
--- a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
+++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Anand Moon <linux.amoon@gmail.com>
 
 allOf:
-  - $ref: usb-device.yaml#
+  - $ref: usb-hub.yaml#
 
 properties:
   compatible:
@@ -40,7 +40,7 @@ required:
   - vdd-supply
   - peer-hub
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261124-vl817-uneval-prop-9723e7bc36f1

Best regards,
--  
Icenowy Zheng <zhengxingda@iscas.ac.cn>


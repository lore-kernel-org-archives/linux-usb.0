Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509079;
	b=LkQgGdbpNWof/YuoyDsdQ26deS+lzVauG4EFzfw0kcbaleZXy5eMTwOBuXWdNUBa2Q3Z
	 swDDwN+KcqsDquOXEsdYx9IX4PB/6wKPEvNlAXGm0/Gb+KRj6qerLBPBf3rT5iXeDoEI1
	 6zBbaseBpNHzGqTWl85x9dMj0KJYyuvqo3zVLTpUDAKv5UBXJo57vCENEwdwXb+6dRUaW
	 iMTetawCTqLLX2HKiH2WAFPWUso5gnMwC2+qi2o2HXGJU4CuFLtzGmzwfpFZ/t6HX5Mdo
	 1xznWia56NABgtkBFsE2EQM9mTkZfgF+2M/thVrJyA8T1PRUkWJ81ISrdtVZ+aRRvWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509079;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=3cDtOgCJEhPH7LHLRH/7roU8vk/O+dXSXjSYqCx4oBI=;
	b=vEG5j/yx/P08bxB5lW/nVFzp/UrsraaPUKSxiMqoaaVmiYq8/nQTRWSXSmYtRVUhwf/U
	 EddKAuOzRC30TQB5Rnu30LdC2piE+yTvIjKqTa5O0fmQt6xr9ovJvj++4Sk5s0j7+JbAI
	 w9KgSePBoTUqonLh9jqGBv6Qqj9KxsFIaS2z9fXXFsPFaLAqmQ1RJs9uu6UifkUPh680M
	 /ElOTQ76FTjreXuvmNgTFx0mTntPG0gMHb49tt9kaDoeIgLMnxXm6abdOs47uYRp4WdTZ
	 sPQuiBNh6jcC0MK/I6MGlD8Yq7i3vJnbyg+b6msvVtT9aTiD2+SSEh9Iv23aNX3NX5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2610B606A337;
	Tue, 24 Nov 2026 08:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2610B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.97.139])
	by APP-01 (Coremail) with SMTP id qwCowADXAfxMSwVrIMuUAQ--.8971S4;
	Tue, 24 Nov 2026 16:31:10 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Date: Tue, 24 Nov 2026 16:31:02 +0800
Subject: [PATCH 2/3] dt-bindings: usb: vialab,vl817: derive from
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
Message-Id: <20261124-vl817-uneval-prop-v1-2-137c093fb300@iscas.ac.cn>
References: <20261124-vl817-uneval-prop-v1-0-137c093fb300@iscas.ac.cn>
In-Reply-To: <20261124-vl817-uneval-prop-v1-0-137c093fb300@iscas.ac.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anand Moon <linux.amoon@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>, 
 Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: b4 0.15.0
X-CM-TRANSID:qwCowADXAfxMSwVrIMuUAQ--.8971S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKw4kCFW3WryrtFykGryfZwb_yoWfurX_GF
	1kZF4kAa1kXF1Fqws5Ar4Ikr4Yvw13Kw18Z3W5CF1kAa4Sk34DK34vqw15Cw48Cr4xuFyf
	urn7tryqgFs2gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbkxFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXwA2048vs2IY02
	0Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
	ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUbH5lUUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

Currently the VL817 binding is derived from usb-device.yaml instead of
usb-hub.yaml, which lacks definitions of downstream subnodes.

Switch the parent to usb-hub.yaml to allow downstream OF graph ports and
attached fixed USB devices.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 Documentation/devicetree/bindings/usb/vialab,vl817.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
index d0484e48e319c..1900444bec31c 100644
--- a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
+++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Anand Moon <linux.amoon@gmail.com>
 
 allOf:
-  - $ref: usb-device.yaml#
+  - $ref: usb-hub.yaml#
 
 properties:
   compatible:

-- 
2.56.0


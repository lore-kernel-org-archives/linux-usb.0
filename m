Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509078;
	b=j3Sx6kWTBd4v18wY9SFYJSk9fViFtg+9MF8WhGh6668yqsrefbztuph2YB0Sz5nbdYZ8
	 3Rze/1Bawm4eEv4w2qfJCmP2V1LbgBSnyUhrZNivJde5rvvXPe1totM3ur5LCiaLzutVr
	 2v5zl+/mm+ve0Ip00zFb4XrrlV+HTLcWFh1qqGhQmmtfWTlDV2IwkPoFU39pYTcykScKI
	 mgvz+erQ4afQjeorToQcS0BO4JWxv3v19KLNOWEhosRcC0oXMrqeYHMMDuW3GsjkIa1n1
	 AcR5AU7PJ3ksr2jLsTxjF2Iz/0rsIK5+Whl5iK4vj2BSTLdI7NGDBQA4sCFtSwOovLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509078;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=DZPxfET/ECET9Ras0QnArOqCMjWkrvDngxRYB2wt8OA=;
	b=KmBB0iqqGanKERVAiFmEmmvUTt9Ter6veoo4Jw08Gtgfv2CcSASy+aFVITYVd+bMgA4C
	 bdBPDFPloTS/RPVk0laE3IFcg5S5mpqMR7hKyzWRCrRO1KIHECMcRq2GuYbssvN/g6mi1
	 cqAMlj1lg9m6TV1j51DTDKSLFUjGU6URW+sM7ZGmJXUPcfwxG+J4CeJ8sOA4kp9HGeFxq
	 0nDRtup09N0f3PzLg1i8OMj5sLt7jUiGKyZ/w4wte8Y8bhyVtqsEMY3iygQaUu/W2aj6i
	 r7RQxoJbSqzp0iRhvfhQ0dqCOSxvM6UReCoM2ttyq6En6b33A4biaF3xaQY1oKQqeIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCA5606A31E;
	Tue, 24 Nov 2026 08:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FCA5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.97.139])
	by APP-01 (Coremail) with SMTP id qwCowADXAfxMSwVrIMuUAQ--.8971S5;
	Tue, 24 Nov 2026 16:31:10 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Date: Tue, 24 Nov 2026 16:31:03 +0800
Subject: [PATCH 3/3] dt-bindings: usb: vialab,vl817: deduplicate properties
 in usb-hub.yaml
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
Message-Id: <20261124-vl817-uneval-prop-v1-3-137c093fb300@iscas.ac.cn>
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
X-CM-TRANSID:qwCowADXAfxMSwVrIMuUAQ--.8971S5
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4xCw48AFWDJFWkWw4Uurg_yoWDtFbEvF
	42yF1DAay8JFnY9ws7tr4IkFWYv3W7A34xu3W5Grs0ya4ak398Ga4vq345Cr18ZF4fuF1f
	u3s7trWDtan7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbPAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWwA2048vs2IY02
	0Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
	ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbpwZ7UUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

The reg and peer-hub properties are described in usb-hub.yaml (or its
parent, usb-device.yaml).

Remove definitions of them from the VL817 schema for deduplication.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 Documentation/devicetree/bindings/usb/vialab,vl817.yaml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
index 1900444bec31c..2f57eaa67c366 100644
--- a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
+++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
@@ -18,8 +18,6 @@ properties:
       - usb2109,2817
       - usb2109,817
 
-  reg: true
-
   reset-gpios:
     maxItems: 1
     description:
@@ -29,11 +27,6 @@ properties:
     description:
       phandle to the regulator that provides power to the hub.
 
-  peer-hub:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      phandle to the peer hub on the controller.
-
 required:
   - compatible
   - reg

-- 
2.56.0


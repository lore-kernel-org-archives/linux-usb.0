Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509083;
	b=AvFJoyx+VrMjLcd8VdjYANZCm5i7gM1jNbDJhif1NSPdLWBHF3jAPRq34xN0xfmou/SF
	 3K5FNouIDMlis0oiQXdOGU7rBNlVin4snYbSY2I0zyc/sgRffYhr93EH2Oxfe17WH7zOE
	 pTYe+Khjie8Poz+k2ypYFjXMH+ymFIBYtUAsAgHQAe82cRDhVgqcA1X5yv+WmuTixLN8X
	 s09VF8h9eIDOhHGgvgFy8jVCB4vJrbsW3JItqcufOS9aK3ObvBPf1a0OQXN9uacf+MjH2
	 IiuUepK9YyKbdfnFFK1cnYQprEshoDxHL2Qq2htxlpnXvr9WjAKU69sW7QXiAEnCHGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509083;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=PyOQ7agFmgchwGW01Vmu09lgY9FSjGwZGuG4/j5F0oc=;
	b=DROfqSM/TgLOF/mnngzMdEPx2kI/dt1wIZjxxXVT0yemU0MiS8IzVIyEknd9VdMklVi+
	 XdySE8Ty/oZRzr7dizl+G6Pgv9rufHqEqeaTTWpoeFozhDEidaqpdFyfvh7mE/EaFX0li
	 caFLoLZOdWoagtJhQJ9ctmvGjMI+Me4/vV0zLHIN1dxLoGtZXL4bEedfFtUWC5lqnbE7j
	 6BMgsX+5idCVrGvenN0Mi6SI4HbjZxOMC7sE0yyfskm8daIYtrgZDWklo+R+6Ps8pFBri
	 gSzgKpKzCchhJTQro6/+7+Ul68KfEGzGJGw1PCOtxnd6Kruvd4mCJkl2Hi3gD4AsfKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93F6606A330;
	Tue, 24 Nov 2026 08:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D93F6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.97.139])
	by APP-01 (Coremail) with SMTP id qwCowADXAfxMSwVrIMuUAQ--.8971S3;
	Tue, 24 Nov 2026 16:31:09 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Date: Tue, 24 Nov 2026 16:31:01 +0800
Subject: [PATCH 1/3] dt-bindings: usb: vialab,vl817: use
 unevaluatedProperties
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
Message-Id: <20261124-vl817-uneval-prop-v1-1-137c093fb300@iscas.ac.cn>
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
X-CM-TRANSID:qwCowADXAfxMSwVrIMuUAQ--.8971S3
X-Coremail-Antispam: 1UD129KBjvdXoWruFyxWr4rKFW5tF4fZFWkWFg_yoWfZFc_CF
	4kZF4UZFnYya4Fgws7CF4ftFWYy3W3Cw4kZw15JwnYk34I93yDK34vq3s8Cw1xur4ruFn3
	uws7tryDtan29jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbk8FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E
	0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67
	AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48I
	cxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxw
	CY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
	A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73
	UjIFyTuYvjfU8T5lUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

Currently the VL817 binding has additionalProperties set to false
instead of unevaluatedProperties, which disallows properties documented
in the parent schema.

Change it to unevaluatedProperties, which is the better practice for
derived schemas.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 Documentation/devicetree/bindings/usb/vialab,vl817.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
index c815010ba9c2e..d0484e48e319c 100644
--- a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
+++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
@@ -40,7 +40,7 @@ required:
   - vdd-supply
   - peer-hub
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509077;
	b=lhP+CFjC84IAJY4PDqupZgq3Iv4pHWYwp8cwG+MPm30DVF+N/ZZnyKP1E5zYdeYszXEV
	 yO+vyXIkkxqALnC/t9cDz9l2IGIYY1eCemgHU50gnPgJEeqDq57n06ck50KFmABapjGUH
	 rYfz5m0+fH5a3Qtapluw1CHWa2fXGKF5cuJUcL0wblj05ful1oNiPkT2tYCZWwspc/70E
	 fijXI6RY4CVBwEIIVDWm4NmYUxjHUSMRGeoiNWlkP7bMmh8aDiiP+UdeHnqc3yelfKHJD
	 N/4t4Foe/XT3kpjG8TTbE3OlVb09fHIFTXVn+xW4nhxxNBe4xmzEgluw9LakhEgIrXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509077;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=2xz/T8prMqoutxTNY6OUN5Had2FkyIhLtB2skS1UOVY=;
	b=2TQhuKtzO35Y0O5rNWaER0+RIsxf0ZeyNtyilRkhc3iB+6142sBVAn9H63QNn1Vh18uu
	 6VTN1q/UUJqx66b0e6IUSS3YIOQQqWEIvnD5ZnN0KBZRKKMrctsFkJ8fJ6DMMeFHSo154
	 VgeKkFYO7Nx3noGnbkRW6vpbUT61XG2/oe0T7OxNr54zbwtP1weHWSMiCnq2e0IA0Wh+i
	 3tWsLRoxHRS2IV69S4yqBKNN18xOf+ulMRhbqtIzvOnjVfP/h91LS5+ixkZ5jVD0tgvGl
	 8bPszHoKH+4a/faeSJEwcxhE+L/ayK03OdVuRpDEGV1qbqayfcNb+ilBWVoKwwqW/6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD6C606A321;
	Tue, 24 Nov 2026 08:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD6C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.97.139])
	by APP-01 (Coremail) with SMTP id qwCowADXAfxMSwVrIMuUAQ--.8971S2;
	Tue, 24 Nov 2026 16:31:09 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 0/3] dt-bindings: usb: vialab,vl817: reparent to
 usb-hub.yaml
Date: Tue, 24 Nov 2026 16:31:00 +0800
Message-Id: <20261124-vl817-uneval-prop-v1-0-137c093fb300@iscas.ac.cn>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDvgJMXYXqW40HTUKRJDokEQ7
 26qy7f4f4fIQTjCu9ghcJIos8ugRwF2bN3AKN9sUKWqiNQT01STwdVxaif0Yfb4Mkqz6ayueoL
 c+cC9bNfz09yOa/dju/xHcBwniix9rHUAAAA=
X-Change-ID: 20261124-vl817-uneval-prop-9723e7bc36f1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anand Moon <linux.amoon@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>, 
 Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: b4 0.15.0
X-CM-TRANSID:qwCowADXAfxMSwVrIMuUAQ--.8971S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw48Jw1rZw1kCr47Zw4xZwb_yoWkXwc_ua
	ykAFn5Aw4qv3Wvk39xCF4Skr4DG345G3W8Zw15K3WUKr9Fywnru34qq3y3ur1xXan3WFyx
	uwn2yr95Ka1S9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

Currently the VL817 schema is derived from usb-device.yaml despite it's
a USB hub (even a SS hub with a HS peer). In addition, it still sets
additionalProperties to false, which isn't the standard practice now of
derived schemas.

Both problems lead to rejection of downstream nodes, either OF graph
ports or directly attached downstream devices.

This patchset tries to fix these problem by setting
unevaluatedProperties, set allOf schema to usb-hub.yaml and remove
duplicated properties' description.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Icenowy Zheng (3):
      dt-bindings: usb: vialab,vl817: use unevaluatedProperties
      dt-bindings: usb: vialab,vl817: derive from usb-hub.yaml
      dt-bindings: usb: vialab,vl817: deduplicate properties in usb-hub.yaml

 Documentation/devicetree/bindings/usb/vialab,vl817.yaml | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261124-vl817-uneval-prop-9723e7bc36f1

Best regards,
--  
Icenowy Zheng <zhengxingda@iscas.ac.cn>


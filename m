Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.6.4.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076124;
	b=W2XzDErKkLY4gWnJQlO1RKuvJAU2cJdn62sdh9Q+Jz8N3BfhvUMOmMf/6ZCYREHLKs4P
	 gY8ipzt58YmjbIDCxV0+OADWmZ3GHWhcwlx0cfzhpP/88ZKKdT1LdykaCcLjfLAgh7Y6E
	 5j4/m4vIytSkUCpU1Cj/i1duzhufHmChPgq75BAXQz0K7Q5o5Rir+foKn641yRNCCI3Gl
	 +W8qYRv8lV27lTush+Di3Cihj29GVSjWqDoQSES3a/cln9jPn8aEEwo5qEBBx6hfIrYWK
	 /UF+NfM157lB6jjdsAPm7KVcObuO81SUrGZyyxGQjXdmoYGRs3nLwgnE6C2jhaw5hOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076124;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=PfMvdnhdeogIiO1WmdL45eNHWMcCOvoX8KJZ6bMV1Mg=;
	b=qpgZSZDFiQF0zm+g6l0PFND+IbnbW7JzpIbYtNip6AXAb0s8Kl7Gf7yFMnpD8SRoBgoD
	 YXMfvK7SKqjq8PmYnHuDSNcQJ1Py50E1NWbQoHHwi9STI3xbAHKkrz4Gd0JV+9YTyHFkD
	 u7J8VEW4wcZQfAnz1/lPqYpedm203ibLBS43IEIjczT10eq+EGa/e7wmFpYZ7SQWu6Ope
	 52XLdA5dpDZdLKe75Ty66judCrIQ80bejgUlpTOYHNJVpF4egIXowHyodK5f/uHh2Mbq7
	 ZmUwOB50sSNeqHswG1tlD8vhfmHaVE1BhbdLyf/2rzSpZKKVAfR91XhJYyYmQw918Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=jDdk1o2c;
	arc=none smtp.remote-ip=101.6.4.71
Received: from tsinghua.edu.cn (smtp47.tsinghua.edu.cn [101.6.4.71])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D10E60A2638;
	Thu, 19 Nov 2026 08:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D10E60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=jDdk1o2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PfMvdnhdeogIiO1WmdL45eNHWMcCOvoX8KJZ6bMV1Mg=; b=jDdk1o2c0ScQp
	c0eE/FReFR4+2cFplHU82F5WuKstNL5jgNUE5c4ba7YUuWqEhrdNP7o4jT1z1LuH
	H0n4Wp1PLcULOdfpTRNldC6RkQZ9FbmTH7e00ksVRTtAJH69mlNdy/dvKrYroeFd
	i1uUrRpl63rlHz+1VzeBw0esjJFJJ0=
Received: from 15.eml (unknown [58.206.202.11])
	by web4 (Coremail) with SMTP id ywQGZQD3swEMsP5q47whAg--.22637S2;
	Thu, 19 Nov 2026 16:15:08 +0800 (CST)
From: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, wanghr2026@mail.zgclab.edu.cn
Subject: [PATCH] usb: dwc3: meson: g12a: disable vbus on removal
Date: Thu, 19 Nov 2026 16:15:09 +0800
Message-ID: <1795076109480-15-f562c8e5@mail.zgclab.edu.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ywQGZQD3swEMsP5q47whAg--.22637S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF18Xr1DurWDJw4DtF4kCrg_yoWkKFgEk3
	Z8Xr4kAw13AFsrKw17AFySvFWjga48XrW8Zan5tw1fKFy0kr45ZF40vr98Arn8Z3yUuF9r
	W3yUAFn3Cw4j9jkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbmkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1ln4kS14v26r1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5Mc
	Ij6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0
	x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxV
	WUtVW8ZwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjtEf5UUUUU==
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQMQD2r+rmUDOwAFs-

dwc3_meson_g12a_probe() enables the vbus regulator, but the remove path
neither disables it nor runs the suspend callback (pm_runtime_disable +
pm_runtime_set_suspended short-circuits it), so VBUS stays powered after
the driver is detached. The probe error path already unwinds the regulator,
so this is simply the missing remove-side counterpart: the USB port keeps
supplying 5V to an attached device even after the glue driver is unbound.

Disable vbus in the remove path to match probe.

Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Fixes: c99993376f72 ("usb: dwc3: Add Amlogic G12A DWC3 glue")
---

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index ca07e813fd64..4d68b50722e7 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -847,6 +847,9 @@ static void dwc3_meson_g12a_remove(struct platform_device *pdev)
 		phy_exit(priv->phys[i]);
 	}
 
+	if (priv->vbus)
+		regulator_disable(priv->vbus);
+
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);

---

The vulnerability was found by static analysis.


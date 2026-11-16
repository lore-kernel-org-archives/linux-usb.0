Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864464;
	b=u5V8g2DsAQxoQu0NtlsR6eiHLMeQ9gok4Vmhkow5D40ettUIepmYXcm6mzMuhTvtKy8r
	 NiLQj/eQZ/2JApvtHeucEPY3CfWaAQAjOAAcAYmPthQWRujHI8ntKoZSSJfHUnV/8VbZy
	 rNuXEJpzObC7n/6c9lxuQOdKznSGdAv1bMDQHDhm8pYCwXEJ20efs3BKsjqiLQREil3E3
	 gUKhyatgGruEzqPu9WcDC1NEUa5ace8VNDTr/caTY7gCLdgCVsOzLWclHL4fjuP0b+by4
	 1rZ558UKxOmoM5h+Spu/CaPNkQXGfhVXntgfXpuFfixgKUkt98mDI2LRqojPKVirgKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
	b=p3jnjk7xpaJytM6Ofbhpzg8qG6OyCSE2qRVCAbhkyAuWqOcC8egrcQATr4aIAU+9Q84l
	 BjcQZS0np/6wFlrdrdCtZ+28M0+6NBhlIeDhLjwo3GJ4/IUgakDFHU48B8azPI+ZthLk5
	 J/G32uHaW+rWUmvtWPxgoHwFn8mz5nV1tYnkOSGykLVLlB7lmTBDCLAfugqK5Ko39YRZR
	 47DfttPDJtT0oM6dGoFWsZNjTpIoAFXAWa7oaM5KBlByO+F3S6YM2JtDILR8IpE8Dzf1Y
	 5bwDYYajHUGT8fQIRZjOT55RYR95w/dcYuTd0CoYyyxFATj8WRskRqzgu591hF6Xv+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jfokKnjC;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5CA606A334
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 21:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F5CA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jfokKnjC
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49412eb1474so2016078f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864463; x=1795469263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=jfokKnjCoBhGXval+BtxxMIEBcJuEILgvyGX7VwyLu6Emt86PG0cHN8zHavEn/go1l
         JnXO60BdmcgsdTFaKXKwOqVgTgnKxvxwuDZdga2JS6GdbOlVDW2WSZOvNyIBuw0tf4Qv
         RAvGWInSs/2O0ObHsKhseNZU76QAiuroYJMR8Mfw6u/mKdWrlCyyVnQXsOqyb/6w+Z0i
         Yg0nO/MHmkz/gLvmULkydyzWvLIWSx2UfOxq9KIjYxFsMAxV32ihPcPbvWf7DuMidRCi
         vSW74NEJbetjLwGeeuNOhALF8E+VDVV0qaT8Cg41pI24K0Mkon/0zMakEo/amjlR1J/B
         S9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864463; x=1795469263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=d0828emV4yvAmcWJKnczp+fndtwPdlF5QGScYct+2Kv17BW+WFOHijUdvzGr49dnYp
         1/+ivJQfr+CyCdn57QH8IbQyZppWMZ1/LF810/WP8vuH42lMz9B3CsjU8X4q9AIbOdiX
         P70kRI4k/B5p72dvG83n1iAJwNuOtOxCkxM7LyPuCgzBOoLjEO+1AYCnYz/XVdbUDjlg
         GKlQO19yFr3SlsfHuQenTbZ7fce0VtSfVUVYwGEd1SxvtX81RZKibycMsngizMMc0vs2
         YTHUAVNvmij14tWfiIzuhigyKYHHYxTL1ymxaljb8/QsEqYF27Uw++hHkVU09ROTL+bI
         x5iA==
X-Forwarded-Encrypted: i=1; AL+hErHNFK34a3ZxMAggMZO+443PpxxSPfvUEX3trMkKvczLlyzaUmDi2STSbR2WIJq1flXtAXpn7OebUo8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QmM0mENYUGNLvfRJxLBDsaouTFu04vGQZEw6vlXlZBDD/z1rW
	rWA05naaQpjOhzjxDJTGhzBInTdr7LEp7xDL3q5v6ZqK3kptlqR0vLx2
X-Gm-Gg: AZFdTZe/5xSU7yhO0pYTU9eMocI0n3lpUer3j2RnuuAxuQAm6XZ4WPPX9DvRuTcjqj0
	IuPBfalPkMFdK6fshSXj1ZKi/iKsplGGqGCu/zm8ocb6ZbeEMbjCqEoAlvUzVjyDozLMRrt5AKu
	zKuYGLCpG0Jq+6ic7dsV6QQ+iKWpoCIIzXWmVBk/qmUh/WLnleekdhw26aXOv/F1s91Gqrk/KDz
	4w/FcOn7+T9ZyAbVJevJDn//+jkpFHxtOw3dP9Lg6aK9LAYcPnR/jW6Nv2+uabfUrEH8GFBor2C
	ifUJlgZn3Nu3Ysc7zZ1rE29VAqFD26xXYgznaw9EKnpSJDA6ETYUoFebSFM1xAktj1OUult+MJN
	sZl0S5Z9Va+AYzsaq2yuU93g83J+HNubZnaKZ249DIX3rUn+6zv98K+ykphSYcPAm36+RBnN1aI
	TDVtNNNPDD9TznS798ij981p3jDfQB1VLwm1Gae/v1SyuBPY46y/astG3iCxBsUyXRfqm8Fr1SB
	onLf2CMHo5vKjqUOH5ORtG4IthFihCNQOknJ/9R+xrOLbK/AGXS/k/7bG4zfHtq6JcubFS9OC59
	AKnpX04hlhxqQsxkDpWqW3+B8bOp7mg8xJyyJuvC
X-Received: by 2002:a05:6000:438a:b0:491:36b3:22c with SMTP id ffacd0b85a97d-49c6e68dc41mr30686056f8f.1.1794864462819;
        Mon, 16 Nov 2026 13:27:42 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:41 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:27 +0000
Subject: [PATCH v2 11/16] dt-bindings: firmware: qcom,scm: Document
 Halliday SCM
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
Message-Id: <20261116-halliday-dts-v2-11-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1106;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=OQO+LwEeY64jVYcmV4r5bBUUpcSQt6/n4JPVT4Z/sxw=;
 b=lNijzEKQlyljkWzaxIS9zrys8uC5qiwJ2YpuyG3Kr+5tC+QMb+R4Db6kOwLBwj0GYnOv/QX+7
 5U/HlbRtrBQBhLGehnhSLzxDVWEhcpke2OLw7yIeYTlC6a6mrQFU5kI
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SCM on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54b00..fb3da66443ed 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,scm-apq8084
           - qcom,scm-eliza
           - qcom,scm-glymur
+          - qcom,scm-halliday
           - qcom,scm-hawi
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
@@ -225,6 +226,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-eliza
+                - qcom,scm-halliday
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
                 - qcom,scm-maili

-- 
2.55.0


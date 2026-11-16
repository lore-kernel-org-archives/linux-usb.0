Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864457;
	b=ZWCTnqBcb/zfsFqh4gQZQuvgvMfz2N4ol0giC6Mk12iOMHmRFlfLkkQWtY+mC1JR3Xf+
	 wzoijD+DCJpr3oUViAgWlY43rxnlB85hV+IOrBc6bpEEgAM7N5EJje33HbAtO54Yqf+Hl
	 WkgOpnz9PEgsRhpRTTfmsbL2Qr/Yvwp94EXpUGkb9aa2KS7Q3nTyhYM4mNmYUWdL061/h
	 gIqeHYWYiiqOP7H4vVzgjcxFT8s0qzrZOteulM51AYzgMzbaWCvWV/GXIlo+AsredtRFj
	 Q3n5zobbFZRCJETT+GZreLTCRI7xxCUh8EWp8uekC8o0+Ow0t2eeAbnClULshX6xTgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
	b=KfMcBXRrQibwUhp1sBaYzIPG+AxhiPzy7r57WLFR+YinqQQuuaJe/b/5holoNEqimXzG
	 /LA9tjwIvUHCD6oIPG2DFzx3djS0wov0j8WL0VWHAoDPRUUOwGEKa8ZeYh+f6a69GMbaL
	 uUFaSeXQUjAfDCh3SvBAlg5Lwj9onYKJbtpv7ScwXdIqrOA6mMHxZpWFSlZ8jp58qte7U
	 UQS7cEfv8OFapiTqRF7hp9YgkqVon4EFHJXsDS6W5NpzMUDmPDtPiqm5hBc0eeMxvG30C
	 FwmopmmibkwhbQzmqtSv05NxU5/VxLTHRXKFyO/QXWGM6AzSkFKYdfgJwSksmYAUIoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aEwrHomr;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E90D606A322
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 21:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E90D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aEwrHomr
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490585eddfcso2811521f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864456; x=1795469256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=aEwrHomrXoLkAiILddo3V8DFgxCuIXh9nv9z9CGp99Mvv9q7rqS8WWfJjEVZyPKHzl
         BJcrzkqstHqVy4gz1/y4oTWYkRx+2g14yun07x+dBnVAXWbxJ6Pi8XR06lfkxtBvqCY9
         iLfFme7fheT+0AavzMAdfuk0LNIbBb4A/fuWyckPSLx8IQoPwrMmA2E7Ut++Patm8fWZ
         5Z3yyawCVkfdeHckJNnYoaWNHRgUbs68NL4nZXkxamHwG2zmOimO4uoTqxyi0KJ8H74v
         KgRMh5LPcsoko2D3/7aPeGtRlw0wksD9UiL+6PyQMe8GGRsHDiMrNoZmXU6ZdSAHjYHb
         hHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864456; x=1795469256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=23aJYURdmc50M3sz+0IPoJy6hsN4zsGWQS8DqkfgyCtqh5htXH8cy6cp1N1N7H5oTh
         NeWEmCFHzukAMJcSNoEkAv7z315cyKZ50Eu8MvuhNTqv2/UxL6Uzu1l+H5A27VHuv6cA
         I53YAzmywTnzcLHrapo95wxTzlcn7wWSjj1eF0xa3z9W7hJBZOjORmNsPmXop3C3lXWT
         jhHh2QD1NXvCmfRpqavsayIiDqZwe9V4oxp0y/A6VkB9mzO+9lseOoK7a4X0kHgHINB5
         M6YyELgPloXJBeUQ2qbNYCvkBfJmQPwcZx87zyOUTHen8RoqozN0In0rKi3VpGZBTxMA
         cOMQ==
X-Forwarded-Encrypted: i=1; AL+hErGIeI68nxnDMoG6aci6vfUPOYxCsUJKTXSgGOod13Rfp7zibk/5h2EAd4nYi60mu/3MbkWJfurPrcQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Gk+HUV7rVhm3jyw54aPrPOITpDji/ZjMuPsTbHyPeegzN4vlg
	TEqzoVnyViHsZN7j3/ZWJQsC/z1/jAn0UNx2hA89dnPJ+ARIQuyQAlra
X-Gm-Gg: AZFdTZdyvHErpvEc4KiRex5Aacv8cxlDWRFryVSoDqPGBO/Mvcx+5iK2taB5bNPVJsv
	7C9Mw3lAt+V4DFvBCivVQ34C4NY0X2ooYve1Io6OzoROgJGJ5yzqeCipyxQEWYujjUxdUGMBwrv
	bEa07AXrjg5AMaHJW1fQT3FqlFdlEmGDDuC0jA6hMgzCvsNyksP+R0M57p5GAXJQqgk/YytnjUq
	xaf44YiL8Y1w6BZdq/pcjOhL/StwGWGUR0SGH13VMPKtZFgXdXw1NVqODCFdOXcIRI8hMsoKNfg
	HA9ps+vfycnqnt+hjbDnCa5F37/mpmNsef2T089/872+XfDd+yg25N78mt0GE2nGpfAQEiRkwXq
	Y3vVCf3bqkeOSK271EGDMG1mYc+lwHxhYVBocVon3bVVDeJGRUfRv1lWw9aOQOMg6F3YNAAm4Ho
	opA/yfSHVcxNOrSZgMC5oHPTTcHrZt0Wnwpa6/+/DSe4JKmmvV4W7G5knzL1FyBvP3LjvnhHdA9
	kSB3xECPoUMat2sbLn4QGCOKSI9xBZPK4++jU3BQVTjEVBQrvaUml3RF8tENmy5BSCkcOQ1wQK4
	tDY/rfIb5Lu68026OboHIhkACgcPMFG88u3/zKEK
X-Received: by 2002:a05:6000:25ee:b0:490:b23b:802d with SMTP id ffacd0b85a97d-49c71d475ddmr22315194f8f.37.1794864455894;
        Mon, 16 Nov 2026 13:27:35 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:26 +0000
Subject: [PATCH v2 10/16] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
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
Message-Id: <20261116-halliday-dts-v2-10-2c92438c6c46@gmail.com>
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
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=829;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QaX1Uqhi9JFBTyniSmrOqgkrx65fb+cn/pSnBpltl3Q=;
 b=9cBm/5Mi8IeF1ejOwJZWQD4SfyJ7BWDjVcE5y5kBsTodKh6u91I9h5To2Rc8ArYF4KPYJAO96
 griT0U/fTv6BDQooM53jxYIwB3vuzMj024ajCLGGuHNM9Pf4WE6Noed
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..3b440f395fe8 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -57,6 +57,7 @@ properties:
           - enum:
               - qcom,eliza-tsens
               - qcom,glymur-tsens
+              - qcom,halliday-tsens
               - qcom,hawi-tsens
               - qcom,kaanapali-tsens
               - qcom,maili-tsens

-- 
2.55.0


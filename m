Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184431;
	b=wsxEqb/lsUGdl/C3I0O5vG3V3lWV+w8mYBq3xyNhgIT1xGwXzQxROW6HTOZPSgC6IJmA
	 0UdxnvWXJUKDReCbl43pW7OAWczxU4+Hlzkx4uHZNYd7hEgx7t+n1A3Dm8B368kchyUVd
	 CTsShXdBePJkZtIbTSJq38O8NpadpIWzLd+4KVP0/2RWNneJ9iq+q6yCcAbvqxDj3wyZY
	 FPWvOZzxP3W7WKBBT0FQS8APGITezQFROpuLvHXHS8df1AfKlvdGlEE2WusN27+lzXTQp
	 bCqrEgY4ys/XgIO6pNGTd8tmzGrx2EeWGhYF0z5KMqPDN4DPAOfN/AYVjrd+mDT8JIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
	b=13Zl8lLZ4QqtGEN37sV1DKevw+2Rse+Q1l1QwMWYnQkk3HlISQi2+AGUJ31ZR3ke4OM6
	 JgTAHKgF482d1B3t3Tyw6PVCAl6LqOqsFOwc6xMfH9jcpc4ofI1pkQlDZ481IoCsRfaQJ
	 ixECRhutLIfx1wDfiHJM+qG+sBJpGGtEKKc6F533cZnih7yP4zabi8tyYeVEp5zOV19h9
	 Ipe5P0fVeP9cl9jbr4cr1vQSxjVKfzTrMN3Z1zpof8NyiuP0PgqN/AEaLqwes02ByL1UG
	 +UsvJcz420uDsogEBQRpsje7PMUERAxXBJGZHPYGXZvZMut6kcJ+n7W6ThYdc0NyKfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqATGSDg;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AF4606D80E
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 00:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79AF4606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqATGSDg
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso224054f8f.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 16:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184430; x=1794789230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=mqATGSDgOcyspCGm0r88zz2LKvOBuTSrflTy4G3x+OmZ3/e6m92wx8lwDFbkWU/2r7
         wF4RvcborS48J1HQFsH7E7pQgiQNwsPdfK59/AT1PhF1G8mvFKr+CfuUUZqZjulYaEup
         ouJz/e8/k/DLsRowKga8BFqAZDnPgMt29Cmqfeh1kSkF5wRiiYm0/AlufG1QlkuycLwj
         rEpBeHEkXJziqZintgY94/c64b0LNVR31luc5/F2R95zuMihuSOw0tSRvV08J2itGF5Q
         e6yNkFjWR7cidQVwBnB5dheZp9Tw2HuJb8BECeTsjwwMmrbGM5Ib9dRsZdyiCb151RhX
         5M/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184430; x=1794789230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=ZFkKFOAy1K6ktGiF/G5uG0NELblxYkTaYw4e+ZiRyj9L1xd2IlrOa71fcx7p0rkGH4
         +cbJffJuNKUdTuu29/tM6TzeXy/Pl47pynwVYOqBrMn3edeNZAaWewEHNse5gjf1iaXC
         jD9rDRhbmGf36T+kJZmDyaaR5utrD8KvE3mNMLpXjSyF1hMcoloEhnp/iPam9l+Upxro
         BIHv/PngJK4yJSVVyoxg4CH9jlr9Oo9pOyKxcJPN1kUJ5lNLtaQIXf5h5BowLDI7AWwi
         PU61l3igUhMQy9F/0AUIqOiZhbM5aGJseQbQpEaUkBpCCgwr5lcEpmCnICaFXCsuzLcl
         1iCw==
X-Forwarded-Encrypted: i=1; AL+hErEA+EvzJD1I4i5EaY8idkf7kucZcp5YiRUE19kUAxf5FVqdFk62u7280akykmaBZ2hQSBeqvhLhbjs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uQ4LwTUWxeOfXdFpWHR8MfA0Feab6cKzLmeD5xYkhtEAS1xoJ
	63Kjbd5R4uNOHxm25vMfYs5z5shK9hQqSIvqxSdOMiiy3GO/wt9KMGuG
X-Gm-Gg: AYBFou2nL2+cv79Ocuq5KIoXO30LYlUELtlMHDbSoka9sP1FotnAHc9KcKnlssww/Z0
	CS+6HEcsuxTQha2mkhPYK3TgHlDWG+msW7SqKkdfPz7UQMGyL5zbAQo2a2GMQ8NF1A6jOywNHNE
	OnAX+yRk7krZtSOzkPYftAxx0ZmdY8LEC9UfIHvLl3vDij0ZjtEW0VjMh6D1rMy8aXabCorXbJr
	NsEuTne2gUKMahPiRzSgO2mw7cq875dr1n0FazcRYg7VDMzjrn4vNaYwxMjpbREHmKVTmAm48s8
	kUG4RgCf6Fy7imtk/y7sPEqW6lfZUDJdHjXs3qlYdinntjq+DOcXCxJz1xZaxfqa4+Ia9sA2ZmR
	XHtVkjbj0/6xckNRuJvKJEKI2Bx0iVG7dJQNN7KxfawMmij26RzrImpRt/aeXlsLH0TGnF73K2d
	7kJwC51XjdrWD3hGa04sm/5jvFm3RxtkLf5+pnkU/0mCq0AQnb7pmOkUZPA8SYABWqfKKuBKmED
	dteubsFeDyvh+jfpU4YoNFRl67zQLKfARPWeZWPJSZNT+m1iD+pRwZjGwlaFT/hFPxaYe+i2UeU
	v7IjsWSSg3p/cBryZZczpaQ4+5Ni0CPMjjV6QuiB
X-Received: by 2002:a7b:c34c:0:b0:4a5:9224:fa10 with SMTP id 5b1f17b1804b1-4b8205a7b74mr74612065e9.18.1794184430004;
        Sun, 08 Nov 2026 16:33:50 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:49 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:17 +0000
Subject: [PATCH 05/17] dt-bindings: mfd: qcom,tcsr: Add Halliday TCSR
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
Message-Id: <20261109-halliday-dts-v1-5-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=720;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=sz0jgm6yJ2qfmdfMMgsqR7Wg9ExS4UZymLewfvVCvH0=;
 b=uUjeKsqz31kCcfPZSa8Z47M4B7r1CADYAoSad8joeZDRvAbLwLDkhf9ZDymLvxVoerAVE+UqI
 g/farVtv7C7AYkuFx6U6v9lz+2+4yx0RS/OmA8jjU0ljraJ4I1qJLhy
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the TCSR block on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index a021e4dea486..e8a681b5e6ad 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,halliday-tcsr
           - qcom,hawi-tcsr
           - qcom,maili-tcsr
           - qcom,msm8976-tcsr

-- 
2.55.0


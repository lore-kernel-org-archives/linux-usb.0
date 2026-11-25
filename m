Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578267;
	b=25RcXaynSiBBgfe7eLxqmrQY8b9MXvD3Fgl5cwS1qQKmYubSmmSC5hVXAZUZF1044fqD
	 d9bAasy2/S1isvNl3dffXeGDcY2kABD6iYqvCBJJS5/EDVKzbb1JrMqRdEc995DpCQHFq
	 6VoaOpO6wOouZ9zyWHxdlpjr4y4dWntYtTqvWIhtDRKyYAjoAXw1rDmZlYhjkLu1iy+vo
	 4IW+G12/Pr7TTUTsa57GUJjX7PojpSnUkrDOWT4ByJEkXPcSgBx21SPidDuqPELbKDk1K
	 9+g87DNA1P6lcSTOdunnld+rBWHwnFmZ9d6wlULB/KZSF5by/tmrJ5GAm/hzifKtsRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
	b=B+ETf9hfCAbWppB8y2nJd/2213KynExickfCR3jFum1kODQqKEAfPzoDrGXsd66dJRtb
	 fRzZLacm7FI/fHyouCzHJcCcD9mx8pjKU44oqSEou0AugFGS+ho/p02wLUkNFKPBqKJDj
	 ktOE6ZxdRsDRTkEwX+IyZzc4vDRmtxvfR7N+2m7rJ6Zx6rVmfShXh1ziMmlvQXGdk3Rs0
	 wbi+erDIZ8IauoDgQLu/YA9S+co1KzVHfxR7ryTexZr1QxDEYfqu5+Fsy3wYXu7BLpUfM
	 5WT4m/29iaq/hUiXE4vAK0sAeDO5Pq3dtjzk8yX/57HohxfWh0J+SJoMTqyWT0ni4ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SufE44Nf;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF0E606A327
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 03:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDF0E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SufE44Nf
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so30184755e9.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 19:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578265; x=1796183065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=SufE44Nf0iNE9uoja8l5aVwkLELQGBnnQSJnkwjjhyh+2xNjpXzsAoozPYmtygloR8
         XCTUXFjT3+t29S/3sDK7LcWZlA16n33y9wijZwHX6Ju80HJAddDGn4X7BJuoxGfZyLYj
         hkVfLXm4ntm+nwjdWfyzsw22laugJbD+VlTiUS51WFqjYW+ZG6kVM4gFIN/QsaW+Y1fC
         aAU1Ie+c77crPXv7rlxquXOEpdq5iUcbk9Bw/fQXVPCbH8V6mcT5VSFCrAHpkFwLMwqW
         r+ANRdiqb4fabO9ULg0rSB9NuToAJUGV4l4allUCaSpFyElERTRBJNdlXqDf8UMAlmtw
         OvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578265; x=1796183065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=TqZFVoM7OWcUFESQe7ePwghL33YTFcfbrPOPHRAqd1jVcb+BC9KafWitLJ6OrR2dWT
         J/wo5qvP92429732PHSTMpYjLjyHCSNeBehz3/HC/PRZZs1A1eehgBcBkCPN5Ix3nJfj
         ATJ8I2YFBXkuA1YXXBzNVy+xspu3vrFAuFLQAxQCUGyj10gTaL1AM7fnFJMAnDDEUw4v
         4N5J/5K9fqWGpNQyF74sDAb3QrRGIYPKAJXU25FEIRDncEI98tYn4lNagYVH6i3u6S5d
         /H9AZ3WVJ+URrTzzg6hxOROjKXJ0MJNKKnTkundFCgjwY4Q6o8bDzOtIcXqgS8Fi1r20
         2evA==
X-Forwarded-Encrypted: i=1; AL+hErE89PpYI4Ca04Wc2/gvLCeUsL5ogGS2CyMTXUYrry7g1M76NfFIYuK8N8GfUqiv61Owgw1DY8wFKbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/utnAbiB9un5IGL5vX9AoApCnSgT577fmdSoele/bZUaCmT4BB
	hc8B3qbMQ9pXVmIFXnLAq4i5WFIhNFsuaxwe+ssqCQRwTo+aIgf5Mttu
X-Gm-Gg: AZFdTZf+pChGVEETmoFI8tYTLyvvEbyuzJ4DL/0hXS0RpnOX4RD0dKex95ZEH3wUVvR
	g/WNfhtMw6W6hIf2dWHM+RKeuUCEAlZaI4CHYIe5UOBjg7iHrC2nbKMMHPFlvaBefZy3Zr//cmV
	nfJEoOHWMIkNuNmF5Ndk6NeqRn5zsgbXhLTb2X3WhDoZdHkEhzQEgpD78wWa3dp5wwOPiPDHN03
	RLxbXnUy2kVL8/h407J1e8b1zIMa/OpxqjUz2dIuWq3Gfc03ArsetzR2d/1j0WVw6KV3Jmzl+l7
	nGhwKELfsUd0pbZYOGk/qfgCzn7qjXJUxthynPxZIYwQJT1uJasBcC9jUZH/Zf1d4crRsYQoAH/
	dfmvZNZxcXxRBhL/+l86vtl+L+URh4umQUsA70BI4FgWs2EAXUGNq5D/uA6b5JCp7tPgz4zDkRm
	MYOxDysvxBlcZArxlN2kIWhJtYtR5DL+Z6FNzQhJJ1sXN6mEe/2EdD8P8JuVAZ79NZ2S1tmx0+W
	nFmQXgu/24NbGOdkaP76lRqKi+CSZClA844Ui015rXbzYqwvVaiLcowOP13Qur8hUEIeeCuMWqu
	SzJDCDhfwlP5/2vKxbQamn07cU6m5nK63Ek8htM=
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb88922df3mr314413945e9.12.1795578265228;
        Tue, 24 Nov 2026 19:44:25 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:24 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:06 +0000
Subject: [PATCH v3 10/14] dt-bindings: firmware: qcom,scm: Document
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
Message-Id: <20261125-halliday-dts-v3-10-5c8311c0b70b@gmail.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1106;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=OQO+LwEeY64jVYcmV4r5bBUUpcSQt6/n4JPVT4Z/sxw=;
 b=ASSSZ1iPRbCJcDXI+svsrzgQJoNbt/i5IYWaxMLqGZRF5nHWw5kJhARXjldkVDjeYGCb2JyQL
 2OZ0LHRj/DeD6xQR3UFBtL7exxUKJQpjnA5HrXZmN3rAlw9HlvDVkc9
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


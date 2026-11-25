Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604664;
	b=ka1yPpT31ZGQDgiuY0V1gDe5E29M8Ky/BPV7Uftt726OMeZZgwsIH2N+KVISXSxRTgxQ
	 qF97xZ15ui0yfVaS8PIOnpY60WLZTIYQfhi4+Rava49opS+4XODey2qErKKr/5lKpnRmA
	 3fpUEi3pBnzyHhYYMRI60njRTijsA2lZuuWl3+dDm5W4rE8dqaKK7RfMsAF2HQgBWReG+
	 zCeshbzSXXhhGZXec/T9ReCbb0toHb1eQk7KvvYBi/MfLlcOWwZHSS6Siqy66CvvKwThW
	 KIw/f0i2TJ9w/wUR4P5PwzwvAQJ+Q8k7v0SK0BoWjUQW9J1OJ0wPM4JbKKih2Zf7ihw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DOeDBZ341dnAxqMqy3hGN4NCfT6SI43HZ8hl/CHGhkE=;
	b=3ycHifWsxEmXq2l7eUi7fCCOKs5BSZ0LgaqdVgw7/GRYIhb5W3CP3pUfNVjdn7jr1yvB
	 2iu7WtygZnGtyP2UlmuDkAgQdyrDyH+z1NsXGVbpWlIS03l4e3z7g6wLSg+8U69tSj0xN
	 k7SLHn4AeaVRIFae1Kp0m3yk3R8If9k0VhFbwZIy0SExVcEdb94Ehwdnyb5PivGT5kkwD
	 6IMM74NKho7N5YUfmIY4VEiAs1HCmbC60bf5W52YAOYAtU3d9YQV8gnCep/ijC51z5GgF
	 jp47M2pZQgTmA385q+3smVkdNgGgaLTQLC8sUnYFkCg/KenNAbUKoTplZNOQmRNhUCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zKS6PfHF;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DED606A337
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 11:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0DED606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zKS6PfHF
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492690dd5daso4256582f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 03:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795604662; x=1796209462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOeDBZ341dnAxqMqy3hGN4NCfT6SI43HZ8hl/CHGhkE=;
        b=zKS6PfHFM3i0b2rOd75UH6dya+291HBcxn9HmTyjqxZ2eQkvMkOBf4LGd9nekicGy0
         phkVUfNUiJcTeSDb9MZN9KOaBuvT5nTjOmenR80TEkDbhVGo2h2+JU31cr+W67wlxfhP
         qnN2IwyDpaQLn2eYOXjFZO1FIBSdhNsr3oIS0od00Yc71TwBalyrnaEelMZViRaH6gBp
         rJkyVbryTJsPDKPBLVEGutbqTBYhhcNjlg1n6VyVQGY8X7+CzpCI4HPQy+7gbHIp06qv
         W23j+E6Dp92hwlkERWSgoKvLOzBNxQvPhskppq/e9lj3+qT56ojR8eXt9l19EXpv419D
         +BVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604662; x=1796209462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOeDBZ341dnAxqMqy3hGN4NCfT6SI43HZ8hl/CHGhkE=;
        b=pN+QWCrD1FCwD4HnbltkmaUjxcbo7Ja0oKkAsxAh8O946GoQdRXMDdfNRrgJbDJpJN
         1x+mZdyULbeUTu9BILqKSjlZyzU6Tm7i5gmHbuZ04guoMCTcDXdVdEjDGYaDeFzOCyrG
         ueZHCInxMuEWILRuBNDr4/D4GQUgYQ35HljmkTFgnnnea0lsXSZyPxrM0M86Ajn1Fr+n
         2dFlHA3kdEVHbKnpXk1Q/s4kI4DBgfKIS5KJct1cYwoEqLz8jkGHOtWsmUcKYEEgfiUP
         SCZd8w0rAd95s26/izx0eKA5s/j+J17goIOzvxZeMC0uLI7tDRKeT/BOoNCNlKts/pfZ
         sW2Q==
X-Forwarded-Encrypted: i=1; AL+hErEljplc5rdtuxAjTEABWpuzibxFWVvTtP7BVz0El26k0lyFWYRTupV67pv2uhQ1t/9uLO7W8nlqqQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HnrehqZswIg0mIevTPvUt8UgrWeixDOo08kEGhV4C7paxITdX
	z4nwnlub4VxJbfVX5SAlEGuB/uioQC9OV7ibwqljOJWyHN+J7sUtU055jngvVytkHeE=
X-Gm-Gg: AZFdTZcDMg5C5JjN9L8zds29dZNGuYXtF5lldbRbA0ZEOZm5cLATQhTj4mbZF3zg2bH
	CPxe7zfyEbgGO7QcSKAmpxMsOGYXdkMx9Q6k6Unl4y0NN2yX+H1MzKicFSwjSP1nK1QAMgp5pT8
	RGaLgtO2Y+mt0m95697SlgXJ3rFLJl7n1ZmtD1m4OyWjIsnGiZcUz6dfFby0ezC+R2b6wZf4v71
	L+r597QSihxYx8sx1/YLM2nIPcnnriROn5WuDq5cMnVp3WIrO2ZVHdqvU5IGxWEEUlhP5XbM0iL
	PFaVA51KoL/S9rJ2SuGaM3oav9O/dMOQy6oFjaAps78hEiIJF6T+je+DuHTx3EKO2FDm1V1asUN
	GqxS2qjC4BX0CcL5Fbx7CPsKczipksMQ8XO+rle0+02qytzpII2xr3fZUbKkUUNjRlQ5jOnBy89
	VAyjTKCm3Xe+FtCeWGggXXZpMFK6Nq4YIgbiqGCuCXFZEh/Js3Efi1ZNRjZt+xx45P/wXhITUTg
	bUdmqSd2oPs2ZRWOQTHxa4V/1iSkjmq/iXRmw3u63QBTd2n18sx8h+4TcR3hExWoo8H/rfakzff
	c3/mbsO+n9J2iLm/wBmR06TVOheYQ9G3ogmx8JMycTKrmTUwOJ64wvR6Ra920oZVbqbEzrE=
X-Received: by 2002:a5d:6f06:0:b0:4a6:8d5b:7338 with SMTP id ffacd0b85a97d-4abb3a4d35fmr35192766f8f.37.1795604661986;
        Wed, 25 Nov 2026 03:04:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm34532250f8f.2.2026.11.25.03.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:04:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 12:04:17 +0100
Subject: [PATCH v2 1/4] usb: typec: qcom-pmic-typec: pdphy: disable the PD
 PHY on stop
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
Message-Id: <20261125-topic-tcpm-qcom-fixes-v2-1-6fede9a69f6f@linaro.org>
References: <20261125-topic-tcpm-qcom-fixes-v2-0-6fede9a69f6f@linaro.org>
In-Reply-To: <20261125-topic-tcpm-qcom-fixes-v2-0-6fede9a69f6f@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dUMEvv3krWxA+TDYHGV5SCTqDXXRPTqDZwpXialeofU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsCyc4i4NAo/ezBHPBI3du6HFGDa0DhGfe7c02dh
 ohALEouJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbAsgAKCRB33NvayMhJ0ZI6EA
 CBqNfhopOtESkJjVU999R6izxfDn0h2njZNZFufykyaHhhyQePQdZeY87tyjWxQlQJAj0Z89hOAsSh
 zrxQBHORYziM3tvd47x11qrJgSGlkzGFOTNN+sZ+4plJo+da5UqY9jCp7rl3jrWDg9qOIlXZW2Sffk
 4+LuIPixyC4olT7dTILLIKptf5obpmPPsvSBt7XuQRV+oZJPJUKskxzKiMKwTFQku/Mtth5QHPGvo8
 cZT4W2qnuAEMD+NBCJ4o3eSIDGpAZR0ab/18XGXZbMAqFYzpKm9auDM6L30GRp+HNzGHsYLMIh6x+x
 5cmdzS0dRzmFvmAAYjpxoz/e9Th+Qdgxmojzu313yVwmZwWbI1PXfeJ95dVy8ZlJDrqDOPjNG/MwrE
 m4HK1uuX6W324U5Vp1eADkEB7akCqiK/eP5iNxfghlfu1jMp/R1SeD2Hh+WXF8Gp8SwrSN/DPYs7ti
 YzD//copOXapU9hq9VqpQabZCvqyXJYLhloXKqzOh7RppXTaXYP8YJ0+4m7BqU59m0rujLdMyvq7H3
 uskJkeB1KIgH+/EDgnEm4BKfgY9mu4L2Rapw76/uHLbtrjTb28JvKmFQk7xEzhTxTU4XsGydT75K/u
 a6AfCKzbL1Zo9qf/1g9xw/J5TfP299+nvPhC2yKm8CPwx4KWfJAdYIAdglOg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

qcom_pmic_typec_pdphy_stop() only terminates the ongoing transmission and
clears the RX frame filter, the PD PHY itself stays enabled.

Use qcom_pmic_typec_pdphy_disable() so the PD PHY is also turned off
before its supply is released, leaving it in the same state as before
qcom_pmic_typec_pdphy_start().

Assisted-by: LLM
Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index 435e07659d65..08cf65951796 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
@@ -545,7 +545,7 @@ static void qcom_pmic_typec_pdphy_stop(struct pmic_typec *tcpm)
 
 	cancel_work_sync(&pmic_typec_pdphy->reset_work);
 
-	qcom_pmic_typec_pdphy_reset_on(pmic_typec_pdphy);
+	qcom_pmic_typec_pdphy_disable(pmic_typec_pdphy);
 
 	regulator_disable(pmic_typec_pdphy->vdd_pdphy);
 }

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604970;
	b=tbcwJoM626UK09fOhddmzKINQztThRtOLYBBI+DKNgyLU6w1zL2n2WGsL/Keih5bjjS0
	 CQSiu62SjBcudvJpuv0tY9oFmuyvAjSonyN+F9ftfklTEPIGJdWyyq8VJXzfHgkoGfIC+
	 YuEigmjODTapPOWlY5huePnHJbkfIWP1WrBz5RvoXRoFZhfNxcK96kHns4nsKg9U/3QDX
	 6DCWKVW+wYLCI+9ZwoDWsbO/Cr9FAXGiFFUES0NxvuVxH/GL/Ai8+n6g/zk2+A5hGtVT5
	 f8+rNvU6nOUmQG/F2tZAHWU6DQg8CZpttqCc+eGw690cT3CpgODEjTa1NTYtNPB/AzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ImD+XWYg7dmEgbPDTDuEosa4AyFv/QwmIju8d6PVbro=;
	b=r0U8BhhnjwBaQh4zRp/G7+fTjJILPyDLxVfYm1IKJFlP3y6sg/rdki3MtEO9gB3lp9S0
	 uC1VnJFLvClRRy2b+TkjnObbHHp8HaVvq75+i4KsJADTfMEv5yEAeAMgXZWbL2Yng8Y+n
	 juCiMotygM6MeDmXBZ0SljWb4oIcuYYSi26tBjD+hAkbW+UwZeuZKuMgZ+XJNDSC//8Hj
	 GgS+A3zXVPYyACSkkPqZQ5e/1Pn0GoeKv4krqdbK2AML/TDUyrrstaycQGLPEQp/5mBwg
	 4GwTHJNCDCi1/p6r6b6WxLJule8G9Wo1D035rdOUeR8DS67UR9PX5o9DMV5TdedJ2Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=icmJ4Xe6;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A853606A32D
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 11:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A853606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=icmJ4Xe6
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2944333f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 03:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795604968; x=1796209768; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ImD+XWYg7dmEgbPDTDuEosa4AyFv/QwmIju8d6PVbro=;
        b=icmJ4Xe6+2T8/x3hSSQXxQ8dUrLa0VR5fc0t2rTa23vjuGMhYlEkfWfjROWF0R2fxe
         Kkuojf6T/hSXelrwAAhtB2VnQTUwFd7R0CR3tQgWpHp2PaAwO2KJUD4J80XDUQEbSH51
         7QNk4oL3A6oY00qjy8sdMLC4a6TFhcDguCnp+vzdPUhxRGxgI/zIao1Rc0Km5OEUiJoK
         tvwPDCacg//NbUbMpXt2B0TdTlfMWajn+GlnTUDp7O3sIATuvLLP20kQ8BHW57So1iFI
         S7fywNSBgOwRfIS9vkZGLN2NGZcg4kNGDTx42r7NDIOi2VR1nFBxl4m/tuoyDWrfSi75
         q5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604968; x=1796209768;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ImD+XWYg7dmEgbPDTDuEosa4AyFv/QwmIju8d6PVbro=;
        b=saKI4t5tt0y+m/pTJAfVEUizJ3xwHbiBA1MV1VFiadkahm0H3wcXoAWih+AK0xGrNO
         HFQWQD4QG+AdrMq1fv57qtudUeCVGf8GXqAgvg3fFUgGZ1MOpb9P/0wOK7VXHDFsxQzi
         GIf984zRWfKugxDQ5wVcdV4gDiks0jkG6/7w1BCvrR8UWzQoPk2I/tWWN1Zml9iF8APf
         +18AZS8sDm/lMLSgqcvcEIj5d7ZuybcgGsAu6AJSEJtMFYKgd8VIiLJJUdr7TqQ4VFte
         dA7YQ2tdy3GypSaSXx68LzbsIch2Z+bn0AyL0N7PYbD2fmIGTiLPkg0mikOlC72V4Ab9
         Gk2w==
X-Forwarded-Encrypted: i=1; AL+hErHL4jxQsnvnHPNyZnmRNa4AtwDRIMBju3ABNqwImkd2JkcN3PEW4RlTvBqCT66U+c1LbgWlFfXQiIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5lrLrn8lWiTsoXQba+29zs09x3ywTCfU9in3PG6ECtOotzzDX
	gb5CEEqG5DXxPUoshbVb075vkOSa86Z3MyYCEdWwHpSeCmI1m3yx8pJXQw+TMYWyFEA=
X-Gm-Gg: AZFdTZf1f9NNFfslgrsXPv9gtWmRfl9PK0Mu4iSIbg/bElqUnJyaPcAoLUunF2PJZRk
	NE8KE22bdas57jDk1gxNmtATC91hnKIbyKlpuOBXlcvklsmwwHgsx+PA0gaH5SRMgq3XducxVvm
	ATFl1Ba7QOEJEsQMqv3FI7MGsOxkpxigMRHZPwB8i99Dv3dQOnjiPKpkzuQPxSNAmFIoSe1sUcb
	VWEav3IfFfuqYmJ/KjSAAyl3MtetX7d4vykGmeTsh5zlHEshYVS74LMg8uTqGZWOzE2F1sbbYhr
	hoES4+0Dp4RrdxhqJPtrbBqpGWIS7fFyr2dhGnCXszAQtDUmhLnmtBAdsNFTF8hU6eldLHgyEYZ
	WSM48AqMeHw50O2R4qRIvTu4xKpqMmNQ3AmCedZOP9c9IzRHCT/QparIZnzfiN9W2GmA8NoH3/M
	dWhv6wrnheXpW3409IBnhwdwVkLDqgWbGZ5IJbJCBJHJyGD0ukbLtK8nlMWNPUelnZJa5rAMjlr
	f8V1z5pi62ATJPAmRsLYR7JYifB4l1v7tzra9ZMXJQUwg8QIovnuRyVqPjicED693xV1NYIstFO
	KR3dX4cPP9QMKEjLQ/P/GAZTSLh2j/QMCSvz7DPibt5V9vo3yA==
X-Received: by 2002:a05:6000:25ca:b0:4ac:7595:6f67 with SMTP id ffacd0b85a97d-4ac7595721cmr28801183f8f.40.1795604967776;
        Wed, 25 Nov 2026 03:09:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm33967355f8f.28.2026.11.25.03.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:09:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 12:09:25 +0100
Subject: [PATCH] dt-bindings: usb: qcom,pmic-typec: document PM8550B
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
Message-Id: <20261125-topic-sm8x50-pm8550b-tcpm-v1-1-f54040ccbbaa@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOTBBmsC/yXMQQrCMBBA0auUWTuQDCYGryIu2nTUEdKGTFoKp
 Xc36vIt/t9BuQgrXLsdCq+iMk8N9tRBfPXTk1HGZiBD3lpyWOcsETWFzRnMKThnBqwxJww0emP
 Jn/kSoPW58EO23/t2/1uX4c2xfodwHB+hopurfQAAAA==
X-Change-ID: 20261125-topic-sm8x50-pm8550b-tcpm-82d601264e78
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=986;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=FuQL+IjmRUt6MMl8jqCary/oDQ34SKkKjkFqxv3HV+o=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsHlB95kjyXmCvY11h55JbqVbP3uxeI0WLZTMTlb
 psRe0oKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbB5QAKCRB33NvayMhJ0UnfD/
 4ijooKzFMNTzNwSuleuIosrftyfy0fR99F16X/txQjsb+0LOCRDIvbvyboGLgNKfiYlcGloAECRNPd
 VV4bQRAM+4iNtMv035JadeTd7S31Vykj9HPDBUJZuApop30COilrN4ORBuPI9sCTvjx7YrNWeEkT8Z
 dTwpQPB3KrOokvUlU6x1beL6wIc69hyDn78OUkHdaxcrIrfpTvuN8APwxdjETAABgyGHw0MYf5vneV
 Cq7Juw5wPiw/6QouZJjJrNmwyv5aMB6ftVhGVggFve8n5wwfg0S8/Xcyh1N9D5++0CzwJpxaO220TZ
 K0rksfbh3zM1++EJKNja2+qzNk3daXbVh+UmRWeXCj4ueXbzJoCrd9TecIfvgQeERmi5MRvduoRFBd
 fGiCodwnqY6ZAaLfu+P0JjvG174ogBhPLkzC1xk08N7/TpWCpiylDUkRBlrbIrQCiNwEF7ujJBKJ3d
 i3m2DPuZGs/SQMQLJT8Fl7M7ttIaOYhf/E3E5QgWuwtrKY+EwS/0O7Of+X5Ezl7mbpmvTj3pm3y4hD
 5ag+jr48hX0rr+0y2YoXmnCmHc59G4TqoH0ALy8aM5sZU2BXLIf0GxJO/XltTDZdmRq9Z4dS50l2xj
 smX1NmL+0zL1DWZbBuTAqPN5LU8Goiu5au+/agcSIBEaMhoAPLnpEH7VJAAQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the PM8550B as compatible with the PM8150B typec PD and PHY
controllers.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index ba790c4488b7..84ab93e70d99 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - qcom,pm6150-typec
               - qcom,pm7250b-typec
+              - qcom,pm8550b-typec
           - const: qcom,pm8150b-typec
       - items:
           - enum:

---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261125-topic-sm8x50-pm8550b-tcpm-82d601264e78

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


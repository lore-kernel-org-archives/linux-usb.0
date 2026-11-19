Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092368;
	b=rHRQo19ulrc4DOrHbapKzXe6MhE+G6nRbAfomHXPcrTcPZMmB1dQdzuLEEEWjzDq7FTJ
	 3NFzAFwDP+MoTPpJhpIZqDJy4xRWGIitgWlVKSdS48V2mB6XL6auihaiTNTjQrBkza/Q5
	 vMOqUuWJV/WM0m6B5SSCuz5MBao8eJ5li0v8jcLf7B4wICN8YKOZzs370b5DRYzckRQFG
	 ogED4PbTf3wk3YiAuIF1s/xPpfgLFGVCoKvKxPZ7NKlaO8z6WkhCpuXV4j+W8/eXLth67
	 2PtnfYn6UP/s0fi6undzOOF+bNf7QrxPYG9k9HXzTBbNICj17KrurQwJRp72XDZSZJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ePm/Spv9q5yyXs0Oc6DXANzhxURarQDfA2TJuyX+qkU=;
	b=tfZAchYzky/s8QfwMhymfF0U3gXAdPZiNFvUgt81ivzNjU46ZBsza5Z6/QtaJqaePipf
	 R9SyMmgvgc1HDYi8x4De+7ERiedV5nEL9GE0kkTWz+lKL2aB36Or5+IScDtYj+Y0DU1uV
	 WsoGkmRiRzA0XNdb8QlY6aOaBBXEWb1GvLA9Uk7//FpnU5+B81GlOb4wt9siAoHrY0Mn0
	 Wg/Juwzzkiv5EgEUPz2POewqYyWFBj8OWhMghkxLYxirkW1ZZ+p+plR0itJjux6Vm9Ltm
	 eya65InnymkWv6DI0SrPra9oiMwDTgfuX/1KP/PMlDzOVplCnoj0IVG0tcMd71L5gBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIXjKAUk;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793CF606A33B
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 12:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 793CF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIXjKAUk
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1438d9363fbso396610c88.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 04:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092367; x=1795697167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePm/Spv9q5yyXs0Oc6DXANzhxURarQDfA2TJuyX+qkU=;
        b=EIXjKAUkoMLRsnfT7WizJMG0mA+Wf5/X3cgJHxZ+ZlrZcxurpiPY9qaBEXdjWbl6cl
         76dDqZArq6bITIt5kIWc+gi5VSpWv+khBf3rF+wY5sWAh/Bqb5aFX78HIPp8QsZEpRAM
         wUqUJ7QG8oHLJLbu4Xu5tUzi0gI9dFOEfOAYl7sidkYc/qTLLaTbmv4Cvi1zmtgnajb8
         vyhFExZwwiSOfTApDrqkzyQIt0MxUx0TSNr/yOH0/OdQ1CoraEtLoHpUNQwEO9gZXyvV
         KP3fwOSpfAkukc7oA/VNSUeuXK9Kn4BUdGVjN5j4eh/tPrG9QuPHsV10oakcZNd7+Jmb
         1dhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092367; x=1795697167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ePm/Spv9q5yyXs0Oc6DXANzhxURarQDfA2TJuyX+qkU=;
        b=fpNMfPbekCZMGFvdItbHCdZEuYklvCsn9K8iY1ieVswGBTT4qWGzbbOjwM47KUNmSI
         +zUPSQ31StjQ0jktc35T1sHkKOwGNGNvDXY9MjgqGpnm/n4sBdT1HxXJpA4+HytLWg6h
         jsQ9Rstb/XLjMJLznGNy/uwvKmoIlsB8WIbNVvtddgR+qsHvqjy8XuQVsKAY6erC4mcp
         yEzV0UH7un1rh58J5gbPieyBwYo0rq6vK0dSZm3MG6Lzhik/aLfgnV0C+ENqwzmyBUH/
         XYf4p6dIBzaImstarFy7PYQZIRhfNcQTBaIlsKrLiwNrNWBKWRfP+iuNdOFEcKmHEXZk
         N8mA==
X-Forwarded-Encrypted: i=1; AL+hErFshqYFepWQOnM9YF8uXdZtE6VXrCp7uIL55kg6iE57/sTfNMgXU8NkO9frPeQu2pddpt5OcpfrMCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UUt4BnE8Qtq+ElJwQNDW2ULfUrydn/mDZfb0mjucs2x4ueQM6
	okN2Y8G9p95rEmRKg06BFEpkYXI91E8r5dv6derg5G9IsxZ8eWPEdgKA
X-Gm-Gg: AYBFou0ZkOaG5g3QpHPSeo5vFi7nX8ZuM+wXjTfLw/loWIsDWv4tuQMw5wM/0up5FA3
	d4l6QiRhsuiJoSGqplmUCx9uZ9S9Hg//NTXEogPmBPX2/9M1O8gN63l5ASVAtysaU/plv5Nu75P
	C10dg+1YQhsi06XpNrrSztvnoMG6mwHSqxzFbbtwkZNToZeHONwflxkRvMPMijpVtgL6G9UAMC7
	Cp/e9+mAgOX6YQEAuCGqZAeISAlIPiPK523RzR/qTcZ3+FIjiC8Z4EkGi0CQAhFaCyibPnb/q2U
	zdVYyLHZKWLv6rhRYy9hy8K8mbqf++YCZ03fYx3E5mSEFOV0BdfPWOmFL520s3iqKqr9P4cUrfy
	He78Led6WgcjzCNILB1tXSVlnKF2Ula3ccaRRB66V5yR8H0Qn62bdiLjhgl8rg0hPIe5pJV2OiY
	xf94/jLSeWwHvG43vA5BkX3TXp/b9y1wIrttRTWxbRekYuHRXg9//UsDmZGtgV+sBUVhisRd320
	tSO99leNw0Vw98e6rx4PAYJVHSBzeEnR9NuHyPotpaNLUsAoFHt0xIwyh8oqR5foSrCH+rspYCX
	2ThhNtClcFRJSAav9qexJPT+bohFCTmgMn4=
X-Received: by 2002:a05:701b:2810:b0:159:f192:5290 with SMTP id a92af1059eb24-1b5524b591cmr769675c88.13.1795092367360;
        Thu, 19 Nov 2026 04:46:07 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447da7e0sm22350329c88.9.2026.11.19.04.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:46:06 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	heikki.krogerus@linux.intel.com,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	effeffe99@gmail.com,
	prashanth.k@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com,
	peter.chen@oss.qualcomm.com,
	tapas.rana@oss.qualcomm.com,
	vkoul@kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Thu, 19 Nov 2026 21:45:57 +0900
Message-ID: <20261119124558.1548-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261119124558.1548-1-26rote@gmail.com>
References: <20261119124558.1548-1-26rote@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
DisplayPort pin assignment gives it all four lanes for DisplayPort,
while the controller can keep running its USB 2.0 port. The controller
has to move to the UTMI clock before that happens, so it needs to know
the Type-C mode. It does not route any signals itself.

The Type-C class passes the mode only to graph nodes that have the
"mode-switch" property, so allow it on the controller node through
usb-switch.yaml. Orientation and retimer switching do not apply to the
controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v4:
- Add Reviewed-by from Krzysztof
v3:
- Drop the mode-switch line, the usb-switch.yaml reference allows it.
  Disallow orientation-switch and retimer-switch (Krzysztof)
- Say in the message that the controller does not route any signals
v2:
- Use the common usb-switch schema instead of a local definition

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64..fdc2bc8d3 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -158,6 +158,10 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  orientation-switch: false
+
+  retimer-switch: false
+
   wakeup-source: true
 
 required:
@@ -170,6 +174,7 @@ required:
 
 allOf:
   - $ref: snps,dwc3-common.yaml#
+  - $ref: /schemas/usb/usb-switch.yaml#
   - if:
       properties:
         compatible:
-- 
2.53.0


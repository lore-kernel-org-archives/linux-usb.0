Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483530;
	b=vQpaTVfzHJh/qYNgXKZrzlzbOc3EZecO6BPGz+ypUrb4l6OIl1wkBpFrfzuuklZx6PV4
	 waZKADSLyqmyYksuCdBbHJwPQJAw3sO1z7gecDrLeKuqJ5S/XQEYuYS7bGv4QiNa4RGiI
	 jJqhN4PToI54pT9HATQb1q71NpQbN03rDdE1BWYkpimTb1CFHxcD+vX1/MKPQxmXc0klh
	 ehs53qZ59sX1jc6wKDdgZZfyWdFK26Zv6p1oy6hKqgO4RIccLUHYAU+kjSqYFPW9RQQbB
	 jnRSeEVBRV4aMlAsC5fU/6E8/8NuAyn7j2q4mIWFnni/UDtD9Phb6xa2g5MuhOifAoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BcHFKzH6PC0hX0kM+WnfYgJDlB7llMNXzNgtx2MFobA=;
	b=09vOEWLYSmSPaZj8ZOWtrubrMdc+QePAy2q4WcvXyFmLOrYDhIVtswtIX3GD3AOkLbYF
	 rVeiGscWmphIjy5W+GenvbRHzL2SPWMYFDo1R+NNKciih+owqU7ix/HtuLhpJRRzO7vJX
	 TYc97ps2abjoTMzUtPVZt7pO21vLplzzHrZZkUqgTTIZARKVAPDnFtyeshsSN1mYZSJTU
	 uI9SHUkw3zBHLmbq0kymsydqFcALOwzwAZKCYbnKGUr0gGSuHVIX6Iat3b3emoK2gotaN
	 0dSbg8OjSrqaZapSPr4H6kEzMFXqT5kkIx1+fFoURRvn+95YQl5qPKV6SlF8MpdEZKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bpc6tjlp;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5B4606A321
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 11:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F5B4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bpc6tjlp
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3720addb068so7407551eec.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 03:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483529; x=1795088329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcHFKzH6PC0hX0kM+WnfYgJDlB7llMNXzNgtx2MFobA=;
        b=bpc6tjlpFatIpalsJ00zMwHn1GBcqsf3GQV4V2rJbh6LJsquLTd7ybtJh1ijCy47Jb
         c+d1mWb6vX+BpgcenjeNRTpaOEato340SQNSThVZ+mSFA1svcmkV1KNtArFv/4ehxtke
         m6v9iiJVqFBqRwE1AtFHLxr+ti975c+/Z6EzYpOo648IXJoS5U6guDhNGa28v5f9EUt7
         oJV6DlU68pRPghGGxrQOfOoOqssth/ABpw759qlasUmCj5qh6NuOgzYEtoxLMyt3YpDQ
         dzXGK0sJd/4Vy6sj9SEYrLLXWeV/gWrcYhgZQGziUXAScIlS5FNZKiXCg8f/yvO/ZfgC
         N+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483529; x=1795088329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BcHFKzH6PC0hX0kM+WnfYgJDlB7llMNXzNgtx2MFobA=;
        b=yiMPvGwS51eCk7pzC/bNVMaX8x+Yc2xQa02Sk0hLMvevlmh12LcPUFfWnwBTU5n23u
         Ehq86LrQq/4SlhByDH3RYNC3l1jxtuaOONvPfcQbv/m6LjYRxHdyLvJGgl5HrTens0eh
         os4Ts6KAC0U7SKV763G8YJUm1cyfp0IvHO4eMspErA6hsklt2lIlhV51zqsj6LSGl0QX
         zLA+cDu6BsiW7qH60n9sr5vIGFA0mlGPYpDsXwGRENiJtl/YXYXIAiZExTwRoMCdpV0b
         SIQcNihmycyq7E+BXOr8favLv26lFsfKEtdKfl7pcv3ZGhjLb55C8bUStWWpIwb0ROG/
         BqIg==
X-Forwarded-Encrypted: i=1; AL+hErHLX+e2DBbWDAi0AjZJrvuTadjc7qANbuWecnEtPO+pWC87v0FJj3omBhrXvxwM1JY1vEXCoVIFiVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Atc6Nc02PMYMHG4wybCkkDMicxpSsB2D/9j9vZLrOYKn8rjU+
	QXCL9UaUEOC3qRJgjpUCAVpB3V9LRxFZ6OL8IRbtHPwGO6qIo8a52aGYyWrCmXZ77hM=
X-Gm-Gg: AYBFou3IgPAXDjUMcAS6GdlVl9T5/zAoLhrpixqR/x4P2VEztk4ANsK3rDQZZyXgI1H
	21pW9KIV7bXTGE9oV4jz3ri5esZtSTRKnVEf1gQiYwx1UmlN6gzUhqLCLzEuEjQTBhyjwOb4+Bm
	pwf+i6gmkaIOXte/byFPMMUymLuIzcJ6UmmmDLVzB11EeqimtEB4O9a9VPj2EW4SVUzSzXWzCmN
	12VscWXGpCMYZ9HLT4nyWIsO2Aeyt+umfGtMbOPZKXpqNU4bA4y3QfafQXX8ndla1tLpF9Ge64S
	+9HcVgIThFoqN4pChEe2PPDefshYgYNq3qp6PGbblFBHfAXLYMKYT2iBTL2JH7VYUoTxM0A8Lqi
	wA04bYRirWGaFPl4qigoEaiGp934Zchj142KIMQBeDhBaGnyOJ7SPgDx+Nb9QQSAKOboRZ4GmLH
	mG7XHluTsua7D4Pq1rpLiyvUPiKQ+lvVJCjNJjnywQqgv+R7jeCGPA7mau6RBEmoAj0csLexmbe
	FVPyi0i0J9/NLvc4xnzAvsZZr08uD5jdAhW3jDPp+Avh/p16v3O+amgZA9ucItljOvrTkiLu6zc
	Vvg8qwIOmVgm4cSCtKS/l8Oxwf0zk845wboWAk9adw==
X-Received: by 2002:a05:7301:430c:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-37683189067mr5405543eec.1.1794483528595;
        Thu, 12 Nov 2026 03:38:48 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe07dsm27149036eec.20.2026.11.12.03.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:38:48 -0800 (PST)
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
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Thu, 12 Nov 2026 20:38:37 +0900
Message-ID: <20261112113838.506-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261112113838.506-1-26rote@gmail.com>
References: <20261112113838.506-1-26rote@gmail.com>
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

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v3:
- Drop the mode-switch line, the usb-switch.yaml reference allows it.
  Disallow orientation-switch and retimer-switch (Krzysztof)
- Say in the message that the controller does not route any signals
v2:
- Use the common usb-switch schema instead of a local definition

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..fdc2bc8d3045 100644
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
2.43.0


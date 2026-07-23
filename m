Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0154943BDBB
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 10:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803163; cv=none; b=Hm3fjWP+7JL5u6LBL4+LYxCBAZ4y9naTqAws91q86xVTYv71idp/WTrUbwaw2U6WQFBeWFf9K/hTn3z8CZEMzC7zSFjR9RLgEc/xAi8z9OUluqT4UeyjmPXUeCfTOExmfvsup9jr2A1P5XN+9T6R0Oo6YKpNIqFuSIRU6rZxXkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803163; c=relaxed/simple;
	bh=PBlvVsvGr+bykm8WnMhzex1smC5AH7JlTemQnJwn/hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CVSNRzQiuV78Owl8Qs8Fc6FA05hzt9O+zWF3LPlfQ7ccLR1X2txAHSZWFp4mTqpj958jPB3kSXT04/HL8UNcjkSDIOn3opVpEqA7mUSdPEPji74rwTTDXe1w+rNtL4Spe9BRXB1fHno7qijHhSwDsr7PqpyaTK2SofUkkZYOcCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HM2K9ao6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KVyuGNHG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HM2K9ao6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KVyuGNHG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qWpr3044716
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 10:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0xuxwwHnpi9Fid00zPXEaRRM79uQz6jYd7duTu4iLeQ=; b=HM2K9ao6bh5VGGEw
	klLAt9olwBvQUG+TOCJHccBRhVHgCbhQnwHkPXDhR9FnGs1qxFJqGLCxqa+7ZN9v
	PA1e4/p5LwWJE9thRYuyR6AMTlQbc2JyWKjVz6uGF5Kg/ccTsIMGv+7APxnV/REt
	dcVqLuCmJnzYcZuj9unOolcsy8rEmwyqkBZTZVfZsUiLi6EBrgozpwcWqfegly+I
	hSJ+OZTipjQNqq4UhrpPWezMcT/vs4d/AD5X4hIsWmKgcHdfQZ8hWBVMo/Po0BMu
	ZDw+xd0AmCpjDRapFpCJSWn+O4GXA8YtSNunkw1NaOurayYOsPS70MM8GyCQPsxi
	AyL07g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq8njq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 10:39:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848d21bbb55so904487b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 03:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784803160; x=1785407960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xuxwwHnpi9Fid00zPXEaRRM79uQz6jYd7duTu4iLeQ=;
        b=KVyuGNHG9xpdNQ99VAXlmru4ElxZsCHjRXLQ1Q4vi8fUQ3AaO5s52MEMAEy6i5vq6s
         mzKBryOaxyBSeNo61tJxFWxXM/7Qbgnj1/x/138zZBcss1O/VXwYUojw4HV7CAa3SPh2
         xEqrHTPI5b6iMrHbI00Yz5TDLquCzkikYtC9q+2sMgPkEn9lsVBFmjqN+4bFeJ1PlHPQ
         lyuJkMrEmDCa5SuDMm/wRHiBmt73jjFKx4Xfgjcmqklwfoarq0pwmgOtDlfeItleLepc
         8s4YGGQdKuflG0lnet8aHl5Oc/EkvX+7dJrTTEJM/B3SCqRmE8ojlytVkY2UoJiaTugK
         1RyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803160; x=1785407960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xuxwwHnpi9Fid00zPXEaRRM79uQz6jYd7duTu4iLeQ=;
        b=VedGqPsB8KK3u3i2JFQTM6rMz4z2U5AhXmfrNl0Ul3fwY9oseqs3rozikSABic1Eld
         U/tjTW7wYALKqDZhwBfy89kKg6M0ZFKVU+QbhdHxVYBkTrlDNIq+hQ1rMVtYWNkm2NUz
         3m2qCR5PH2z82sFNeJ8/vRPOrrrz/slTCcwX9VEldBNLF/7i2JpSTBpgzgWaNSPw8Igz
         DKa+X9G678Fbf3ZhfyQozAC7lsOiJ19EvHEBFQ1j2hoi7RLiE1BNj4Yj/DvKhqyJF11U
         jQCyuxHnL9HboIhK9Y+S+vE3I5N3agiIN2mueyEvPY0UFSP9IBO3KNnTYRqsUnkiqahn
         gZaw==
X-Forwarded-Encrypted: i=1; AHgh+RpnhtgVWm4CDoklSVS08Bn76+wqAXCDyXWPJ8Q9OHAQ8ecHhUHFafBMGGNm9GkgNLNHT/eNehC0d8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU7ejjDbZu+dlmiL35BWsvK7VOfyJZ08YBmeLc2WSiFV8AeK/g
	JPv87kpqACg7R0jHok1ARsy4L7wcssaoMzUTzoGlKsRuzc7EpNcR0RRWLP4rbibC5+4d+9ofXEr
	LCoUJD2Ba1TNWMxQqUoYJ08lucwkVrSuwMJ66m7mT5dgWIDyRduXFU+dsXkSd/w4=
X-Gm-Gg: AR+sD11BVbgiGW+wUJt4j6WzzO/Ja2Yk65Ydokb8erfM8dZ/lHxxDTZAJWqVRuIWy2G
	9/smA9N6UV5LhymchRI/HmWY9NGONNKnU0cQ7swr4AexaQwKhZcko0guKIroIvuALUIJFu3RhmF
	U4aHk0aFfS5ZdOqemdSSJ9G6zZoB6uKccsOhKrksvJWh2U4zOq/zZIUErVzNZtNJZ9anJq6r6N2
	mryC64jTBihZHYGDN9iORYNs0D7hvE1m24l3CRrWu8oYJnra/dUq+oA+B8kZePMmolGE1ifxHs3
	SkSE7eUZEy6Pw+NXCh53wYYNK+H5yEbmGKuBOWZTHx4KEg1KtYU4Po7VwB87YoxH0C0mIbSmLnu
	FTcMWbz8KBPJLJAHw0HojqoSNj+uYBQ7a2ZwJXza9xLZblIrJJjTevbni/u8n8LOWQizhcQ==
X-Received: by 2002:a05:6a00:3305:b0:84e:165:da65 with SMTP id d2e1a72fcca58-84e2c244122mr2705005b3a.64.1784803160521;
        Thu, 23 Jul 2026 03:39:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:3305:b0:84e:165:da65 with SMTP id d2e1a72fcca58-84e2c244122mr2704979b3a.64.1784803160120;
        Thu, 23 Jul 2026 03:39:20 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17604a46sm2864469b3a.60.2026.07.23.03.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:39:18 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:09:04 +0530
Subject: [PATCH v5 1/5] dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-eusb2-int-handling-v5-v5-1-f32ea6c1a318@oss.qualcomm.com>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784803149; l=584;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=PBlvVsvGr+bykm8WnMhzex1smC5AH7JlTemQnJwn/hU=;
 b=Ig+LtmVTjlW6psaSiwo9MZgmFk6Unrs5ipwJbEhMmqnVTfmBdsIEdjhAECedPrDJ4SusZa3CS
 JCHXuEPmk1WDAs28elvozcRyYLraE+9PDQVsje9UcyL7GuDG9dDcfyi
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX3bkWuTlNGQrV
 8vupFC0OD6tD9HYjmPLWQiJLIsGL82OFKrZ3mXi5wklvVWVZxiPoZU5QS3hZlRfEdp8DfxVS0zW
 uHG7QPQ9F9XcpbYQU88A6pnyc00k+HQ=
X-Proofpoint-ORIG-GUID: iNnMmTFDG2zy8Fkep4dxpJHipbiZMUTW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfXxJvyBlr96quv
 48KnkeGjAlrVP3YdGgU1Y+D67WLX66zjfE/i0+wc9qAJox4+AbIBLnMfsbI1ZEmDsPi/WWIOevD
 8ctPxsq9O3Ie740AFoUEJGhr/aW+JFujGnO/9fol1JfbbEvwdAeHNSCrgvwsptQfSdvC4c+iXp9
 Fs51CTh73hbf2SYyPuYT7DiAKgO08lrTycHCLP8j1ITsy5L80W9fLzWPWI/+AasgDT5NDxBHUxg
 xzyPTG7iTDR7kXNbAou5oicbMi3FHfiuPyk4qRZhlUm2dW/elvxZg9FUtBwBziF+PHLEOdfw0xJ
 xU1e/BdYrkggaDfdU5x6LkMo3ZFTqS5O03Ix+Jonxl63ORIzT0M4C5TdtfPcWPC3ot6OljAP4Pt
 8MANmo6UVPHr3PkumTDEcvSO6OxZZ28uxQ2cgR7q8Re7EDRRSvsQvTAIDn70C6PCnJnbqhiAFGl
 cXdccLZe2KnzMN3411Q==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a61ef59 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1husMANfLlrnribazw8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: iNnMmTFDG2zy8Fkep4dxpJHipbiZMUTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230104

Add definition for EUSB2 phy type.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 include/dt-bindings/phy/phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..555a022c8c0b 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -24,6 +24,7 @@
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
 #define PHY_TYPE_XAUI		13
+#define PHY_TYPE_EUSB2		14
 
 #define PHY_POL_NORMAL		0
 #define PHY_POL_INVERT		1

-- 
2.34.1


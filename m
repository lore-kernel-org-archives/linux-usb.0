Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A58E3451B2
	for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2026 16:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923276; cv=none; b=oy/d/oR3DU/kXQ5zL3ytnu8MVUC2SqY0TXkvJ7daukedPuRNiXqJ8wwA5I1vDq4jcJns+Gt881I8gxaGbElWhJBPrDaFOSB2pZERVD8RlUuLYA/59hPRn2rRaPQ0mRci/UUvBev8gKMgrS3Tnadz1Szk20NBH3afQZwqA1C3H1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923276; c=relaxed/simple;
	bh=SFkszoYob0NQmXMceDh/DB0rxgYBc8NVUBA1MCXzYRE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Vxio3X1iXu4U5vpBdVhPL+YJPGxJE4X3ioI+WDycPMxbxoGdphbi66NvUAC9JjhXvyWUWkmecWWEvGg9m4ntOr0xHNhVmZmOvU6C2hIUkfXX6xgNrd2edRnvm47z5sFpSKMJ7mCxxFFhEu0+DEhRoToi1OY0NCgd0cZw6PNGTLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHMUDJRe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8O6TW4c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHMUDJRe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8O6TW4c"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661G4a471509868
	for <linux-usb@vger.kernel.org>; Wed, 1 Jul 2026 16:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=W33J77eszCzFLVVz2y5CJSlgxsxIdWmNKHK
	eyk/vEhY=; b=PHMUDJReCDQjIcQ33EMGF9e5oWRhlkpFJ0zIXnP0cmDZlly7sxR
	RXsJDQIIcgN1bWIrUen/L76d2CtDxSpnYRrNxWoObWiRNIJTczG+xF4tDkjSccjr
	j96v9JA8CEQUGeimDOmrWO0QOlA7yUpJrzpV0U5m5J2XVvmQW7HmT0mfs8KSCq2S
	5aNaHFUPcd7js8h5iWTKeuwKFXZHqbLS4zPrk8FywZ/ac1zmkITNO9kAQCEHqqSC
	UizLS7EtiikSRtmCd0DXjYdxCbwes5lQg4Ws1N/2c7Qrgf0ln+GG5UEu/Tm65VLa
	t8KrfEl2qs1XU0iAItGhmltnM78rs+jFoJQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563mg398-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2026 16:27:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso689204a12.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2026 09:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782923273; x=1783528073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W33J77eszCzFLVVz2y5CJSlgxsxIdWmNKHKeyk/vEhY=;
        b=d8O6TW4cnNjnm4CIwH997nEZGeEMBA2aLMgxbV4TEo6JbxB14mghDPU4+976qPfQHL
         uWahm0fiHSou73Qs0nF+FMEwvXPaR78j8Aah74O/NYbEEN3rypCnm1QVSrLU/mL+dccK
         8uz9iiAtRg7bVx7To0/SF5Rg+NBGZ9qyzkLTqujnL0ljUeTJnHCihV9hti6EEZhgKmua
         dmq9Fy3vb+1drWsphWlFEnPTA77c9TvoBTBQm5t7avGDvIHEys+ZUQnV95r92vc7W1NK
         rA20YtoJv2fZeaW8/c6N2emEAZYRdUIq/BFEakvZkfdOvCDq4tlDtrlpt3ABaTDbe0RR
         m7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782923273; x=1783528073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W33J77eszCzFLVVz2y5CJSlgxsxIdWmNKHKeyk/vEhY=;
        b=N5rcnvCJyjlqlf8mLzy6eD/YCxRvQjq39ou4C7URBwUkI5OzDURc5eWWU5jifLDwx6
         oGQ5b9cnrX755s0VquhtX04gMxzPA+8m9wB5OGt/9d6Z9pNpY1ANuQiDjcR9oy9GsOrr
         s0ogCViXMjCB/ox40II4HKL5B8/KgPHppNLrbMz/9nnbx9R/sXF2HUVwtVwDRWOf59hO
         p3P3rmv537w8YNGdU7PqNOxmdPX9tFmqPgFybpHQqzHvkqcMk4kdI2dyBIVkr9bwJ7HL
         Q/bYS4AU3FLQEbqkBHY4Q6J8rD4TBlG9q7HJKQzxiwIcObawEbXeSw+0A36ZYfRKtUzr
         o1oQ==
X-Forwarded-Encrypted: i=1; AFNElJ8w0Smp78WEU+2bKJn3uI56ozJILc3Ka/LpNKo1KVQ1VMjLdWBU12U3W11ocFTNu8zVdMltEQtL2rM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzknP/q1+Y++cOTBt0SaQ/XQNIVOZGM+k0LO/a03LTKlqHE0Oim
	B4RQcFrQksO+JWMbX3z9oHMk3L1ggpXUHOPh6/eN1/SsAimJbrb1f715T0G3gjwPHC5/y2zchbO
	zBwUuCC/Z3a+hEUt8nccM0cVtRjyw+F9EQ1yAFnhOpluiESXAm0a1wMBAnojuIdw=
X-Gm-Gg: AfdE7cndqoVa0uGsSZi51r3CPZgYTh9BrFn6oGrp/14xF550hhR/D89aDa06Uq7dR3I
	+crTfNppIj7DHlaNZ/lojI/wLBa+ecdxLz31KX0t/L04HBot67cXEQTeQLxNuie0B9/WSqGxQbL
	IIbpa2JH5krCOJsWYUCkj+u6ojLIr1jmTnpbZeREJFxqHgKEVc+fLTLLSz7Kn7l++oMvGCHBufS
	mE4RxLEEzC7ApwdNPRLU5UzlGzpu7YXMXdxG4nWgcEidxYfNYgy34tw+i/qwF/eNhc3EEYAnXau
	+RW/2sASaoPPyCcX3b/NtqfnLFGxHTlscz7PiXl87xpMTGyU2gs9lhW4EIvpOqKuQr7Ypv7cEQH
	bSf/9XoaSJ46fe+Ma72fSGWaDyZp7LSZPT6F3bsoQbV7wBSONal0HEYSmIt4BFD7lsvyqW6IkSu
	KPPOgP
X-Received: by 2002:a05:6a21:48d:b0:3ba:ecfb:ae2c with SMTP id adf61e73a8af0-3bfed2a20a7mr2405040637.20.1782923272905;
        Wed, 01 Jul 2026 09:27:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:48d:b0:3ba:ecfb:ae2c with SMTP id adf61e73a8af0-3bfed2a20a7mr2405007637.20.1782923272447;
        Wed, 01 Jul 2026 09:27:52 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2abbba82sm24782403c88.14.2026.07.01.09.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:27:52 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: usb: qcom,snps-dwc3: Add Shikra compatible
Date: Wed,  1 Jul 2026 21:57:45 +0530
Message-Id: <20260701162745.4043106-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xXPWQqFP4jmtA0kDCdDfoZs-2Gq1uIoJ
X-Proofpoint-ORIG-GUID: xXPWQqFP4jmtA0kDCdDfoZs-2Gq1uIoJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfX3E9vZg5WkHRZ
 mGIFqAhbLJbkGydDJALGNx9mH8jVKsOE/NTv+rFwIBcQcrplMQ2GvJ4VOTM2vP+4+QBWIP/79vI
 knFA3BBItSI/bTdbUrEzGJNLl6cBgrgav92pXQMXYQelr0jDU3lMy++FWMWjY7mwKpeY2Rk9XxJ
 8nqBKO0AGzEAh5fg4WzERo3ONB3Z6jWZ6ZFPZHwAChObIPjK7puwE+MBfbGJ0nczqWA7UyX8c6v
 YAvOUTaw1L7UcPpLhYHpGWv9mEfVA5qHDvRKflu5o3tj6pJs1Typ2Dz1sXk7p8LXkevwmKL0PI/
 lMqp6j4Bv+X3ZM9PzaZjUykSP4oJ23ri8hpv0J7vGhy+h0sDZRkiZWKOc1iyeCMbOEcQTsSBOFj
 rTDAi48TxUdJcVuQinCh/l4EKlRRwrBsGBaot9bZ/rj7BAJozRkxPM39B+FHmsxJRhGo0Ot8j0t
 0nIuyMqXR3obfH2ipBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfX666rdGQvPStg
 tUYmmL7bpOi/nIXgu7xinpuvN78joF1lDxnwEbSa45pn/8CNLKxfzBqs5lc156pCJ4qHLr6u6mT
 iQulMerZuSc5pyQsJ+aLkitI4ENrFek=
X-Authority-Analysis: v=2.4 cv=UopT8ewB c=1 sm=1 tr=0 ts=6a454009 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3e1sJlzf_ErWyEvw0aAA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010175

Introduce the compatible definition for Shikra QCOM SNPS DWC3. Shikra SoC
has two usb controllers and the secondary controller is high-speed only
capable.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Link to v2:
https://lore.kernel.org/all/20260504145710.257211-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
- Moved to using dp/dm interrupts instead of qusb2phy interrupt.

Link to v1:
https://lore.kernel.org/all/20260430-shikra-usb-v1-1-c9c108536fdc@oss.qualcomm.com/

Changes in v2:
- Updated commit text.
- Separated this patch out from phy patches.

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..026fc715eebf 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -60,6 +60,7 @@ properties:
           - qcom,sdx55-dwc3
           - qcom,sdx65-dwc3
           - qcom,sdx75-dwc3
+          - qcom,shikra-dwc3
           - qcom,sm4250-dwc3
           - qcom,sm6115-dwc3
           - qcom,sm6125-dwc3
@@ -386,6 +387,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,shikra-dwc3
               - qcom,sm8350-dwc3
     then:
       properties:
@@ -556,6 +558,7 @@ allOf:
               - qcom,sdx55-dwc3
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
+              - qcom,shikra-dwc3
               - qcom,sm6350-dwc3
               - qcom,sm6375-dwc3
               - qcom,sm8150-dwc3
-- 
2.34.1


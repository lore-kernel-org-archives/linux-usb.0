Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEB73F076F
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 08:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587181; cv=none; b=igDFtWmIFQRCTb8sM3n/ninNdJLzG4oRqTY53YBgpFRwRqHRWkmGN/upboyrSvVcAw34w7rq7sjPvDWZc/bzZwDgqHKAm5lCYkQhlfer1uRF/r0ws+a83ITbwfFsj0ERL9gAbqFzwH/f6ZlCJjP0ObLlNyOXXu8lTQTFTJPh8PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587181; c=relaxed/simple;
	bh=uBXqfc4mbtwTmOdfZ2rYPKZ6TJPThoipKevya/9xmEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zuuu8gOqctIxRSMQkTRKtqk9ABAHPEdf7Sb68JieBlu9oL4fxgZEGGDOV3dg6ldjgUGs/hPFAkCdO8eJCITfJW4ETgYQkk/gKNIAWWJuBkLatN8FY6r07TdWyYiEINnXTMXVhWpJeRP7KLw0VgS6YEIqJWob0ApklMK91fY+Jas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Es8xX8DG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZobNzBQP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Es8xX8DG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZobNzBQP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Gb8887925
	for <linux-usb@vger.kernel.org>; Thu, 9 Jul 2026 08:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q7C3LES9FKlhz1br8iIOlDOOSpebq/xu1aRezenbPuY=; b=Es8xX8DGbSdw82bC
	cVPQq8CvFgYjvE3JtCRMqRxkSB7RuxScWKd69Z5cwSJ+kjyj3DUJetbfL4b8r0Uc
	1lsWeHISs4gDBFKWftZ1gBG+x7+nxX9GeMTF1QvcOlIxlyiIrCMDCo63Vx4vQjNX
	2R98Zp1uA9pN0oEigFc9TAO7FKD9q+d1Jg64erl5iESBGI8UP01aOWsi3E35ydCZ
	RD5orcEiE+rSTIvJrl5Z9aq2rsUov+NcnmEbRs60pHNqz5bsInIv6ugStqWdISLY
	B2wIuNWBF6H+uASyCDmPHYlSzC1E/hQr7gjpeCfa24E8kO4O/KlYvNCQAB8AeqCP
	/Wn1ng==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33nhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2026 08:52:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380b630c505so1052097a91.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2026 01:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587175; x=1784191975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7C3LES9FKlhz1br8iIOlDOOSpebq/xu1aRezenbPuY=;
        b=ZobNzBQP/nc9Mva+FSWR77LtKM1wjJHH+5yZpZ3fIhHb+VNEoaceo+PoWOucRUFP75
         PNbVK6mfEHIQPihWWuEkZVppVhnPh6HT6P7NTyamO12Ylm187wrlFTcUGpCpaQEPoALf
         zM2S3iIM3AS4SWLr9Ol7BcaLJeg3hgtcj16zEjIkOx54HqT3eLSINmjrOfm8IHQmEw4A
         xTBtOiZE1u7GCH0xGlNyquFXOvlrvhrm/ICShsdbJTBvp6Gu4w2/6VBgD3frbhjBYgj5
         ujeMHdvUy6S8cWKy1Zht4NNxN+PCgBK/IEwFTjYMlamvqGtMjXs7FUWnOcu0KZ6v109t
         sXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587175; x=1784191975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7C3LES9FKlhz1br8iIOlDOOSpebq/xu1aRezenbPuY=;
        b=C4bQT5SFJeDxFSeSGBTn/iX64vUFdkcQKFTlM0NCKjq/VJRpMTOY/EKn8JYhjvZHGZ
         mtDRKf3LU+FvuC3MrFMtNT62eTw7z9sXzBgwswgZGLo+4dCMJ9F4xeugEkVwTqcT51sL
         BebipQhkL79JgLYiYo1/qcbyCCUnN4Yg50mQ2ji+Pda7qsW4Gy6lp66/pUUp6Ksi/7nh
         EKGyaHeOr2VO0+DFl9spyF0o9lHl5gE9qNJt/H9zPK9DkBvpF1UrCnlQ9vZByD29/DVd
         7m5QbB+gia0eyWUlYrTV/yXuqpbuydasRUHr9yMMarqMvgy7O6HDlaWjdBoR7E/1D4oL
         76Ug==
X-Forwarded-Encrypted: i=1; AHgh+RqRjKV6AmKxFnvMjfNfcARc+vy5DSsGfSs9UILwLR7xz6CyIhkoBnYRZLTb5qmh4e8qXjGqk4md/G4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4UEz+0G5N5w4uuhrCyaWT6BrnXhfQ5kY4MpPjNQZZchDRijvI
	E7VyEc+thdTsZ0Iv8eU8tP7n6spNz3RSC8wpJf2P/67zRreOguZoK6NpRYrzg0zbDaOoiH/djgW
	JtfIIFjDbteKx74jyPGSfBwDMqt7Zl0TIbFBMBEcLEgWxuj55grXojfOGfjvmWOs=
X-Gm-Gg: AfdE7cl73DEkENeK4m5GNsNLYitem290TNXTkc226P1qMwwQXvSYRvtZw92EnKZYWZW
	auFliZdU4P92pQkGOHTVP4rjGPMgWrG1ZxyxUJom4hHyFsfZnT01dx0soKrHXzL9YNYs9Pnd0nL
	QUxq9h6xAM2ubHz5k5WOPdSHFMwrOF10ih6nNZ9WPjeNbmfRJLs1zpwxlWTkkDjRIPZJMW2rJKN
	SjS3jYqtdkY8p6yL5pP2Swz+A3ljsu4lvLCofbGhcsss3coSkZMJ0RoixYLKMOr+GtoWdsQbzQx
	0dZVyedSBjzZHbVIOttvZMr9B09F2e8NnkWYE0zE9YWY0HB3u+ik+ojf4ixeLKMGdq2Y4+iDMOF
	+Ev8c0JogfnOo7sQa+H+a/Abw58dVnjK11a3QN+OrYM/ls87NJNE9c6xViQqDd+koSR02sRrADy
	cw8jh0
X-Received: by 2002:a17:90b:582d:b0:387:e0bb:57f3 with SMTP id 98e67ed59e1d1-38941bce507mr6673928a91.36.1783587174666;
        Thu, 09 Jul 2026 01:52:54 -0700 (PDT)
X-Received: by 2002:a17:90b:582d:b0:387:e0bb:57f3 with SMTP id 98e67ed59e1d1-38941bce507mr6673906a91.36.1783587174229;
        Thu, 09 Jul 2026 01:52:54 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5574c36dsm822771a91.6.2026.07.09.01.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:53 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 14:22:36 +0530
Subject: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
In-Reply-To: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783587165; l=1037;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=uBXqfc4mbtwTmOdfZ2rYPKZ6TJPThoipKevya/9xmEU=;
 b=R+gYRQbVGrxaHiTRKfJDYrz0XjNuxyCDbx4jW1Lf4CNygeQphMdL7BcC8MG6qG7tH1zGX5Rnu
 Uh0S/vHgvnBD6Uj7HOa/Whj9Ty3kRDnzflTxYBv3a7/IfCgbA2JN7t1
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: vFm7s0Bg4IDW5xFVRG_TzAvzU8me8xeE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX5/sqqoxHgGpE
 xKdBuVAEcXvcpuExowj3SXPCXMu/71BTvhlPpnwDJL5Dv9pW1WFhn/wLzJ5Euwj/9nZTei8SN8P
 SyAxRtybkbIXSqmp0yM5BLtlfpZ2Icl3EamO/65BRmGkhLKysW7aAd8KiXUtK6WLhhLTIIGK4fD
 RnMR3OFDIQaXNTOGNKZvDGhmTwZKbkBPRIYxli/VGPueMuNaMuwgb1KRUCK5ziOxoy3uPvi7+dd
 bu1g1QXfJpfftgu+9KoMD4dU3IOr/GhnsKmIv49AgSkYHXbWjamBZwzsMvV/hrYbE0gHFaENGQb
 zH26jXGweKzlz2Fvtlbimxj0uNXUU8PLHlwrLVIpLif76nYnnM//edj159YfKlt1ztdHn1tVpQa
 CDTcDvmxKekmnQynuR48ZsYr927ljip+9mqeEnvSMlgWaqg7n4wOmefCmi6CcQkEzz4l/PZXU8T
 s0I1nj4uR01jS9BJyqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX8HADARIfqRt9
 RbjSqLF69Oii+G6galLuLXvfMe3jhfSEtiEpSSAvIj76l1tBVBL410naZhSNnBKoamV3PSXhdSt
 XnOBxppCA375P32/zUQr1BKookiWnVQ=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f6167 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Q2m6lpKfM9RfMUJwhvMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: vFm7s0Bg4IDW5xFVRG_TzAvzU8me8xeE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090083

Add property "qcom,has-eusb2-phy" to indicate whether the SoC has eUSB2 phy
or not. This is used to modify dp/dm interrupts during host mode suspend.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..0c6a839be82f 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -152,6 +152,13 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  qcom,has-eusb2-phy:
+    description:
+      If present, it indicates that the controller is working with eUSB2
+      phy. This property is used to modify dp/dm interrupt configurations
+      while entering suspend.
+    type: boolean
+
   wakeup-source: true
 
 required:

-- 
2.34.1


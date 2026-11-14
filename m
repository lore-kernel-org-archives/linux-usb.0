Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670772;
	b=d7ARf2XBjf0/wC4du+6wRX6w2rKfcXUS1Ize1P+glBonfkLUq65vc95qddQrjTaWtKdz
	 q/EY3IZU5JcTpTSh1ZjDznEAWXtEK7RszaSh2vE8cxcm95zfAP+XwJLCvvfDRRq267Rb4
	 yKpnLSG5CwB667cfZxXIVB74RwyUyLeEC84rG0T4bZn3XKkzMf45zmjUgmp1Be9uVbSkC
	 /muJwTUP8AL30bMy5fenPGR68AJRJFw3x8HNpu8UFQRmO7eIWdKdAK0pUjMu92UqKwG+p
	 PPDLicRrqvaXD2oNYm3FUDeSOzJTl+fKl2wuQfjUqnQ7yBne3NoVE2vXcxLXLlHboVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
	b=ODZIS5mRS6xmMsm2ndKwiRHpQl1x+PD517vUkjtKwAYkpOyGaaM8FLPKiD6JY72SklVF
	 KJ6uCpUS7IKgb7VqiCsQM5xCahNCf8glOvIgYuUteqVlcfd2ZNYTFpgXyuxEyiqpuWJhN
	 14gIjUtTa4IvXMHLVI6c4aSXSiPsNojuLvYxDWXgDWKFQegSkmH42g08h2cquDeriEVc0
	 eRa2KuhrnEbH25C5cPkamOwPwpAs3FPEwXmTBQWW5nt94w+OA/e0mSbxOPpTwWFhl52cX
	 mab0+UcuG8eua2zFQAooIZebRgig04/P5TFVQnzXcMM8b5ljhbgidgiYhinPR5tHiIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CdQYFmAN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ckjtQ2E/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BDE60A2615
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9BDE60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CdQYFmAN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ckjtQ2E/
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDl7tw2215811
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=; b=CdQYFmANNQYaiL39
	Qs3rz5EFvtsph67c3HwOmOjOgk4E3mZ+5zvqvcHZq2FP4R4vdwxYkSDkWHNkAJ64
	RbuPE/xRu30gyYNW74rOXAGinif/Z2JNDoAPQFnSx8TdL9ws3qB/wdb+HB6YcDZb
	qNwXlCFfqjtbpUspOHmUvjZCLAwR58MeNrmx4WbYp6DQKrKLkNmgIP0ZQ+z5Cn5m
	RNfdM9QLtj+gFohFJeiOMPiVkSXYmyw3VnLApTnxR3rsDGIg5MOxXVa+lAgnooGn
	Wc+pd6o3d4q+/v3LoCyg2MK+IOcc9Y2EMpc3SQHQTPMIEn+YWdcPviTE161ccE7I
	aoIaHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj4146v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:39:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-946038e22f5so97278485a.0
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 07:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794670770; x=1795275570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
        b=ckjtQ2E/L4Srvl+3Mz93nK7kXVRQ8DbtOnrkTf9RMtoeqPlj3k2KKb7/GQefHmAzMI
         hdrp+ohUMyY6ci+CvJHsKoqt3fVjhwAJW75/PcToTUjdv85s711mG4gQHRocO8wPbSJp
         RgvKX8BYJPV+PPv7laeydy8vTnIKlJkBL8ZB0D+2/WpcMKd0tnYaLjr8lcGK508ogJG+
         +HjDcOpSXMVGl7/UZEUEkl5mCF4U3hRpukupHCmaSxFwhgfUvtQeG1nJ56JllZZh31Xi
         GEqEV/va/Kc2xQLLUQZXAtyF2Qt1kdryq5YS1KCHDIPCaViRzcIkmrthzr9F+39rLc3d
         kYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670770; x=1795275570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
        b=yBs9SznlBKVlWS4iBfMdKHYXMPdeX1QWmV8/LQVmCTJe4qBq773cbfKjSYX0odsKhp
         Ar0d7N5AsUP4MRdcbAkLl2Yv1SLBznmSCEXwqjUj0b0a3IIYVFsDEM943Sfwg5zFLh7S
         nKtNMR7E7Zr+MnEdtFDgiknt3BjejiAI381L2sl7Cagf6SDPXl3CaaYexG4a0U7IE4lo
         plWuVPqUc1y/zHY607GGDXsu8qEWiH4VpWjExV8Qm5aX/5AnwV2PVx5OsukZaBbxXhMM
         t6icjuGfK/5DWl0imTC3soXF3/bJK+oea2ARfQA6Ww4Aw6UL4atU8U7bSwactAicnFlx
         oyYQ==
X-Forwarded-Encrypted: i=1; AL+hErE/Vlu14gBtH1TTglLE/Ldcr9eKx9r0rDQxTIQLhKkhjyR57VgoGOU4QJpBfngGz95mXbcAsGX8z7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i5IN3xNO6ZYZzxH767Y0kUbBepKJSDI7JlyZRRMEto+hV4X6n
	u7xZNoKilVOkcy9BPszny+EsdIm2G5qnKF7b4t4duGkr2ryPtTtyiX45XQ6dkks09SJUD1yNNCV
	lqOeMuJfLcniEOi+kh8iFYjlbZugE6xHbe3xvgSALi4vclWvQ3hgxcFtBGymPjD/lQ5Dmdvc=
X-Gm-Gg: AYBFou3V033w4x+YR8MPXTOg6v31MD+Yh+Nq3BATv3G1aHs8Emdsvz3puAsaJWR3RMN
	eh2lFfK0jjTmaCy6l8/HEpOYwW6e5sNCoQeUHQCjVO8ETvh4FZWlhnj6/2Zh1ytuUnvKvBGz+w+
	9rvMKSXUd5SyN15KO2HKFr3XZDP5G9lfFizdnjMwzpxah06qXEdUhRFD65fB0KFXiIaUcWinaKP
	TdmWUJVvriyIN/pKS0OfcW9FI9Bb/C4Kk/BqBjxmJjNjGeZKp7REqfhjCV7ahnZ3py7aeXeJLC0
	Yh+ifcvQSKxCRVXEwYkAxT4XuZMSQIt0fuRVu+sjs/pSodo/5GEJHNRylbsZTbbJPjIymBxogrt
	Pw9dS+bCa+0CV+qoseTD6ZTLNkyTynW5W0Ypzvik5xjIRY9HnNKhxEXujjZrjH0b3UMrOomFE0x
	lbM8Sb0uocY+yo
X-Received: by 2002:a05:620a:444b:b0:93f:2ae1:ea06 with SMTP id af79cd13be357-9494bb59a45mr995697885a.44.1794670770333;
        Sat, 14 Nov 2026 07:39:30 -0800 (PST)
X-Received: by 2002:a05:620a:444b:b0:93f:2ae1:ea06 with SMTP id af79cd13be357-9494bb59a45mr995693785a.44.1794670769898;
        Sat, 14 Nov 2026 07:39:29 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm167268366b.11.2026.11.14.07.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:39:29 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 16:39:07 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: qrb2210-arduino-imola: enable the
 EUD
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
Message-Id: <20261114-qcm2290-eud-v1-4-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
In-Reply-To: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX5vLC9w2m6N9J
 OTvyQjt+yfmLmjvsVOrzWXXy51xwzPiJA/tZ0vsdvBlK2klqLQlBLFWWZJGgUHyO10ENEo4YHnj
 3j7h+1FbSRhl/HRPTWS3teSwx2VFbkxcIUGY0M0tv2QiDoZGgEMLoRHcJjJnhYp1RjfSesVm2Ai
 DQnifn8+MrqwNmPsxVpL6Pt6SzmkU0Fuvvb+ATeHbrSNwgyGmj/NsFp11svPC3h1AfXxtCAN5dI
 iyNQ6DeNXnf5+KSADLD0hOiN+QU2gyBresQO/BRycGdtogq3F/hjlhoC2LV7MPnu9prbzsjJQZa
 tstmQVSFsqrS2pTe+1YDALwUpARWRjh4eOQcN2HMRVwHy5jcYRdXKw9WsbExOV7vMpLIBEnMiB/
 rRB/cSLrCFOgDNXxjYAM/z+8C/GWjvF6BCVtqAIAq/ArNdKDECtJNWK6hNeUi4N0uzH5pUWhIyn
 tN8voUaTqw4VTha3wxA==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af880b2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pvBjvzZ7d9aESBAnF-kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: NH8SE9y1meaOwuua1CCmBeoObGpS1_K0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX20wQ79szD8il
 lROZ2JQNAKabKBa+kWN8cnxG9rCqC1e+3K15HE8zf6HHN+SPgTYxTa0i4BQRW2msfFyjPQ32nvi
 2Rh13YSlm+Dr8ByAgODZbzNtx9Nr458=
X-Proofpoint-ORIG-GUID: NH8SE9y1meaOwuua1CCmBeoObGpS1_K0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140062

The UNO Q exposes the EUD on its USB-C port: with it enabled, a host
sees the EUD hub and its SWD/trace functions, which OpenOCD's EUD
adapter uses to debug the SoC.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..a1af2caa5bfc 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -226,6 +226,10 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
+&eud {
+	status = "okay";
+};
+
 &gpi_dma0 {
 	status = "okay";
 };

-- 
2.53.0


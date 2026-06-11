Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C12B38E8CC
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168996; cv=none; b=d2R22ZlTD1Ea2q8JYfx/HTbEZpFqAagxhWkSRbSn/iVMKzDynIuDGRPGS9VLakCVGW2+dvuSk8EFL9HAet/j7ji1yhdtmuUi7zZ3wq0bcG+fJrlNLkykerRY6uz+lH23NjZCS7HVAopU1W4Cy/3aNcMG9x+fbVFlC89vM+/1z+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168996; c=relaxed/simple;
	bh=bqcfhdzuxUamPm1pdsfQKtg0uUtvUiezwZzqRCMONrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bawgri4wUHBMuhu4T6Z1cqGKDLvBPE+ptcQXRLoFNUkioWFoL4lS9EqSyRopeOVHBOClM78DkIYyopXWGJQN0N9iGNnqwM/M3YFMGGfty7kJectZEucPT/OsgrYSD/TTk+0tSdpAXGl8TBx5WFpvETK0IIF+1Q/4+E9j2G/9zEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZhJUN3E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X3XJTxi/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZhJUN3E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X3XJTxi/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GZJs3846464
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 09:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CQ+rhfBfk5gE6kN0WbbcckxwBkvmsmlYXsU
	RkvaMapw=; b=IZhJUN3EwGI32whFV3/hLybAvgDH+TZ2ThXKM0cVuaqaM4d3w84
	M5eIB51ljgniWQnUhsv6In1lYWWb0EOAJvw8RuEQXgubQ3r/4njw51pvdnVoXrNC
	uFriUNdU+HQBOkQRxLZ7vqg53VqZ/NRbmcpEuYpES29fdHk6nzEOapCdLTZBgCqj
	KPxP2JS248vFWXXOg0p23yi5oPAvWNVemh8K+gn7PwBpJDnaY4VnqukdVAc3G0lK
	LfAnhcAJDx5Mne15hYqHdPPowuNibkQn7katIrDWmNA1V+9TqXBi2WC6mmVSPD5N
	fc2iY/bockxNEKd2iaOuDB4uiNwwgNbxieg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u2md7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 09:09:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c86487a8ce1so1949008a12.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 02:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168993; x=1781773793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CQ+rhfBfk5gE6kN0WbbcckxwBkvmsmlYXsURkvaMapw=;
        b=X3XJTxi/3hZwTCF42KEzleuxR6VEeM9f9CsthLKeIws+g0zBC4xHpqf77mNZkaz20Y
         RR+l3mBrsWO/zZXdv2ioyJtIHQW6fS8P71FuyALpDW5538UCSD7DNEPCnqv/JGMLEeDc
         ecPATB/OOtKdO4JWhUyM7vr+Yd5DcmLk42kFDeJsGhSHiJDoZEpgSE9/oTxHjS1gubQp
         Nygc7olE7Itb3TAMYi+wkwrGx+dXls5zbJ3WPRcVE9fCV7uoqFm6wI5nuqbw0AlytjJO
         fzzVCY3Nqa+aIRwCzxVNVpwTxhdve6KTnIKuViu8byUquGMn+wM9QiLAsg5DOfl3338G
         KO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168993; x=1781773793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQ+rhfBfk5gE6kN0WbbcckxwBkvmsmlYXsURkvaMapw=;
        b=ZXeR5DQnXFbC+mXvGYXIXhBKkgUDyOR+SpRpUrbTVRqXoKJsLr+kzZ3l0oVTAyZTaG
         msgXdn0ETk7P8SSA5laBd33Pri39cgXt3Y/QtWfl2vIkG6j8tizLqlIVwOO7mf9tTros
         fpp0hCQOb5uOx161gH9+0GG7VD4lbaP8TG7Mhosh/HQ53D9VahnNXzEVlSoOxDMnA+gc
         9AGe0x8nfaKEsvFlJORIo7PSddkjWXNZz4ZbgAwnMqAWfdICQ5Jni/bBsSQMR3rD4vo6
         3G58x6sgyZEiimzzslRRt+IK4Jq2zPgZt7u74ZW3a4tnvZd9cErmyURVfWEbHXnUG/Pm
         Qfwg==
X-Gm-Message-State: AOJu0YwSboh7jwp6fr9NXYnt5wKTkY6s73aX48v2YInrsOsulO4m2wrk
	qbTp31sUbspO1DzoFkKkKjH33aHA15P6yx3zL4Cw/o+Iut05L6eopEIgm7Q5n9Yx+VKStUKwDcL
	8w8s/6UKHxk5vvFuRDwzBZAuZoANinSnwPtiFxtyiCrHFsTIXw/FrRTLCC2TkeOM=
X-Gm-Gg: Acq92OGG6pVHk6zjuaBeeO8NXAZGwifEkr9pNhEDndhFBklHPnINP0/xdnRvzb7RRlE
	IErQcnXcZSoztnPjfARZC2oi4AJfyv9E3tL+6Awt+W7X4kO63h//rT1awkJiScjFq+ILZLMWsYM
	1Wr9k0EDEyIuJdWFmXEebmbfkS1B5LbnpDXjI4CimqPKk4cPA0zVkuDJv+uVw5mxQmKXgeFMGBU
	mV2425zOBRLgcEUsPmIYkelGzvj759vvh/qThH+MV0vl84oNdAccKszYeyuOs8KFiXKtV40fo0k
	ontPKezmWeP4GSS/wK8DMJCCgWa7uVy7ahFSvCtjMX6GfrAgEq1EhZOAXOh3Rum8E+GQUPIC1oH
	vPwDiPABbndDxSEwKCxwzsGWdaWO126y/FK8iqmV+ouFz3hoe5mHMVpr/D8TJ
X-Received: by 2002:a05:6a20:9c8e:b0:39f:3efb:e888 with SMTP id adf61e73a8af0-3b5e326c692mr2283440637.25.1781168993521;
        Thu, 11 Jun 2026 02:09:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:9c8e:b0:39f:3efb:e888 with SMTP id adf61e73a8af0-3b5e326c692mr2283404637.25.1781168993063;
        Thu, 11 Jun 2026 02:09:53 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8658610cbbsm1083490a12.17.2026.06.11.02.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:09:52 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable USB_UAS in arm64 configuration
Date: Thu, 11 Jun 2026 14:39:39 +0530
Message-ID: <20260611090946.2790631-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a2a7b62 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=V7zewc8DsbaxPfsbzs8A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 9n9GqYCO7p4V1yK36BZJcTtXkUkQmuUE
X-Proofpoint-GUID: 9n9GqYCO7p4V1yK36BZJcTtXkUkQmuUE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5MCBTYWx0ZWRfX1iwF2c08aPjD
 evExoGkRYlo4VSoBXqw18WlCOdwX3Ys87yRBnHvPpIU1Tlc8ZdEHAXKdgnUpWhMmwIQTWxkCgP9
 g4f0Iv+laEhJcb6ZWNCC7cSCV6KeQNvAYpIwTByHPc4ZwRLGEU+RXMOV8GbnU7jg2yOsUf8naKm
 BrOtRBfOq16I4oxMZyJdI/ugxCdOZeGN21Vrg6SV4p3zWEy2a9GYysxNEyKJMvLnNYDomBiY1P/
 d0nx40ktjoAuGvCfCGd9DtZl1DSeXXB2TDR4Tt+j3Bq8/tQU8MPZq89YYn1GWmvTkNfThzxFGFP
 YY73guv4LzJRPYBKQ1U3g/CZcBEdkOkbGQXMw2t7GApk8qeyxnDJlc+fn/dN1sssNeKmfqDfW8N
 jICGbBre/MUYxob2btata26WDk/tBEHqvVpqt+NqpF/9xOHMDxSTnNMq8S1WV+if2CA8lvralNk
 NA5ku9s1zSL5OwLbk2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5MCBTYWx0ZWRfX2KZhtPMLwEW7
 GMeTpS3B9zd71ACXEp6UcBhJJbfqmBv3kcSfxnvtib2xSIYcezSc4LnqNBK3E3YTptJvxAUQT1B
 o9bm15J2fiG0gvwXk6IEFkxbIYkxs1M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110090

The USB Attached SCSI (UAS) protocol is supported by many modern USB
storage devices. It provides significantly higher performance than the
legacy Mass Storage Class (MSC) by supporting multiple outstanding
commands and command queuing.

Enable CONFIG_USB_UAS=y in the default arm64 configuration to provide
better out-of-the-box performance for USB storage devices on arm64
platforms.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..f82e9df77941 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1216,6 +1216,7 @@ CONFIG_USB_RENESAS_USBHS_HCD=m
 CONFIG_USB_RENESAS_USBHS=m
 CONFIG_USB_ACM=m
 CONFIG_USB_STORAGE=y
+CONFIG_USB_UAS=y
 CONFIG_USB_CDNS_SUPPORT=m
 CONFIG_USB_CDNS3=m
 CONFIG_USB_CDNS3_GADGET=y
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452188;
	b=RMhdEa1/KLw13xammKy7wkxYJfmIqVYJPfEVAJ88gB1AJWOPBW0F/E8mHBbHC/K4KxA2
	 wUqQU4Upya3km3onb0Hzt1baizYh6/WJeRS9tKC3nibLXc2JSUDZcSODENQAFi7Teqvvc
	 PaYygE37eFnD+BWidk5nl+uZEqG0x8zLwdkMSmWeXL/g83HxPAcPWv0iKuXhe6gR/W75h
	 gQne5YAfgILbs7xt6RSusGVFf3f8c+5vgt/H7sksmM5DMkHz+JDD2VU1J8GVSt6+kJsFL
	 n2mmihIQjTTwLsTa26HUNFUe9zhhukoNJCJCI2QKhzdHNmOPcE3yGkn5DIkWLwfRgNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452188;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A5yNgUL2BDgyfbgrWsnpUHmwm50nYFdr8TLu0kHo2HY=;
	b=qbXGt05oKRKxzeiM3B/WiSR0ttXedTkZUmMO3JPkjzbjQtC6M4Xs4PZavqwzj9+iMUfd
	 ca9FSz3cY7OX1vBtocEffT7DvfWg55fxdnTDNPluj5/8OWVhSc1FOaN7cAZupLspRkPBU
	 X19UAbLx32I0dqRMrSsisFhcTxMW/8/w9IeoZPBvquwBqtQsIh3yvCCPE42T8bek4z88E
	 HMz7F2Qpp6XYi1cF5bmHxO0gOCDIaZY48jY6LRKW+uTZ+iZ4I8o+sJoXyLquaXaQdhNb2
	 22nm9bRBDTCcsgwTIBT/YlGtvfa2K37E4a51byhhhQIxMoN/+uXmLFNGi/PwfyyfZAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jVaG/tJP";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="DXG/Q+Nu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C936606A33C
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C936606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jVaG/tJP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXG/Q+Nu
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGl633025316
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5yNgUL2BDgyfbgrWsnpUHmwm50nYFdr8TLu0kHo2HY=; b=jVaG/tJPi0r5azqr
	iTYujdKSSFZiF0oXoaHGBKaO6GK2EeqBYYH/R2kMDVLZJhFMvnvC3N/l8UjI0KM4
	lx/0zs4BV6JRBDoWACHFkH/UWq/hTNj4fdCCTrHDOIO+Wd54RPFyg61POHHB3P8O
	P9KM2OyBzCWox2oAa6WxHIcVQJf5Qktgie1qgFlAfl0JvOcPn7dQyfkIzsE5KO4G
	Df7UWLuBZk4LdwSGEUYEctt/DZksROF+bfAYjbhNygHjCaItPhji+MDZzwUc1E8w
	Gl07qsYMsDkSxvlJQ3RhVbG4Y2JggiZoGDnrGbBNJgyF7b3uHLhMebIS7XkI95XU
	1q8lyw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pae43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:07 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99939c0007cso514087241.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 08:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452186; x=1796056986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5yNgUL2BDgyfbgrWsnpUHmwm50nYFdr8TLu0kHo2HY=;
        b=DXG/Q+NuMFr7Yuf3I6NXdU4VD17Nww2DhT9CBq+IlA59etn7L9LJ4qSbLU5gb4kX7P
         GfD1tMl87Gjd25P02rwETrqP0+4lzVp+OaUl8qGB+Sh/z0FtBn7d8aG3FtVMFHwW28p0
         ztamE50DOdvSyQLNm+r18CNW1X/bgAT+vJDA8O9PFxCfcAZy60NfpSA9jucMYfQ4mgVm
         r42/QUuXAUfT/rFvFHhm18Xw0qkVNehETSlC8AgfxUE3qULF7rPyDRp1HLIL+3QXC7Dz
         vp1lNqb3+QCEcKFjFxI1ROkQLJsBBBg4MG+4nHa8BOMppZ2pxuLrZL+wADSQbjNqbfmD
         3CQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452186; x=1796056986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5yNgUL2BDgyfbgrWsnpUHmwm50nYFdr8TLu0kHo2HY=;
        b=S4+rU5hvottUB65PQ3PgT8Bb7T2scVGlb3R+XtZ0Cof0uCDnyvmFOT03QnIdRkxBpi
         WYGB+3x0EictIzqbPnjH1ejKFNW6qvysaIkVn7d/heVV6D3hWjYyfAqQYlR2cUVqGA13
         nBHffayfb+Squ1o96IYbiu1+gvHUveqFIMCAxNgs8igKKe/wzDOutZ9HE3fyoFo8OAaE
         BFYwXtNXxmqrybtshp9q/D29IyQhJgwi89ruA1Wxxtp51oa0kc74LMpuGu2X0NAixhFR
         MXnYcxzbkyCPfDVXbspaBGYAnrrVNJB379DmxV3zISkBWYggiE4exajUWabx9HbW/1o0
         ug8g==
X-Forwarded-Encrypted: i=1; AL+hErHn3dYowqgBLiC58766wCbrKdmtylew+YAtnHLtKzKwsSydklZ5kfYk+S+XY4S0wGycuKP5CYHa/1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fZkQSpEZUciHWpwgiy5WEB2hFPJfaFdq564H4g6ST8OXsvZLI
	cupqysYnIFLkrX3ytJfn0lh9aC7NqS7PoH2kcuke9qM3i659Re6NqSweRaIImyQzdO3a1cxU0xn
	Eh84e866FKWZOFQvOPUWW1zZWdEieFNHPES1oDKc3bBqHi6OjpAOxWBwK5AfhNqU=
X-Gm-Gg: AZFdTZdRcNCDp4MIM25zu0iDxRMxLo9Xzm/7begFzHc4SLjPoaU42Uur6xeyOIcEvIr
	mYHJMGMRDdkvC3e11c9BSNHH8WrYoFAjYjpp3lKMfEiFpIwJ/89qmCHvo6X56HiEkA+UpPqjOO3
	crmu3WqnQoVmpRnIg+4Ra5Ly08w5p6ZbZDXQni4VZNOcknMXpEM/zaoV8bU7rKXvzhJYra/OMWg
	Dpx111je1+RZBhYV/J10Ecp6c/Irql+im+JceVni5X65Rcu6e4HmXWJD9gKotC1bwc5GsGAy9PY
	VoGRzqEtzmue13D97ddZ2YRToOvaQEbt+Cj3zhYNlb+/+kedly9tIPMnfk+jVTf2XKK7WVmVCaI
	GsqxyUY7Lpc18RP5nABWk+yDnQa/TeWaWkxccHIimsKEx8XTZbKf58Y/WCC3LBRPLCD2wgoWoU1
	K8gBHygjTt4RHY
X-Received: by 2002:a05:6122:2493:b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5ee8aeff63fmr5452464e0c.13.1795452186327;
        Mon, 23 Nov 2026 08:43:06 -0800 (PST)
X-Received: by 2002:a05:6122:2493:b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5ee8aeff63fmr5452457e0c.13.1795452185869;
        Mon, 23 Nov 2026 08:43:05 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:05 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:42:56 +0100
Subject: [PATCH v2 1/5] usb: misc: qcom_eud: clear the enabled state on
 disable
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
Message-Id: <20261123-qcm2290-eud-v2-1-9bfc432dee07@oss.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
In-Reply-To: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
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
X-Proofpoint-GUID: rqPp8mwMnxIkdx5Ao45jobxelXqRdXpB
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b046d1b cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-IlMunDoKa5HfhwsZc4A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX6Q5/qfI3u3ct
 ECoGqfhsQOeJjUlB3Oauf823wpVTEfwCe7pyUHuqwymq4b0lTsgBJx7CE+OQ24jjgPjl0GK2PJf
 70uiL79/tfiXATAahtZUASJmu56tAkI=
X-Proofpoint-ORIG-GUID: rqPp8mwMnxIkdx5Ao45jobxelXqRdXpB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX4+D5qZW4rWN6
 yB2t1rtVBScnLSwlZEFUxt9synmVDB0kwBKVNXD64qv1hGv1Jm7mma5WK9jlnksf5NUQRTxUSEt
 1jb2/fX9YDKFn8+s4HVm2/TMSH/d2ovFClWPABHtMhppw1P+xm8CGnV10jnA1YMHTd3cFk3/UiK
 cNrZMRu/jsJJOhzSZWYy7X/5rzowVEUiMeL87h0tY3LSZYG+MwiT1/TqVAXdPkNKtJzMoTL3DSL
 oglucomLp+H0YSlg/4VXuCowfILmIqwThkqEGLlQgNUxYPOrNgIfTIQrHTgh/MZDil+6t0gfZiP
 3ysz2Ae+PIDJ/65BLADz10ZYVaNEpwhC3DtH2ra2iTEMIyteYp0flV0zr0rgCcmRaYdNDt3ikZT
 swGwrBzS1HCesY69l+BFh+7skVrZyJgIJV1jJr0L/s16X2qJhUA87frX9fPbDQzEWgeBL4eTFWf
 ldClaVR22weWvqzfE4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230066

enable_store() sets chip->enabled when the EUD is enabled but never
clears it. After a disable the "enable" attribute keeps reading 1, and
eud_remove() disables the EUD once more.

Clear it when disable_eud() succeeds.

Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 73f9fac22e19..6743a1c7d717 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -97,6 +97,8 @@ static ssize_t enable_store(struct device *dev,
 
 	} else {
 		ret = disable_eud(chip);
+		if (!ret)
+			chip->enabled = false;
 	}
 
 	return ret < 0 ? ret : count;

-- 
2.53.0


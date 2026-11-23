Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458537;
	b=ZctrODa+0ZZ/ycms+DaWddAEntXgAVWbzu32X8Gcp6Q0o1gHlNV8VHiQL3eXtjALBBNj
	 oLkGfWJzrnDwFJR7jzaQjd4LGl6L6XrDHw6j0MEFYF4sqgcNdf+i7Z1Gi025O5ZQ44cd6
	 g4fXX6e+nc1Lq9ZfELFTbWTQLiLy07PUUvwrWgBfOoD0oNohM81TyiJMTvFMYbCoBQrba
	 9NzN5THaCmqxyGxzGZ+o1nLbcv4BXGl9cvBa4em+pzJyZbcCnqrYoblqCHe72DbCDULnd
	 3iblUX9mtgZl3N4klYpJkxWSEC+EVe4rKY4++lWY+dKtblHD0/urKqpRw1RigKHgkHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nhfcchwZrq5HVAFa+r5LC2cvCNyvuS6jjcv2doVhkDU=;
	b=G6aXC22C3W5ixV/xnwmWcQGVYUHi+m7m+rWS9hEbT+lEoKkP5HGN7ygP+GRoonIZWni5
	 UQGkOvzLAiCTP8iF7vunrJUx86JJRF6yMjC0+7inWF+F8NiheJ+UYtYDjauMVWwy6WaPq
	 wsoXASQ+UEf2A5I265C6mYeqPsO92AHkAAqAiILI6lZ5+OfqRRiAecj1s/wiM2vHANyD1
	 yEjSMHRzHBOc1oKBrKft0Ta7XyhKyM2LUuSK1ReNjWxzgOoAIDibiMXdfp4TEuwZVJWmQ
	 0ozL2ZOmxBFb7eAjaPXhnkIMh1IhHDomsN9lM2pZseNYCkv9H6gIIr3XJ+6iy9qAhzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M9BSbVdI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fK0KR2ha;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B6D60A2616
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4B6D60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M9BSbVdI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fK0KR2ha
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGnVe1861241
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nhfcchwZrq5
	HVAFa+r5LC2cvCNyvuS6jjcv2doVhkDU=; b=M9BSbVdI1BAMdhptdNQDL4nVZz1
	rEjTTxVHCT5UZS1IIOs9jPja/Wot9/8SjIdyJuhZLgAWVvb+tVuWe38LOjR8+4s8
	LiKBvrfdpOvoVmv9sgREwPpttVAP9lEzuPLQNmnNU1lAN2BV+BfFMqNKlVOI6WMk
	dYDQb1z1EV1nW9jj0QGcfbWkydajRhwDmB6w4AES8WlaS10GqaA1yM1USBsHILog
	F1OtBUMeau5y19Jn11LA35R7XwbCc/v+dQCyattQZsIjK3YFWStkjZn8121fLEdV
	E8EaGNkR/EdtxUjqnFF+WaLuF28qadDHDxrHwKAMm8yHjzglgm2VDPRlB+w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a2tb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so4505145eec.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458535; x=1796063335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhfcchwZrq5HVAFa+r5LC2cvCNyvuS6jjcv2doVhkDU=;
        b=fK0KR2haXbhjn09icUiF5k5tTPdJ+GtC7WJPAsIQcQ3vH6BbWYGdTTfAtnkA2F9qGd
         wNeidrgdPseOKYSouPW3sc+Yt7zjrlJmufbnOIPyMXKITvYPLF1pVZS+Yyqv8RyfpuLt
         bISwVR2gLFexPq2O28sq7gildWcryuFtXcSOh8eFVnxTL49GHvKc/bwZID3qzrJjKVfW
         Iu8xYGHGS5vS9DH4OHBpPtsWaNq3gL8Zbm4yM0ZXWTtMYGv+3kO90gwTtGx0zWbNqp/x
         ZrsIz+KqAnaNS21+iXpNunlzLRtjQ2bl9uJgB3Y5dvyfvmTOFMnpfpuOuHK4GnCpDSdh
         0Iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458535; x=1796063335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nhfcchwZrq5HVAFa+r5LC2cvCNyvuS6jjcv2doVhkDU=;
        b=jERwZwdJCqiR2e9GkU/abWoKa99in4oqcT6BvHO2cqMyDspIAQje+h9tf+sGhneCvP
         3CLcDCK0FjDla1dyZCRjF+eJ3uiUw0n02rfUFDIyqri5U422wH88HfIub7OGN2wXwZjE
         SWCSK9Y/wLJlcUk42CTcjr9f2z42v76GL1xoq6OG5ZzJ8W6NrSOtIWqPskRBFG1XXDUR
         en4N0WjgAD6Au/q8oOdbY1vqVqdx6QhLDRAYsdI+aNjoZcaRcSqDzvHtLip2C5goY7eX
         9vqZmmwpOphHM33kx1jqEq9Amuf4Xgm7ZWtOR2ahgsCZoqyvCrVcHO41NHezyfPxhZCm
         wHJA==
X-Forwarded-Encrypted: i=1; AL+hErF3d4Sm0CnQOylGZ3J+FRxr+47AcHg8TouYlcA2OVvB+iboTiREpms2TE3dU+qm2pFgJVJreV8ekRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kAiSYNU3YJOGmdwUcwJC5CIZJY0pU3g4sOzO0lFLqP2kLf7k6
	6+CIyWfQwz8ppvWYRYpkDczcg7ICQqBub1Pt7gj7hGfq1tW/hxkFxJqWhZ6LQ16UaY2a5g4dQIw
	8jff8uX0r8N0u/Drk03z25xhFE+uAhHEWXgaBnHL6BNd//sR5pbUnhRn65JDtZpI=
X-Gm-Gg: AZFdTZfj36Q2fyBPhZWT97wuL6/8z9cH511Xaf4TSUA7C/2M8fdv1eToJK7LXJjn5g5
	EXXqyN+BlSZAyRcpNyNhU7dHrvfDuzPcKvPUzB9HcBIT51AA/Yb+ttF0Na6f5Ptg0+/QqXdljwL
	wRl4mV8BXfnfWzauCvK+O4OELKOS140jS0ZiocUusjPpijaHUnaVrrh/uMGaNI/xPpkCDjA1+p2
	Wi6MgY2cWXa441BSmP/hlbVNFJddvM8DSMzvY91jNhdcDzdVBUEAOSrJKBieghbiOGpg5PDACUp
	sIlPXTrKShyHTNOazr17LNTijdmYmueAcB9xwr6qJUTb7GlncB1tuXgjbD092M3ySLdg7+ImtSx
	ZTEbIr2ExN4N7O3bKz1w23grUa5LJ97dcju9GhFl2UFCdJlhoFRArEaWdwNWVyh+lrqJN8ebgCT
	82Ak0sBY3BqO1uSjYpGMPX+3Admg==
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-38571816d35mr12339166eec.40.1795458535490;
        Mon, 23 Nov 2026 10:28:55 -0800 (PST)
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-38571816d35mr12339143eec.40.1795458534987;
        Mon, 23 Nov 2026 10:28:54 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:54 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v10 5/7] usb: misc: qcom_eud: improve enable_store API
Date: Mon, 23 Nov 2026 10:28:45 -0800
Message-Id: <20261123182847.143892-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfXzF+YeHVH7tZr
 ZmG+4rXWxNQZQiN/w7sbgqoLG1bqKuF6zxWj8/P2rgSkwfC+b9ouTC/MEr4mMiiCOR7WQ0tS6qT
 avsuyDOV5Lo+DlJYrlSDm/Dax7yF05c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX1JO/T0BRszPX
 LE+NvJR818TB/P5+vG1Ye1kxPfQPbVuAVPTaZitQO9GTZNc4i8kpwOCEUcnQL5bJOYZp+bXXZuo
 b6c9XqrkrdqFTu8+KUbxEfRM1xPEsrcP1aZaz1CVwC8eAt59HXcFUVxpTqYYksjv7S/A+hsn3TI
 JgicKaNg5BOh2oXsePkihfocgei0C+TP99wp71nz7orOrY6fLYux3EHRugLDFmZC543wfxS5z7Q
 jxiy1gPTXfArGr734YzvKmsLmuCjr3TvUf5DLB8Sm9Ng3s1EQMj1tAnQ5Dfv4sqj8mFDD+kJIOs
 61RT4NQvjaZyMuSiOOvztA7bTtGnuZM3AT6lVCdpyqpgN9zr4wtK99Cp7xVbKVifqDDH/VC9RvM
 yJda+RiCUeFSMAZ5Znwkg2sLdSI+jyvGXgPrt+aYDO7WOHl9+HGsLh4hBYlQw1h7ERfhmSRIVGv
 SCH/Bs20Qn19PDrWugw==
X-Proofpoint-ORIG-GUID: 2Wl9MF1wfw51hbMPznSGZtK9qYDjTSxG
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0485e8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 2Wl9MF1wfw51hbMPznSGZtK9qYDjTSxG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230073

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 2304402fc90d..9f26231b6648 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -164,18 +164,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1


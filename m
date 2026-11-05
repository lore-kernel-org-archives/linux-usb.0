Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873198;
	b=QmozxnHSIjY3YuhrSdRpjQHuOiLv490XkGUCKwsLLnVnwYHJjufdEh36tPOlIaKjtNt1
	 PMR3vFwqh1Mc336pbWAOvf77HuQBHGQFSkIzvF2rJG3/I6hBGz0KEwUnos8OjEA437ZPl
	 co24ngoM5d/EYNPVIIFisAnS7dmN4jpQrq3F480W25tmIJHmEnt6NqdOAV002CxRPrgV3
	 METdPrxx0zjLx34E0PpW7sU1v3my/NCpYDg/37+SJ8aZqPidNmcj0xbSd4OHcY1mrOeJq
	 KP18UyncdTkY3GEVk8AJVb/IQjC1Qtm/Fi+ZEpaFl9ZgJI78Np0Bon+oR/xwHOixDKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DU/vOX42w3GP81gwU32haFOM+yeJBosY6jLWaZZ+9X8=;
	b=sc7Rblpzaq0dIPp+wCmx6HIcr57G3JMXi+xj+pcu58ZfnePIGcUutBYzWuSVMTuPXUo2
	 rSff/ziX4SHiPsk0/cs/kTQo3LA6raHd73p0mmcXaFFylgKPNNt6FbmSTnTNUFUQmWL4P
	 GOMfD/4OB0rHWhYHoqtKTZBvD6yqiPteJ51vHkskMo+k3mZ+z4TWflmUVnQzpDSRtv+hC
	 58NJO6qaUNDNPiOpOIKGL96WoBypyDapyOrfj//gW4R+2e/t5o9Z/6Yt0YgqGdD/9Qamf
	 4BzOaPniYE/MvMXBUpWl+LyhcRbzuVn2bvScryim/xjDikHQH5gCQcqIpp0FZO9rfRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iq66cKjq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gbaXrJ6c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7219660A5BCE
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 10:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7219660A5BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iq66cKjq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gbaXrJ6c
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59thOe3532007
	for <linux-usb@vger.kernel.org>; Thu, 5 Nov 2026 10:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DU/vOX42w3GP81gwU32haFOM+yeJBosY6jL
	WaZZ+9X8=; b=Iq66cKjq3yYEL2naEJff+GMjZSETIrIg23pQAjdYO/3LsBr8bYF
	NhazVIm6DbcCo5gB/FfecqRkVv9jEh1p5eqdNgqQTFUzMVl7f+qmMlgKLo2EThvp
	b3Zl52OhFTLdzjJ0O1nQbhoMcxFTKj8sKFWAN6boKLCk+bOs+MJVzDPi5YCroei5
	ggkts9pF+czDWjNejC5NJ15rZVwJfYFcDlY+dkU4UOi8HX8eNSx5+3mqw+v1tdDs
	8TUTD3P8s3EPl0u4LevtkT3knVx4jjy2m7BVJrkJM8U+hkkz1NXEXLVIRMzbn6BQ
	kLa1eRu4SNzsYjX4+DG3xYWPULMclroK9uA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq92jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 10:06:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36c9e87d262so2302275eec.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 02:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793873194; x=1794477994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DU/vOX42w3GP81gwU32haFOM+yeJBosY6jLWaZZ+9X8=;
        b=gbaXrJ6co3KCPSM90yN96D5bQmIHQlBjL9NBo6bEQ7YWAAZUYagLoOX6Zwdzr4+KwN
         urLEMXFLzrJpuwaCFfYBcVlEBh/S5guGuEM399BoENvWcbFInRFXvEHWo5ABHUB+nykc
         wblvGTIsEgJxcUnMvyS/Jz/Gjo8J+JK7jFa0LHEqxflzkZGqDo09Psc+NycbgyPIbxFW
         sSQnY+JeTJgkE6C9qPEhaeIVf2r5zYY/n/qah2DheDzNRGD2DO20rYt6E8uBlLgPapyb
         KWzioSn5Mt3zieZeY2pHeMEwY1QXsX1tB2H3dL7IsOug87sf9a9grfbse3tIf4blXQxP
         oy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873194; x=1794477994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DU/vOX42w3GP81gwU32haFOM+yeJBosY6jLWaZZ+9X8=;
        b=g2e6+RbDAxYnAb3c5WnwRhcEfW15zklYJw9ioY4WZTB/jE61iSZ1nGUgkB0W8+0eK4
         yxMJbf2I6NZYsjRaeKdw607YteFMLf3vuAQFs+Fv9E3VwC5AbwUaJt65aKGitJ3L4BMv
         B1gyShp3DGP9QHJu2QBr52xEcXhjJem7IwZpKp7dHVZQpaFO2s6eI9HohLOz38GbrJHm
         BxhxJJtYS3ueU6S06NnigC+KoGZw/js64xQA7JqHibVfBk7MDAIJlA0XaCtoB5ueePk0
         yXuOxK9wdPxwh3e3Ti8gvitwI0tD0BkonIyfxN/Gc8ZwMu7r7z3p0J7uNWi4lPSR4chg
         9myQ==
X-Gm-Message-State: APuU4Z8xURupa30+8Li8u/tPmLF+Z0Lh+YPMTvZ7zGwmc4599hxTdMZW
	HUoSRBcyY+ZAmzYDpvpjZk5vjlJE/7PTVEPqH1eNuv42c7cmQaXy3DywAsCW5ckVsrGAstUajPI
	c6kRTBZOgDi5RMZAm2ox0t7QTggPRfE4yzjipiPLR7TOAmFfrRfW9G348C2LU1hI=
X-Gm-Gg: AYBFou3LKVSHXwAp2JO2KG03wq+FaNAQ9rB55295FMgBQb5b/UGj1pozC/7M8/bsglh
	aRAwjVjOl0T9hY0T2QApokAshU7blbfEt/kfRmX+B6EUabaqAUyQbB2kf8Iu63TgGlDUBdQaX4q
	EGOh0Eezm6RVE8EwbYj9W0RuMxVMWtdftOCVgU9nhstYOxErGtk5KMWYOubzzFYSk9IdsxAu+mL
	nGYIHmzWR0lCoXhfmF38dRIcUdyLsyR7jXpca6ALVDpbJIQEC3jb23WrorZcYwVNsSjY/lbTZoC
	9nAyhDrSYiioC7Jjnix+CO9PTyp2Y3natjjFi/C7at8vMs8CFZfmXwj7uyeWKo48DrHUqtRp5jC
	wTLfcIE27FVWoOzwVhYoBtoWHaURCgyyE1zGJx/r0EFdkM559PlJV/n8D5Zr/fhgQ5D6A5yCsTk
	kO
X-Received: by 2002:a05:701b:42d1:20b0:156:6676:d0e2 with SMTP id a92af1059eb24-1ac5cb1aed7mr29126428c88.10.1793873193867;
        Thu, 05 Nov 2026 02:06:33 -0800 (PST)
X-Received: by 2002:a05:701b:42d1:20b0:156:6676:d0e2 with SMTP id a92af1059eb24-1ac5cb1aed7mr29126382c88.10.1793873193120;
        Thu, 05 Nov 2026 02:06:33 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm18719239c88.15.2026.11.05.02.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:06:32 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
Date: Thu,  5 Nov 2026 15:32:16 +0530
Message-ID: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfXw8arIDWZLSA0
 UXMQX+3D9jvF7Eug7YSsWmCAPi5VUh3AFiz9oz8jsThkuMFE1uClPTWv2Q2mNDkpkd7gE6YI4Vn
 ZfMLokcAJWAZlv08omgczIWXAxIlyKG5X2Hkp31fkx729rl6qJgLgvEI2yStmfGZnrpbkj/MgsJ
 6/kw4+SFiQ1joiKK4Shv3exPjAV5f/Thu5eT1LV6xYd5Cb/mN5m30Ml6VnOaTLtuz7KGqG/qwzZ
 fifEa/nYNA13weDPQGzbjw/8JmTnQ230HxJUiNVDu8X7Vjie81mGsfHaPgLCTEk72RK+3WAO4jj
 lF4is/QhfOqc7EC9XBu43m4W8xd+UPqcpF9snb49AYT4Abzbg++np8zieHvbu/o96Q+wbu3/Su1
 9bytIwUZXhCApmRxPqvevxdSUHQJ5W37hE84ShEDC4TYpnXf9fZmoccB/l1W4cLAulF2uRyfICL
 Itw1JHlJsIc53H3fKAQ==
X-Proofpoint-ORIG-GUID: wLlIBHTeSJCOmb2ktAqKObzwxABilLLP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX6ABMgjM+hKEy
 Wysu+cXEyJKJOYVZFFLvx42s1tS2v/WiWCOYYIhs3rV69CcFrPVAhRZYmL8IQ6E6WF17w661Elc
 9LDe0TbL8eHpKz9d2JCFz5bzKwmYP3o=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec552b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pXwHkFXhuZ6WPUJZpREA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: wLlIBHTeSJCOmb2ktAqKObzwxABilLLP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050040

Increase the nominal max USB memory bandwidth vote to let DDR scale
higher within its nominal corner, fixing glitches seen during
simultaneous USB audio use cases.

USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
MB/s, ~1.8x). This ICC vote does not by itself determine DDR
frequency; the vote-to-frequency mapping is platform-specific and
comes from each target's interconnect/OPP table. On the tested
targets, the old vote kept DDR pinned at 1 GHz within the nominal
corner, even though DDR can run at 1.5 GHz (+50%) within the same
corner. At 1 GHz, glitches were observed during multiple concurrent
USB audio use cases.

Tested internally on RB3, RB4, RB8, Shikra, and other KLM targets.
With the updated vote, DDR is allowed to run at the higher nominal
frequency, and the following were measured (not merely projected):

- USB memory throughput: 125 MB/s -> 145 MB/s (+16%)
- RTD-USBC audio latency: 17.9 ms -> 16.6 ms (-7.3%)

RTD-USBC is the round-trip audio latency measured over a USB-C audio
path; lower is better. Note the +50% DDR frequency headroom does not
map linearly to the +16% throughput gain, since throughput is also
bounded by other factors along the USB/DDR path; the frequency
increase is necessary but not sufficient to explain the full gain on
its own.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
v2: Added Details of targets Tested.
    Added details for usb vote.
    Added KPI Details.
    Dropped USB AVG BW vote change which is not needed.

Link to v1: https://lore.kernel.org/all/20260611081831.2743464-1-akash.kumar@oss.qualcomm.com/
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..3a19385969dc 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -46,7 +46,7 @@
 #define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
 #define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
 #define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
-#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
+#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(4500)
 #define APPS_USB_AVG_BW 0
 #define APPS_USB_PEAK_BW MBps_to_icc(40)
 
-- 
2.43.0


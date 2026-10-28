Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214031;
	b=B1jWCn+1TpsURjRKdIsaaxsBqVcfYcloo0eKmZ8VYPU7jtI5KQPvpgygD0OnEg/zh56P
	 +tU65YHNdXXppy57wYzHjFKPbhqZ62UKM7HzyQr6iT00CQGih8nx3MXWyXYC/pH92JIfl
	 A1xKSkKNICDVUAmTX2QFiYDDZdE+HYs9mcI5eC0a3DkiVa4YqE23g0ercrAWyxpfdJdJs
	 SoZMYa2Ue9kpK2Kon+TN0lFhq4HVACc3eyVjJZmtCO5viWDrYA6BO1Bb45kqiMNX1m7w9
	 AyQD25JsVogaq5FkfyXg07cQuEuPrLTvb+laeSmFkuMc9HPPQVA9dFqHNhE2JhJMoQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ihzh9krNeTK98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=;
	b=LeVYlGZ8n+Qx5vwfUr8i4C/512XLclOgvwlLVEasqFjKbCPoJHo17hr0c0lr1n+lz70T
	 lozNRyU96x8MR1A32tL+puJP4bjNxxNIjtKVH/39Wsl1NUpOP7DB1X1R2gKzFKYt1TWj+
	 eESu5lnTaHFgyZ4wemnNShrcd0J0QC7Xhof415jaejSADw31NUxJ4ztTbkjUz4dTQ7ZA2
	 q+r7b9YpbsxMhuhUWyKjCOs4LAsaMqOD/5WptQoiNCVm38bRrjZMVrqj4EmuFMKIssuzv
	 sN5S9P4fQq73GmAS+zm+W5tMs6vZFC4Eep1O/7XowmvWONxFaopIlmFMUsJn1uXIztg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J87loaFo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixuuXWe+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7464460A3811
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 19:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7464460A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J87loaFo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixuuXWe+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPCf01026668
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 19:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ihzh9krNeTK
	98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=; b=J87loaFooyki6t56M+osl7xd0Nh
	0J7oCPNoLJIdleMrM+mZXByx8GlkLvKz+EQgaQQBroSNN+vh9+9UmMnu4a5zKYHP
	anIYVH7AoqxYaV3Pu4EmPPwrGZVUwIGEjhs0a+eFCQaKEK5Xw+BQjPfSGWgabLX6
	SHKmoho/ynimbeplHzz6B4V4gWHj8Uv9pKQS5dxRwKcSyrKrZUDWKfIZvcbg1VLr
	Au8bjJUg6WWydu90Y2TGfaFnWE9uI0XmiWc6p4W3NxIhrym1lqp4im2O7W8RgleU
	7/W3wB7Qa7PPjfipEaKVbJkLoMwwXRMwgfCWNG0aF8NGU7H+6FlpsAlrJUQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb28dkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 19:00:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so5085194eec.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 12:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793214013; x=1793818813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihzh9krNeTK98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=;
        b=ixuuXWe+a/v36SY1H6f+VsmVNlIuo16jnlxGJ6QkBHYYvFAPsYqW5hQ5iVaaLch13L
         6wVRd8kR6HUcN0Slcpw9XQt221knO2eFnGLoHU/t1vWxhMCzdwOqQ2zuIt2jX4Y2Y25c
         TieQ6us5zZMcinDjkS8FBF9CgFAsnOEBZYf1Bc+Vlx2fz83v1RJ7eIlFnWuhqmLCOV7j
         4DV3LdDLpbUsKjX8UY84xoQpJ5ydWa4acRY7oL03mgvW2cyhGXqfC5SGjk+pal6yz7Hx
         tnICGMs2AYsyjZuCAPoqRhkrw6+4TQs5KDMXhkBEnF4RQhLt3LpjMrD2wSOZRP0P8q8x
         0DEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214013; x=1793818813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ihzh9krNeTK98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=;
        b=GPYIV/EyOiv8G+tuj1LTpbRhCMHh9N4CYAs1K5a7b/523Adn9PlYSysUpmKhQHB5nV
         qhhJ42S7UtM4IhL5LKYDXllrlfPkZBb2LyGJfRlcIS78dy1A2xpfkX5yjO4CZN6gRF98
         ITxiWTk/aJv4lfiTBcx1tZ6K6kLv0YitJGn3hX+ymWX/DrlfuNNB8WrHPJW4mPtwEC90
         L/bmRoRoIdmZ+alZlyH5tIIn2BAz+QErdgP/EKwuLVSn3qEDqPdWmObrd7kEN9tHR38A
         AbmljFO9x/5FDN/NnLS4azQvdlgsRuH0256hWLMWu18BtN3aR+zQSkPwF3m0G3LBEK6c
         dCqg==
X-Gm-Message-State: AFq9FYIfGBSVHPC77IN9YDaCnbU2ct3Tl5WCqutNmf7WKGZoRIJI2hDK
	HJT1mCMlt/H1dJO1McFoXgDopym+f8L8r57iM0/HvAF6DThpUw04hjw/lu4ht8BnOYi7QGCtVDN
	0vPUAYCyFrkWJgyBFacM4b51ZT58YVJg0QYSHqUDWyS20YYqPCJvCchzJ5guAENg7PVCwTs0=
X-Gm-Gg: AYBFou3YTZbNR83SaSsVZKtMWQkcvTY1V9ZxjsSHxFyz9i+gJHFgdiWlDh9laJ/2O2b
	wEeOdq0EnHxgokOscUzzHhYNqh6zUWx8lnOk9XcopZHiXuyR7D0Uh85RG5G/nPG3ZEnsoJF2geJ
	t9ct0vm+xt016OGc/BnfPNgl0gG0AwaFiiWMI82EOTbwq8ot0iJPTZ+vawYftsE+8a3nzTki0dd
	fg8+7Ta/9IjIyexNdAnof0wYVN73VHsti8fyxrkzdTeAHfARIX26lgaaO24mRiJ8KxGKKfgcmnM
	d2QkaLYKfkRyLu4Q9a3jSE/1VQ48BQ6Gy/FvcA93LviU9fltxqsHR+x/YrMdR1/XOSOSrqyeV4M
	wZ79quhTuF3S3DHTLSHrFT2U4G8Y1MvGb4716w/KiDUov/hNkI945GScd0E+oMvfpdwjRsllWXU
	6/uoJ7CA==
X-Received: by 2002:a05:7301:29a5:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-36a203efd45mr4646590eec.20.1793214012803;
        Wed, 28 Oct 2026 12:00:12 -0700 (PDT)
X-Received: by 2002:a05:7301:29a5:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-36a203efd45mr4646546eec.20.1793214012227;
        Wed, 28 Oct 2026 12:00:12 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.12.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:00:11 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] usb: dwc3: qcom: Enable VBUS override at probe for default peripheral role
Date: Thu, 29 Oct 2026 00:29:37 +0530
Message-Id: <3c1778a36380bb6d9123c3791f15cc3656b80145.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae2463d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=KL4VWcfqKbbHtFUGL8sA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: e0F7OF9-jt7bqhYcI97nteMlDBHyc3y7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX7ZAn+0ROmVTH
 RXbnoILyTjBCm6NuaV7ackX04uG+uDNJkklqaB5N8rntAo7/Jri4yktYycwhJ9ZPphXMnbyJsyQ
 vWUMGl5pH8OrWAT2x6aotQ45PWb0KzI=
X-Proofpoint-GUID: e0F7OF9-jt7bqhYcI97nteMlDBHyc3y7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX0IUTmc6UQD+e
 IEJtT+e/XnMmWiWVt9oY3wcf1B5e2UjPHINDcIPEwJ0r1XDe0QHS/NafV31cT0mg848D6ltupc7
 ISmue1OGVeo9vTYDxoPVN60xbpzzi/G8TkSptwZXNtOQTodLsVzYZJkg533rHGHcrXcnc/ZuhSP
 xWrqszODpeYJhmiVueL9BWm8FfViNekEUKT6jct+agqZTl30/dELXT1qTrJV6f5xQALpQFl0AQw
 dyGMFCmPewkun/kd6u+iXlj4ybGwuJZQWn0Waowm1FXfxQGuZRNoTKMloIdttQUYdO3fMkbuB4p
 NdtdigwHcb/rc/MReHhuk8tPxddsXJ6ugfERgSIsnWTsaPz3oH1+PplZCwNfw1BlUDWIKsYGS5H
 r4Yb77std4bq52yl1vbNhSlcu3CVA/Y6xtQvfTPjbSqeAWmTxMTy2Zepi1gOAz/+tvOTHIQnxVz
 rNhN5uipJgCRIHRND0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280075

When the controller is in OTG mode with usb-role-switch and
role-switch-default-mode set to peripheral, the role notifier never sees
a transition at probe, so the QSCRATCH VBUS override is not programmed
and the device never gets a session-valid indication.

Enable the VBUS override at probe whenever the initial role is
USB_ROLE_DEVICE.

Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
suspend/resume iterations completed with no failures.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 0896a323bdda..92f1223f7b21 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -953,10 +953,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		dwc3_qcom_vbus_override_enable(qcom, true);
 	} else {
 		if ((device_property_read_bool(dev, "usb-role-switch")) &&
-		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
+		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST)) {
 			qcom->current_role = USB_ROLE_HOST;
-		else
+		} else {
 			qcom->current_role = USB_ROLE_DEVICE;
+			dwc3_qcom_vbus_override_enable(qcom, true);
+		}
 	}
 
 	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430919;
	b=fFFgzDe2XH3Jh6P7E+Sf4EWEA2LRTsUzsezY2e5wu0RchAqqtjcTVaLaLm0efLGXtH4o
	 ZI8AffBFuT0J1cx+jeqC/O5U6PgKCo072ttQUhpie6FSZuTimwqn9NfCnlnJvDESDZ4pt
	 NmUMAv4eKDp75uaZMXMzxHo4jBmaWTmLzeh/QlXPjs/iGajgVwk5vqzwQN+AQM9GH+l9/
	 kgT0i7EHh1GRh9khagg72Tgiu2lJdE3WKq66fJBxvH6hh+6AKuFd3nbC1aSTZCJyOuos/
	 y24zfA3wEZ90mblxGScXTQCQ/uwNl6OG0QfOr/GW5nlOMU1vRmVamIY+MdMLGIpbyeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9DuQUkmVsC2nbsYQKE93igh6iDE3a7mvoD13FupPHR0=;
	b=hELCXkCyWqgHWAc0+3lZM4f0Ytj62k2Ja6BSQLDYdK5zDLG5cNwiF9HkSfC0p0VZ1pdX
	 A0o1uT/TGFWrqySihvDILM7KxGhshCsTrQA/9deXWmWoY7BDvZuLEr2i7/eKEywdOJE48
	 +byukzaYoAWcRMCKyVeW6+VpNgxs1HEXSBY7OXEHPWtiTKHuspHF5zWnpN2hP7EBWG+/w
	 bzctyQK+ZQwRXk/cZ0ZZr0CfJNAYRNjpyBngLsdNXjaN96bt7vHup4koc/fKRbN91LxxT
	 7eV3k8rYWzu/s5/btaeH64j38sJFHhivd/IFIIS1Re/aiVWWHIJW5g7aaK0Htl0llgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aixyfQAA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IisZDukj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8805606A680
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8805606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aixyfQAA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IisZDukj
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9GDKV2073764
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9DuQUkmVsC2
	nbsYQKE93igh6iDE3a7mvoD13FupPHR0=; b=aixyfQAAzTnHzCSpYwJUdInAifh
	b2IADcOH3PSgNZSUx7AasPdz54I6rkfwVfngJTrXwqFyaDqOboApeP9SDebMpPL1
	XxTQBmWkh0UR72NQxnER+Yt4ACfDMZ8Mft9qfMxRcyS69lBXiYWrwzNRSO3RamZs
	F2ndQoYFG36HjOqV1q60IbOz6W/BjN/peiesUUhbA9VGd+8E5hYUvxEzM9u8utUo
	oVOcDX/SjuGB3boCD3zvpFIFxypBbvtHtKAISIMVvn7SJvYnOacY60FAh+r7Dmi8
	uuHbsm1jIdTpt0mEbCkLfNeipz7kvaRgO8qgOlxdWFwe4RR0t+AxSFajrJQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p90gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:48:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdd77f53db5so1625024a12.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430918; x=1796035718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9DuQUkmVsC2nbsYQKE93igh6iDE3a7mvoD13FupPHR0=;
        b=IisZDukjgMdkwfp86ri11ABle3ubHCz3FAZ3ADC20Hm9v8onFzDT+xBveZqHy1RKwS
         51+9wVTm5WZdcwHU2+YTpT0PkyA6g54jHM3rj60plaFeHaLOeg4+yJvHCGrzTNOqkyDB
         PU1gTqizZYD8P/RtDhF69ZFBhtJA1Nd5M+w7wH9RLUEQHho9ESsDPxLgiesmzsm2N4B7
         inlGQurb6NSaOq3ufVlLQFd7puA5VWNtVAjIdb4ApkF2ykIFgd9lUTYDi52DVk5nHZWo
         cM72XS9iP1zO+Z3ph/1Xk5qYY5/zcVDilIYxyr5fzuhQQ3OiH9UE7usoyYalExnwEzjQ
         JExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430918; x=1796035718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9DuQUkmVsC2nbsYQKE93igh6iDE3a7mvoD13FupPHR0=;
        b=yDT5IuaYus0yqaP4e8nwBi+5Dnfn0yJFZaOzLtfhLVwCNSeC4w+FCsCwElAEWSmdLw
         IHjkTEHq60KovxBhIZqZySyj7EdHTbfKZxqOucySEAxVUHBxAPPANxFqGYJLmx8/hZnf
         lARIEFEeGm5yQt7+KQj7xwD8p/YIy5EqfxJxfrZzGhd4p4zbN1cnPN2ZEr8Mqr3PqFtt
         qvnOWZfcnMflmHEv613rZ/HWzrGlJCCTKopNKYCA0MSx4rQ+C/oZPjHy530+xwLRR4ZO
         B7jN0cMV6Tl807iRLy0IQ+GkAjGOtOZtuOjTpNrSvCweUi7UaoUOWwm5Rk8HFUQoNeYT
         rgAw==
X-Gm-Message-State: APuU4Z+zV+ylhFIdF2byYyU4NKJ0DM13rbLAnFwwuLqwkPV+vqYT+DEK
	+y+CuHNK9u8jVURCQgCDGuySWYitssrXxUPjPp5DdX5gO49LiClSBJUksEFPblrp/3NkLFg7Md7
	U3WMwid+Am2pZDDqf9ktR1UjNhed7oVmAiSLi337YuVoJdRlDzqW0bvSR7TJIzfU=
X-Gm-Gg: AZFdTZdTU5uqKhBnP9oMAAtwW1Hi8umMWjxtx14n5ndbikB2DIas8PEI/WwEZJN+YPM
	ejuR42KxhBxI952ObJMtQMupRyQRQqji6MhTIPvqNcCUk9hJjVYYcdNuGpC9Vz/ydhB9WQg9BCb
	7ReW7Y/acjWvvKqKNZpAgFuUCPKFb/LVUW3iLwiVGQWVQaLeSgt4n8qm2Jxpz1t0rjqXtVfSBJ5
	JnfvGAFAFotCRDjZM8OAVI9fNUILKOuS07coxpNGMPdocG9VRH7MsMuKfFk9LpOLmgZa/+kskp1
	KB72Pw8CTxVMxaJYJtmsn7DHdco3lRzlguvCFdU6cJVaybI+cYbuv0w4N6ib5QJ5zP37lJgUq2W
	FPOFewzKGJKRKafF28x91Vh2HAOXuDZ6330kWkew8W/lsTgYeTin8CBBTbHtGTE478floho8ysk
	ySwqLVnQ==
X-Received: by 2002:a05:6300:8095:b0:3e2:83d5:191b with SMTP id adf61e73a8af0-4014c25610dmr9462414637.63.1795430917714;
        Mon, 23 Nov 2026 02:48:37 -0800 (PST)
X-Received: by 2002:a05:6300:8095:b0:3e2:83d5:191b with SMTP id adf61e73a8af0-4014c25610dmr9462402637.63.1795430917261;
        Mon, 23 Nov 2026 02:48:37 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:36 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v5 11/11] usb: dwc3: qcom: Enable VBUS override at probe for default peripheral role
Date: Mon, 23 Nov 2026 16:17:26 +0530
Message-Id: <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-GUID: eI9yN-Gnx57qiMxJBRPMKlNSdY8DACge
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b041a06 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=6vjEpHyq_EskaYpSVAcA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXxJzFI/G99QNg
 evQOUqPBCq9Q+k56AlseSBsjlpwfipya/jDDobQ5cCGCBsIoSSGgiinVR5iEpr9ZhA9RSRByE2b
 t9WgdkCCZbIoC118nPled2ah2URUkM0=
X-Proofpoint-ORIG-GUID: eI9yN-Gnx57qiMxJBRPMKlNSdY8DACge
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX13/gUcUmxM/O
 ZQcuVWq0zoHTJ3vf+ZTwmlNu6JQgPTu3CL9hnfx1rkOFuzJ+OwVAeVbZ2uRa03+tTwYUzN4KHYP
 ZnjUS8w/mXryG6YEWIKFTDSrOWKLE2FUfvXNkDdX2dHEQeiZWEJ9slZaJRBo7jBE/jhJQmH+/hE
 1AiKLTNPV36GLQSLr9euv2tb1xUpXJBUhB4zmyXya4x5tdpTFxOG0EX9B3Eak9jxDT0qnNY3oOE
 dfK/hEJvCLarXROYTYAI9QBafTdLk6ydD8vcWrrcgFawmuYOP79YRGgOtDMrjSLp2Z6SbmoK1i4
 WDMHGENoYEpE8jGSEi5bGieUqwa9md8uGo+Z/mc6HrfKfBLW3BmG1NyWUNDvOe9vz4QfZBueOKR
 IjW3KS6MvjkMbloLmKRTwWbLofv21j1pZr+59CjsCjy1KueDyxnB+ujXajbcqCor7KV2Qt1M0g3
 OYKx0NJobHj3ROZ9btg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042

When the controller is in OTG mode with usb-role-switch and
role-switch-default-mode set to peripheral, the role notifier never sees
a transition at probe, so the QSCRATCH VBUS override is not programmed
and the device never gets a session-valid indication.

Enable the VBUS override once at probe, after the initial role has been
determined, whenever that role is USB_ROLE_DEVICE. This also covers the
dr_mode = "peripheral" case, which previously programmed the override on
its own.

Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
suspend/resume iterations completed with no failures.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 559de5172e61..22b6c7ca0297 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -964,7 +964,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		qcom->current_role = USB_ROLE_HOST;
 	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
 		qcom->current_role = USB_ROLE_DEVICE;
-		dwc3_qcom_vbus_override_enable(qcom, true);
 	} else {
 		if ((device_property_read_bool(dev, "usb-role-switch")) &&
 		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
@@ -973,6 +972,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 			qcom->current_role = USB_ROLE_DEVICE;
 	}
 
+	/* Force the VBUS valid indication to the PHYs in device mode */
+	if (qcom->current_role == USB_ROLE_DEVICE)
+		dwc3_qcom_vbus_override_enable(qcom, true);
+
 	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
 
 	qcom->dwc.dev = dev;
-- 
2.34.1


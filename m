Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670426;
	b=1abuELkkLFxA66mtnFsM2VL7JnKVKfMpIgA6xIOiNhE5NA3wl9libyrPyuQGF3xVkFMJ
	 XNaS4cZdYFzjnYw7Lz/3+4MIKR4YYJrADLFoJknb4evHUtVZ/a+iizjNlrbJPWuzHiNAt
	 LSHrbSNULnHVOwKioDxmphPBpc2yJWZbkDZcXY5d8Y7DNnzq0DH1tBsU/PsWpsoRVCiQY
	 jccZD1WqZmgeDQd4MDqldf24NSHiwVL8n5Eq9MzoKTm4nhVlKpkkGHdb3S+2wcElkXHAI
	 k1JCtUL0pQK6wVbEBagSQJ0pZORwCBqS7cnHlLuyUsy11Obiirm48sfztV/Rq1m4O5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670426;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mcGpGCXO5/dlhHVTOAIAmwtZelovy/2IbGLxG8DYV9Q=;
	b=QcvfnH8mIUhhNmyoEi/pOPkAuCZWKTwziRekw3gnxWMwd8ZEurfWr4YWPyFMKxr6cM6B
	 KQkmtopqwYHDjlNZ4Jo87bqyeZyPYjOG6kKGTI5VU5PH1acTkL6cZil403yFn4hUJgvRM
	 TAHLzZ7dmRG0Nr08sUBXyCecpM3BXiyNQeZ7RDTFYMHVR8KNaeR3t5tEQPyH1pAtXmmAB
	 dRNh+sPQrA4Fn1pnTGtmGhXs1gQEeAHKPAHvdxvWgtWreNkrP/zaABvEi+G88UmRLJcEv
	 9486dKZUDn9bsVl4oxYwywdtNoLOmVwnVPQzjY7+/FZbNac4+4G/UrtXdveXHs9ZHvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HO44ugaj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUOcLTqo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133EF606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 05:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 133EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HO44ugaj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUOcLTqo
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ4ix5L2998164
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 05:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mcGpGCXO5/dlhHVTOAIAmwtZelovy/2IbGL
	xG8DYV9Q=; b=HO44ugajir0wS3oGIFabjnwDNWdGygcs7LvtmjxlE4qcf8vHuBI
	Lp1APGgJhNIBVGfNbpVtuk1NFy7A+bgIoreIUW+vUPY66TRXakPKz99nj+6RrxNd
	kDDA95Sg6kLOI52PauzpJnzb7fBwWlDuvQLRqZIqswwJYW0FHIInOxWAdiIT/C+P
	TG6U/CBMma/soV42hyiH45z4a/0h3L8NwX3a4inQhG3bv9yZJAyYlGU1UEu/BFeR
	EyVjVn8Ix76/VG0beRs4/tzohCFlEnXGU0VZX571uiiii88IbV2gt+4Xk1z4m6Pn
	+LHbPhZZRCn6MOW3+OEyPkIpUueF9s3Mfgw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnuyy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 05:20:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b4092b645aso5580197a91.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 21:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795670424; x=1796275224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcGpGCXO5/dlhHVTOAIAmwtZelovy/2IbGLxG8DYV9Q=;
        b=TUOcLTqoe9qaN1IuhLDAToodB5Ythj+3dgOCx6cPM0tuXFF3H7gUmtA5LKl9T368Sg
         P/etftsQLU5D46CZYW9ZBBgq7cHxYvmEeiYb2PJiewHIfVw/c2Dk+uOhporni2MZxVqj
         9TncIZIWx8v9d5ggSTVjP5gyRiXL3IZ+1yEcmc0Dmn8x+8HbbxZC93ys/W3JQnM25Pr2
         ay5ftyQiAk9LpsPwoSPcvU9li1T9JfHc8rc1P8qiwgewQogTwY2FjDeoahXfIkQbou9q
         AjVA/L3GJG5z5COvWqgs1AgBVyYeKJKJmD8uku0oSS9yH9TAAAmbUWDLP2Dc8xkvf++E
         Ak5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670424; x=1796275224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcGpGCXO5/dlhHVTOAIAmwtZelovy/2IbGLxG8DYV9Q=;
        b=GCEAMCMfLo0MEMsfFwfN9vxusCmJIilV6vEJ+smBCec1PE2l9KN7ok3gfjX7larMAr
         Gp30h2JiRVCk+wskVmIy6Mmr+nAM62J2iILc6cF3p3j8ZjL0Dl2C5tzs7+F7htfcSGMC
         Fe2Qhok3yCCHkhLDWNKkxGbhVAz48c/DrC3FRa10alx5vGmtNsY24AZcXhE1AJ0MLQAd
         F9H9kK0H8U0I26J3zz9d+pH7smdYmeoKeo92Q0LB7O2hIbttf8ae5fW80W4omRGHv3uA
         +3Z8TjhAAFz40JHOtOFgF3jLrSR+vFbgRgv/NfcQuWryOOwJSPLzs5b376aq8s8x7ngD
         ErwQ==
X-Gm-Message-State: APuU4Z/4a8hbbzoh1UKXZtbJavMwBy8qOo1HlJQlyPP6J35sU2iSCRdb
	sbj3NXUQN+GRs7fHdNRaQXC0dIHbbNzTUyf9rr5jFc0XMJgzAdUX1eUY5DeWH+t2ZwFQuMVsHuZ
	EoNCwPXxGyumWCLRhzbCRdI7JxEfhQ6A0e2L7de8MZBOtgwBf3kA8tqyAtZ7EvCAnuvxoA2U=
X-Gm-Gg: AZFdTZdy3naFj8SpkDL9IPxEwlVR+RI0WlXnAUrwE0VGb78T/ml1D6/tTE+Y8KCODXG
	k4s2OZ4xhSkonyZNBXUSA0uEFwQELPdLR1uydYCCdbsT33L35TmO9WJ+x8KyE8poauUXwJa/q1/
	y35s7pRQjb/O7EO2VdcHix2HTHqwOgCTZJXura2ZN6ew0tdM+eZL/gFp6TK+oM4XqnQfVq9UUFO
	Jwb2bmdQnkcM8E9It313Mnxk7V8z1zVi61ezkS/bEulyeM+JRdwoOrPU6uqZwu/mVjIlC2bBTI1
	VDeXmTnNVVh7EfL7tBlB/HIIQhZ1CCU5wp8mhzSP5NOxN/xwabAO7j99lNEm1pXM88MOX4lKj7y
	HbBiDa4H85k4RI3L9OU/e3EvpeNqqME76zuJjc78tf8bCQeC3XetWgUsueGgNa2VW0dGr6L5Xkv
	4Ulw==
X-Received: by 2002:a17:90b:4ec5:b0:3b3:a6b0:8991 with SMTP id 98e67ed59e1d1-3b41c96180amr18653706a91.60.1795670423981;
        Wed, 25 Nov 2026 21:20:23 -0800 (PST)
X-Received: by 2002:a17:90b:4ec5:b0:3b3:a6b0:8991 with SMTP id 98e67ed59e1d1-3b41c96180amr18653686a91.60.1795670423500;
        Wed, 25 Nov 2026 21:20:23 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm31129371a91.13.2026.11.25.21.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:20:23 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable <stable@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH v4] usb: dwc3: qcom: check for hcd in dwc3_qcom_read_usb2_speed
Date: Thu, 26 Nov 2026 10:49:58 +0530
Message-Id: <20261126051958.2983579-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX50tn7zNeWi6g
 YkQa4o/9X7lKR/GKrRRoEoHIznpvy9Lsxr1R5jrGvQ6qh4HKd60/fOssuOVdLGwHYvxc/NCZOrI
 GN5R6d6osor7mNdCS7KwIIlISjZMSbfuhPwMG2RMR08898AE78dM/EGuOlOBtvcMlo2lLJXDCxx
 Rv+LbcRXckSA0aXiErEPOD/Dyn7L3+iK5K9q7WMSXRSyg7GaPYEsylec/fR6ZHmSPwu+Mfy7DJv
 0kArEUcU6QwlT4AsajJ44cXvX+uL84JU5dyHq3EgBSloxJYa5PF2owuY1QE9xc+ms+kQY8BAJcl
 8itHiXTMZMCtrYU+X2uHIQMwlK5Uk5Ixt8nV+XLxNkSy6YwSUR808S/Mz38qZGOqDSWKZINQC5D
 fyDCltbxr+1PVWDZ4T3gD543nP0UCyKeRmbECcp1tOeKz3OfavKgtMxdV94FiZEVz6ICDWX+DK9
 i6GBUtDWkCuzs2xTIBg==
X-Proofpoint-ORIG-GUID: _izRwtkVRZqFjHMy3Ryc-gausMpIUT88
X-Proofpoint-GUID: _izRwtkVRZqFjHMy3Ryc-gausMpIUT88
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfXx8On7Ev2hFbm
 gdT+H2opI/cXNitt+FRxopXqKVbv3izq4KM4SJBGhZDFbE0JVcejSykKY4ru3gyYilKO1K4qRbB
 J1N4zyvZNt6fIFEqwNZ/F+OCzI0etCQ=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b07c199 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=87Qc2ugH92rl6A7fmoUA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260019

Currently dwc->xhci is not cleared if xhci_plat_probe() fails. During
system suspend, dwc3_qcom_read_usb2_speed() checks dwc->xhci and assumes
xhci is initialised. Since the probe failed, hcd will be null, and the
subsequent access results in a NULL pointer dereference

Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000058

Call trace:
  dwc3_qcom_pm_suspend
  dpm_run_callback
  device_suspend
  dpm_suspend
  dpm_suspend_start
  suspend_devices_and_enter
  pm_suspend

Explicitly check the hcd pointer in dwc3_qcom_read_usb2_speed
before accessing it.

Fixes: 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during suspend")
Cc: stable <stable@kernel.org>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
Changes in v4
 - Added stable tag and review tags
 - Link to v3: https://lore.kernel.org/all/20261022052602.2335652-1-prashanth.k@oss.qualcomm.com/

Changes in v3: 
 - Initialised udev to null, as suggested by sashiko bot.
 - Link to v2: https://lore.kernel.org/all/20261022044748.2303528-1-prashanth.k@oss.qualcomm.com/ 

Changes in v2:
 - Added null pointer check in dwc3-qcom.c instead of marking xhci as null in host.c
 - Link to v1: https://lore.kernel.org/all/20261014105711.1708244-1-prashanth.k@oss.qualcomm.com

 drivers/usb/dwc3/dwc3-qcom.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 5a68025ccea5..6644d1fcb7dc 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -232,7 +232,7 @@ static bool dwc3_qcom_is_host(struct dwc3_qcom *qcom)
 
 static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, int port_index)
 {
-	struct usb_device *udev;
+	struct usb_device *udev = NULL;
 	struct usb_hcd __maybe_unused *hcd;
 	struct dwc3 *dwc = &qcom->dwc;
 
@@ -242,9 +242,8 @@ static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, i
 	hcd = platform_get_drvdata(dwc->xhci);
 
 #ifdef CONFIG_USB
-	udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
-#else
-	udev = NULL;
+	if (hcd)
+		udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
 #endif
 	if (!udev)
 		return USB_SPEED_UNKNOWN;
-- 
2.34.1


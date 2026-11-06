Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942174;
	b=QMqHJXdEufF6/C1uoCxOZbMzrwgn/m5iDhQn0Ku8lfTcOz6TGeHgdVIzIwt5TFx70A4L
	 rJFqpiYg0z3x90NwG0sBUzdmfFpPGf2lSlJG9IGvlhwzrJPYQSf0dRZNBdx7Af1xD/NG2
	 7uY77owy5OgGaIsIX4jBdl/qEp2f8vzzJfPrPdcUSYzDC8NQGpHQ/m5XIsdVD5XE6qP4r
	 cD/oEPDuqPViWmCKmifYypmQMrkgRN9CzeeyIb5QT6dELKB+Iwdpg6/MD+pd9jEYX4p66
	 j60kTve37628Ul8ag0Qas44ILG4CfU0lpEc6ZalExMVyP+WLAz18zvUbYi6UzO12cug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942174;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/o0vVV/A4YxXprKeLcO1BEUKd42fcBI+y2LEaNy5bUs=;
	b=VJBUG07VBbk81HsNDsMe14VO5nOX/XR6u7u46Ge9lQr1TSMDnHN0GKyWB7TJw8wCOGCL
	 b5CtNIECyfZHrgCDdetlyTQeXMihP4UHCblIUQQMe2jb97/OugaEaWBNjN9dPBavKKKHr
	 d6mTOFl3OS+A8tyQmbV8Rg0dYgVUrjTs3jJGu+vwQkMTDX4Cdd8LhTkTPviKmXoFKKno7
	 7n4WRTMZMvFziB/Ci9qYvS2W0VYKLLZYPB4S7QONc6Ld9bxtrKGN64GK0kP8aALy6eEGu
	 hxIpqNIKMhxRoTzbaUuu6QcNyePMdBFETzL1U2SgukOKbq8E2grYsTFlYSab9LJXFUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RiPmrBYn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T866JMLL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7F5606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 05:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D7F5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RiPmrBYn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T866JMLL
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6406qX2817468
	for <linux-usb@vger.kernel.org>; Fri, 6 Nov 2026 05:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/o0vVV/A4YxXprKeLcO1BEUKd42fcBI+y2L
	EaNy5bUs=; b=RiPmrBYnkdrJPqYgiKgTAjRKzmo/xgy85Ym4JLPVNeoMS7yiuVq
	Ei10hHobTXFPvDZPcRuE9ksbP5wDNLEXjjp4XE2PcLCPGKbQTkStfwkkOqjH/87v
	GUDUU2+Dngpv+8E6qYOIquG8+NRGri/mfvLACz1NSR43F2syOsDGyGC0mJe424WW
	yvE4dOq+4rnHNHQhKAZIX4FQKbFRf6APK8/fYfP6vf/6Z82Us16DlN82s0lS7s4m
	QbGKLCWSof9QJQ9rcOJ/3EHq6Ne34MMz8xZjB65m8ewshNRJeQKMn9M6JtThKqK6
	Gfq/DD69p+WHnMZjsWbw8N9EIARYYNAVRYA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa109x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 05:16:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so462798a91.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 21:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793942172; x=1794546972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/o0vVV/A4YxXprKeLcO1BEUKd42fcBI+y2LEaNy5bUs=;
        b=T866JMLL3OfFf6kJVNkZfwDuJQHnO28fmntHAnbkdJcRkMg5a3anYVwJ+VxTnUPypq
         7stXtfybK+VHKkS3ysJYqX/NHfXjIi8/ze6eg/ywGb12zsuHaUvgcpZq+vrA6+dz67R7
         2N0VciqgI+XdRYxTXm4BVWuqzoQiEFOD4KTAywtUXL1Mqt/Qhj9lmj0GX3ErgQrvjY/P
         7j4mNCa9wjxsaafXNxZ17kOT7hNh68olRapxkMPaqu1UWt26tCaL5UtRqnxB2ZjTovoa
         37mMVJ3PMR4PlE5HoFvYaQ+fvyqbJGNGy7NNrhrWKpOrWxMonEGgOGZbpkrzhOzTmWBs
         5tkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942172; x=1794546972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/o0vVV/A4YxXprKeLcO1BEUKd42fcBI+y2LEaNy5bUs=;
        b=WavUOPA6XNg89PeFUtqWURtZv8VhY43xu1QICFkoNvGbhDboJiC3nevw1UuFqT7Xx9
         MaOjw3BpwTRkuwf+kVE9WWNfVKvcX6FIvDSLYN5orBFLuRynKuel9h1jeR/roqnz5DC+
         lEMwuOC5+DbjuI0W+K+HNIemCz7XL/QfCSgqVwbMpIzTPpXf9G49sAElYUdoh8ogfcpF
         K5Iog73MZ1ZZwZgvXWxYWLYlrkPgHxpG1fqi2m+oD4htFja1t8O1LPNkNOFLHqtrC6uE
         7NJbNvsj7ZYEZPBZU39n3rUZkz74HmVVfVR6OoKqMK8hzomdZYrEDO0sU5JR2la8p/uT
         Jdsw==
X-Gm-Message-State: APuU4Z8TDzGU8XOb1eeIxiYLGCG2yKt8RlUTNmVKYRZmfQ63WhIwTKkm
	5PAIgOURB2dG2H+5gJgCxYHP456ka6P8WkV/a9rsoDMU4jHzqdaCy0ghKejf5Q0xR6NQ/NbLgPF
	JkMBzlmCODMhks+cG9cMPBysFJI+4frSs7SnLJ4loAgiVb/sXOr5zmcTBLLNBmYI=
X-Gm-Gg: AYBFou2nAXI47LduWhS9cR14n2gnU1Tle226N3w2aOukPlGYhsUyRQE3zoYT1oWWDay
	l5sNWLRmE66BlHIa9gkUhSDRJbcYaImaV5tA55KITOmQ7lkUGzi+7/qu4IJAZ/2tvrvT+uSTwpG
	f+Ksi3OHWqlpFjZ1zwEjctp9PSoeKxmQNO/cDV19vGmF9uSle3ZwOnTlhG7lL+1XGwi29kMCMA1
	uRxKoL3mIxokpRjHzCNLlvVgVVga4BWJlvmciYJeRO0asHtvv7YJa30zLxqTTKhaTJbizISrIWy
	fKXaY61b4QWsyAenW1IWzTusNNNZ3+8jRQFxe50HSpPz4Eh0A99RiEnRdx0YzDibMaTh5Wk8P4x
	jaAmecqIHWpQYAW81S+tL/jiuEUAvv0d3Eeal4otRY0KpdVhWDADpQZy+qZ28/2G9MjyeGvZXNN
	mt
X-Received: by 2002:a17:90b:1643:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3b0db714ef4mr1491726a91.62.1793942172141;
        Thu, 05 Nov 2026 21:16:12 -0800 (PST)
X-Received: by 2002:a17:90b:1643:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3b0db714ef4mr1491699a91.62.1793942171657;
        Thu, 05 Nov 2026 21:16:11 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d5d744sm1591075ad.43.2026.11.05.21.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:16:11 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable <stable@kernel.org>,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH RESEND v3] usb: dwc3: qcom: check for hcd in dwc3_qcom_read_usb2_speed
Date: Fri,  6 Nov 2026 10:46:05 +0530
Message-Id: <20261106051605.1398445-1-prashanth.k@oss.qualcomm.com>
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
X-Proofpoint-GUID: ByFVdCGvd1-mz5Rx-sZSJjBdyFuVBd69
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMCBTYWx0ZWRfX0aM9nksj7G/w
 bmYZhanW3ko7Nsr6VfdoHBBzTSYDJlz45LCmj91UTW7odBVavqxcXUHcYU1wHQuFVtu9w25YPFd
 yJdfkRkPR5iSr75JoqdERlxNiyNb3k8=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aed629d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=87Qc2ugH92rl6A7fmoUA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMCBTYWx0ZWRfX2NHu+cC55hLZ
 Q3SXQmDzSawDTc7jERE3i6onK1fLRXA6GSWJY2TvEXbLqNd++/GW01uoPrR6rSHtXW8BnLk8P0v
 mG+GvUS0wSYOkw0vQVLtaTgKAaqWKLZmK5fBV+GulhJ3ew6SxRn0pgCrzOeK3nJdETc03gnX2bO
 SzklfsJii7pI3sCPZocwOiHX6V7JWBgjjxlCchPjM5y9cUef/eP/h8swXXg8Uug63uCYVsd6fcr
 Q09Sl76+DznENNFH75tuB3mabFFJ7zYE5vqCZnceBkGuH10bkujpZRayS2QtuPC++LgPZwu2+Sg
 hAq7rMfvRS1n64TlHt0i/rUtujHaOWAgArKL/k8uJpKGLF44WV77tmoaukFQ5lM4z8l05YKiS/I
 8BaPLb/ytj9/Xw5uKAy5Tgwi4OzsbMlenOoJVEbqQ3BXmbg5yW7HgOkuwYcvmHVmBnwPqv1pJD3
 HvCo3tI19UPPSVrXxcQ==
X-Proofpoint-ORIG-GUID: ByFVdCGvd1-mz5Rx-sZSJjBdyFuVBd69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060020

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
Resending with Cc stable tag and review tags.

Changes in v3: 
 - Initialised udev to null, as suggested by sashiko bot.
 - Link to v2: https://lore.kernel.org/all/20261022044748.2303528-1-prashanth.k@oss.qualcomm.com/ 

Changes in v2:
 - Added null pointer check in dwc3-qcom.c instead of marking xhci as null in host.c
 - Link to v1: https://lore.kernel.org/all/20261014105711.1708244-1-prashanth.k@oss.qualcomm.com

 drivers/usb/dwc3/dwc3-qcom.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..e4bf0d5fc9f1 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -231,7 +231,7 @@ static bool dwc3_qcom_is_host(struct dwc3_qcom *qcom)
 
 static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, int port_index)
 {
-	struct usb_device *udev;
+	struct usb_device *udev = NULL;
 	struct usb_hcd __maybe_unused *hcd;
 	struct dwc3 *dwc = &qcom->dwc;
 
@@ -241,9 +241,8 @@ static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, i
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


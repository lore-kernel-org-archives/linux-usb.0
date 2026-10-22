Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646773;
	b=uv032H0X7/vIgRJ9nJNw3qgVhs7dlDStXKAKkN247tjcP6n/oLJkFsJNknJQqpFE252y
	 zoRwLHWJ2GANsRa5qdeGZXybMSLOMWmxMCGqp/AKTc+6zmpAjVCf7Q7Cdl9FqGHVjKKCk
	 PIgz5LJhWmx99izaQI0pO8RJzpxkEURdgBCsvknLD40ELvJzGRinNyUoVBtADSF1BCilR
	 87oFLj0O2Q6ampp4jYBH16iVL1rXFlI1YHZzzKx/kTy5NjHxReZbY9dXtMGBhQTMaOgNN
	 hM99+RwylycJxQT2UMtcQ2NPtxCTainClyf6YP/CBdpFgt0VEFmjTiJEoFlj2i6kajQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646773;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8WUSu9jHfJjQNLjh87SGdnRz9GLn8vfDbjf0BBTOZC0=;
	b=Qg8UGEeoy3QhqbG1TyJ1pVX0Pzy8lySMy5SmQvXel2V6YRCyfCH6MikjDQMamyjG6ZM8
	 O1jgqXK4z4IlSHb4ZH3Y8c4cie8Ytf8ZARXBO7rzQhnwdNu7e0+pcyTwzw+gg/C40DAEz
	 I+t55VM6hzXsDJEaViyYuavz8tZZFJtkhci+oWyLDZgNxpdOEPVrRT79SVSpTkhdss3jR
	 wY6PkvO36RynQWXGcwpIb142yvyyl7KpNPn8InEp+KeMYLOVSBp5TWjfwMCC7TU0DauZV
	 vX2Lh3/UgDlNREjVBHqdhZ4QETz+wituCMItuOe2HkPzm9QD2qmae8/IiGEqNyNXpNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ho21eM/R";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=avMdBOEs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DC5606A31D
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 05:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7DC5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ho21eM/R;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=avMdBOEs
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M4SoSp3262855
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 05:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8WUSu9jHfJjQNLjh87SGdnRz9GLn8vfDbjf
	0BBTOZC0=; b=ho21eM/RF2GQxw+wgPPP00pTKtereiQl87EvIMKClyx/O07tkeq
	cimXScVP6TSWCdB0ltAj1PKhopgvaSW9SIC5QZD09HkRWWajkqORMNhyUwIZnxg6
	6IthuMFftpmYQLIfQFCCNPVzNVan6b1/z1gHjbGpY6VnbdmkAVpRXsFTxNPKK0Xo
	qfVFmQwPZXN5YLEslWXu1O0dlssoSSeEVvxfeItkWRdpHvz3UJR9GpL/euyB5SWp
	9e8kfW9aKWuJCEiSuD3oYAfQb88H+iJNVVwWtgrrO8oMeQOy9Fq1CzHDBPiFZ8xI
	KeRuInUewnpC45d0moTmJg8YCRGaL0TP/Dw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c8ra5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 05:26:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so711290a91.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 22:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792646770; x=1793251570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8WUSu9jHfJjQNLjh87SGdnRz9GLn8vfDbjf0BBTOZC0=;
        b=avMdBOEsOa+nnmFV5tg5xcsinOw6tByi8PJqMNI0GMvLPKhRMNyisdfh5xYjBwhTsa
         dG1dA5MWME0eeAH/WdPL6D6lO4Abxnas/kQXrH/TyHDy3SV8Xw5wLIpGW4SJPcHt4ffQ
         1S4+L7OSK455S+fVjn+vP7Fn3DBTxmZncecBTJ5RYwAKwkN5q8Spnk61GDjcAVBZ7DQ/
         L5S0enOGvMT5fVV+hlhEEYQU9NLwnhfT1m47gAPlQeGIIRaQPoYpnlpUMPfY+3kK/SLf
         Wdz/r7ZhKvSKNa0R0IIi/E73NuhtNYtjoMLeKTJM2nE8ncq4EBlyoGBM1kO73+3NGlm0
         yadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646770; x=1793251570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8WUSu9jHfJjQNLjh87SGdnRz9GLn8vfDbjf0BBTOZC0=;
        b=j1ADEiBEvuFlZ9uSfA8E/AdIO72lEdVSWuesDzHNmzk06DrkhVjAw1blc+hIsmhXX7
         cCmd36rdU4I4RuxUHsmQt5aABqtNMO8x/AlSwbU66hRfHO1Wxedg96PuIYpv2HZz35+z
         zFfDuqi22m+pgXe8MckRQkptaANXFFfeVMB40MNulXo4DRn42l2rhyVQ8ULcJPJ2uiwY
         C4P4IG23mNM4Bugp9f2Owrs/fatVodiJrfkyg1x64Xk5wx+t18GilLSBGHU7yAVOAUPm
         Ra5lS/IBN7m6ihR9el00ISWDcLmgSc5sk/zoU4H3tYmRfWFIeYt/mt7IhReWZOXj0fzQ
         MbVg==
X-Gm-Message-State: AFq9FYJ+NHzHj8bmadEE9zN7n1HPMmcyuSfjafy0mydJontVDS37Ovg/
	u0m4vTipj9JQcr+5TEZ63y9XEiHu1KF5CHSPfbKfjJdW/J+YJTO+LcF/HS/pT3Hk409FqE30e7W
	IUBHOZluX1NAOb9TfMONKn2iuneJh8PKki/HwN88F4LY4MStn8P6KNd7FW+dLcdc=
X-Gm-Gg: AYBFou3yP9DtRzR4jRo9QFBkgUH8TBapxyoxlrLrTAXsydTB+HyG+SwuUo7UtHW//W8
	3GdIsamoO2U4DC8c3cOcGssCoalAxdGpB+rdGY+O9jwbu8Gsy7BdczYy5QbdKsxw6bXH3EHr4rL
	bwh4Wkr6lsSNLUc41Jq/4mAl3sZV8wHFVCBnhUD7CRJqtICbNfvXusvVzt+mmSIYIyYtuUs8X6M
	bBYAqxz2xogEQXBZuhqsSpbPyvc018M3yYqeQBJTQ30+XS+nrMvOcIbaFZvenyQpOqsA46/95RU
	Hzs1GxKvsrWK/xhBr5VYXMs7kb08V7L9a72IUfvxGGWjJkYkzVCaWbfV7zPmEhffPE9pLWOARv+
	wanv5lE7toP8rNc/tJnSvP9uu0Ise
X-Received: by 2002:a17:90a:f013:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3ada6c56e62mr550547a91.5.1792646770389;
        Wed, 21 Oct 2026 22:26:10 -0700 (PDT)
X-Received: by 2002:a17:90a:f013:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3ada6c56e62mr550540a91.5.1792646769887;
        Wed, 21 Oct 2026 22:26:09 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48ed74bsm2375149a91.3.2026.10.21.22.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 22:26:09 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v3] usb: dwc3: qcom: check for hcd in dwc3_qcom_read_usb2_speed
Date: Thu, 22 Oct 2026 10:56:02 +0530
Message-Id: <20261022052602.2335652-1-prashanth.k@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAyMSBTYWx0ZWRfX8LaQrmMavi/8
 zweA3tZci9lZvnHROStowNeVdWW/m5MhyeXkLiv6YHsKth+bDps8wcYzDrcYgtg2CKo9SECOs8I
 N/BcX59L36wx5x2GqNKpDBpTesRNZrk=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad99e73 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=87Qc2ugH92rl6A7fmoUA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: uFo7rlSSs7-yQPYvnRYqcD_36mYlogYh
X-Proofpoint-ORIG-GUID: uFo7rlSSs7-yQPYvnRYqcD_36mYlogYh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAyMSBTYWx0ZWRfX8ePeBOQXkQ9y
 mBNDrBMLm3rRJmqFhqg/HR9Gue8HD13t8jId+opwghloDMxpzFnrQK4wXtEiqdkXj2ryTBo0l9m
 X5AbzUFkoaGqIk3R5gYAQpwr5pRNPqTuRyqK23/w9rvZbLY10K06Ud5tj/OVovJgQUFQN0dqiaj
 VXg6UEbH1PcrFNfEempDT6r8LKvt13K2CJyttmAz69JX3CxcCN3T0f9NkrMA+a71t3XXLhnv1fC
 qICwuP9hTXVjabZ6XqYn0UnsBYqCXzJzUCrPXXk3EhNR6UHFZKyzkhJ+Wtw3MO0OTqGEo1LdjBv
 ImTDqFSDqNoAETyt8u26GQhpB0kvCFhlem3o8q60oZXiJN+nCibqw1dmdfaFulnFShPpgmibxQx
 r07Dfn+7qwzig0M1/RQ6zCg5qkHZdEq7h+Elm+6Q8M2Wxl9Nj3Ng0fkxsecvgjbA0B1Sp3ykG9U
 4MhvsvrEKtyu2zrD1GQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220021

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
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792644478;
	b=RpUY/iPTfvjIPrv2zbpjWHC59vuShjS/0WfhthmkVxH4z8sUhjwIYko39j4dBtP7VpgQ
	 Mjomtegy9eaJSujubviNTNNLaKZQDauGDKFMbI/MDxMbEXp0i2/EdYZXaSH4IzL2QQV4r
	 nhnAo7I6gHJqRnndiz4EubphzF1sJMseBvRuABo2PfoZ+ZlNGb1q2dQf/AQT4KflgJECQ
	 PUGmtGN2pepKtMlC8BaH6oxH7lnPd5FRx1uip994VLpoUsdecXRo4Jp/tOlFe5KyWq9cz
	 yyhB/bH+hhI/jV9OgwLTIuBZZ4BdZEU+6W930Uc8iZKGhXn0UjKxV2fIEDMvq2aEIcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792644478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nEUthsA2IFqMDFX786vIXrF7ZWojnc1c/eGLHmaf5pw=;
	b=QmKZ5q7+/TqLW6XStZm0YrFTclycxudOL9qCvXb9NujMNu7wVICYlHoEEiJkuwdewkR2
	 csaInmZaf0cwzqYhVpddlLGrl5pie54WRsFczh2fWAdEanGb25tZ8M4PaNn2XZYueUBET
	 Y8QOZ7oapxr1kJl7jLFJv9wIud0FfEu2HSjQm+RG/chrf6iodKVjdI+apTntQOALOe8RW
	 nxl+TjxI/UX8BBwoEskzF9D0WH5AszbnWtXnb3AnZ4nEOvU+0c6Au53zWWckxUw8AuN9/
	 gFyGya4MvLflLS+vB4C++sGJKOZt658Nu73PrWmJPcwYcOx4JB+3lAHkI+O3CTAjq2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lm8+EQmd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bPPNHN2a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D70A606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 04:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D70A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lm8+EQmd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bPPNHN2a
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M3jA841576789
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 04:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nEUthsA2IFqMDFX786vIXrF7ZWojnc1c/eG
	LHmaf5pw=; b=lm8+EQmdvI3kntP7bZkb5J1LAcouhzGUmEcSKbykvPu8j55ljNg
	8IeFQuvOxPQKavZcIaTJ1PJm027zVwoJjdWh4aaGRSBDqlHxAb9nRQ0/V8om9tX2
	Mt9/3V6NyAKGP5MdxnRdm8lmPuSEFjvO05Mz3qt3HJfaI2I7tS9R8n7NeZg1T+Ri
	hEkY14DeF6B/mBPtzNuc5Xad1xhFeVvmsU941dBj7V/GdvxzwqAB5JhIV8xecAer
	6ffS2iNpfr/RYb1q/VN+53b4yAX02oylD+36P27e3rUO1ZAT0M8EpWtPP7awzEQ/
	ey1ZEe+HjtaOgUjOxSzBoOBVKkocEc4WdoQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93brp68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 04:47:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so3462140eec.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 21:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792644475; x=1793249275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nEUthsA2IFqMDFX786vIXrF7ZWojnc1c/eGLHmaf5pw=;
        b=bPPNHN2a9W7zucR4bw96lB7GYoOEMn3SfK1drLqOMWD9D6gAeZemj2ukvuW3fxxwAO
         001qWdJXnunnh1uMTeUmQ3yRqwnVIg8oW6NdbP3T1LK1lOjVrJdzF9Qi0pCWSBRK/j9F
         gwIKNBQfMQS3dHplpfyh4k+llrTJZsgavzHnwQCCChNPemuMDAGS6Bg+NtYT5XbKT8YT
         XthzguJa2KmcGHqf0j+MkSACFAs3mzfE9XKC3E5u6+xoAdIGZWMhRgCk+3ep1WONDu9t
         p45focoxmyg6AWHCFJ7D4EzxKdN1PpE6QxVCmDTriLGCYlXsmWZQBkq7mNqdce/AOWwH
         35mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792644475; x=1793249275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEUthsA2IFqMDFX786vIXrF7ZWojnc1c/eGLHmaf5pw=;
        b=SHsg1W+1Ybbq9hLTYH98TiLwMYFotDLBaHM22lw6WoaAMDTfTGYAzqrBYB+vBsFefs
         rLpBbZLEOrER5kQzISIJ3m9zAzhWwArbYshIoEyMD+x2xkoYcweftpuDhCTKmK/q+NUu
         1MFGN4EwvOEy4RIEtMRN9q0hPs2e7NotTnwWWq1/Qv1STSuj4UavrVQMjm6HY1a9a6MT
         l9dbYkE6hR+oFfM9yhs1xG13oblsTEST3CdqzNbVWGZvUHB0t4KlpiIqwyXVpsD2I5yS
         NJ6n1bgQDEQNm/7Fz6a5XoqpGbVB3AMsBlGTq4plAXqIHeE78bo5NSTc9whLUlQjHlC9
         uuhA==
X-Gm-Message-State: AFq9FYJ8/QB193VwLABQ93BTVdN7jKtXOIOcKFIW1+z0ZUkAQdlx8uQM
	KW4jcNOIQz8x9eo+249WWko/sG7aT7IO3UAfOmXNIzEr67aKx5RClzP66FqrZJt2OV6sxXmAjpv
	PGOw/hQDKXzVoHEcYrfnecP8M1MR6VUU/97N85j70eFBPgIBwjP0P7fGAFeJ+FDo=
X-Gm-Gg: AYBFou29pPkHTDfSuBQ1gf/9IDBbukv5ScoDE6J4UnSy+ev5S7LM8WTOvc1LcESmslK
	jqMds68sW5OjE26NNiOUyB03T5LwCIcjagJ6FTpJc1AcMIruXq9OWHS/QkvNuXKITWB83DiENZT
	UX5BlBSRhGp7u5/o8oIRjgynbthWVWJEdvz5rPwVw/JEw3YafjAhvxuaY5wC8IzQXcbligGjXn2
	YehzMJdcMUppylJSn8EYCIftvQRaivhWMVYafUjFxVi00imOZqyEo0U4+ie+3+mjH8/KvUBV6K/
	k+PoupL2YbTFPO2sW36sn8wfLDzNmGGYe7/k8WLaDeKCe03AAsOzLkD7fhj+ri5yJAXaivdsGcS
	G6Xa2Kdf/X3NuM9qC8Dq2BKXPl4uX
X-Received: by 2002:a05:693c:88d7:10b0:35b:91da:7cb with SMTP id 5a478bee46e88-3674e04fb43mr5913715eec.35.1792644475262;
        Wed, 21 Oct 2026 21:47:55 -0700 (PDT)
X-Received: by 2002:a05:693c:88d7:10b0:35b:91da:7cb with SMTP id 5a478bee46e88-3674e04fb43mr5913679eec.35.1792644474697;
        Wed, 21 Oct 2026 21:47:54 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741f753f7sm13071866eec.27.2026.10.21.21.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 21:47:54 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v2] usb: dwc3: qcom: check for hcd in dwc3_qcom_read_usb2_speed
Date: Thu, 22 Oct 2026 10:17:48 +0530
Message-Id: <20261022044748.2303528-1-prashanth.k@oss.qualcomm.com>
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
X-Proofpoint-GUID: m4nGhxwWoR_vfThMN1pO_PQ93lRf7Dr3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxOCBTYWx0ZWRfX9Z2hrj5dWjyb
 tRz8WrWws9IZL5t8vUPtMUuE5O4/23T7cjsXPxy5EmNWJ3lOUj1BhARAkeqn5ql4yQsVBcCT7kE
 v9lXMN2/vbgJxl3x83vsE2TqROHLDXE=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9957c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=i82cPfGn_hM9wOwWQywA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: m4nGhxwWoR_vfThMN1pO_PQ93lRf7Dr3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxOCBTYWx0ZWRfX4Ksvuqy78oj3
 PtGNdO++WOy10Kb7Mh6gk31ELW9TecBUxa9V3ieibG7Ko/TOSfKYJi3yT5pheY6LlrzVW8nSaLG
 2l4prNexadznA07bMLTVG2I2reKbqNywD73sUaQ1gxO+BRFkwTI/a2/e9pkpT8JlvPnUHaV87pv
 OOYLQym6HYdD79le0vqmsGrgEo68CPl9shRrW20QZMMZj1FyT5osl4+N8N8pAV1CQknIjI4icli
 QmGLummR6x9iLvDdCMYHKJ0x3ZrUeZ6yoO77VrBBbCJ+Mfax4CUBaJS0g3PLNCPjA/lbWEv3k2T
 0gmVfvBb98bMnnxCzMu5Q/A6Klb/0/EQ8zvVLcyXDSGXZ1T6V86+8ywd1E+ydz8StBRYauW7enV
 nzM5ccLWNWi9fmAYiYiHJe1rLUF+EkIIyYGQw7uUyLYKAD/EL4l1t6z5XWze8JISzWx5MOeU8nj
 9pgUPpJTrbL8f40wV/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220018

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
Changes in v2:
 - Added null pointer check in dwc3-qcom.c instead of marking xhci as null in host.c
 - Link to v1: https://lore.kernel.org/all/20261014105711.1708244-1-prashanth.k@oss.qualcomm.com

 drivers/usb/dwc3/dwc3-qcom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..6ca51d37c35a 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -241,7 +241,8 @@ static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, i
 	hcd = platform_get_drvdata(dwc->xhci);
 
 #ifdef CONFIG_USB
-	udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
+	if (hcd)
+		udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
 #else
 	udev = NULL;
 #endif
-- 
2.34.1


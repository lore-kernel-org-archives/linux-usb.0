Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801C641D133
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 16:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736746; cv=none; b=A96OuaiCb/rT8ywbahhYJG6IikPH+3VCbhlZg0fKrt9rZkYEnZdlvL0PjOyi5I37cKcW989bYJhcxC/YMK4JOwVdwuUiDmR/tDu6mSjbDwOqA58dyil+4uutIUpRw0pU0dyJO21b4QG2fGhY6QPVIyfHBSIOOT/sllOjeEXAOk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736746; c=relaxed/simple;
	bh=sdxJeDHkrQlTySp7RQqlaKWFt8llLd9XMIvoTxxdgaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dk5D15wto1ET3q4hOtZ0QAEnQCJLuZHwDAUDnJkmILwm1daNF+eS2f8xLNILm4HqpxSQb6VYc5wLvbI3tfOkqXYeKOLMVLnJT2cMPz30e4OLYbcRvGoaISIff/BlijlPCFihCJc3vG3WNfOrAU6Pw+Jc6bZCnmWRFB9THvCQSSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvfG2xMv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTwnOJzq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvfG2xMv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTwnOJzq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MFXvD81146366
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 16:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ThOsP0hEyflEn62fng4lb9
	iPMnmI2bEXMNOsBjKnQqY=; b=CvfG2xMv2zJLMXjcIIqxwESoAveJfaeoCZPbVK
	NnmGmr+OHcNBr3Dh+7ZWOaCD+70DiNgYzqIk37oSbBtBbvvItW22mwtGJc6D96pz
	f3EeKjlkaMtQIzpNzUfz9h9MYNchTp+tL90OLPFJcjnmQEghybCsfLlNIiJxWHsB
	GvXhuNmtVaasog6MWovWQeZL+Pc7jw05ExvaOdjJTruf7WE+DGri+WkGoADdw3Ld
	W3kieJIDf3zrfEAVUjDe9fYffnW8r7Jv7BsW9eHjHGrsogXkQczqkLZ2v5uB3tZL
	Vs2qy2cFiimhRvrEE9lecWAQFtIMDK+R2pzdGAswg4OzxYTA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn34mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 16:12:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cefa1a2be6so112588185ad.0
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 09:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784736743; x=1785341543; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ThOsP0hEyflEn62fng4lb9iPMnmI2bEXMNOsBjKnQqY=;
        b=cTwnOJzq4WeiftNHifOECQhgVx6vcONJaIVAPpKBbygHZbEDfFwQVYP9Czl01iYJ1B
         IypFIRE9ylNM/DlSmSJh8CtU0hExrJPx9J0mQ6nGVylxSgokyOu3nhpMsDfoLb5BTa1g
         pZnI6WUU2Ta/wHFzCBpOpw/huP0DZlBsv+X/DzRfNVWoiHqDrowznNlgIlphUMq5k3Eo
         /E+QwUMVMRf+EfGwOIsMrkk8C03ySYQkl58oHaMHqKZLvIT4waQcQvGXwcIYl+42YEIM
         8KhjHLMhsjog7K3Rk0wnn2ZRQA8qW24dISByGaI/eDi9ZI2v4ylBP6SRebAuO6b1E1uY
         Qf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784736743; x=1785341543;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ThOsP0hEyflEn62fng4lb9iPMnmI2bEXMNOsBjKnQqY=;
        b=MY6j660UpjSUbrCpSvdz21/xHC3tblzRLs5Ostpa4pFiXjGLUBT2pcHNOCeFrw0Zq2
         ZI6ujsRtLrQeWNkxg3UPX771mVDRPmwXlJTiCqqJMvBSowf+caPUgB+i+XfDb9LxKwGz
         oFeZP5rpYnJNsI/CjmOsej/i30I+Bgla5MpuIe8Lj4i92Qhg4owxjVwpPyqxqEtO1P/t
         BWVcJMqgvI5L8HyUg5Jo2ijr+W/PQ9erOSgD2iI62th9CtMD3MWVvqJe93P+xFxoDkwJ
         9tQ4BOwoFCj6cZHjBcF8m1E38+Gh4SuVpWX1rYzvi2EadANvHzCXcJxOY6UFCLQuHYzk
         5M2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqF2DDMpilxfefUor+kIRgS+GqMDqIj68AjsH/WvyDFjMRHkvppGLm5hd86a+oRIeAwk6/fcguD2S0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDD4j7qaZPe1QSx6O0tYOBMRjhrHMe2E9lT7YpdIbfCgJ+Fu3N
	yrxVjAGUo3Ee/3Y4LMi9GBdmOZ9MdMiDm/fQMLseBa9YfVAFLU7HD4r2N5muznRad10u4Oax+1Q
	S/YEsYw1T748Yy0EoqicHMArfrNx3F1KFOyDK+N9eHkVykb3A9Y2M+Vr9XhIkSLs=
X-Gm-Gg: AR+sD10ljCKq/gGdDs0VKmJY7gexRAjBeWhnQMKTwc60hOir1bWyYI7cj05qauMlb8W
	lSj8RSAFv41RgfVNOOhjAOtIRiBlYxorx2UjqJTDjAI9Jzb+JIHWISGqoRdtMY9cFBEhRTvdtNB
	PqSvol7Cx3eQv/lF0s/nIKvvV+IM01BXcZRMJaJvp8OwLcIHh8Cy7S+oTVXeonUl8aK2/UtTXYw
	6RBhBnFX9GOhw3/C8uhbdVzZtYEaO2nhIWyYlMmb4J4Mo1fJ+t8wHiiZ/ZALTQfxp1Jx0Y9AD8Y
	EWf8DdNb+V4Y8UC3rCWdrSRGjvEZyb9fhiFDmfWOEo6+BmkfZEq8jyQ+pAQUzulAqj9SJFKrZNo
	OEpbtIFC8Yozrq7dZm8s=
X-Received: by 2002:a17:903:1a43:b0:2cc:aa36:c04c with SMTP id d9443c01a7336-2cf348368abmr274046915ad.1.1784736743102;
        Wed, 22 Jul 2026 09:12:23 -0700 (PDT)
X-Received: by 2002:a17:903:1a43:b0:2cc:aa36:c04c with SMTP id d9443c01a7336-2cf348368abmr274046245ad.1.1784736742427;
        Wed, 22 Jul 2026 09:12:22 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e088d3fsm11058985eec.25.2026.07.22.09.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:12:22 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 21:42:07 +0530
Subject: [PATCH v2] usb: typec: ucsi: ucsi_glink: Prevent suspend during
 UCSI notification handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-ucsi_glink_wakeup-v2-1-b43dee56df24@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANbrYGoC/32Nyw6CMBREf4V0bUmpsRVX/ochpLRXuPIothQ1h
 H+34N7NJCeZObMQDw7Bk0uyEAczerRDBH5IiG7UUANFE5lwxgWTGaNBeyzrDoe2fKkWwkiZBFE
 ZfuQnUZG4Gx3c8b07b8WPfageoKdNtDUa9JN1n/10zrbeP/+c0YxKk0tQgp9Nzq/W+/QZVKdt3
 6cxSLGu6xeHWv/2ywAAAA==
X-Change-ID: 20260710-ucsi_glink_wakeup-07e6bd23256b
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784736739; l=3235;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=sdxJeDHkrQlTySp7RQqlaKWFt8llLd9XMIvoTxxdgaQ=;
 b=YbmzvS+YJI7MyokWzk07itDjvIOGZda1ZUrePyTorNadm72Ml0t1FHPzgiEcGSfoAQX+y/AxJ
 B0xN4/MXUtyC9mOgc8CzdM2YMp/LXJbR656IoGJY4IfMXuGaSosnQI/
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60ebe8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=0NJbmkjOm9SxVZ9QAlgA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: NkrZwapmcdpTLvVwIkujOJX-I2s8a5lS
X-Proofpoint-ORIG-GUID: NkrZwapmcdpTLvVwIkujOJX-I2s8a5lS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE1OSBTYWx0ZWRfX7kKg1s4YckO3
 QhlL1CoPk1obMnTEn4W7cQI4u1/sCwbGo4o0NjFPhemGmqy716M8c3QQIlAb+5ad+904oD3rKqv
 f/6Ts0nXEteEdvgwanPSScaOK09Pu68=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE1OSBTYWx0ZWRfX9IW31R9bHa2V
 M9m1GD7P8Ju8Zkscf3Fr/rUMnK2SM7tginQMx9JQVbAnESJgXBr4KpVrYtbYITWJaB4wPAXxqUJ
 e6Z/PPjiXjBqCwNNUb50pDZykbpk2+W2L1OeFIaLRM5Wgc0Ex82L8j9WfZuxHQT2OK1dMmAS4Ou
 DkdjheuNY7i90yBc7eJPh3DeTPzBN9Ms168cjEUYrgek7cp6LOsAbLKlmedL3Wl0Y5HqHGE6hKq
 9hQ4XWvAqUFD1nSwy6GtHjPn/EAIfHmwaN7nF25Z2F6xHV8SOXFKnWHWo3Ptl7e5DrPidZDaIw5
 6vs5ClRh94Oc4vdupPO1mLyVXY5eUIh83U/r9VqPz0xaQQgXilgsbQexfhIa2Tlrsmm2vfKO5yE
 iIL1wdI+gSD5Hm8uy7CeB0WWL7ZbJrapBUVNSCFU5/Z2MIRugcbfVo3DwEtQBYU7FATt96DsL06
 Yc1c0YG2UzZolp7BWIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220159

When the system is suspended and a UCSI event arrives (such as USB plug-in),
the GLINK interrupt (with IRQF_NO_SUSPEND flag) fires and it eventually calls
the pmic_glink_ucsi_callback(), which schedules notify_work to handle the
connector change. However, since no wakeup source is held, the system can
re-enter suspend soon after the interrupt handler returns, before notify_work
has completed running, and the USB plug-in event would not be handled.

There was an earlier attempt to address this at the GLINK driver level, by
making the GLINK interrupt wakeup-capable, ("rpmsg: glink: Make glink smem
interrupt wakeup capable") [1], but upstream reviewers suggested a
different approach, preferring wakeup logic to be handled in the client driver.

To avoid losing UCSI notifications in this way, register ucsi_glink
as a wakeup-capable device in the probe, and call pm_wakeup_dev_event()
with hard=true before scheduling notify_work. The hard wakeup aborts any
in-progress suspend, and the timed wakeup source keeps the system
awake long enough for the notify_work call to run.

[1] https://lore.kernel.org/all/20240603073648.3475123-1-quic_deesin@quicinc.com/

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v2:
- Replaced pm_wakeup_ws_event() with pm_wakeup_dev_event() to avoid compilation
  error on devices with CONFIG_PM_SLEEP disabled.
- Link to v1: https://patch.msgid.link/20260710-ucsi_glink_wakeup-v1-1-7d97ea628d92@oss.qualcomm.com
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 12e07b9fe622..1643d6756127 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
+#include <linux/pm_wakeup.h>
 #include <linux/property.h>
 #include <linux/soc/qcom/pdr.h>
 #include <linux/usb/typec_mux.h>
@@ -26,6 +27,12 @@
 #define UC_UCSI_WRITE_BUF_REQ           0x12
 #define UC_UCSI_USBC_NOTIFY_IND         0x13
 
+/*
+ * Wakeup timeout to allow USB event notification processing to
+ * complete before device suspends.
+ */
+#define UCSI_GLINK_WAKEUP_TIMEOUT_MS	50
+
 struct ucsi_read_buf_req_msg {
 	struct pmic_glink_hdr   hdr;
 };
@@ -342,6 +349,7 @@ static void pmic_glink_ucsi_callback(const void *data, size_t len, void *priv)
 		pmic_glink_ucsi_write_ack(ucsi, data, len);
 		break;
 	case UC_UCSI_USBC_NOTIFY_IND:
+		pm_wakeup_dev_event(ucsi->dev, UCSI_GLINK_WAKEUP_TIMEOUT_MS, true);
 		schedule_work(&ucsi->notify_work);
 		break;
 	}
@@ -401,6 +409,8 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 	ucsi->dev = dev;
 	dev_set_drvdata(dev, ucsi);
 
+	device_init_wakeup(dev, true);
+
 	INIT_WORK(&ucsi->notify_work, pmic_glink_ucsi_notify);
 	INIT_WORK(&ucsi->register_work, pmic_glink_ucsi_register);
 	init_completion(&ucsi->read_ack);

---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260710-ucsi_glink_wakeup-07e6bd23256b

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


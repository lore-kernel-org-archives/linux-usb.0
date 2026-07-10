Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58C14071DF
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678918; cv=none; b=dCEj4cG6xSDivZ5XZeg9WbXsFEH6sPQbCnHXnXu67X+N3lVITMu8p4Y31rCK0ASYEf+mKMPmd5v90m9egH0zgamHr7RkqbV9bzoJmC+cAi6q4/8ELxtwtZ2owsVbiz4TAuro4C3CdOfBzua9N302huqSxxVbaiO2oKhoHtyn3Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678918; c=relaxed/simple;
	bh=3WxbNsQ7mZ69Fc2jBNSJ2Td3Y+toTk0N0QW24jryalM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bZeOzLOf5hM6Cme6ZXREkOgG2OaYfnxw3OHN9Avn6Y0aEtqNK8IXWJWJLd45eQNJafaoy6mdi80EfhEW93UD/0g8UKnD3kdJb5VOwG22IHcw0u9lCcKAOKsF7bsU5VOMbiqclmH8n1rF0GSMJaX9pBCDqFFDU31CCvZ2BCgohH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZleMJOds; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MuP1ymFw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZleMJOds";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MuP1ymFw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dYwr056517
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 10:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EZFxcAp6FNYb8Alm1yQTDT
	ica+rLWTyD4KSCLFaJ3ZA=; b=ZleMJOdseGTOZiB9IiastIj8GF4tJu0uJZdDHB
	YF+X/KpbGr6LDT0a+iYHRa9tnFKwRGvAq81NMp7gVUJG5pnokMCJjEhzV4iS2HJR
	ol4WT4DpziJWV6CN3DCICRC/UEzC6PwiF6BuDnkLYkV41Sdb/gcxBodZQip31uvd
	PZH70G9ix/qYbC+t3YujqufRMoae7kxyNfw0C0GHbuTW0/SxVOApxBRRp9S+3oTT
	i6X0lGBMWmFm9WnMMgD4PpZ7vtiV+w9S8AGHuoqUl7XiMm+YjhgRnXW4r/qpL3wQ
	X9oX7sk2rFbkh9CXhIF5goVbxaDbVgvx+4oJJRTgwP5H4ymw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwtajf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 10:21:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848415e9e8eso1205503b3a.2
        for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 03:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783678915; x=1784283715; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EZFxcAp6FNYb8Alm1yQTDTica+rLWTyD4KSCLFaJ3ZA=;
        b=MuP1ymFwgT1N3zH/VI3vdshTM4FE3lXeotKrpm8DxI1AP4LgO1AIc/eaqm3EyS66lJ
         sQ/rt0/U7g3vPJRkj6zNw70xgBKZu7sFMZsLnyEZd6RrKGZswW7ft5/hYQ2BrsbMzjIU
         XT+btYwL79NZeJ64WLFxg73HfFdz5iAhKT8CRQr7/zbWt3XiWDg3KLUNnxO6+irlpkRX
         m7h3OCkTOEk0JZuqbZRuB/UMA4sXxtsA1Ir7xYDLmoP1ivwTpMf+JFDnBIblbAo9EU/z
         KDP6/0ODXWO6MMc457wpwkdE9uJ5x/qeXW67j4Xj+HghvSiS1tIPMQ94yaQHDlxjUHfH
         twrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678915; x=1784283715;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EZFxcAp6FNYb8Alm1yQTDTica+rLWTyD4KSCLFaJ3ZA=;
        b=kFm3642vBXwoLxpIebHaYMRONhmNXC5t7LnrgobB6OiTcJhiDFj99lnoDEUZhnnbK/
         gTENN+LwEKmNxSDx50bo0u0np2G4yUEjEQUdY6eam34bE/KYADHUSGEI/M/X5rvOwK+M
         ReTnj+JDVgyS1PEasBh/teP23YCDEf4D+1EHS3Sse0/dzNV0oIOcHogJF1TDRwMhhVcS
         Gp+e8+xoLLeieful0dPvFA5vAyrVCJQtVWehhEqdzb0HUmfzDIuEZDvUZ9EAAwf3Qy/W
         UMZ1xuOVZeq9+Q/9DGQ3PFmB1S5Rfd4oiHfDiAYRB5Onlw7Q3r5aqCWJcU+MrCYxRhaN
         spSg==
X-Forwarded-Encrypted: i=1; AHgh+RrQGO0ua6nfdx9NIc64EP9eSDlg8QKQMvyDUBOriXMFB6pUbPNMW7MH1Iu0xx5q/upZG3J8Z/tZZbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNIy9jBxcNhAtT62F9Qz5/yL3Lo54gFegLH+MkwC9zmXDHyOdV
	CFFFfxBNI+DIN4+z9D8o3udn2Uli8ztQQ7ciM32BjFLa6/YVgxCLIur6kPRwq+tVhlrO+HJgEaQ
	IMPX+JtgygvjemxVK/GYWQ0sRBjMVMkDMbkF3peNHFfLiw4UMrgcIQqi7234dcow=
X-Gm-Gg: AfdE7clSwheGbgyzKT/5KfjUdsVesmSxOMS2WxiAaMbP8kKV7Z/uxroPL/QIDxp60p2
	STMMhsxM0iU7qRatW+1ZkhbLwYlwZJK+qHpfGxvhK2Y/ndj5dPXqgn9wjcrLoSpnDMK6pumHhqd
	Luj03CrVqNbLTuwZId0sSnGT3a2+65EP7zONV23geIm+J5jNNaDLjMo85/9kxok2mTgCqfL42Lm
	ApO+ULwHQObMvY8xVsYBA9jguPPZHJRwETQfL46gXvZm2ifSQm7q6lQEcoVrLle29UH67UySo2V
	mZphSFrgH1r1da40VZp7opisKS+q4+1I4jysKXTowMsIqXjOvdbhTevpfZb0czPa50BHNM2lb+b
	LeJFvgAvlpVRNkar+3Y0kBrwCLUcfug==
X-Received: by 2002:a05:6a00:3a13:b0:847:83bc:d2a4 with SMTP id d2e1a72fcca58-84842ed228emr10458902b3a.2.1783678915192;
        Fri, 10 Jul 2026 03:21:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a13:b0:847:83bc:d2a4 with SMTP id d2e1a72fcca58-84842ed228emr10458873b3a.2.1783678914642;
        Fri, 10 Jul 2026 03:21:54 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8485413c264sm2943435b3a.61.2026.07.10.03.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:21:53 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:51:31 +0530
Subject: [PATCH] usb: typec: ucsi: ucsi_glink: Prevent suspend during UCSI
 notification handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-ucsi_glink_wakeup-v1-1-7d97ea628d92@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKrHUGoC/yXM0Q5EMBBA0V+Red4mVVGJX5GNaA2GTUlHkYh/1
 +XxPNx7AqMnZCiTEzxuxDS7iPSTgB0a16OgNhqUVFoWqRTBMtX9j9xU782EYRGyQG1alalcG4j
 d4rGj43lW39cczIh2/Y/gum4DVSDudQAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783678909; l=3002;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=3WxbNsQ7mZ69Fc2jBNSJ2Td3Y+toTk0N0QW24jryalM=;
 b=MRZojahDR7WCNFa16OeapIuLBu3cvPvjMl9zQ1eWrymTMiJrx/WAu1o8a/Ur1TiAuR7XRQjZJ
 HLULj3iHCLXDak3NUYvCVqtXAhQcCbomYtMMKpYrLr6/neisw1Jywez
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a50c7c3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Pr3NCNcdauOKfqzJXY4A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hQLH0V3x9xgHoimvavRRFlfOzKXa-x6M
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEwMSBTYWx0ZWRfX3oQ+uB/lro06
 w0thAvpJFyeieSzv2Hz7w3f14c9/qy/ialXTgzQ3LBGd2GuImgM92Cb2BtAlULgHJwUIFZ+Li5e
 EPMywl+2uoOd0+Rfe3GYIu0nmuY11TE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEwMSBTYWx0ZWRfX/hP8D730XAjv
 F9LtOXyDBvXFcxjQdDQV/TzNP9jnqjD0bHmw9e7AglpsykebGP42aKbp0xTCWl5uTFKgxdeRe1v
 FaMG1aAHCExYEjKBNN+g+2gOhkFegxYYBVR7Xqo1ce0L6icGgGkMJ9PBPmxrGi4Bx6L+7Nq1AGG
 crsxMndc+zSHrV/mhBGsTATahHOI3ipcbDVIb+pVWZj5MzQSzVyXPSdNA3CPF7Xw8cSaC0cEy/h
 SYuoprajaJsAVLADhts5ILkjFEJtKr1dcXLEDUXYZSH60SPW7kOyEWn236N+KnwykL/4CCcrSbG
 wpUCm4EuJrkCS6R4/l2yNtfOF4z+RUp5SwMTHENAXOyZjlpKGvd+O3grE6I0Bik6dzhMjwsaEml
 4Fvytvqre8PzpBSmCgl/Mk8rYAsgtX2oiZ2fa7KiwBuqNtNUWDmv87ggF9kaVNW+2bOsVrpjsWp
 i7BOBnsAgWLJiCn7XVw==
X-Proofpoint-ORIG-GUID: hQLH0V3x9xgHoimvavRRFlfOzKXa-x6M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1011 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100101

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
as a wakeup-capable device in the probe, and call pm_wakeup_ws_event()
with hard=true before scheduling notify_work. The hard wakeup aborts any
in-progress suspend, and the timed wakeup source keeps the system
awake long enough for the notify_work call to run.

[1] https://lore.kernel.org/all/20240603073648.3475123-1-quic_deesin@quicinc.com/

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 12e07b9fe622..7fa039f0a2ba 100644
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
@@ -342,6 +349,8 @@ static void pmic_glink_ucsi_callback(const void *data, size_t len, void *priv)
 		pmic_glink_ucsi_write_ack(ucsi, data, len);
 		break;
 	case UC_UCSI_USBC_NOTIFY_IND:
+		pm_wakeup_ws_event(ucsi->dev->power.wakeup,
+				   UCSI_GLINK_WAKEUP_TIMEOUT_MS, true);
 		schedule_work(&ucsi->notify_work);
 		break;
 	}
@@ -401,6 +410,8 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 	ucsi->dev = dev;
 	dev_set_drvdata(dev, ucsi);
 
+	device_init_wakeup(dev, true);
+
 	INIT_WORK(&ucsi->notify_work, pmic_glink_ucsi_notify);
 	INIT_WORK(&ucsi->register_work, pmic_glink_ucsi_register);
 	init_completion(&ucsi->read_ack);

---
base-commit: 2cb6eac064c8334418a76999468f68696a8dfe71
change-id: 20260710-ucsi_glink_wakeup-07e6bd23256b

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


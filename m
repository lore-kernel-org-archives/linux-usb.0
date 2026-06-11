Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56B2397321
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 22:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781216539; cv=none; b=hvJ5AXf54l9ahxUnRu5qoGgpA9dHI4cPXWhXL5up5ZyUTbpFVwyF/TatJ/2LGeOxPjc9FMOGvSE/xvn99Fs3BYpCPA68Hkuj2k/ASmbfW5pp5LptwyUX48C5O+FkVnnvt1tFhsqWmbYv5CTV284n1g7UBlGO8KHNY6kG63qohFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781216539; c=relaxed/simple;
	bh=d1J3Qe5UigcccE7VBHSzeQf0kk7LLlF3NSyoVO2nIx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iy7TsZ2ZDuNiabp/QZrUMSHo5ljlP9IdpwnLQIBjt/zk//K35APcwafgSKjlghs9Ne3J08qKnjoSXH33dT61nG5ec08yuCympjs9JulloIO7G9RLFkhJ3J1u5zrnlgnHt4G2sCbCwmFnBOC/xfAq/fnR2qtueaFpWlJnam/O57c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8W2axrD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXlcX1in; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8W2axrD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXlcX1in"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3Ppi1510640
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 22:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1dY6K2xgh2U7p8EG/dBjjf
	n2raq9Fy1d0oOPTCjgX0c=; b=m8W2axrDDw54UVooPixMv3zRO2/abayEvZwcS4
	pAc3VfgCc3fAMvDGOR6tG3ElR9iU908GwXW/oe0Ib7rA3+aCIn/MW4psj6ip6yiy
	J8HMluwZDcIYJtwB6W/vv4B2k6TRgX9Fyk3Hzwj1nBMb7GQKV3Gy66qHeYpP3kl+
	j1FUl4upVl48LH8E0ttDqU3q1go8YbcTJvNkIYv5oPLKyvbWORxlhXZ8b+Jgaakl
	ZH6c32MTisfR0fIThkIr5Rlu6JJiW/ZFL6irfd5MthI3YnvrlgGWBHbVHwJas1SK
	7QEuZsDhzpyhvCaHkM1YaYdJ0riKxhtcm5hl5Ff/xTIFO4Ow==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u40nh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 22:22:10 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1370417c0bfso311807c88.0
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 15:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781216529; x=1781821329; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dY6K2xgh2U7p8EG/dBjjfn2raq9Fy1d0oOPTCjgX0c=;
        b=QXlcX1inyPKtWlZufo6kxaKxcumMEF5d1CNt5zJeolQcdt9l8ba9scpX3XU6iN4Vyv
         rEO3gZFrAStSi3+Qps4hA87ffkNgAQ02lRpVcvYOitdOk00SMnGZ/KdHgu62kLuU1zGQ
         UGBrT1meya8/6Y+1YOjq07Rw2oJB3bEYwPpbWmxtphqLniMvCvegIwXljPTJhsT7XjXg
         UiOezg0wCVfoeF7figZ56f1t2uwQrV9GboMDC6dS9kYquBN1IgOFa2u0Gc3mh5fjJQWU
         F9kRmdZQ239Xo8iyHjNzQLI9tm6csZZkB4VKvS/sZ8z7BN7/bZz5+bBoMHxTgqNAXZur
         Ji5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781216529; x=1781821329;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dY6K2xgh2U7p8EG/dBjjfn2raq9Fy1d0oOPTCjgX0c=;
        b=cMC4vJc9Lfb2euPj+eEJ/NTyZkqmqHO4V6IlKJagGfs6T8FWvi+FgolAndJ6WxuRDY
         7+MUUNF1r4J2L6l85XbkIeCziv46bEivi1bz98BrXKbFUqBJh4YBiE2xKXSJX5/dXXBh
         /sl1PUXVN9TUB1e+K8dYkzu6+lAdCG41u8gJcSnBKvhNlH2umFMc2c3NVeV9tCu9so3y
         VagIbj86CjMkWHHkMW9wKBXlCZpcTgN8aNE5GIAzGDZmt5rPgM0/eZGB9jNn5jC7aTvA
         It6clxoc4YNVWVwyuSQ07QIdWkw8sLB9Ivsd2cD8/m6zot9C2hCwXWndZAOSiP5NosrP
         JcNA==
X-Gm-Message-State: AOJu0YwYlt+mveXS3HCykI+WDiwIYdEj2S4OERrGTZ7XtKwO+KX9YiS7
	f3WmBuSdtuXpPMSKx8OqMwD55CGBiTQqOmaCSpoIJkkX6sbjsJRsX7j/WEOaIHVNhGfwwjraH0q
	yHofC6BEqdqTGvcFjzfLLHtfkp55pNqJBcyAQkFwBdo2uq6fAqeML56zQbKILkOA=
X-Gm-Gg: Acq92OFUxlb5Gtr+TIxAP/K5BH02CdzJSaoaAkTvo9q+dQ4GH514ooADyiqDnzKr6ry
	xVsuEcfxK0kvGeWqm2uQHET9Z5dJtLZo7QdHv75rJHMBPtzFFk7Oah+5+yWHL0AUGsnQpBz1sBr
	wZ7hRFqL+ErjWSt+N1+bs16bqRAEnEIukSvBUK7c/MdAjrb52kXYUhazXYE3W+N1hirq8AsgKht
	XWdOpj5GobnyfypHPJvmISQtW+ZYAYZnJRDMKnS3bUrcs0n3Oi9/4DfVz8S4KbD9WEIgFpiomRE
	eKTsbL8SMP1T5/GgEs5qF5jsQTW5yC2Kk3nYQfZiKaxpP6N1cdSXFUThv3A67cbKrz18zYP9KX1
	+SX2kKGu406b2a2+94YZmfkw2N+o+VMOmwxQTJsP/ZL7/pWscq/kdobygh+oipA==
X-Received: by 2002:a05:7022:100a:b0:138:40b4:6cf9 with SMTP id a92af1059eb24-1384b65548fmr241320c88.19.1781216529304;
        Thu, 11 Jun 2026 15:22:09 -0700 (PDT)
X-Received: by 2002:a05:7022:100a:b0:138:40b4:6cf9 with SMTP id a92af1059eb24-1384b65548fmr241305c88.19.1781216528759;
        Thu, 11 Jun 2026 15:22:08 -0700 (PDT)
Received: from [169.254.0.2] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b96d6c4sm203807c88.9.2026.06.11.15.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 15:22:08 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 22:22:02 +0000
Subject: [PATCH] usb: typec: ucsi: unregister debugfs entries on teardown
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-usci-unregister-debugfs-v1-1-f4a518a94f27@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAk1K2oC/yXMMQ7CMAxA0atUnrHUBFoJrlIxpI6TmiFUdoOQq
 t6dAOMb/t/BWIUNbt0Oyi8xeZYGd+qAllAyo8Rm8L0f+9E5rEaCtShnsY0VI881J8PgL5TimYZ
 rIGj1qpzk/TtP97+tzg+m7buD4/gAFyU95XsAAAA=
X-Change-ID: 20260611-usci-unregister-debugfs-a24cfd3c59ac
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781216528; l=1774;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=d1J3Qe5UigcccE7VBHSzeQf0kk7LLlF3NSyoVO2nIx8=;
 b=MmBVIknFAuqnuBLFMsG8PiAOJNIIw7kUv+JSy3OOVtboAO7bzhEDKCesjA+7+PYbyC3pxtvyR
 nOZLcSEgu95DvsLIwiW0aBcjXzF7hwkeFXlhaGzqu9ZIR98g7aDaQr5
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-GUID: RAbKzFwZpI2AY0zPjoMGkJPs1YcC6Wld
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIyNCBTYWx0ZWRfX5OVxqrZuizfm
 kZZs/VTmDs/ErY0RE7zguAkkRqNMGbiT4udI+rjp0ECYoK8f1xZQ2NA3yNyb2lyw+4Us0/d6nEE
 EodPLq+5aogaonOeoq/aXGtSd7SfiHw=
X-Proofpoint-ORIG-GUID: RAbKzFwZpI2AY0zPjoMGkJPs1YcC6Wld
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2b3512 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0uOraXvCSQh-yJGorEIA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIyNCBTYWx0ZWRfX5aZG6zYc/lyl
 nJvM4ueHo/bDD6aWmXPH8fN59JUhD0hW6uueN6zDbVPjDUTxhj5zF6ZbmVVgUDlu+wW+qqQ+E0w
 fNfkPAG5ztHXZY2M+qJRNWr4w099n7sR/yILSiVQj2LOE9eCKbotbbRaTFfnEl1u3OAWenqOG2k
 Nu1ry3zBAzQFwJ6/wGO/0eGVwnzyJUgQBh5FwukH1JbXOIqsWqwGlQsXN2N8wXxlnBRe7wnpNj1
 2NOsjFAyAs38AeptqPMCK3/RKVU5BozIIwZyQR5nCsBk4yztO9V1NNcq0zz1pCnhufE2CkUCIan
 IrpSGcQaUDRtpYQVV3DxQkQE4kTYXCgoesQgEVhPJh/O/mxv7EK2kWkLuSH+7peK3Pd+0ixQf/7
 nwsu3WlqwA4bAA+7pLiuYb73X+CbMv0lWiDy14s5JlPYsJseemdErgJ3OQiMjqxjUjODiv+lEwP
 Bsl/4EZYjwglTFg+rEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110224

ucsi_register() creates per-instance debugfs entries, but
ucsi_unregister() keeps them around until ucsi_destroy().

Drivers like ucsi_glink that unregister/register the same UCSI
instance across remoteproc restart then try to create an already
existing debugfs directory and log:

  debugfs: 'pmic_glink.ucsi.0' already exists in 'ucsi'

Unregister debugfs entries as part of ucsi_unregister(), and
clear ucsi->debugfs after freeing it so repeated unregister
paths remain safe.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/debugfs.c | 1 +
 drivers/usb/typec/ucsi/ucsi.c    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index ff33a5e7c6b0..a124105b6226 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -162,6 +162,7 @@ void ucsi_debugfs_unregister(struct ucsi *ucsi)
 
 	debugfs_remove_recursive(ucsi->debugfs->dentry);
 	kfree(ucsi->debugfs);
+	ucsi->debugfs = NULL;
 }
 
 void ucsi_debugfs_init(void)
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 92166a3725b1..dcef37754124 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2186,6 +2186,8 @@ void ucsi_unregister(struct ucsi *ucsi)
 	cancel_delayed_work_sync(&ucsi->work);
 	cancel_work_sync(&ucsi->resume_work);
 
+	ucsi_debugfs_unregister(ucsi);
+
 	/* Disable notifications */
 	ucsi->ops->async_control(ucsi, cmd);
 

---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260611-usci-unregister-debugfs-a24cfd3c59ac

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


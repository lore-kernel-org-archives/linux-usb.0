Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D908340E8EA
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 13:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824516; cv=none; b=NM/Eh+6RtuOJzbuWdqwnNHK3bF+mNXI/iYzTGZ+dXBYg8shnyiXf/hIQegf3XWPsM6KPQy9mkmoq1EJFeeeJ9meENrfVl2zgOzNKMYcojteYO06ekH+cfvJyf6PEPS8mkHujD9VzLjPOOaS4Pi2auqauu52PCpjhzXNNtu9Mj3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824516; c=relaxed/simple;
	bh=DSQxXIgDCkPxGbaPVXTbhuAq3rlZnyHg6luik3fs1z4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OtfD1SkFWVrJvhg+J+ymVfire+T0JkD1lmTCEL6RdGXrGqbJ519kmrU8p0dCcLJBDTdXhS7pokrhAGRvs2ZAIOKSJn4T7IffwZKpOienmUEU4vCE4HRPmgrvCObjLLs7YnQaJXq2eZgD+ifqnSNhf64kxikBwD0/y3GyvfJnnoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ygq8jBX4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZuziLbQw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ygq8jBX4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZuziLbQw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mqTj1541611
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 13:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mSN2VeIZJT5Di6yVQ0OWzmLjmf0jzhX6VKH
	RtfJvyMU=; b=Ygq8jBX4gNJWtOGPJRJNj7P2qC3IaBNpPslrFRA33Qs7ZxEfAw2
	SjhO7EUMJLnNcPx42mhjTheXj7gwaLjRLTDYP0cHE0Id/Xh7cayax+InndJxzyhA
	VqUBKBZwgyoK6L9oECp4Sfh5aIJDerRkMEWvBjc4LvpM8I3O5Hn6l6CTVm+yMzgN
	QgJFhlP/xBh0FGOYunH1fzd2z6mHawZwFb3ipHZTi5x8lJHs0+7EDf5bGlMBBcUS
	RWvIhKMYDcoqMKezJ+Hermxd9QFwiQOesEiVkB+5Rwmn8VRFBoxGqi0Tbt9RMR7/
	ppfnTn3QbKa/EEOQFy2T/yc/WkG77SBCFXw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp2j9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 13:01:53 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9d3aae57aso2009147a34.2
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 06:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782824513; x=1783429313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mSN2VeIZJT5Di6yVQ0OWzmLjmf0jzhX6VKHRtfJvyMU=;
        b=ZuziLbQwlgRIy/TdHhe4gOPGgqbenhD9GpRebM5B45z3T2i30LgNJhM1SRciImlhzJ
         6AYInZI4L7bjg0lNDO+/tpxTlyVDz+oXzRTDaUOyiFykSZVToiQD0AOw1KCzLEM9qA7T
         KQqRQ9PHIYm69UE+kFMottDDdIMg5hbXI7LFicV8JiVAak/htvARZatcnYs800A3gfLo
         VNJP3OzOfNABF3k5Bnrd/DoC7AeBH1rTJLhADpu6ATy2wtUAXBUz2U9r3709eoTwqoYj
         WxSsfO7Lw/R7HeXyBfGeXNu5Dbk0uF5XC2O1r7RWMMB4z8PD/vysaiq82aoDnou8Y6hy
         SKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824513; x=1783429313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSN2VeIZJT5Di6yVQ0OWzmLjmf0jzhX6VKHRtfJvyMU=;
        b=ZlzcjEwvaQm3/5YsIBX7i6zhqegwhVnqdA1M0MgTGStIsYOz9K7tSEGrBwohfR9XiN
         qlTHWhpx+GnSFR2NxQUKKqJ824lQd6uReO3jeXZSs5y90nI60r5IHXE1hGL59bheFnCt
         p63fdiXuRR9wJm3rYhFciqY0ew1kJ7iGu3YaSUTi2SWi7ILuPA/2uaHpILaLrlDTCVku
         EMOgv6LvEWxTyqqOH59k8Y27JV9hbWHI8MGhu0di7biHouaMZY2mJu0IbnDMuVlyILJs
         taMV07AaQAStLZNRyNcxPvvIU6lAUBidKILqYWSDJyc1xdhETmpaWRacaXivsL6queOF
         qKQg==
X-Gm-Message-State: AOJu0Yx2tKnjsfP5mIkiVqcDw7ZAPWqEEnjXe8q+lgHmzTUVZOhClhGD
	oBCoaAqak+1FmOyQdPylSni1O8qNaues8ZOZphGPoJrEigk1slF3MrtNTr/3f89+Nz1MYptT68b
	7D2qXutKWTBILP0n7OE/56ciNYXZ4NDbQ0VYUgY6JJ6ciPU3Tvql+Zf6f/BMGIpU=
X-Gm-Gg: AfdE7cmzY+fGhHgiEZ2eXOyAoZ9Mwf+MBECdkSwE0HDTYVqlGClMxaPmCrhNsesczQ0
	oAn2qPhR8yt6PXUqNubKxjyrHxcfMRlU9D7ixtc1AoCZ6cWV6tJl7J9wDme/9Y8rc2jTolhuvou
	S1EsAXJwt9yr+IeDl59njS0vCISSWTM+lURZyWIulDdbxxmYYXTkPLjN6QvEknN2gAZuUrgTx0J
	pB3tscliERGTeDVXpU6iCCUPcfUU+v5B0iMnBOWYwgPTo/QbIb3UABbjbhL0cNicwlDnPzCB3W0
	9r+gcUkYhuvE0Y1gQ7sbyDk8FTM4g8LZouTU+WL+glb6aSEAgMbNLALgk1TpZZTLLCQNFCp/aeH
	Tm7ANzAidQNPxca/nL8lOZ+WeqSPjozly7fNfzADFVWEr3O3ut49N9HYoBR0ky5Dqkp5Vf5/gU6
	7X0cAzNQekhIE0Z2m8nqZ9HVdQNqHBnwqVWR32At4kiHWxdjZofm6n+k5Ky3ix04c3xIOaL0hpT
	vDzbGPms08Bh5Ja
X-Received: by 2002:a05:6830:490f:b0:7e9:b4cf:5996 with SMTP id 46e09a7af769-7e9fc166db0mr135585a34.25.1782824513099;
        Tue, 30 Jun 2026 06:01:53 -0700 (PDT)
X-Received: by 2002:a05:6830:490f:b0:7e9:b4cf:5996 with SMTP id 46e09a7af769-7e9fc166db0mr135534a34.25.1782824512584;
        Tue, 30 Jun 2026 06:01:52 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c968400sm1155609a12.25.2026.06.30.06.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:01:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org, johan@kernel.org, akpm@linux-foundation.org,
        andriy.shevchenko@intel.com, pooja.katiyar@intel.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] usb: typec: ucsi: ccg: Log firmware version and hardware info at probe
Date: Tue, 30 Jun 2026 15:01:47 +0200
Message-Id: <20260630130147.1385145-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SOosAt_cs8Uz5HCfLJOuC_9ZJCvbQfq9
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a43be41 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8xlLZXg4DAQ6vveEHZQA:9 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: SOosAt_cs8Uz5HCfLJOuC_9ZJCvbQfq9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMSBTYWx0ZWRfX9XyXrx70UHaO
 wgMl1RqPiWizX/HIynXXR4LlBJsTqSIrj6mkF9F05r2mKf4itorqspICeAGLQpBlGoygXgiqZMW
 ihOVTTiGdLnWI/v8nkWoswPBSh0dtRM0/ffuLaRjXkvIW2Lfkuy/jYARJI/lbZLYSmIbYZkzsxx
 Im/1Y0RhSL19pXQcl2yFX0D8Su0k5G+qS7319p1ZU0GNW2keDxKWKlAYptoZ5yF5klBggf1asEc
 oUXqs7GEdGxBdgPEaTZM8hpNdGd0WiFOHCSEIbwMfp2+beVjJQ2CFW+f3vd8SfDZmNzEtv2Zb9T
 KzGN4BBDtkRAgR+pSz82wT+SAjUmksT+acmmZqsdUYSHNJWsbVOuzztpFvCWGyQadimlqKZAPRN
 oOrhn1oW1JEWR7qMndNUO0lu7c6szKftNeLgIGZETq7Z/B3p1OqIdPcdOP46zR/i/71+uMLeA+X
 48WEdlrlOw8iOmWSarQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMSBTYWx0ZWRfX4bFjtlRSfXlr
 +CISkbisxorjHERvwlXIUOzIPFZFosX5lD96LtK3+xSHYOg/J+z61ZTzqMIjRMuF/mYeB6joJzG
 GNWVzdp9OLX+E7bluSg2Gi3xXZv5iWo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300121

The CCG firmware version and silicon ID are read during probe but never
logged, making it difficult to identify the hardware and the firmware
running on the device.

Add dev_info messages to display the firmware version and silicon ID:

  ucsi_ccg 2-0008: CCG FW version: 3.9.0 build 0x0000
  ucsi_ccg 2-0008: CCG silicon_id:0x1234 mode:1

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 4463c1ae96bd..2715bb7b53aa 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -738,11 +738,21 @@ static int get_fw_info(struct ucsi_ccg *uc)
 	uc->fw_version = CCG_VERSION(uc->version[FW2].app.ver) |
 			CCG_VERSION_PATCH(uc->version[FW2].app.patch);
 
+	dev_info(uc->dev, "CCG FW version: %d.%d.%d build 0x%04x\n",
+		 (uc->version[FW2].app.ver & CCG_VERSION_MAJ_MASK) >> CCG_VERSION_MAJ_SHIFT,
+		 (uc->version[FW2].app.ver & CCG_VERSION_MIN_MASK) >> CCG_VERSION_MIN_SHIFT,
+		 uc->version[FW2].app.patch,
+		 le16_to_cpu(uc->version[FW2].app.build));
+
 	err = ccg_read(uc, CCGX_RAB_DEVICE_MODE, (u8 *)(&uc->info),
 		       sizeof(uc->info));
 	if (err < 0)
 		return err;
 
+	dev_info(uc->dev, "CCG silicon_id:0x%04x mode:%u\n",
+		 le16_to_cpu(uc->info.silicon_id),
+		 (uc->info.mode & CCG_DEVINFO_FWMODE_MASK) >> CCG_DEVINFO_FWMODE_SHIFT);
+
 	return 0;
 }
 
-- 
2.34.1


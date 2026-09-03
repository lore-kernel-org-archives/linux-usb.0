Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF7B4EBAC9
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 15:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449946; cv=none; b=unymFNJiE83Rn4GgMmLN3HTuHgj6miwRiHp+bTcNGp80LLsSrl2c5SpBNorZWhFTe4YIOdFDdHcQnxyuVDRddM+cQ/c2FtYD9K1JtP/sfjKBx+9SysCWvbdPHkI3jmYFzOY2j44ICI5DfxtXt5r27Oo7eHzScal3bMroU8k8q1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449946; c=relaxed/simple;
	bh=mst0BKwNQI5xzsAgPU0b63vSk4pLGpAaOz+r5wcrQHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H51f/5lYPeLjSJXud6LhViwHMBJN8P73HZf0w5+1YEGRrTTnGMyl+gtU7I2OseqGK0klSoRgrmDNW5522K0CdLK4HknBGiHt6SaqGPynrvBu9P60pqaGui28qtGc0rQZxA1zmXukj6OwIpKZuUJ5NZFIxDsEyp1Wds9pd9sAS9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKu1Kj8h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhY5x19W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKu1Kj8h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhY5x19W"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAhDG707759
	for <linux-usb@vger.kernel.org>; Thu, 3 Sep 2026 15:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h63WXqFvCbF
	y3gKLgyxNvCWEvPKYpY2mQIKN7hO7nws=; b=cKu1Kj8hW6VbYnqRIufNTYuaAj5
	pCFmfEMHXoUljJlOc38xxTGDhXwL5sIEQJJnmzlCXLyfegABjH98HPWawQhrDl/Z
	3F9VZjCzu03Rqt+vFMUrkDiJ4t6hAfHwQ/sIF/eTNOZ35rS0lC7u6zmrNNb9QLcH
	08trlMbGPvCpBhP8ipa7pFbdYzjSaJjrctNotK7bNP+9KXDYx+njuaT/UoLUGMbl
	UM62QqtzCR+FNi9/9i0JtqHLk01dcFEgBe5IhSG8qZXt7iKFUbq3Wi+8QXUWkW7F
	LljxuGOpj4ydM3+dLQ0y23LeRWo8NYEhz4HZnvZTAnQQsDN7QYuqNCLXrDA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekj3aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 15:39:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c1cc5206so58785a12.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 08:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449942; x=1789054742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h63WXqFvCbFy3gKLgyxNvCWEvPKYpY2mQIKN7hO7nws=;
        b=fhY5x19WcYuT9lbgwCDUAECybbd8xdLmiNUhqXlwFQtMmg4JziZZJUmWBXwj2Wuiq5
         R+LjI8oBw5O4+dejuu1/NoXoisd5lB7MfgU52b3mxvhIGPp7ljFqCIbMN89V4O0ftVO4
         31IvX0m9UAPA6BsiLOxC1flrR/CZIk+nkKWfcVNOINtllMnIcb23JEvl5p6qEFD57rwB
         2n2+z1ufpQ3M5k7FlqFrmb9KLvDYlizrRKlgtL5VhPK67VI9HhDsOZxIu0/QKcqCfjdf
         uLqzgj23cixYRE7JwlMy8EBxDMT8gYjzi0Ihga4OiYaPoZnitwsjBWuEBaG6bOTElsb8
         M3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449942; x=1789054742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h63WXqFvCbFy3gKLgyxNvCWEvPKYpY2mQIKN7hO7nws=;
        b=YMuhGGmtdY8+EsIhayd81s/RA6yqPODBV8cpVjEt39K0MLohe8UhUtDAHK3HS9+iIW
         Bu+3CoK0G3rGgM0yfFZZtdKBnv0pgoioGbfp2nRYLe8WtGM7/IYX/mOgER6wFGyHWj5T
         dcpCd+/5hPsAnlxr9pteypoOxa1zQcXHJs3QPdQTn8LgJ0nB4CKxd0O4EgF7Sy4apyEe
         LMMCuq83aRLket8pjxQgh3BwoVxr8r4JuRvzNHWQWDSXfA1PBhULCvZwYqWOt6qgIks9
         egiKd8Dmo3sbtc3CI34xnNK3M8OjE7pfAk22p7Kpm6nZZ1ilsLOXzyiHgP9CwbMIOGl1
         j6Qg==
X-Forwarded-Encrypted: i=1; AKwUvByBZL/ecmvM+WcRV5W2bmCNSnkO4P6vnSD/93lwzRdLUT/oqapx/JwfRh9opAg2JtqPMsXwB7N2kJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lVUQlCayvU4wXvBH3gqCAS+VIZmofxo5f2/6FKRSrN7G5jXOf1
	8PPrQxkL4pvkLGcEFg2W7FrbbKUVPSElHonMI08xATpLLRU/Hn79Vu/MHzGbkNLasRJB0N2vK4A
	ILIB+Wna7v/QMRtO1mY1vZvoPvXcRoo8M6QBH4luHFgY5pJaAAdnOrkY7hRE7uuU=
X-Gm-Gg: AYBFou3bAfpSQbAPEJoym2gxH4SpQr9PbC24lvD9IGtAc9saafgBtVM+xuwlL+Km6iP
	wOGdItU39rlrhdXCIWsFa8TfYmODWTELyGfzcmkJRs6AGCdo2p0qJEr4tqwXIPtGb2F13Tc6cu2
	ibJDVrNUuOqjpaly1hQudkcWASTi6FsBcCcInhXwIRDj/ufLRBKJn6xdvaoUD6yCCXW7BZ431Dh
	SeiKwJOn5XldCHysegRHnwrZbYzIICvnaXs04NSwXyxpXL9MgdiLDJ6t20lHhbod6WxpoW8TryQ
	GQnGmksdlZXBRii7GkLZZAINGCNon7v2HYCBPLYZ/UY6pKrZFC7lm5mYB87ZKT1I+t685uC6Y1I
	1eiGjIofkFLs3JV2bpgK4d74v9OyojNWt
X-Received: by 2002:a05:6a00:8e02:b0:857:727c:a1f1 with SMTP id d2e1a72fcca58-8613fc1f0a5mr1326526b3a.19.1788449941825;
        Thu, 03 Sep 2026 08:39:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:8e02:b0:857:727c:a1f1 with SMTP id d2e1a72fcca58-8613fc1f0a5mr1326448b3a.19.1788449941199;
        Thu, 03 Sep 2026 08:39:01 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm81069b3a.40.2026.09.03.08.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:39:00 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] usb: dwc3: add xhci-reset-on-resume property for power-loss resume
Date: Thu,  3 Sep 2026 21:08:25 +0530
Message-Id: <20260903153827.3463313-6-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lgSxNF-BbF-MPh9BAuV7naFX6H_Cd92i
X-Proofpoint-GUID: lgSxNF-BbF-MPh9BAuV7naFX6H_Cd92i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfXxZj4VfTexOs2
 hgYS5rPODVw6Vwb7ev9mVK/OGxvqK7CrmHpXjng90S7NWEoK7xF9gUa2h7W37lPz17uVdlIew8F
 dNlQFY1bvW/Csd8gYqrmIM/FeLMVdmNHADKZYhTq7bfLlF1M+rdeL6m9uT7FG4nmF5VASLU3krN
 i47SN6PXNA3J6k/XbaAZCfJqbPquu505FfWz0qkaP8chTeGET2VhVv9r7MjqWmHLUywFWR4M5Ar
 glTpzBhiBdYaMK/y1QtxthbwTkBEAInV3KoPptoWhFfucW2sFOXH45kd8UHzWmkV8Eo0iIVKnYW
 oE24MkaLUX1FGGTC+b2GJtxfrNcWKKKpqeIYTsk+y5BiGgbSA9mKBgqiNVNTDjCOLwerNedrfyi
 MHg8SzR7gzNVieb/Rh92+qTRYJeLeuhvpFBZe/NZ5RyLj69SUJfXaMTSpUbjzRk5buEGFYgiKsn
 Fpb+AIEFLx3XSQRF+aQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX4UF+ZY3xXXPI
 pZ8ed9vmYlSPvW75C1hA5NzAg2U1olm1TcMS/1ZYPSIkFtrEYG4yGqB7srTywyIOTUz5aADd1Zq
 9h2F8YeQA+rcd24EuhLe2dZc1NuK4YE=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a999496 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=7YzMA-XWCf9gdZAyNeMA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030136

On platforms where the USB controller loses power during system
suspend, like SA8255P, resume triggers a Host Controller Error
requiring full reinitialization.

The xhci driver supports XHCI_RESET_ON_RESUME to handle this,
but dwc3 previously lacked platform-specific quirk configuration.
Add a device property "xhci-reset-on-resume" that enables this
quirk for controllers needing complete reinitialization after
power loss during suspend.

Let dwc3 manage the quirk for the usb controller using
software properties.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 4 ++++
 drivers/usb/dwc3/core.h | 5 +++++
 drivers/usb/dwc3/host.c | 5 ++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..eb6ffd5148a7 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1712,6 +1712,10 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 					       &gsbuscfg0_reqinfo);
 		if (!ret)
 			dwc->gsbuscfg0_reqinfo = gsbuscfg0_reqinfo;
+
+		if (!dwc->xhci_reset_on_resume &&
+		    device_property_read_bool(tmpdev, "xhci-reset-on-resume"))
+			dwc->xhci_reset_on_resume = true;
 	}
 }
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 608daeb7ef10..0ff23eb217bc 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1172,6 +1172,10 @@ struct dwc3_glue_ops {
  * @suspended: set to track suspend event due to U3/L2.
  * @susphy_state: state of DWC3_GUSB2PHYCFG_SUSPHY + DWC3_GUSB3PIPECTL_SUSPHY
  *		  before PM suspend.
+ * @xhci_reset_on_resume: Enable XHCI_RESET_ON_RESUME quirk for the xHCI
+ *			  host controller. Set to true for platforms where
+ *			  the USB controller loses power during system suspend,
+ *			  requiring complete reinitialization on resume.
  * @imod_interval: set the interrupt moderation interval in 250ns
  *			increments or 0 to disable.
  * @max_cfg_eps: current max number of IN eps used across all USB configs.
@@ -1420,6 +1424,7 @@ struct dwc3 {
 	unsigned		wakeup_configured:1;
 	unsigned		suspended:1;
 	unsigned		susphy_state:1;
+	unsigned		xhci_reset_on_resume:1;
 
 	u16			imod_interval;
 
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 96b588bd08cd..2170fcafc889 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -129,7 +129,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[6];
+	struct property_entry	props[7];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	int			prop_idx = 0;
@@ -173,6 +173,9 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (dwc->usb2_lpm_disable)
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb2-lpm-disable");
 
+	if (dwc->xhci_reset_on_resume)
+		props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-reset-on-resume-quirk");
+
 	/**
 	 * WORKAROUND: dwc3 revisions <=3.00a have a limitation
 	 * where Port Disable command doesn't work.
-- 
2.34.1


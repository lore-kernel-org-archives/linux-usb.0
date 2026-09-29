Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5B64E0B8D
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 21:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717732; cv=none; b=BJ1YKrXNtBqxgnZ0EEvxBzuHrF/J2mPE1zPzz7pe9HHd3d6Qbnj1K77Xf0dDfwSLKXgHkctTette0+AgRPM0C3GAWkqVqNfjdasut6A+fZGp2Pz/wG3HsUA5wfF6xZEI7yH+iodInDJ6ON8gukUEKQBCSQRsPAMMlJ0Hku6RDQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717732; c=relaxed/simple;
	bh=DfUyGXAigUOuE5hAQY8vlBtickimUxiN0dtZr1aGGUg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WzQgHR6xIMYxi23epFN92gpXpL2I9f4Xzyg8Yt/pMl8JB6xDR6x7rD0yl8zrnlbo2QTEgMMj4MGlZ4MHTQcBGerKc1bem55PP0GMU7Q3QleHUAE/BnLjSMJaRJGSvPZ4WCk9BnGJjbYk9JKY4wjKPWS0HjrP92BKF5FP8HWZBtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1J9L1ZA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2004fv5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1J9L1ZA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2004fv5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THeFHH3842728
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 21:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rNWQbn5BoFz
	a8fHCsTIRq2Yt6o/OubhO/LVi7rDZ/Jc=; b=l1J9L1ZAExmknpE9xfQcdyPpLvc
	pf2BO9KDSOTP99Ujb4g91HCHQg1O1qNtPLZLgzsQbcVjBTmtrg3MjyKqb5/ZUk9N
	+MJI972VCVy5i1C2QxPOspYBq8EFaODpxYiwyqio0tEc9E3+GXZdWrEyma6xmVPf
	vhKvISlP5eAWcqb7zNTJXk6cLwxv4kW6+S4wh8RjKrNYyM5SWEKTY9f2DCjxkmON
	THxTOTE/y5I0+FGy7mqKMU0HwKmj2O6VSjZaYTgrkPdBcEo779a+VIHCvZzg+RAo
	pEPmHxcgwA2xlcXZzJceylKYfSyQgS0LI3l2J7I1u6Yy0+uK/BTF6wlrkvA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0vb1yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 21:35:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1616422eec.0
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 14:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717725; x=1791322525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNWQbn5BoFza8fHCsTIRq2Yt6o/OubhO/LVi7rDZ/Jc=;
        b=E2004fv50zBJ4XupDmeEniCGDRy+om1FgJFuZ/xrQ41B9p4ZEBJx2JVkIGYOAVgaUx
         yKIcHO/qJTsytmQF1R6Mo/32t8d8S7ZeUk1z5CgeQwDGsrp6hIpT8RjG8GPWbBXzM+/W
         Fg7T4ippONjds0ZNq3SqdE3ocem6RRQsuYlvrNjDQOYTofTmi2ZmU454bNLz3ETSg4vw
         G79LojAfcYREePsqbYSlfj+jvPfOJU3xT/kyC0rh/r2vCyXyj7oI2Es2I8wpKEaiHKcj
         Sg8ecW9Hn5UGYztn+e6ree6YuuVuHPu4zez6LoincMm09iTZO2JgJsfjz/LiTNAdPTJb
         WyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717725; x=1791322525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rNWQbn5BoFza8fHCsTIRq2Yt6o/OubhO/LVi7rDZ/Jc=;
        b=ClnvUz7CNt4hP/v7K0zRTiZ8AyGQI6ye6O1x918peyXkFYUXDw20SzhOuGL8otJqla
         ItiEJcfJ/3alO6fpRwo9/bGVph7ekfcd/aubgiIoTbYONOcdrNYUtxaCwcwaBDRKTKZ0
         wSStCZdjDY5tDr13m5V+H3iVCWTmH501zLTescUBbGxJPlp5nN/hLo7ZvWPerwhPGSeE
         nbYjghCUShQ9iXz7gU6cgErxapmTZ01PCNa3d57S9QJbPgf5PRuWJ+wfrSOsRIOPcQPZ
         wLmlRDrrFAC7gbpP1l5t3dI6nbSfqWE6GBkeuHY/Yqi98zfGrOo3R44fnR/6PdRMW1ev
         3P/A==
X-Forwarded-Encrypted: i=1; AKwUvBy/YuBeFlluGZtIkAVOO6ZVvgNxzhwSZzUwQzJLd6hu1N8Xb2O8BuV0D5+SsuVnq1CSO2CFg6NPyi8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl9QEzDl4/qN024LbDvQJ2ajq4hUu9Fz3S/2DzBXAO/v7IYbZ8
	9ZaRYRsuYX7j6sAD62xpYZkX3L3No5E8gY2p3EutS88XwoutUof6uHLojt2Axg6kAbQfefGPJNV
	kLqaXpp6q4w9OpDk2LlQiyqGJJLdIm2N9LPGX/Ks8/TY4wy4W6MqjHqu5vcahYJo=
X-Gm-Gg: AYBFou2mMVtDgOPKRQnBPk+T9jrkhZO/MpEXtgvxs3RcIpvMc2l/pThqjEST4sHroyv
	jFyufMO9I0aqQ3AcopZUSXJC6OpjMwOkIuFiI9EFvb6lEQIR6ohO15eF1bcXLm4AAXH6tMjvVix
	Sku6NLNE2TRB2EQ+DlGsLlasoHTJCuXhRVyEOORPCvKYdLR9POpcFT/yfv6tVbLnETH7gw5wLmr
	GL/x9FowF1FCzRYX6IzFkXgovaCz99a2FI3NPfffgvWzXZ7el8OxKf28STP7u+XwYVsI+PY/yma
	NxRGwqEQ13iQvH6gGqI9Pz5FJOvjQMyVrC6Zqq+Cv2D0zOcrILKWTKDP1/cIRgD9O01vye1Gt9p
	Vh0+OTcdSRzbdtDb2CKR4EcODfxKvf3wIQW2rKk+riOAGJv1NKyN2
X-Received: by 2002:a05:7300:e9c7:10b0:342:78aa:51f7 with SMTP id 5a478bee46e88-34c675c97bbmr708988eec.38.1790717724994;
        Tue, 29 Sep 2026 14:35:24 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c7:10b0:342:78aa:51f7 with SMTP id 5a478bee46e88-34c675c97bbmr708947eec.38.1790717724278;
        Tue, 29 Sep 2026 14:35:24 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:23 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v9 7/8] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Tue, 29 Sep 2026 14:35:12 -0700
Message-Id: <20260929213513.2401005-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CGPwWjpiWgUSc4qRwsTqY_5uweIRiOVg
X-Proofpoint-GUID: CGPwWjpiWgUSc4qRwsTqY_5uweIRiOVg
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abc2f1e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=dOwNoGVJVf10FbPJOZQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX0uRRA0/IpljP
 6BSjXZ8EcxXMWnt2tbnRSHXFU0X4ApPDmuRt7xP6eDx78rC69F1uXInOHfYZYUU0/b3JDyfzMf9
 gLGIM5NCaN6aFN98OW/TN/98rfML6M4E6+HS0310UeUO9OYOjn2NGtYj5BXJMaC9sWeeKJ4bzXr
 VidpzDHwDh6iycWLW1spJ1p+U9TkbsjsIUypXMdyJbZ+KZwlq/s7UYxC0eE7j5jgEEfH0W/T2pF
 4HQeZxkOZL1fwhq7UPYM/9DxKUNHYtc2jzI9vjWlKl+m6SBhKG9efpfB0m73fH6cYg6E51hx9RB
 etscU4EV22zjC6NEOu354xog6xbXjDLGUYHF+Et7hntSBWHHTwdRYFEInBPxyRB9/LGxLeQBYQa
 hRhLz7yhoY8J4AQvc2HW/Nwbr6xuOuZWbgZi+wykVh/tim/DySL4cwZZ+qLU1YqwVv1JDto5Z8b
 t/m7o+mfgKWu9asnxsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX5nRJpyKTuU5m
 ntbeB7chFXJjhcKn2IRdSdvJFZIWkZoQ7jXyss6WjOuztyikqHHVONtHQcqS24tiOKUlaWnOkrI
 L5fmo347neE8ZycpfEKmY4XqJylqgOI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290086

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 5a21a2dd0b0c..f6a5c2ff03bf 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -313,10 +313,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	path = chip->paths[chip->port_idx];
 
 	if (chip->enabled && path->curr_role == USB_ROLE_DEVICE) {
+		/*
+		 * EUD virtual attach/detach event handling for low power debugging:
+		 *
+		 * When EUD is enabled in debug mode, the device remains physically
+		 * connected to the PC throughout the debug session, keeping the USB
+		 * controller active. This prevents testing of low power scenarios that
+		 * require USB disconnection.
+		 *
+		 * EUD solves this by providing virtual USB attach/detach events while
+		 * maintaining the physical connection. These events are triggered from
+		 * the Host PC via the enumerated EUD control interface and delivered
+		 * to the EUD driver as interrupts.
+		 *
+		 * These notifications are forwarded to the USB controller through role
+		 * switch framework.
+		 */
 		if (chip->usb_attached)
 			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 		else
-			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
 		if (ret)
 			dev_err(chip->dev, "failed to set role switch\n");
 	}
-- 
2.34.1


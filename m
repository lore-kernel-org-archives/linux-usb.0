Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DCD3254B0
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 03:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726945; cv=none; b=NPGMIAEdX44cQfIJMC1R48zqwIOOwD1oUEzfuMONcC5OtnTrqtlFhx02H1KCzRb3NcguXEAT9cZY8kYtViwV6IJoUfKoBkQIoAyMjwh5aprecJ+T7j6PmgET9ETggZIjLJ8EfcTVo0p/0RG93XudETpjNE3xk1qpu2MijO//Ebs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726945; c=relaxed/simple;
	bh=HpHLnY4+cq26k9bEYWvJsx8FG9JYVOEw8X6TJecOzlk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MJDVysk7CAypHv4H9LH3IL06/soSQ5YmuAal2ClExjASzLmf0PTmKrIEdyo7HntmPhaJx4vi1OGbobV1iq6Aodi57hpjeO7WDPGh5GGchsBxIWhQ4SSuRFFX51fhk96vUMF7PL5jeVKRLkN8t/ulBYQ4BQO8JbZCvl9O0k65ehc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZ0yOm55; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Orbt4cfB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZ0yOm55";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Orbt4cfB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LVWQ92941161
	for <linux-usb@vger.kernel.org>; Mon, 3 Aug 2026 03:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lh7VPnpiWdW
	yrdblOAW9o/VI9PYxFPN0+cxK+2KPVVg=; b=ZZ0yOm55CmwDCYxS11YV2uc2mNl
	P0om+LSoGl+7c0OTrgyNc5vjgDmMECakEzeAHJbIf4W2qnQ8CpYBqjGveTov+6xd
	TXlaKt3Y8Vo5JC0An4V4qjUL5JsOIi8Retgdk9JC+OI6bLFko84rAaxt+EZlA7kX
	ioR7DeOOKLSs9dKz34oRxs4tMHFVWMkz6x+f+K3QTTyqY9ZrCh8oze3mMF0WXpNR
	t0a+jS5ukJrXtETjBqFzdtj7FCsJ5FzLULGjkNwKiA8vfFOA7Lmk7+CVYjvGbWFf
	eram/IyW6YOoAWnaEUVdR2uWC9AZewVWJ3ySrHmm/9XLXSitWOcxBGsjCBQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs911c84r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 03:15:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so3915959a12.3
        for <linux-usb@vger.kernel.org>; Sun, 02 Aug 2026 20:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726942; x=1786331742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lh7VPnpiWdWyrdblOAW9o/VI9PYxFPN0+cxK+2KPVVg=;
        b=Orbt4cfBsyPjubVLKgROhxYNCbzYaE5GURLGgaPQscmRo7Bg5TxXPQMKF8kt9rS+Tq
         BVXDaGLwgTDSBKJShm69+TIZyUIbAt9cwAEwiBG553Fpqi0Hy3eDK/CYli8lE4jvNnTi
         b/wbDNLenfv6Le5S1QMNKNae62pnatSDC8xzHszj9OLAy7HL0t6TdUMD9+xRagh24/dk
         EI35Ro2iSML3Paf304+1VSbaOlCniv4PuS/9LM4SwX2hmqhkTebMhYUIK0yE9gxPO0Gh
         T1ODBHVgTFb9RMCPmnk3TxCRTdzhAaxGNBcnSCXq9We6AtSF0+3cgOydSMJF38x8BnLS
         OE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726942; x=1786331742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lh7VPnpiWdWyrdblOAW9o/VI9PYxFPN0+cxK+2KPVVg=;
        b=hVpNm4u+DvR4Ye+TZIxLAP2OYBjkY6m2C2OsvvPDvJqCPrsIyU2rRFmHwKptzQoWey
         c9+fo+sf9Mn3w4shsl8KTd7ldWBOOhVOu1A8WUgJ4CC5kE2zeoKOslHded26Yj0CU6Li
         R8fM//lt/ZbVHYQjrSS2ph6di1z7i6O0/iS6B0VBdQM3Arrv767NBT02SRqrPQzHmMp4
         Uwd06ZSm0LLNoydTBad2x65hVqPfJ3TTQYBIgabQAwjOtEQFkr10G1TnmnQWiE30iMoP
         M6SAvxZUNdJR3GYeIEGxnUfvEF/igxDXMIKulpm2tnZC3O2+3U7bQdbHFUGYKmQWKRjt
         1ZZg==
X-Forwarded-Encrypted: i=1; AHgh+RpMXBr6Z51InqSaXPpL8c5sOKvj/YJFbAzdh4QGiL+27IC1CWdgmXbojUlw14g+z1LOHKHFeLCGcqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgFjrlFTBhW9NoZF528yrPxSzGoOiwnvGvKpBhIU+/ddtmgG2a
	2t+DYSJtuS5Ru821zJphGhAGrnrkyEszI1mrS6H1R8aeCJGBfDs9bGdQdOiDBDWKqGMgzSo6RBI
	7S9UDm2FfqFq4psWD47GZBSLqxJLP/XJToWn5rdEbVWM2DSexgOd1AA8925X+zi8=
X-Gm-Gg: AR+sD13HJxREecT8LPBevKramJR9ezMLKLUQWw1jjqMpr+OFjsm0+gVev/0v0YoUa2c
	3ISo1/diyxU8VObwap6NRRwLwQZahCXpFEpokS6pSKt+paXftM7oftDPsc16OLGLCV8bbQehl2W
	ElUZmNx3tOsGbzbCFEAlM0Om2+Xejv8lGbbLoD9pWJ0oUmvfiJ/IzoQnDUHC5i4eH+nSC0U+p0f
	H5vEOX8mAuOT9BtrPY7fhWmdpI+KZWXGAKLPOIgqEuXWzn/OcaHVzDICQOuRliccJgG3oc2UK1F
	pRfgRYzNHeY6x2NmjqYk4Qqxoy9jYThmKwbarI/CE5D3PO7kGPpE74wN3UG9Woe2Z36off0vkmL
	wDFRzA7s/aCXcJXf1X4RsM3QwtymCySgmYeGNAWK64bw7gFmsrjk5Uw==
X-Received: by 2002:a05:6300:4045:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3c92a524e22mr8309481637.23.1785726941854;
        Sun, 02 Aug 2026 20:15:41 -0700 (PDT)
X-Received: by 2002:a05:6300:4045:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3c92a524e22mr8309462637.23.1785726941444;
        Sun, 02 Aug 2026 20:15:41 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:40 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 5/9] usb: misc: qcom_eud: improve enable_store API
Date: Sun,  2 Aug 2026 20:15:30 -0700
Message-Id: <20260803031534.2942628-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX/gEVXsFyk/FU
 8nQLXlpO/4D5lkO5arwgdWEFqphj6men2J2X/jdE/f0wwnZaFE7bQOI/oMeSR8gt4N6pXaAdol5
 HfsdwGJDswYXwBi5zWX88SuKNxqiMF8=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a7007de cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: FglGvZ_WhDOJk_VDmZCLj5wW2VGHzp2p
X-Proofpoint-ORIG-GUID: FglGvZ_WhDOJk_VDmZCLj5wW2VGHzp2p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX18x1AZ6lRnDt
 omqfhx/ZM/NvF35Pp36rR5G+wi6EvUVURQBFAIygmiH5+MWSB+79Jw56VozTc9orl9JTFN1jBlK
 Nrb8i2TsI9JU7BIqv9JzSOuHJaOR5z9+U0brVqnsf9NfGyBsP5JehOralKBAPGOp5PlGZws9utT
 8RgmTxGSDatkXla/RzhBMnYj3kgD/jZEQyW6oqQ15ZKTJN8mnowPZB8nFn6GEYmqBNk3X/nbIVc
 204xI4kwU5jcmUEePqmVeTyct9lkVsF5Q5KxvRbtz0NCLyypp8FGYpYh8H9YMYVrplRcTaE/qHi
 96Hujgw4NK0pqzNR6vuIvRHoDnTQbtlaQlW6Ch3+HiRXorsdCumkcVlIo1H5/AbMFntDq69/gTl
 pfFV62EhqG1je7Chv8xN1kyqVhJYTkIH8+gpuO1mK+Qf7NTIyZSs4WRS19dBwLU9B6TfiCz8VfK
 GKhG6/l+lijqaKImZJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030024

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 48a4441b0c9c..e83a4402e4b8 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -162,18 +162,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1


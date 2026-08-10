Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106C02DEA68
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 00:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786322583; cv=none; b=EZ9Z26txYZFBYXvFX4nHmqkfl312z38IiTvQSWfKA1AGRCK8HDKGpbt01NBmgwMz75h7uiRx+eQDJLfQujlDCiKr9R3C/aD6TsxFyY+6WiHaXQD2eLuDAUKR5TCuXkeKWKSPkP5UiIMtEvp4yumk+MfIf2AgtlPtKN+yYikBhqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786322583; c=relaxed/simple;
	bh=zCCIQq+KrJFZtwfxH39V5+ooJIN09fl+sQ/FabMIwoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FU370DJ1ghFGgQWHrQmrmgYwAlKgpcn3LeJ1+5/H5ouQwJ02hIW+6cbu5Q73hCXAzgU7fYt/iVkArX3X6yyS5JCIjDpcKaQKhCDMUT+pMkCsvjbZ8dJHMREn+VuJdxVbUY7/eMM+oSaMSkRcCz9ZfCihMC05dy9xE/vmZtAclro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ISeemduv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXKoo7Y0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ISeemduv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXKoo7Y0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L7pav3779917
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 00:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pj8QCJu20kF8a7wqUi/NbuM6XX7lyQobeVKElhOCGF0=; b=ISeemduvtK0tDdLY
	dHj7xqb+SYs7BBVULG07z/wxqOeDkvD0OtaKQtBXyLKEdnEs/Yyq2w+6615jOLcw
	8MpXjYafrkasv8VryjWgVDEgY0+LqOw1Pr1ozPCAKxt9D2GlNJSkXVGqtx8p4W3W
	ImocylISLmYgfuzZabyacE1GfPwQjdvRJSkt95+yKVKAfil8Gj0vfAL5v6iyzTZK
	pc1YLVpPpfkqcP2lwLMNFsiYdulQ9Yxeng7xydvDk+lZbE/m/YZkPKTDzV89D5Sh
	DdNexfUaPnb7+13STETzTvK1qSxtCypWHxJaF8Uo1F44r9WI9ZzjERNM/3dWAB44
	fkeWPA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvhvbtac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 00:43:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso18939551cf.2
        for <linux-usb@vger.kernel.org>; Sun, 09 Aug 2026 17:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786322580; x=1786927380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pj8QCJu20kF8a7wqUi/NbuM6XX7lyQobeVKElhOCGF0=;
        b=CXKoo7Y0wx+x6TUBA4fGxGwN3mp0+O2HdWG4tx76zdc6bcmTup8UGN6mtQfBhiE1th
         vBQZPDpSRHv05XM3n3wC1NJH4Y5wYyc/DMnGiG1JcMnrM30eI79wJ7q9otkW8uenF3I9
         Bo40nyCucsGHLevlYhkqlrNYOWE9Ylz5320kuODk5BNRHEC+mVZP6+jziDDZ8BXFSmAq
         3SxnG6J+1rQwDJqD353ocxHYXRapZ9KPII28ZYWix7V4oVGSWtjQhVwjUT3n8u3u1oCP
         Rc59iY8ltSkZMNwD+MoY0nci/xt+xQhAp1z4pS7IjzVri+RylSCh31pC4OqcmLx3q7JD
         nm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786322580; x=1786927380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pj8QCJu20kF8a7wqUi/NbuM6XX7lyQobeVKElhOCGF0=;
        b=Nvob6PbfjaD83BhpGmOFhPzKgrOquL11BthZcvTe1tX68wQU2tCZUf/bAuzPyIn55M
         P/Helyrj34MAihR7qONtUDODd1zz0mVBZbf7gLEutduC9DtoltpnvDR1cSFkRg6akMLd
         9u5mDeMZa3SDm9BeE4yC7sq/k7Cctf/6mlOtRr3pEh4jO6EvZoIZCLnZG8c7lirkk9lB
         +qPyfbWAksqzXF/ymy2B4pMpcdG1nv56fUomAMoz5YnQgFtdhUos8g46kISRB3AoE/+b
         8GJlKpm/9CNrUCz2GYjXnTW2y+b1ExL2rQaNS1GWpKx4xj8MIBC9bnwxpbz8/QwJX1mH
         9osA==
X-Gm-Message-State: AOJu0YyjAW7goRPTGlwDxLBYBQSUizdm3fSk0qmDnNH0ccJIMDclrn7s
	xSHc8czAuXQ/JboORo/FJBCvP1V7A7YAeCMekxbq/3nZxHwvHtW3AutBxV2P8hCAkdaWo8oHaLm
	7fM9t+DtuJiBWBMVzTp8mOxJH0hhaLRpoOrprMVtM8TDHOx7sQ5/P0dAKltEzWTY=
X-Gm-Gg: AR+sD102nZT9Q+ZiYdufEqfVdqYSzWm+HimCKfQFvaODm7+5db+zsfX7/tNwMLfRSed
	gyTjHe3qGc1Z/E/qzqiyHU4JYS1u4umTDmZ/Vud+OZxdnbzJPf5i+x74w5jSpDSAizS4IB8SHuo
	vJ8i4P6irMZ2dgPOtUZO1teujrnDPPosMgLAFQbFJ+hjunVeO2ephiD4wXSgKGEE4Ix0uv0oa6K
	NfA7w1NzWmV0sH5wn9nml3mLkuPSdY+T5qOFvCIRl04DTTVT7fCifsTrDhV1JIdncYLz/rB/EZH
	5ehjgK+2Ey+ql5kbUb3ZIJxer7unr20vIbp0hS2n0409vUbMBpMmDO8jpLbgu0htmcsiBIpWd5k
	KhRwdj9bZlKl+D9Q+hRlMsqVrU70VsjzphRKPk6i8PCBMqTU8mCVRDASVPMFu+xtDcUIso8QmbL
	hoM5fk2LRsq9zR+A==
X-Received: by 2002:a05:622a:3ce:b0:521:934c:bcf with SMTP id d75a77b69052e-52d191d3fffmr200362031cf.41.1786322580268;
        Sun, 09 Aug 2026 17:43:00 -0700 (PDT)
X-Received: by 2002:a05:622a:3ce:b0:521:934c:bcf with SMTP id d75a77b69052e-52d191d3fffmr200361611cf.41.1786322579794;
        Sun, 09 Aug 2026 17:42:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3d56sm1679742e87.69.2026.08.09.17.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 17:42:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 03:42:37 +0300
Subject: [PATCH 6/8] usb: misc: onboard_usb_dev: add support for the ASIX
 AX88179
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-onboard-usb-v1-6-08a805768328@oss.qualcomm.com>
References: <20260810-msm8974-onboard-usb-v1-0-08a805768328@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-onboard-usb-v1-0-08a805768328@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2718;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zCCIQq+KrJFZtwfxH39V5+ooJIN09fl+sQ/FabMIwoM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeR5881yVPlx8qQw0wLkeHljDPsnAhnsCHOHVH
 45LuWk+xouJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCankefAAKCRCLPIo+Aiko
 1b5qB/45bfH/8xyr43I9Xap/gQNQxjP7QH/zbGyLTk+bzRIVIoC+q7JFwG8HU3/BA0BlXeycU1l
 Pq/B8T+OMILv7b6mh3D3UFucQoWi3UFrZVd8H+R7RehtaOav56BOmfNzFvBmhCxbfv+ifNF3Z48
 ghuUWPW9P2/E4EddDN7PFOnAS7a7mzFUDVUppNBXohRKnIGLP9jL+9+Lg68G/odRFm7VPv4YkhN
 4aWLfDTgF3Q+ZEYT7ajR9eiSpSxP12iHmPYn0Bef4f2ASnoOZd7yhCIPOm1itLRNvg/A9unW3/3
 WRvUtbjZxtPL37+PgfXWwrZHCB86nZFbUDPhXtCdwQr7rDwx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=eqbvCIpX c=1 sm=1 tr=0 ts=6a791e94 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=GVYUdSXVY4KBhG55bxAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: nFpySiR-BjoU0cEYExb5M1AtIR2HkNg9
X-Proofpoint-GUID: nFpySiR-BjoU0cEYExb5M1AtIR2HkNg9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAwMyBTYWx0ZWRfX285NTA6zUfxG
 4zqDpDftpjIrIse8yjjIwfk7BQiSz3BCwB1sQVJD895KlT8r24I4/sHDKjSRTpwHQzSxVw4MIPX
 iUaRgeHqK04EOatPZHiUMw70L2tpnRySacrDlsVGPdTIuVhPeW0VczfIbyU56arGWlZWJXmI/8C
 yCu0OFSrSkesW6zU01aEvBV6Gm9NEX0b0+3Al6yp6NfjvdnJbHRIbU7S7I1+xW/ADQaEZ+mWp3o
 YgLSAm8gvH/l9f/lDtBy4MvJ8xDDWfcnuaW5oP3EHGLYs9V8rxXOdgjvFsEYs7LZTkwjfaqSj9Q
 dN76rbq8K5j1Ayb8nezEtlA4lobPeX9iuQcihj5iBFPcan8gXOTdkmUhA5Z9HBErSi5Ko9Givs0
 9CeFn4HsorBypUZTCYhQ3rUPqZpw2CBb+ATytlzS4UbrNrBKrFZPd88EW/kMO/C0ihCBFRw9kQL
 /ya4gsU1SCqPNqH+kdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAwMyBTYWx0ZWRfX6KaFP+xlQQkJ
 MZhT4aGjbbRiUDUfczZja6KgiswFyI3oyrCGZcd1u3NcJK21z1wkoGjzFKeqyNpIDkEqIvEk3ib
 gDdhgzKSnaKa8xE6ql5Jg2W4qF4+3WI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100003

The ASIX AX88179 USB 3.0 Gigabit Ethernet controller on the APQ8074
Dragonboard has its RESET_N pin wired to a PMIC GPIO, so it stays in
reset until the OS releases it and the device never enumerates.

Add the AX88179 (0b95:1790) to the onboard USB device driver as a
non-hub device with a single vdd supply and a conservative 1 ms reset
pulse.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 2 ++
 drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 37ebbccce35b..8139fe3f2cf5 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -564,6 +564,7 @@ static struct platform_driver onboard_dev_driver = {
 
 /************************** USB driver **************************/
 
+#define VENDOR_ID_ASIX		0x0b95
 #define VENDOR_ID_BISON		0x5986
 #define VENDOR_ID_CORECHIPS	0x3431
 #define VENDOR_ID_CYPRESS	0x04b4
@@ -650,6 +651,7 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 }
 
 static const struct usb_device_id onboard_dev_id_table[] = {
+	{ USB_DEVICE(VENDOR_ID_ASIX, 0x1790) }, /* AX88179 USB 3.0 Gigabit Ethernet */
 	{ USB_DEVICE(VENDOR_ID_BISON, 0x1198) }, /* Bison Electronics Inc. Integrated Camera */
 	{ USB_DEVICE(VENDOR_ID_CORECHIPS, 0x6241) }, /* SL6341 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_CORECHIPS, 0x6341) }, /* SL6341 3.0 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 7961b9ffa99e..27efccbe2286 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -59,6 +59,13 @@ static const struct onboard_dev_pdata realtek_rtl8188etv_data = {
 	.is_hub = false,
 };
 
+static const struct onboard_dev_pdata asix_ax88179_data = {
+	.reset_us = 1000,
+	.num_supplies = 1,
+	.supply_names = { "vdd" },
+	.is_hub = false,
+};
+
 static const struct onboard_dev_pdata ti_tusb8020b_data = {
 	.reset_us = 3000,
 	.num_supplies = 1,
@@ -159,6 +166,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb5e3,620", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,625", .data = &genesys_gl3590_data, },
 	{ .compatible = "usb5e3,626", .data = &genesys_gl852g_data, },
+	{ .compatible = "usbb95,1790", .data = &asix_ax88179_data, },
 	{ .compatible = "usbbda,179", .data = &realtek_rtl8188etv_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },

-- 
2.47.3


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206414A13A6
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 12:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341961; cv=none; b=ELKW9DHx+Je/KlU90OcRWNgSl/FGk2qROZgMnwbMR7Po3QtSI4f2WCLU2u9tXT9JhQPDwukirHcWToiBN0VP72w5U7UoxUWrU3UguvUOfQTvVQcMhrvX/0QXndhDKgKij4ViFm/Mt4gZHBzwKm+EG1zY8xn45Pj8mpiLdQvspp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341961; c=relaxed/simple;
	bh=NdHbJPjvsu2u7F3hdYrPvFRlBpPy98KniXg8xIhSKCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=loXheQ/mT2omnLZZBo80eRdA3HGceeoGaFHxT1pY1eVrmMhqM7ofKM9/p0fEmqkgvOZnOEQl6DpLxf4zJWH7LBWhWTrYmDS6/SjV0aPj46Xsx3lUjAC+Vglkzyn6cj6+BXudIHoR1ZFSHfRyGKV8ht5yMyhrO/aVpoPaLgLI/a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GUx5BzmG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OXkdPOQc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GUx5BzmG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OXkdPOQc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxFZV401636
	for <linux-usb@vger.kernel.org>; Mon, 6 Jul 2026 12:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POK9tIxGCiwp0V/tTMSRyw6r6KDPw5Ng8BAFX9Ifcc0=; b=GUx5BzmGdeI3Evy4
	TAdA/IjbYevjVSOOVEM/jHBANLO/MzvCLIDPyIiN9HGOV3lzrtsxDYh2CWy24aEK
	e5pwxDyUvASqAikj67tpYkJEHSqpVZx3/eXDlvj8KZ4YJmq04TuS4yBAg4Qm/eRM
	ZEODUiB8+by0n15kbnlqjOE9269w5Ym9DK32zJnFCj0bqmMBm70riK2KGmEZoCu8
	JkOkwNLn1fuC88jPUs0mvgPD+1NSV/SEeU+G8k2TrSp+bpuv33JoNGSTFOPm26k0
	myU/VmbL6eCNFjIuinle8aMsQaDP1VEBKYV0quH0XkvrWv1IekNPOEs/A387VrsR
	n2AyQg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grm34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 12:45:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e63df032bso328954885a.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 05:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341934; x=1783946734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POK9tIxGCiwp0V/tTMSRyw6r6KDPw5Ng8BAFX9Ifcc0=;
        b=OXkdPOQc2XyZ87fUDp6zGGr2i86DNLj9Fo+isk35kw6z7ddiAaYnOQzn4uWKUPGcsW
         nU+zB9sINl3oJfqf8Glrb/47eomdEM0LJpV9rZ5Xg5knS58U+I1YrvHt3ncwGW3s3TM6
         h4LQdt6vm7829gfS5js0tLR6mbXFASzGHRPfSiSsisn8gvs8sb5UTT/xEo8SgTfT6S+l
         cCpwaBSVH+/KGSOsadwCOoLW7I3L86ppymo9zi/QuJgD8UFzuKVoSzV8/jvWQn+8har3
         RKATM4FeMFw7J8TEecRZed1TqKBFgp6Mp5uIATBYQllEGFWn45ZFB/Iq3O71/slVJPG9
         7U7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341934; x=1783946734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=POK9tIxGCiwp0V/tTMSRyw6r6KDPw5Ng8BAFX9Ifcc0=;
        b=FOF6NYZo8tO2MThhOa1wS34QHOrp9+Gi//2/Uvk8pEhGemCxMA7ShoCP17moyhQUww
         bObXq7TS3pOypVLACKP0vJ40/gp5np0awBUjO+6jqm/7I3h6vH6m/vJkfFXMBaEWz4UF
         yLH1GFwelFhQYU8b/4pg/d4EkY85MhxmQfzUd3R7+jQL7dprhoSZ1ZJUVU0mzzrzWCGH
         DRjkD+d6OdrLX4rO/zhHOrzVD6+VanDTo22U2YTg4r/8PYbrNoTaxMwhl70fvgf0rDzi
         uZO8QFrVZaBRSmoj/5X5JhYsXhV4RA3xM6dhkUBIIEAc+pbEa/jtUzChj6x5/8x3blKh
         WmaA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4GDUBMd9nAtCa4Yl5d5L/qoDkgIvYhzljlrcjMSxliahcUbZCnZ0Yc2Vit6NAbohB2YPW0jc0gXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFeydBX1l/Plqg05hGm+cAgH6yCl6gqXxIOa0hp5HIcE5pVkUX
	+PuearvG1gdaQs+8U+D9FrAKDXLvxqLlNoZp/KkzY8heu3MFsaQtudbhhz3fC7C4+HDV0eMuMWk
	QDIaacvF7a23T2ITgWpv/jr3qUfMlHXfgZik5Jf32oYhZuDJ65Tk+g0PFrkiEMRk=
X-Gm-Gg: AfdE7cl5XO87DMvt9kA9J/LMi0KZTaGXyZnNHpKRiLm0gCTcguVJW518UHsJoBavs1G
	ob3tvFjM9diU1YN5bqtGYcsACvDF26dTrZdztB5Jn7V316KU9jCjqU8/dkJijbTS7wYYGWCZxgz
	P55iq12qeE+N6VuVrSLBnyMdwD6oecVTJ4DUxZbeDodWKzbHPU3ivjva3PgPMeasMJ7+r30FyWc
	ESFgxXVLgWQfFwajXrLEGBT1wPe5lutJUipghNw3hu6fF6TxLo8IiNAiik5S5PSOc+HPylAseCr
	N4PgMay3FsyC1mFb7x/+GtClatqt5JeBPf226Q/WGPq9bOn6ORJOJICCW5verUFxhrLC9F+0HIQ
	KMnLlKXwoIFSXtEtjcTD9/mr03CTifnZsj279CAkO
X-Received: by 2002:a05:620a:630a:20b0:915:9eb1:f08a with SMTP id af79cd13be357-92e9c9bae7bmr762485485a.18.1783341934109;
        Mon, 06 Jul 2026 05:45:34 -0700 (PDT)
X-Received: by 2002:a05:620a:630a:20b0:915:9eb1:f08a with SMTP id af79cd13be357-92e9c9bae7bmr762466885a.18.1783341932688;
        Mon, 06 Jul 2026 05:45:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:26 +0200
Subject: [PATCH v3 14/20] net: mv643xx: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-14-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NdHbJPjvsu2u7F3hdYrPvFRlBpPy98KniXg8xIhSKCg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M6kp8yOiB9vvJ5zjdHbWe6Po7/EnS4ga+ev
 hCyTVpoxO+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujOgAKCRAFnS7L/zaE
 ww7dD/0amg46FTyYgYW8LYZgcSVagN2XNs/hYCpCDsj0WIQWByz3JPvcwF61FhdVtvUFuUYV+eg
 X7P9kb9yoTHoN1zMJCWDP0kdPaf12F5JdaMy+qsgjzl2P2MgGwuqQQML8cdGlCndeIvBfZzo7nO
 9qijrM7bVX71vT/EpqOJHbzX5gMZmLrDW9GuxO5m4CIjxHImLkOcRCikfjxnV8hepAxrK1AMx6R
 Mc6flJ2X5DdAi7Cru+Q+uLRr4o4JKNA7AxDT5X6V7Ns88ytfrTL5oV6D2eulc/QkqAYGEtknJw6
 chwScCFvjEXtvO9lO7ahl3qlNLbLc+YlVO1T4bKSi285G+axZpIEKet3oauOfTFCM/saAVEif4M
 KuvsN9jfwcJ0xXMRvreW//zyuhY8LNwY3Qn55M1FVhdMhR15xLP9t3gOyKyxu8id1cdmortkJpD
 qrpspj/OgEujquTmIu1nsViAjjB0bI1BWn7odOKePTyRWnujpCUPRgGD9GE6y5D1J3d2h2us/s3
 C+UML2ty3Ar0TmOdfF8nD81xCWgHBwz96BBI0ipfe0fz1VLXXim6Z24Z8Tpg6aFGf6ilHkampD5
 kfVoicCCwzU+89dyn7GdpnULRhUez+rKMA82vKy1zopgY/6h3TvBwUmDbFlk6k9PYM2h/XaSG9p
 jy0y60D4DWCJRkg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: B6l9BWKMxCgo-1bpdBHgAPtxsWwoaM1h
X-Proofpoint-ORIG-GUID: B6l9BWKMxCgo-1bpdBHgAPtxsWwoaM1h
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4ba36f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=KA_NOx0aAURzDPfFvPsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX1QNgb+TXkqI7
 Su5zjGXxh2+Gzps4kdWFlzyUYwRELjXXdMvjpRKxS/tSexFhpQYK3YBJwN1KnwpHH5LtPpagMKX
 vtBLBGnSafDAcovBd2L/rS4P8oxvHKae4ClSqQlu6LTpYbFLKeHymkqOLp84objKk/AGFxQXn/B
 t9t5Iz+CEQD64N6gZ734i1Xw6wppVvIa1oVHTKPt5kKHAYUPX0EiyQ4bwwRkQqjpK0ER5Lr7X+4
 odwEjZeShh9ZYlNfG10LQ8qr7EsNwq6lzR1iWUOw9rIlSUTc6fZhZF3V3hQjHGIVpaWxvEcMC37
 pi4ILpcuHZ1kF8vHf7wb+EOc1ycYJSN7i13cPmB7lFqgSJV8PeU1DhWC79wNQ+PnoF8yNPXaMQe
 pDLT/W7JNHL5Rlwp8cokgdDnIEk4o1MnXGQ/GvdwgAkd72LKKc6znoTwkaCyT8N6nwUy3kTWNzu
 BBRJNffhkEPA15ncpPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXy5CFeX23t/xC
 ej5eTsIuz5jbzjJqoCivzfC98JpvaHJnvVGyAjbDK1F4ESGOwdd903jkd6gGAiWQ7YUCmRyy4Bs
 EkU1zuCwItzVvkj5yCzF0JIhDOC6bxU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Acked-by: Jakub Kicinski <kuba@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/marvell/mv643xx_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index 1881583be5ce2e972fceb14c2b8348280c49ad1d..9caa1e47c174c9d7a161b7f2e2ee12a829b813d4 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -2780,7 +2780,7 @@ static int mv643xx_eth_shared_of_add_port(struct platform_device *pdev,
 		goto put_err;
 	}
 	ppdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
-	ppdev->dev.of_node = of_node_get(pnp);
+	platform_device_set_of_node(ppdev, pnp);
 
 	ret = platform_device_add_resources(ppdev, &res, 1);
 	if (ret)

-- 
2.47.3


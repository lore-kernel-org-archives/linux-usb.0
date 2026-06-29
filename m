Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFBC408019
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 09:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724444; cv=none; b=Bxm7d198Rk5cG+Ojd95bSCDZkuQMbL3o77GJV4wPR+1ZzXDnjdNCo9t4Uj2OxuJrnsNu1vLfaPmWjV1h7UjwzT+OWju7g90vbHrunA/OlcfuOHZOG1B5g6OKjYEEF4ZJV3mID+dpvDez7PnXIPC8nOs0AonmJmLwnrRl4Oyk3J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724444; c=relaxed/simple;
	bh=uU1Fr9CywAvFxzuC6Bl5zMISX54D90vnS0rD7BYCHEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l5l57S5Wjb7DP+b0HTzJdrLeZk0Q2uGynMU9qsDXvxiOvd1yEPL4bgNjNvRbeLBmwjB5/M9lOQZfzGZenr3nltBR8pucZV3V62uR3yME0QL9XYwSeiNAGNdcPFeZW0BYRRBdMTBi7BmJFSub3Zkq/FirAUVPLPgeTCppizYIGjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O3a63/+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eSFGm9Kb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O3a63/+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eSFGm9Kb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6sNSS2143207
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 09:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsri2EPN9pY5QDvkjI4fd8dHK5CB1Dy3Xc4grAMl3dk=; b=O3a63/+IxA+EjaKg
	JhczbaptnwlswGKlVyWvfV79oZ0KgKi0bTGFNJk/kxCyF7mjkMbxf+IRd+r55AZi
	GXomEMUi1DqoikHCTXPAjdrqb5Ame8D8+M1BTcrlnoGZNfrToyafFbjNRPQ2zwaO
	4KfhKoM+KaWUEcpS8ywRhbLGES/ncPAMK0oyJZDgf5lyYxGU7SSiPqxveHceEdKx
	yJ3pc9q4r02Gw8jMiTN2QMkH6NuZHGf+hk/uKmGbuIXR8ABH+pgRX/a19EIS9WLM
	6fVCVyrgt9sr3cUfuSRwMDTtyQbTS2qrFv72TDwNRNFbPtkn46a3Ggi4Go1D0EVz
	NGg4Ow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8nr1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 09:14:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8585bbfeso43837141cf.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 02:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724442; x=1783329242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsri2EPN9pY5QDvkjI4fd8dHK5CB1Dy3Xc4grAMl3dk=;
        b=eSFGm9Kbsx1GmvJmkIjUxniIelBq/QY3wOPUknlY+YBgJYWOKOEDKj9+H5p+28yMNE
         jQMK4SIwPgjdrgvgtxy0SRnmqBO+205SDfAQjga69jq8embffpJau/TIbd110mz3QKBh
         VTXRDYoP+mOwWzNN/YxazU8q7nAjplSdQCjzWQdaYp4gkeGEKnrTej1e3y3Bw7TXpFb0
         LTiq0ZlAhZPZIZOYkO+y4jF8nMCUlr0wbmXA5OheLmjvpJG9ayGsebUePkj2PTKV0l20
         ZvhwyjGpKmlTHgp7NL8vDXkq3kTnH3cU5tpla7O7ASKgubDlDQi/IzCjLN3wWUz389V1
         jtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724442; x=1783329242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jsri2EPN9pY5QDvkjI4fd8dHK5CB1Dy3Xc4grAMl3dk=;
        b=YQvxjDoHuXdoLtGM+bi2hL3OQZZxxntRJkFt/Dtzx4Y4PUNwshb31VIXUU2dSlWwlK
         7MFUXgMHkGwnS5XS8WxJFpGb0jMzKZPb39f/fxnc2TDJ8l/jUX9SvIq/XJt/WOp4F2O6
         Prf56cmiW4kgB4xI+cVos14M+vQ1u9FIdCSiLvMstlkjaNfKErofhWxTaW6T67wWr04+
         FQtmkr+JbjRnibUKsGbRJMOficwK4kWAtGqTa+VTLuDwaCoRXz9SUtGQ6ExpyuauMPl+
         12efJBS/du3gLxn3TBoWwk/7EYT4Z0E6p1ATtvMPxg1XqgSt1D5vTLtWlzC7/pHJCHxy
         6I/g==
X-Forwarded-Encrypted: i=1; AFNElJ8bbNdpVLQaR43s6GdViP5RhqqR4GYMLNg0tK3gDYWTYHQmLyEoSmBoRsjgKoF30CY9sOtooz+0p2o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxet6fUxvj33GReJ2ODWJaqUIHH4vZCrBRvFw4Y7wFCadw5BN2r
	PJU7+z95FBEtlmSKsqvOBbAFHxs3YuByI1Ljpc/fxCU511pooiax69Bd/sfvmEBokaw6u25O0JK
	aCfOOU+x2OkScJKyMACnaTWgWrp4pF33qqNEVrvw0pYwx04UfVP4iA1eGdsbEK3I=
X-Gm-Gg: AfdE7cksOHZimJwmQ8ZQNrcdjhvfezw1OS6U5vCgxOnZkcg+k5PyHJZ5bESpotxUjJz
	YYGy/rY22kTgi/j3f/of46W7j0NN/Jf10xfF/+EQWlSETFQvl4Gu8d+FOndZ58VJtQWuexA+Q82
	k7i8bZQvF25i96TTwumx0CMsw41AHIJp8eKNaN5H9kDj7A0DqlQCcOWPxbQ2Q2eL9k/0kTdt+3c
	j5A/41q87c5Hd071UopbC83qSxlmg+uBcHKpL2Sd8g2xImz4lVndVn6CwJR7csF8Oyx9hn+fTzG
	L3/QOyhg9nW8G0wPyoaGpPkfHbFT7B1Osh5PN1k/JsxPeYtS7NoYvWe/X8w2SgiOoUxuOkEq2IB
	Mh4vDPi5ume2+fW+0ej3G7XAf8G/b6Zbgwl9nuxmr
X-Received: by 2002:a05:622a:a50e:b0:51c:868:899d with SMTP id d75a77b69052e-51c08688d46mr5705241cf.15.1782724434201;
        Mon, 29 Jun 2026 02:13:54 -0700 (PDT)
X-Received: by 2002:a05:622a:a50e:b0:51c:868:899d with SMTP id d75a77b69052e-51c08688d46mr5704721cf.15.1782724433603;
        Mon, 29 Jun 2026 02:13:53 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:41 +0200
Subject: [PATCH v2 18/19] reset: rzg2l: use
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-18-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
In-Reply-To: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uU1Fr9CywAvFxzuC6Bl5zMISX54D90vnS0rD7BYCHEo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcVVV4ntsBNkEfJYpWCbBlNwGjTzWXksVf6a
 B7aYJ8a6BWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3FQAKCRAFnS7L/zaE
 w4lZD/9Z00RoirT9cBP1O1TRPSZsV/i898PwA1y+V390LSkU0nBecvgm7et96y3iAHLoAbhwMId
 fCniVeDmYthH6LI2ZiS9IIqGiBvDjXeEAhdyEvMhzBuiPGFdp8mFz108HQYBgy2lUI7+XDx7Af1
 rMkRf1MMt6X27j78EZPbKvJxROug2ur0kEKUiFIfs/I/zk7D2EvBDMygGK4m2zrcyre6SfLQxaK
 8I4dqrMScYY8SOluQf/60QUYHV/hnhOpo04JNaLAyIvaMYd2Qe7n9BJjsaHXDQbL4S6iWyJMT0w
 BqfC+KJWDZDMP4dmiJ4zbtlsbfN5GUKj8+ZiDylkn/8gD9sz81zDrsSjahp6yn5UQoBGWd42Ndm
 pt7oPQmw6Vk69Bw55koR2LRDdmote7WmzKfDN7d9l415NKsy5TKIx+djbJyZOmNCVzd0UgtIB82
 zeZHJ5d3OfaC/hM/UMDugPFDzimkz8aB3O73Y5VGjZhxNSsYmkmWn1HMPcgS9UEtb2YcsJk2gWk
 m6fAyae3Lps827xqLL5DFo/eAY61/9bJ2bKTNQyB9JP9FCqUoc1quDYM7MzqjaYJPn4AIr3mbvN
 SJ+j1qcgCh78X6wsSW5E7LlwrU8gDhIQbjdeGn1HzcP8Z7PDSraWAf2hXpcezPNeVEgjZ+BHkGk
 q8nixFMcHJHjozw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX+zo2jE3PAtFd
 GdCqCuDPLO4Y1mFGfaRdrJSx7GADtUyLIjbdkfgDZJJSZmtoHvIM/yve8jRD3+5kxGKYkecIkqv
 +EMZdzBT/lFQ14Lx71Ovkarr7utEUcE=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a42375a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=kq0kPlqncbyAjjsh9XUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: bpZg3P2xo56NCVASPAxOOk13BsEnk1WT
X-Proofpoint-ORIG-GUID: bpZg3P2xo56NCVASPAxOOk13BsEnk1WT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX09fXGC+7EhpZ
 M8gRsp7g38NQnjz8iLk+tAnwj6kNG4rVNTRb3c1lUhCYWDf/YYNpRouqeHwzGHj3udzakJw8Q33
 OFJpbGx9HYqqWd5ZFkD/wWzRdTKTQd1NOQGiX8tqi3MYuIGZFY4JIGhv5KVBxWgCDUSub+6i/t2
 x3NHs9ZUXSnFaZc0R+p2m2wC4+ElyGjCmhx02KpQTp2sb/rQCLkcU8fKOX0KZ24n11OLzbjM4e6
 Q4xOoYJo2K7vS3INv+CDf2iP+LCG+H7BQVeeZMGuO6WkbK6odNrKyId32zK2H6OzijBbCTItSpc
 8Wrw+a9bBrrPOGeUU1pl2yM92/9T0HtX9eQ0dSJZtz/zmMI/hqepqJ44iNiUaJfAlSNbg+g/0lF
 bJRMjPLHeZZf85bCvVdHvVwn+5e0edjeELONM9wp8TABuBw1HxitfaWjrJATDMuk2jiK6ZJWdLL
 1pFqUVL/w8HmtP5M4VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index fd75d9601a3bfde7b7e3f6db287ec8c5c45a20ab..f003b360629c90bb37ed0ade7a675b5b0f28fa7e 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -249,7 +249,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	vdev->dev.parent = dev;
 	priv->vdev = vdev;
 
-	device_set_of_node_from_dev(&vdev->dev, dev);
+	platform_device_set_of_node_from_dev(vdev, dev);
 	error = platform_device_add(vdev);
 	if (error)
 		goto err_device_put;

-- 
2.47.3


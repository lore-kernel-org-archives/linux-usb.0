Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9893FE67D
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 09:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724401; cv=none; b=pzAL2ZTEXG89LKYcUfsXBhJef7GFy2CmFrXCqYB9z+Xlk+xRHBSYiJypckZbkefpPIHzXKVd4XfTvnNR3yzFHzCwGxnvX0buxzaLwkKR2Y7g2kJUieJcefccNSET6YxA5IRzE3g5IMMbH8y7yCoVbnjNERegGxPMnHTnbxEqxLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724401; c=relaxed/simple;
	bh=Ig8bPnwIF/mjSMvpWWcGdfQJeYqm2NUWFW1h+WHRo94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nuXAhL1uJQCPlZBhJWrgTY/uXVbftHsnM9nxyuxXpOsbgc3INdDeXDdr1WFiowsRRE77mFu2Nd8J35K56QIeDAfM4bwM0l0bEdg2P9MaDLFIgpRmZP7CZF1L9vi3DimsxA0ynnG9RYwoKwXyIGZS10mqpfHZ2ke0ab2K5TdsgJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e49x9dge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fwPdi1Za; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e49x9dge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fwPdi1Za"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7DqBI2188823
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 09:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=; b=e49x9dgevQ3cG9iG
	Lkj/IXiDOCjyRPpFLYPYID7dhrpbk+iSA5taIkgY6Mlrk5ptpQhi2PCxrS++NyCr
	j7AIY+DUsDYgCvBLNbDdOX89qLG32+hXZcZDllrLWGMryBTHjnyqgNouP+DK9q8G
	A5+RTn3AlDL3xbGZEV7v4QPykHh9MOpwOzfBeycwCg/AQFQup+OivOuL5T2kudbr
	SR1C8Lsz7aiqSc1djzkUXOrSMEcAJgQgapxM6Hv0zohRVnHKFEus6/p/zWUMd9GZ
	NinwucbDLPW44K0sEoc/+mwMWA/J+LaGL4B5oMe1ojSSmc6BGaRJI4/cAH5OwyD4
	gQ7JYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trg35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 09:13:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92b2ccd78a4so205962985a.3
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 02:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724398; x=1783329198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=;
        b=fwPdi1ZaUuSxBFtEk6QkOun3qB0mQSIYiacEB+irfueyL3it9mAFZjSeuBHGPRQVsz
         q88FtN8u1AO3lwuV9dvV3vSV76KACTARv/n5s9ST50GMz4R3duu+hnXU8y3t0urUdANx
         pRKVtrA++QInEcq4tKcXfJKKqn4Is4DqZr//ARkDHD6loEVUpPFM1cb/00562vyQxakl
         i9a1tSNTFR7gnP2aoYvrOE/xew0YoPq5sqDD/BeM4cSSpIkHQe5P/SDkXs3sXEXE1RUq
         EOetZgoy4SAIGygUWEmgAX/UVkzVxjGQZzrmAO70MdJRPJIBPmXyypHFOqwznwQiyTK1
         0wvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724398; x=1783329198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=;
        b=JHa5Z4rjTh70kzQBaplpZzJuBzOKgnjAc72gBMPK4rP0zvheUAQaKjlR6OrqM/IMTm
         K+z8PnJR4dCCuQerLKpYrdP561gGL1oNHiTuilRtXLJvMGyA4l6GgC6MtUATcSiAFZuD
         pP311l1il1r0F6a8bICwaMmzCxWD3qSvH2xjV43i/o5BnfdiwzFb19rIoJwLZ6SGR4oj
         35Pz/Fxus7/BpSRyo5+Gg6zdhUNxTI7F76sG1FPjfXhvxpSfHX53bVG0vGCNb4/iJ/Go
         YSeNFIMWk9FT6Fx9y+ic3LNOz3Y/PeRSH0xKIfy5bcVd94oeGHGOgatBpdVS0wbDZB+z
         JeOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iRr1VK+HXnC6gZMhUi+YUvRcGnVFfNQwuobVtZqxt7K+BxrT3P34EvCVwQxapZKMdfZKVsVo0Jak=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCMPT2aU6MP5qgQy5ciwXB2areFJ+mGrq+tguqMIWvcj0CvSNl
	eVkglOymeSmMcf5thurcE2gnAiYYNrtMtZDvXnwrOXvIPt6iGNHNIZccf8tn9itbCObLHw5wpIU
	k9vzaY1l1b04jmBUNLjx1N8ZpZMzmyOJJHw2CahfoarmFt72PUfwrKA98PJH0OU8=
X-Gm-Gg: AfdE7cla1OzEnkoDA5Szh1OGo/cYRmtOxKa0VEvgqS19yxRz2pAJwcOBb5+sEWQGxMg
	GHml/FIuXc0j+E6pzywXmsXFI3c5J0uB33Q9jkKmZhl5hbpz0nivV/SgrMcHaUBHZpmtjDsDoSr
	PPCvij9s03qeeNws4EWDwRbHg/JlxgcbDAvUawG9jQHBEkjBitZ4S+nKQ8jibvqu2Q36iaTFgIb
	F5+hA5sLwrjmY4lHBE123F38zyDZVhb9XqhTLxFnZHRqAeJxax3IL2lldxREdDIAlWrikEhyca8
	YGaR9p8j9C8+AFyqwxiZmZvHdsI72N+amAv9ePx4SO1uUfk8FthBge4fU/t4C8DNs007jA/ACcT
	coyC1mFg1bPj4Aj0/pdDtNquNQBZLD2mjXGiqIo2U
X-Received: by 2002:a05:620a:2601:b0:915:fad5:90a5 with SMTP id af79cd13be357-9293e5df82cmr2398881085a.54.1782724397557;
        Mon, 29 Jun 2026 02:13:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2601:b0:915:fad5:90a5 with SMTP id af79cd13be357-9293e5df82cmr2398869885a.54.1782724397008;
        Mon, 29 Jun 2026 02:13:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:29 +0200
Subject: [PATCH v2 06/19] powerpc/powermac: use
 platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-6-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ig8bPnwIF/mjSMvpWWcGdfQJeYqm2NUWFW1h+WHRo94=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcMDhYRt4vSVXRm8SXMUBqWTN4fu9NU0CYjk
 RvsANfN67iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3DAAKCRAFnS7L/zaE
 w2NXD/9lRtVJg19v8VXQmSDry17OwgjxIADNStd90IU3BJymBaFn6uKZlSDyZNAN61Sv1vUpYbt
 gBiZxsoOwplweM8GutmD/BJ4zH6IEJMTok8pVeRaVr95QvimqKpAltLt7gILbF61IqVety3vnd1
 ij3JBKhpmDwxAakI65pteui/qIS4c+gzd4hTRcSMc6FP6wrIWgiA8PU4iQRn1O8jrO2fwKeIl0G
 g1X+9ujm60pPVnP2M0Hyk4UOS959i0RZuvrm5p6C6bsrc13KQmbqakL75sPmziGIKPRumLqWUCc
 ppKaIrOem114J+vdybIf2FJZbNg1RE4C+ZWaCjRdpimkp39y0fLLliI2lv7zGYEBvBnGgHglZ0H
 mE2dakd3ROg3q5D7/wKq7kzPGL9CuaHiniuR6jmAjxDDb/uLkQ2gSzR4LmrwyOrh2gMcRACavuO
 cAI/1JjBnuWS1rfCL3Av1cRlzGu7kl49WviXJV+CuP2Jt8roh9+0MyDDotAzxC6TP6k9C0iGw/Q
 HeTDr2r1C6sTpUzIoWxW0F2LlnG7VPkEfDmf/M09bcfa27HdRql+A54QzgbdrR3Y9gHdrDMQL9X
 Rdbqm4kG80vtQFKa8yhYV4YHJkNd+sPtTieuhhmR+XGDVwv15BymMtt4OytoRz6kns0PQy+M5Sm
 K9bZdIkgQUPvSxA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX3nb/vvji7cdM
 UX+6++lNa6Dr65cfIbEpS31i2AUeQWnJngL0floaFf3PXoZ0Hg6mQWz8utaSjR+JN2MhD0m4VEr
 KCjjN2yzEDdkYZrG4Nu0RLXnqR+9sTulWKBNnFeAzLoAoyhMn9XpVP/gfKQNl5Qf8l+dHpf6l8U
 MBLBYdZ2x8xk+dkucU3p6HuUQkFh0n8+HHEMdjm/0id6AyxNukMkMw2OWDudaH/0UQzaYW+jcPX
 l29h7QjnlpPvzw4xNiAATDoqiBGpGerLU3xFtD3kXBp+Ypw7SzC65ag/OhIcznG8sndmKf0taBK
 LtyAeknLbwQHqIdWD3zFAHEbKGlnIAWUto2/lO1N6s4GRleN46MmoHAH5eDUZ2q/V+y0P747j5w
 swFkZ8rmPhyFe28NrGivt8cyLtvEh7SOdoCNMGhSB/U3kKiRE35J24+DtLRZ5oZfUlSmOs9WsGA
 y/Ki2blbAa2A80vpraQ==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a42372e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=kq0kPlqncbyAjjsh9XUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX5ja7sjayf8eb
 k0XaqMODkiBn/yu/LEKUAS49qRkgvgEOtG+WAZMSOZAYIzGswSdODArCp21NsPNpsV1UZQBsFgq
 Q8SHQOIJeT1EvOIwwMadx5z4BpHoVYQ=
X-Proofpoint-ORIG-GUID: KH3Xo0-lcblUg3SomzXcnVAAWcZz42qd
X-Proofpoint-GUID: KH3Xo0-lcblUg3SomzXcnVAAWcZz42qd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index 973f58771d9636605ed5d3e91b45008543b584d3..a175a32a222bab4cc7400f6ab6071f5630db2cb8 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -1471,7 +1471,7 @@ static int __init pmac_i2c_create_platform_devices(void)
 		if (bus->platform_dev == NULL)
 			return -ENOMEM;
 		bus->platform_dev->dev.platform_data = bus;
-		bus->platform_dev->dev.of_node = of_node_get(bus->busnode);
+		platform_device_set_of_node(bus->platform_dev, bus->busnode);
 		platform_device_add(bus->platform_dev);
 	}
 

-- 
2.47.3


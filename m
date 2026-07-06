Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC69347DD51
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 12:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341925; cv=none; b=CVHa4AZ2A+BJPrmHXnQZ8hU9DaDcYM03qaJWVhV7A1Hc7XQbwE+CDst1+Yiv0sJOr7N48MfVwKTag+4pPDix7OLobh+poIeSzYLKFOnHl2NoOPLvvvy5vo4z6vKt4JY84X/537Db2mcKJecyK5MJv+VWCWZxK7pZTXN7+XXxvos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341925; c=relaxed/simple;
	bh=6rZCe/y2D+a9YrBo7o44HEaRO/K53E+00VjO92+29A8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mS+F4BUmP7mbdLvWxioP1O2oA5zl6Ng6PMBhfsMgm8Bn4XFwm31jW/WUEgMUiDrzU/gne5itAkVahK0MaReoiPQmprXwNUuTsKyw+lFnwTrsBywSiXO/HgSFcf4mg/Dl9afqsiEJlmSCFP8l4xgUwsWV9Bj5D1LY/Umw3QHTwW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a9nGmkj7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3nIYnMY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a9nGmkj7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b3nIYnMY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax7Ad245532
	for <linux-usb@vger.kernel.org>; Mon, 6 Jul 2026 12:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xl89k/DVW/7Z5ZCZ0MfgdfeY7qOMrXozhfna0OAi74Y=; b=a9nGmkj784flMoWo
	nlKDw8oMF+f2NfnRndN3+dZK88CW/gRhqy/CF50Haqk143r8bBMiDmKMu4SsVtTJ
	JqRxsX/BvCSiWsJvNyWg3st2ohyg760/41Uz1k0Srb2HbopSvNxu6pOv0OaB5K+I
	4uCMM1F9+Prtbl/F7/vwUeslmBjrfxxhAtTMWAxI2r7PSpQSvLEV8h+t1EAB5Wfw
	H6gZRSu6PVH1kQ+/H/1UgtqRMwirgBgGE3rTfctlD07zovPLGyBUEE6zjhNroxkL
	6krnr/WfWomJ3jWUjR6rnlZP8NRu1grRW5qBkb60Sr0uPQMVjU95lg3j9GL0etUi
	MTbyWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98gjm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 12:45:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e73fc29bfso429124985a.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 05:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341910; x=1783946710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xl89k/DVW/7Z5ZCZ0MfgdfeY7qOMrXozhfna0OAi74Y=;
        b=b3nIYnMYKYnYtgoCrLdqFoqTy1uyv1ZwpNlji2FXSEjqBgXkFke0rrCVUhlaOQPbb7
         ezyHHlaEzK1XinBZE/8CD3QCkAZ/IXo0gvAQ0EpMCHxrecITCWDN8v2pwuuKwxxEBdQ3
         7iiODW2ANQpdwWLw9gYyAMaJR9LMGGMwg/HKJpKWn+aoK1HAqgyKarxtLUevgNNEFlKN
         4p+u+ZtloA4X5vVC+8L6b7NXoQsdOu7CgVFiPJmbdHLQdML5PsAa4AvTQ7hoGpgkyPXG
         oqzthyxc0u7iIJxw2xj/kVhCHfQmxR8SEgSXUYbAc9aKEhbzge5z+AiSVTdrvQvB0WJO
         +8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341910; x=1783946710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xl89k/DVW/7Z5ZCZ0MfgdfeY7qOMrXozhfna0OAi74Y=;
        b=lFGHtUnK9n9pAd4Vg2MTVR91uCrld3JpZUfr08avmGvXZLDPGBb3pGxA1RPcdvVxhn
         ZIItlg2OEXIYZx1gVmi28qn0rilb+ASndL2HFdyrmuoG84wx3OiMug8nBomAqlWdQzOm
         Nr3V27rsoBvPMIVsaOaucfV4M6kr+HElyRDdIK42XKX2Dfh5FlYsbUDCJzttisNcgapT
         0HBz9JBhSzWeT6L/b/UqolgijjhgN9HNJza/PuIYozv4URV8sDDWoAwPQA+Ze6nf3wOG
         lHdCu1gCcvoKAlVomcT5Hp50tSu8gwsEim5WqN9jcC+XE3LLouFkEC35L33xpGdhOgYp
         1Sbg==
X-Forwarded-Encrypted: i=1; AHgh+RpjYdxIZO/VG5zAZeSYcOCPzrUIOhGdLNGYwLqSwYN4YV6yxyoHdDN24DqapoNELHQAnhZx4iQuJTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyStY9ZNIODH60bnXxU24bS3RO3zd07XKhgegQfZJ+wAr9QZKp
	6E9i40YvQj6xQykxtec27nIYhjpOoV9bbqLzvRxQu5/pIn80133Q/tykBMkwWNk2zXDSPCDo+tS
	9FgEspUGYYtZEPHdjWdBMDzCYd5DdfPE85dhHBeG6yPZPYVj/EoKRN3KXzgMa9nA=
X-Gm-Gg: AfdE7ck7eCA1i+bijfvs9TpsmyePpireHuXHHUKBigl17KJJeD2XxXTAs9+B3og7zIj
	baQkCCx6ld1DNKiI9gbb3OjOgTycSxt3uZhxZpOuRvYLTMdHmrE2m6f0SH1BKOa63aBaAJwADiU
	DhF3H6PBZ/9qQpmdg0ZzsjaVJLNjO9BBmh4R41GuCQ8Tu1QvrEgj/AJA9ieGA+ehuYG6hO0PZOD
	49Upn+36CD72ouLsR7vnNHmrfZ4iG5nn4FOd2i0LmQzKRncFhSZ+Sca+bEfpjGcXJWwcHxCG5Bc
	YQyV0NgQXGA03wSFqAcKO+qqgXnbiybnHE6A42ki3u4PLlAnUKjpNAY/ifY8plS//qYdRGEN48y
	Yx5G5D0n71vrEB8MGHTLeUHRQ8alKpeAEak4dXMpP
X-Received: by 2002:a05:620a:6888:b0:915:4211:baa1 with SMTP id af79cd13be357-92ebb514d03mr45489485a.33.1783341908968;
        Mon, 06 Jul 2026 05:45:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:915:4211:baa1 with SMTP id af79cd13be357-92ebb514d03mr45480385a.33.1783341908161;
        Mon, 06 Jul 2026 05:45:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:18 +0200
Subject: [PATCH v3 06/20] of: platform: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-6-1ff028e33779@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6rZCe/y2D+a9YrBo7o44HEaRO/K53E+00VjO92+29A8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6MzbEKkoY7zHwdHh1nhL7+KUq6bmwPT/0qpN
 3KEErC5TPeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujMwAKCRAFnS7L/zaE
 w60EEACTZsP51kWnjlnO2jdIFQ7rVOfzFGs6vreWn5WZ/mLyIg9up5SCC/v1gGODbvvSYMfrpPm
 Ad1NgJk61lE4Uat3YIah8N/690VRcsB8TdioMaFx8Y507jYHNEaWoY88xEeK0CJ4Mwike6XPjOR
 GEO5nxlIQw9xvALF8fVuc8iaZTOixQX/ObFGe7Cs2CT7+t8RLsF+Vxm0rGC8QVHfxBQTI8GfgLs
 WHKZ7rFwOFnGNa+BbflSlCxSvtd0M/BxMgc6OM70xU0/uHmP+w5qVUUYk1RNOONSyK+8Gqf/M8t
 +qNGS/XhygjkdGCarvI58e1YP2vFOezVdRt5CV9xA0gqIAKViiNYuOcbF7EdfSKGVzL+aM83HVn
 IB2+oUWPmEglBLJUHCHjCS5ZrCwk0j2/2SWTJhkvp9/5G9keP0q3kdVub06bMDW+1mOjw3j4CgI
 E1deH3qz7a10c7gmtthQqcIkdsGpqVgLKi8G/nsA9i/5VkNcLM9yCKpo1lQ+UWH1cYYetKLY8Mx
 961OZ+RmlwG9djjwf5eDpCQxOakUVoDX2RnGxJzOuTkKwEH8RxMxuwwM9l+Ml+7i/bsnScdRX9N
 Iqy3R+yve8htINya0Mxi38Q1JZfJ/lWL8CdNpHdWyO8KCAgK3PTqQlKGkyjmPLRj458OO2fr0ta
 Mo9Bsbw78owdeyQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4ba357 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX7a2CCY7DBeHc
 KRVDugmtxH1Jh/qRgokoNg2R6XC0yrm+bFzdTetA7Gzc82MhXscWd3MSTkf9D5oLbuc7UTyI/q3
 aaK34apN1A3Y/Jn+YdxnQPA7pI8KUWc/EIWEcYH1GLqe2vD3UCGaU2WKQnOjn85tCqx+74GTSEM
 nwHGDFkN9I36PNFKvPvduWkNrFqTS/e2/Uzh9QWRdMrBd5LrYWbv0vH+WPjTX52ZdzpZTQW95Xd
 suskYt5NNLaWnu63JvZ4YvESm8JVGihGyOBiwtJnHpZ8GBNmJKc/e/1Itl/JgRyB0P4TXXGGqfi
 ILUUtdQdfAdWZeaiX6xxJlitK6e+rrnhvM8IifCw/fBlbCzMJnlMu8vn+oyy8OjpVIUrjOoL8Fd
 Qx1nE7yfvYHu3/ypJ6TbXZ5M5rJD06F2C8mQtQDOQmfMfU9kit30jaJb2BvS4vaJ6JxN3LK2CND
 sAS0mQqGeDlo3Ktb7oA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX4ygJEBnBGU5a
 VE1En6016Bvn2kLMpJpkROHpQ5HMmHmX6Z9MwLufkSi+m76dC2B1qA2QZUDsApY3orb2FNX6zLa
 tL9YUMEweF5/yUZM+KtZsT8O9Rb8s3c=
X-Proofpoint-GUID: UhZj85GoBfTV4tabc6eCOJTs4NkQ7qF0
X-Proofpoint-ORIG-GUID: UhZj85GoBfTV4tabc6eCOJTs4NkQ7qF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 53bca8c6f7810ce2235b4d084a361626b1d2da33..8b1e7640778253492c080085b4015e1423389d83 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -126,7 +126,7 @@ struct platform_device *of_device_alloc(struct device_node *np,
 	}
 
 	/* setup generic device info */
-	device_set_node(&dev->dev, of_fwnode_handle(of_node_get(np)));
+	platform_device_set_of_node(dev, np);
 	dev->dev.parent = parent ? : &platform_bus;
 
 	if (bus_id)

-- 
2.47.3


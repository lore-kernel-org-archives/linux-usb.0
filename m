Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF92407CE0
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724441; cv=none; b=ZGLTLTa9a73trCYTi3aUE8m4ITKpCjxwhAmvenQDQ41W3Py9KckKqB1uhEWxmFAxZDsVdPiqWvknksUCYpkXoAt7xHqMzmHkhoJGzAY58UPLwumYkz+6wSeec2/N8mtJnIQcV87eQq/by7nIfROyegnN9kmBfxvLk0SawFvo6VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724441; c=relaxed/simple;
	bh=VEyUxYLMr0/kZUc3hQzqiXRE39K4YPDPrI9dGBJJGzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WXBJY4oR1U0Y15eEAu+T4WMhPYNrhnQ5rc/RNyM9DHybtFM4n//g0HKWlpP/M3r0hha8E9Oii99ADJdrGHEo+nvfYpDYmYVuJWcyoPuExMJR+NK8llwr9ay1gDgENJY9CAPG9AoJmgrIauhgAKDz2AbDGYIDOUcgiKRCE8+R5IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXRgvZnj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z7GfDAf0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXRgvZnj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z7GfDAf0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xfNW2431930
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 09:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p1CXheUuAMODxr2cJ8/mrzTf3yj1wuZdPj+yzX83Vyc=; b=jXRgvZnjw5GcHWfE
	EdU7pqnfu1aWmT1Qn83DNUkYLXZwtGxZctz5Pk3eozOWBd2IJevGjeFy9d+S2RDI
	b3b72IXqCckD20juun7ZhHEfyVD5nJtyyHcSQOMo30hCVGZxHgHELkthlpER1Vz6
	0Eb5Qv15bCrjQT7N9QhM13gtQQB9/4AUtNto0lbiDQOJcoHuuSzbNTdq8XEOHe/G
	c2tEUTwdqe10fVkez/t5upUYrbnnxsM4T48AAdSfvA9y+NZG3EJ0istb+YJ+knp/
	bBGVlhKOwCxw3JF+ZskQRCKUV8AxFXwVEJSQu3IZqDJMPo9bQBuN3xDFCfueJBvB
	aptFDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nper29x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 09:13:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f946461so142847085a.2
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 02:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724438; x=1783329238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1CXheUuAMODxr2cJ8/mrzTf3yj1wuZdPj+yzX83Vyc=;
        b=Z7GfDAf0pGD4kxhH495wPdWjwpjdA/2gRH/O3RdM+HUVFc2vPESEa1OzNDdjS/3Dpi
         cWoM9ae3QgS60gjCiSX86rsmkbqYTmKFvzMw7eOn5d3wRWPABLqdn0Si3w4XNQYnUVlK
         DJgAnaIomMsXuhbo02TCUtm4FYELxyzQeqAjaG6184SzDuWHJpX6QNK3Av1at//00WXs
         jLLG6y2EZIDh8xRBjFSRxJ1UDRYGuSO+iyImSuwHBjSN7kCI0pdNfc+yRt33tBQzAiQX
         p9NE10puO95IvNZCNm8OKoqtm5/q2Tl06Ou1zZG4PEo+yzuShtQinO5uSruHUm1ONmsA
         6jjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724438; x=1783329238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p1CXheUuAMODxr2cJ8/mrzTf3yj1wuZdPj+yzX83Vyc=;
        b=iOalF/UDR0QTj3IHsyETQ3duP91BJP52ykx+K963KKeTbJ93Ez560pcsbfvWEblN1H
         sKlgnq3nD9aVW+bQBo2ZxG1wPINGABeCsvlUK9Xo1ENTE++yJ+qcFsZMFFznsn5qFYPx
         0xYj/6wcTU0caXj3X7jecKyJySisgqpGUVXgwp2isYDt974SfAs8mmoMfuiK53Wr+v77
         mNcmx2xZj9G1NXqWe09923lajrI5p6+ZSnVwKLZdFtYY5AbuNOWuGNo3vhrZe1nmEcDx
         qfNSt+ED6Qon0O2ZnKTweMYJIeqMijRrvzoChh4wZosJ40XFv2RY2o+NO63QCIg9BHYS
         khYg==
X-Forwarded-Encrypted: i=1; AFNElJ+Bqn4TMA14zY1dNzcvHz7R33J8FP6ZbnpaWRucnihlMs/lem6afzbThxNpW6ObZ1K7i1rNuPmqPCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGQKPmfMi0zIsxBCKi30wp4kadtQqhCmfCpId9KHErbPXj9M0B
	/2RdHs3bUOosTBKdTJRjbm6fM2/gk/cXQk48NvtKL0LgOK4laT3oWQlhdeVy0RCifoeWNOPgFSw
	LkKGJCTvfjU1HTS6Wd7kg7629+tWUNBnP7ilFyroVLBZZv2Qdays84jc3DdjaTZU=
X-Gm-Gg: AfdE7clPgc1l0RZ1pA0NeU2p8Rr804lg0BjOh6NRUG0w977S31Je9d7EZECurzM/EGB
	ewiGzZKuvCSpfUcLG1rSwFIsEW1V7QMX4ixWMhz/nPmWDInSElEmF9E5p45ot0VUS4bqOJl1D5k
	ga8BqdvoGSSP9hLvTXvwy/Eid9TeSMIyUzDvZJnQQ7TyJJ4NNNP6+WirQIPgJ9gIgW/Z/N946M+
	gbEeoGsu+2GOFRy+psJnPjR6eqe/c+zR9IegXWu4w4/gRyu3JOMo0m29pTlBjoOAWb4y0jg3Ad3
	kbv2LrBeYCZuWSOOHltPvzBwgPY+FHgAYDpPFXvAMK4MOV/MG1AZERA1mm9JF/T3LO1cze5UTs7
	fI+d2UV8efpqF0bRSJs21NFT6b14yRMjirWCMybd0
X-Received: by 2002:a05:620a:6499:b0:915:9273:9239 with SMTP id af79cd13be357-92b3b6eeaf7mr1315079685a.13.1782724437629;
        Mon, 29 Jun 2026 02:13:57 -0700 (PDT)
X-Received: by 2002:a05:620a:6499:b0:915:9273:9239 with SMTP id af79cd13be357-92b3b6eeaf7mr1315070685a.13.1782724436678;
        Mon, 29 Jun 2026 02:13:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:42 +0200
Subject: [PATCH v2 19/19] driver core: platform: count references to all
 kinds of firmware nodes
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-19-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VEyUxYLMr0/kZUc3hQzqiXRE39K4YPDPrI9dGBJJGzo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcV2ZO/mjVvS7fscrieifMk6bWNF2AN6BkT5
 4dxIfGu2nWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3FQAKCRAFnS7L/zaE
 w2YpEACbPZSAaWOfh+OuT1Zwlgz+BsRRZZy6cDhBoTiUeYqKdcPmZxipz2TsAMuIlfYPKLh5abm
 46zQkAaG1vtOnsxm9+NTs1QAQ6xkDAoZzhIZMDHqyOPOoG8Gr+0mG5poyrmzhIJ2gZetsvDhSUg
 9BI4HNO2Ya2KjeYG+sFBfGfeJBAYbg81BgstPscXYSUTtblGBlW3R8dYSpD0xb5mS8spl+VhdDC
 3Eyi1jA28rzmPeRic1GeilgXo2ivpXQ1UGz0YeY2OdeZ5bq39rMU95OrW8kxMNV7LqUcxiPdxrK
 +fmmam/m3oLoXNKVFHp0LsKRGjrxZAtCV1oUDuNsQJqoEgaj695Gpkmr0wyk53BDm+QyBQTKJ5a
 azgRvH9HAuBxKvtCV+7ZH9BC/fDFaMPQ1RHKQWg5aIVDBh6TePB9H7+5enD4z+jF2LEogBad/L2
 GCZHbciAEbPm7xr2qYxHLMIgDFckOP8wAQjTjPZzrk8O6H/L1KbIMZEro0kRYsSBj/ofkZho6tT
 2RFWYf+OCFS23k9vsQNHX6T08a2EQEIL7w6cyBp1iSio1pHhuMvlvnT1iKOkYXSPxDK1FPJmjOi
 NZ2QX1sApJPEihNT9LGA6nRo6KyHttwNCAeYh/bhtKB4gUErD3iL6L6N2RotJIEEZbbdzq5OQma
 y6IZyLYWBBndyZg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX/5l8CajWrLWB
 1aIR31w1RQJw1DUb/P6kv1YPqSNbDajypsfYvznYa4ve0F/T427Ej4cmNyyQdxEecnIP0gHmiSz
 fG5m5P7RWt0gXKlocz+3CB3awhF/v5v2PzMup58yLtea3nAgzrbnMPlHBItPzmdtFcwunxqnj8u
 EkR2ZeTO/DWlu561Rv6PUkROPOhMqOZmjFdiXbnPYFign7HnbXvLp2sEOta98XozkQ7Jb7gdNLZ
 eJuxSqrKkPE4Ij5ona9lASkcsPLPfExz+Oj8NJ/1en1z0QdlDRnKHXyD7JZ+O+pQZHooss+xJXO
 n8q02nExkO3tp7Vp0ujemu57ELXT55keJYxQzZt2tm7VFtFMVx1LWAh32RHm5Wi0Ac3BPk6DN02
 E/jevqjKps2JmdoFILiMAs2U8flxfSTCoHR2PoO2OGfyMCs5waTv8vJQA0ImyMf/Qs4gwfHeZWo
 ckt8KeKt+Scmt/2BmNw==
X-Proofpoint-ORIG-GUID: vLE7PuGMXeeSnbTb54-ofZjpyB8OHZbm
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a423756 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=2sGp0kyKjRk1obZUzdUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX8AJX6Z5ElzJ3
 2DVkJMYutC/veFdSB9keaTp/wX0caYmDq6gaGMchLOaYZbqfBZ0nyAf4o94vz7Qwqhq9rBtwWC4
 4c91lj4P+tr3sas0RwEDzNd1Frw7X8E=
X-Proofpoint-GUID: vLE7PuGMXeeSnbTb54-ofZjpyB8OHZbm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074

When using platform_device_register_full(), we currently only increase
the reference count of the OF node associated with a platform device. We
symmetrically decrease it in platform_device_release(). With all users in
tree now converted to using provided platform device helpers for
assigning OF and firmware nodes, we can now switch to counting references
of all kinds of firmware nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index f24a5f406746b53ca9eaab9472f6dd1345e04ad6..bb5f5bddd047d4ec6f238e36dfe4f4ea36b92a76 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,7 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
-	of_node_put(pa->pdev.dev.of_node);
+	fwnode_handle_put(pa->pdev.dev.fwnode);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
 	kfree(pa->pdev.resource);
@@ -705,9 +705,7 @@ EXPORT_SYMBOL_GPL(platform_device_add_data);
 void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np)
 {
-	of_node_put(pdev->dev.of_node);
-	pdev->dev.of_node = of_node_get(np);
-	pdev->dev.fwnode = of_fwnode_handle(np);
+	platform_device_set_fwnode(pdev, of_fwnode_handle(np));
 }
 EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 
@@ -723,10 +721,9 @@ EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 void platform_device_set_fwnode(struct platform_device *pdev,
 				struct fwnode_handle *fwnode)
 {
-	if (is_of_node(fwnode))
-		platform_device_set_of_node(pdev, to_of_node(fwnode));
-	else
-		pdev->dev.fwnode = fwnode;
+	fwnode_handle_put(pdev->dev.fwnode);
+	pdev->dev.fwnode = fwnode_handle_get(fwnode);
+	pdev->dev.of_node = to_of_node(fwnode);
 }
 EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
 
@@ -921,8 +918,8 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		return ERR_PTR(-ENOMEM);
 
 	pdev->dev.parent = pdevinfo->parent;
-	pdev->dev.fwnode = pdevinfo->fwnode;
-	pdev->dev.of_node = of_node_get(to_of_node(pdev->dev.fwnode));
+	pdev->dev.fwnode = fwnode_handle_get(pdevinfo->fwnode);
+	pdev->dev.of_node = to_of_node(pdev->dev.fwnode);
 	dev_assign_of_node_reused(&pdev->dev, pdevinfo->of_node_reused);
 
 	if (pdevinfo->dma_mask) {

-- 
2.47.3


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96BF4D8DAD
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341968; cv=none; b=F27yl6EgwdM9z8gEKRXnEYDOkjXpA9Y7+jWXrvCNqPzyMFr202dWVip61snyvmc0ftxTJj53evNlEG3IG2ds4xPLa3/KiJ0/BW+zp7+jsR7O2VsbroG7a6MisbNa14vfR1dVrceBnaRxKPQ6Ty0jgQMz7Swdb5oGTgeQR5OIT1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341968; c=relaxed/simple;
	bh=IqF/4dKgB1628r62VJTRc6pv/7HE6yY73nomq/D91IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZP8UuEoo3kL8meMoLY/sYx9YvyIlilnwdvXjvmbuXj2YJt5ddK8GG7E1nT5380vCHq8y7RQmdyBZwXZYELCpxvDWwGxmcRrQbMmimuA1eXk+H+Q19Hb/Lzv7QM1X0hFn4yoprEm761dUa+Q+0pmwWj6urhaAXz29445/hbQfuBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJEEF2hq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6w7B2yC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJEEF2hq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6w7B2yC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxAKt391078
	for <linux-usb@vger.kernel.org>; Mon, 6 Jul 2026 12:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j94N3D67YZmp+yB/bJ2N7wl2Db8ez4ZkEgubeH9mxnM=; b=mJEEF2hqlR/uOjVJ
	VGxfq6X8Coeflz9gG17PG5AS1d8bsHMFXhdZWsQVpoBGNxPvBhyMKeuA+dyOCDVQ
	f1hfsjqCoXOdNFPJoAu72h5EhTA2RJe8aHAuVR3do6hcY/6XuWdPi5v4ABh+SBK/
	rcNeX0qyntCP4cdXULNVaYmo+GOzB4IXw/vS1gy2FdSZK/epGthEs0eICwD0JDHC
	qLwA7MiAX+whloAu+BOq3pVZA9mRrwwWNHrvcFQktC3WPAB1dKapRcEh1XLp4aGO
	t0DPDKiFYVlnUQvHVG/TurGAk+efJV3NTROGxUtnqQUlu+PHgMshaUYjPMuJ3IBZ
	RMPGMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrrmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 12:45:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e663c29f2so310164685a.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341951; x=1783946751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j94N3D67YZmp+yB/bJ2N7wl2Db8ez4ZkEgubeH9mxnM=;
        b=h6w7B2yC64hERrSEv3KVmydDBLqbCSiU+R84v4YgZKY6Zn8jToGkof3At0DxnImDAS
         jLayZ53LM6dhN0T4pBFGl8O4aurS3grzb5UbBsi3oKuHYWr9kKwQk9/87dD7rROdzwWm
         a3oC8cZh2JYIe7K7Iq/aOK9BE8lcG0wMVr4OtN2+mLWwiQd/kQIQ4jwPV3fAwHkOk90t
         YRxaeo1Ejx4NgrX2Q49OUU5Kl7t5+467cpuv3OBclUWOm4O9lGhmSrNwdqO+uT6wGPhx
         xRribaQi1/QN+HejfnbbPG45WUs8jFO1g6RdEVLTfUV1B2K9C4Sp+Rw2ViRiVuWJIGqO
         +qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341951; x=1783946751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j94N3D67YZmp+yB/bJ2N7wl2Db8ez4ZkEgubeH9mxnM=;
        b=iZ+63u2cojv2KbFkDaIbxDruteYUzgjz+6M8u6YrubyyR41fe7VlLyKmH1jyph1IMY
         k6Lz1rrC/NjGCBI8nfni4k4rKuexIrC3weGaY6Ff5fh3KDsmu/ZIKtBFc1uUf4iQKG6H
         Q0KxbgFUsSQgGn7n5+aljjzayKloHi9D+XVVU3dKpWDUAGM1RpTvCRuElgvJXYddTROC
         BU2CSyAqXFSZAwOkVPH0Vzz1i6pgPqCfN5d7cz+pZKNBL17c4g9YQvvUsyhrYHtCKU3t
         iPgSVrGwKKEJdqFGLQ9VLfloZ5T8N3X6Oll2Eibn768kC4+7tY2oUP2K49OWQkBAeNLx
         a8vg==
X-Forwarded-Encrypted: i=1; AHgh+RrO0EEMFYZR/cmrM5EXtZ9G3rjkEI+aYg7ZzBzH27FC9jKieZX3uCZCLDQM/FadHPTAPg++GRxZeCg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1R/O7D9hzDZgEOLUBx0fK0rvOAfJGG1curqufsAU7PmpQO8jM
	+q5BeEvyonpe/9C3+/phfhDB0uYQO1PasFiS+QzMwDZVDA6GCHmhCj8yJkCpHPGtSUDT5RM2EaI
	r/Nv4UMf0JiRxS8tj9BUxCzm+b4QXhlyOkFgWZJrW9PgVvV26KRsvQMmrNtMZpA4=
X-Gm-Gg: AfdE7ckbQtkIk5FIZareBQvSq7FOZwahVeiWLPIHn3MDMAi1dxDCWI7G0zJEEw+vuMY
	DIOYjgAqpqvccSoTBHLdLYybDhQwgHE3rGrsrUBwAh1q0BB0SYcHRmmNtEEpPtT7CjKO30NmpLt
	oPygx1Bq+9VoWRVv2b93xKBtAUAIg7isxF0gMLbgN7+yNT/UbbehbvqSgxpRi1CAKX1BAMjrrLZ
	64RW/JTqP+IuWlcRTKLXDvWGp8Foyq0Tul/XeZo72HsPi4MMYoV/XMpQHglQx0raqhQz0ACpSSG
	50703XbXjfkuX1aX5UGQlvspd4ppL6R5CtkWGnw6DUB/WirJOGPNLvJGKiUp9skhpFxvgN/HGsQ
	ln+gIll9YkPxRnLEy0hoeyWqXKMw5BNjAovOWTDI7
X-Received: by 2002:a05:620a:459f:b0:92e:5b63:224e with SMTP id af79cd13be357-92e8b5049abmr1749175485a.22.1783341950766;
        Mon, 06 Jul 2026 05:45:50 -0700 (PDT)
X-Received: by 2002:a05:620a:459f:b0:92e:5b63:224e with SMTP id af79cd13be357-92e8b5049abmr1749171985a.22.1783341950261;
        Mon, 06 Jul 2026 05:45:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:32 +0200
Subject: [PATCH v3 20/20] driver core: platform: count references to all
 kinds of firmware nodes
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-20-1ff028e33779@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IqF/4dKgB1628r62VJTRc6pv/7HE6yY73nomq/D91IU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M9ruJ8yyUk+I6pdpFWbcAtYm5CgsYvefKU+
 TywqoMuS8KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujPQAKCRAFnS7L/zaE
 w0+BD/9zjT3fKJr7/zYP0sHpUApNtRCsyLsJzRKuAlcO+cogBO21GRQk1DGikSTFqOqALVvaQ2g
 83j83HjHg+bMyaUlGN/FEHSMVHmKvXmesanFWRUyj5q/cQcFMH8POK0Xe3edFHZZx4BBkdJLCiU
 YBgV2p9qKU7Yx9ujTc0nbFflTLCPc+KLCa6XMeNIL7NcRgHVvMgBJocHY4ppEVSl3w0N1MqzNLN
 MJ2jEc+08OGTNE6VqBsWKGpcVcsy0c/flgXequGSLwF2lbMvrEVBeckaXblcohUFBgsZTwHIilr
 DuAyyAxwT3CWTsisqCJ/uzziDpBphBHYSMVHgzJR0EvF/dg0gFk2JrYTFDjipwiMhwshuY4pMG6
 brBELDRVNzWmoJxvrqtCNEs2g6/282jmP5bq8VSGXsiFh0Tlh1WMQesFTI3Dru/rc0SNeU4rkul
 wq2awNwyKdDtNJtZDmRz22Vrcbh76dcF1Halbc2omaKC8QdnXDZFTtncn03dXnNqBcF2/RucoRD
 PgoRvdtJOI/EakLR/ayb7hAHHB2aey6mLr7a280QfJRvxTxQ9lcDY4ZxG2oeQyo5EJpmBhQCPl8
 BmnHyLd2X+djvXjF8tGCWMjxCty1aDjcqXp8ApTdwR04CWKI/ZYVFf+bcapravEbsUypfWAAx2W
 0i3DMYG/6NOmHjA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: YpzFFhlDM-aQ04Eokv27Ya56SjtYHgdp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX8oY8A/Q8Jn4J
 kjXJpjBYG0O5eFU7xBzjiUz0i5XOmTWl4AsEO+LJvy8PkhryMdIeEx0y/G8moryZ6vdIWAORmU0
 Cpkwz36+UkA0Pz/JJuNtar0cT9+IybzX/qTabS2EFzOISO8wsnUO056U2NtVIgneMTQ/65/vIdu
 P7pyKoTUhw0z+IJXv12vXZYmWf/YFh/AldO98tIYn4m59rqPPa8xHEO5yoGTBKYnYom5UdRqsRf
 qPzVZ9XfwL06i7p61wAzHhc7EGfKfOyrqskfpMa2lkKku4xBH/lolf38HQqlNySTvRLpf7Dlqzg
 1qJUomnufW5i3I5S7Hv+TswTHs6N91L7qIjJjgz3W8SGUwkxQ/F+nIxv6+nkPQtbyPW/3iRZVV3
 G8sjxeSYmS+m8GOMo5mNtNbI+Jov5MG8iYvkodNim54QkKK81C+Gs8R2aEaSgIbn0ex1th6GGhW
 bL9uf/X8eWVOygjXv9g==
X-Proofpoint-ORIG-GUID: YpzFFhlDM-aQ04Eokv27Ya56SjtYHgdp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX9kOotlJ4a+4o
 hJBSwRXEfDfJipi7mSwtwn5ieOBKiRMZ3u5QQNHJ7LwZ2iNzSjQmMcwU9TR+d0d6HuO4A/6WYMw
 P/M/tuULBS/Cs3hp8b8PXtaOwuF9r3w=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4ba380 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=2sGp0kyKjRk1obZUzdUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060129

When using platform_device_register_full(), we currently only increase
the reference count of the OF node associated with a platform device. We
symmetrically decrease it in platform_device_release(). With all users in
tree now converted to using provided platform device helpers for
assigning OF and firmware nodes, we can now switch to counting references
of all kinds of firmware nodes.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 9357942d0c79b032645035879b2bed3d53305b9f..a71015f1d915340aa01ebfae67196d4d7ccecba8 100644
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
@@ -712,9 +712,7 @@ EXPORT_SYMBOL_GPL(platform_device_add_data);
 void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np)
 {
-	of_node_put(pdev->dev.of_node);
-	pdev->dev.of_node = of_node_get(np);
-	pdev->dev.fwnode = of_fwnode_handle(np);
+	platform_device_set_fwnode(pdev, of_fwnode_handle(np));
 }
 EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 
@@ -730,10 +728,8 @@ EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 void platform_device_set_fwnode(struct platform_device *pdev,
 				struct fwnode_handle *fwnode)
 {
-	if (is_of_node(fwnode))
-		platform_device_set_of_node(pdev, to_of_node(fwnode));
-	else
-		pdev->dev.fwnode = fwnode;
+	fwnode_handle_put(pdev->dev.fwnode);
+	device_set_node(&pdev->dev, fwnode_handle_get(fwnode));
 }
 EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
 
@@ -928,8 +924,7 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		return ERR_PTR(-ENOMEM);
 
 	pdev->dev.parent = pdevinfo->parent;
-	pdev->dev.fwnode = pdevinfo->fwnode;
-	pdev->dev.of_node = of_node_get(to_of_node(pdev->dev.fwnode));
+	device_set_node(&pdev->dev, fwnode_handle_get(pdevinfo->fwnode));
 	dev_assign_of_node_reused(&pdev->dev, pdevinfo->of_node_reused);
 
 	if (pdevinfo->dma_mask) {

-- 
2.47.3


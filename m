Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E9C3FC5CB
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724394; cv=none; b=jrTTmyFUFWCC0CsBmxYzduPE+N37sxPD7yrXg9GxVbOQMJg8uJQHqODfVOCOX2L7bVOdjSNDH2SXzNfBO274k7/EMjLZ0R1V5hWGVx0JP3dyK55QSX56iAhx/Zt23qtHTvZpqmUDc9DhFASCxo/4GHtc/lJT5UyAROka0Qm4d4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724394; c=relaxed/simple;
	bh=4Xem2fZJuhLkEpQ8AuCHhmO9dgYwD7FFiD2wwhhVUBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L4bSnZ0J6ZoHu0cF/bIoHbux/GlaQCfob8Ar7N4iR7ndkMKoOPtVvdms0pXFqcuQjeh8gx4uo/P6/FOS/jJb5vuZ6z0DA+kS0qK4X9t2SeUQIks3EJ+yRchxF+nsscqnW/yAUMBieUKn9Lg3/gvz+zuSA41KdFk/Eoz/mjm8dNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lka551JY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPE5GGGF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lka551JY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPE5GGGF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xgov2431950
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 09:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BmmK6vf3xg5kSs+g+NySw3CxCiN6R9NnyD/njOvPVjA=; b=lka551JY52AAQD0N
	E1nsTsclnKJB9amehHdeu7bzmvQhFFyH9jnIDHlkrxX+7hSdRvhB8oznWibv1n47
	TQJ93IOSM+SS3HBW6OhkTYu/8uBEGRh96wB+2s3baNMiaHwcod7+emf0GARrG4dG
	ujmpsZ/GRFx64Ut0bLqS/upYq5ytq9s48TVwl7RViMDdtwEFBTi3PdvLviVP2MFm
	YTUb+PFU9akJEbNi8hyUgnaCeAdALfzfFj3s7iFe38BNuMC+pavQ9JJtRHyTehT1
	FLI6q2M9RNjFVtvofU3cjlu0pDwZzcqZgMmAje0zblGjFrXVez6nANvsIq9pnj3H
	KnpFzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nper20y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 09:13:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so485498685a.2
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 02:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724391; x=1783329191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmmK6vf3xg5kSs+g+NySw3CxCiN6R9NnyD/njOvPVjA=;
        b=kPE5GGGFNYOgVHBVkshURHkZFn8sjgQLTh4Iqz3vl5QNgKWbTM559/ldDegOZH+OHE
         kyfNH5U92bnO5jUGtiDctxO3V3Y5bNNWp/2cz2SftR5gIU9zq24F0vvh6xxl2vvr4vAR
         LeVdc4cFOnQ4KOu/gt7g0PQHtQwmg8RcyJ8eCvU/Y/AyUzq8XFhwwOGEg307hjNLeyCg
         sFXmcEMO3iVwaPlNR+vDiJTcBCp2X0ylmcFDKxIpP3pKwjn3icsYrrv/cORhwm88CSIL
         d3u6U2KZyPJyrUHWDfPxK07ptwqHfpbOoo3GBTXzAJoAMMXcUYmfn0ZM8bFI0Q/Z3OsL
         ImGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724391; x=1783329191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BmmK6vf3xg5kSs+g+NySw3CxCiN6R9NnyD/njOvPVjA=;
        b=sCj0VWtrwVAFXqOUB7/GO81DI67z5eWQU/HtCZ4EYmljm7XemuyPcpDQPZir/CgR0e
         k39aGQcEA4jIjrqTYU32F+Lf/YhpSkHIFeV0tiX6G7vDi5A25z7VmPBPZdxOxh7v/ad0
         EsS5N7LsQ+xQozG3rt+Sf1aqdh3iWJ0InSdHmsZ4Oom7oIrZjQ7+NjPdQkwx3c/WTtqX
         64kAoKexI1k+JDEPTzOO2rQ3RcdaCI1q6PbX3zobXZJ2LciNtmMuQnm5Ro27GUlWJKX6
         93zfkrSRgMTZGOXc+vuh8VKcs/zxm+lUh+Y+QzBgKdcgAzsmaEYJ5dCSmhmq3vOyUbyb
         UblQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MTDX66VA+SsIxrCIKwWXekJYe8HOqnwN7NO6YjuiCEkxwT0578+KoPAg/7QCidhIrEzH6yQRtars=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHuWOxX8rS27PIgakdXF1e7KA5A6q2gnIo2GO+mGdAH+V76tPL
	FWQdbMu/t/Xyu+DyrbxN9ej3O+8lhSSndcuhIthPHP605Dp/uyNsHmTBJViZtQNCeLBLnBYfiv3
	HUkmTRPQktJOfjGcE54OBxxESGj1LgeITtw74rDDRlK9+UQ7lGNns2wCm2byf/KE=
X-Gm-Gg: AfdE7ck+a3jL7CZwVJ+Y6FEWGh0gQaD26lOfOY4PLxcp1S0o7N5AADdKNqo6XxJ52sz
	dz+zVxDSu8mm+ceBoSDY+rv8tZXd3snlsuRZWLMIvnizQXdP8sTStvhupenmKEQpF2HRcvyLdWa
	yY9XRUATUX65e57qF9CybcViotm96qSdffwZ5OTdPsVFP7vamNw3Iq61RiSvKZ/7XirY6nCE5CY
	LDigu7i198kdF11B1SFNXEMtBiNwiySV643ZR/P1xVQuDBcV8asx9PnjBcDm6+YxtmswNZPlBtZ
	vtydVbazZz4+XZoD/u8qd0Wbf0pRBRFWGA9N/lXqwCdClP07xiLB2FxOAx8/VCxrZTCDT6fsNvb
	msTV2D0ky6pu8nR2YaO6WegRr06M4bdS2n2RKPIes
X-Received: by 2002:a05:620a:a195:20b0:92b:4ce5:6390 with SMTP id af79cd13be357-92b4ce57573mr1026440385a.25.1782724390865;
        Mon, 29 Jun 2026 02:13:10 -0700 (PDT)
X-Received: by 2002:a05:620a:a195:20b0:92b:4ce5:6390 with SMTP id af79cd13be357-92b4ce57573mr1026435185a.25.1782724390191;
        Mon, 29 Jun 2026 02:13:10 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:27 +0200
Subject: [PATCH v2 04/19] driver core: platform: provide
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-4-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2284;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Xem2fZJuhLkEpQ8AuCHhmO9dgYwD7FFiD2wwhhVUBk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcKKhTwBlGLPKN++MiZnFDb7ToqrUhpCsLFF
 bslLR74S6qJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3CgAKCRAFnS7L/zaE
 w/b0D/9hlzF+MuyoI63nIic0Ze6VbI7qxNCbhn6uZeyniPLgZtbwhc69m2JUdgrAsHuQj0IpgJ5
 RCEa24lCvBE2SclclefxC17v1wor7uj4mUrvqJAsmjgFueZdPPr1N600723ruBzPxuJumeQzssh
 jlRIYTX7/407wi5FmqwD448VpGUlB7Pa8NNjN4IxiVGs5XNbGOoj/im/ZWZEqGnDlSu01mcNJ6H
 iCfItNYSQATbNs8tXytgXjr2lFulGi9myKKDBQTaxbB5YtuL+8nWjUC+8o8kzBnw0EB5rK2I3RZ
 xOnAwjeUNAsnoHP1h5Zu3bola+8Dt77547fO6ziravWksfKzGMhGBTDYqtHYdVBNiSbOu01mOhj
 wW2esT/uXcCEuSBCz5c6WMXwwp5oY07WTlwLR5FKetn3Nr8g0u7Jct0e9Ae0Mt7+sOKVLeVMy6H
 VRRwZ02oyzNv6rvb2wurGxqaqfrcXzQuJCOYNJ3jXfPXjuhBl0/jsf/Mh+jygRzqUCoxEpt2gB4
 VgJ1DsNmgpFosrKXs4a3l3flS+45sPbHJm3BdJMiIo/xXOgRhIEL8CNJjywDB0OugyemEEIs2ih
 rS4p2TSq2yTzG7YADPWUwWt9NpbmH36Qfqd4amAhIgP0uFrRnLP+2T42NgZ8X9f7xOLG6mDeruO
 VLhlU915iOWWEBQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX7U+ZY+RcL7Cn
 ODm8F/Dz2HZzvfHyHd3mF70zJhpWyI0KH2dwGqHCsEiECotAl3tTVkgB73Y3hzv/q154b4J6X1k
 Fi2jAtBZoErL8YErlcKaUPhEW09/kb//tPWtdfLD0DIn0LrSi54vxBnbeeBIrAdHDPfidA5cnoJ
 c7ugpt6yrrBA4vOkbrpja4nQQJoQWvLz6IlDoIiyOMfJuUbJXbdMJ2UVHQawuzNXgK4r7pUTUGc
 IEe9VMAI2iCregCXb7CoDwmg9qyiPMVonoVPpneTVYcnwl07gVZQGMnyUyHnBaZEhISqJTDG3ek
 Xr4LWxPYdU9JC3UzQuStAv035wqjMZSQ3GNTwEDCHe81u0Ev5fyNYm+j2+ED5FOHzS33H+3vcLR
 GbTFFqt2KZ90ThaR07ObTK8APQVjF7RCREUoa0zg8ZyvcF97Y1NJ/mNVeCN/lrXDsyDapZExizs
 7yrw3/adGFWpGrN9KGw==
X-Proofpoint-ORIG-GUID: sF0ts6IcgJhhifaINYG9owNVIUfBb7cu
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a423728 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=hkCPowqfBUTF6yk2FrcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX7EOddz3BsCOL
 FBDGIpR5yKhFVyTC1cON2yluMCpoGAurtP74wCONdRBSDSh1F19X3K2lsddYsMOGMhkZF1K1XOn
 DMUm0IdHdNnH7tHP+9kRpBdX2giDfX8=
X-Proofpoint-GUID: sF0ts6IcgJhhifaINYG9owNVIUfBb7cu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074

Provide a platform-specific variant of device_set_of_node_from_dev(). In
addition to bumping the reference count of the OF node being assigned,
it also assigns the fwnode of the platform device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c         | 16 ++++++++++++++++
 include/linux/platform_device.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 6520b70cf3052d683a2ecb1a0dd7227575546ba0..f24a5f406746b53ca9eaab9472f6dd1345e04ad6 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -730,6 +730,22 @@ void platform_device_set_fwnode(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
 
+/**
+ * platform_device_set_of_node_from_dev - reuse OF node of another device
+ * @pdev: platform device to set the node for
+ * @dev2: device whose OF node to reuse
+ *
+ * Reuses the OF node of another device in this platform device while
+ * internally keeping track of reference counting.
+ */
+void platform_device_set_of_node_from_dev(struct platform_device *pdev,
+					  const struct device *dev2)
+{
+	device_set_of_node_from_dev(&pdev->dev, dev2);
+	pdev->dev.fwnode = of_fwnode_handle(pdev->dev.of_node);
+}
+EXPORT_SYMBOL_GPL(platform_device_set_of_node_from_dev);
+
 /**
  * platform_device_add - add a platform device to device hierarchy
  * @pdev: platform device we're adding
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index c463d46b7b9ab6b891df1ca9f0c98608d2bb140f..94b8d2b46e913ebcdbdaa3710f008f478b59d7b4 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -268,6 +268,8 @@ void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np);
 void platform_device_set_fwnode(struct platform_device *pdev,
 				struct fwnode_handle *fwnode);
+void platform_device_set_of_node_from_dev(struct platform_device *pdev,
+					  const struct device *dev2);
 extern int platform_device_add(struct platform_device *pdev);
 extern void platform_device_del(struct platform_device *pdev);
 extern void platform_device_put(struct platform_device *pdev);

-- 
2.47.3


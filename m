Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693FD3AFB07
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145317; cv=none; b=FJ/74eLNtPD66daucBB0XLdtiQPvr2FwAUE6blK3FxBLuX5oo+doQ/VH1uak24sS2JscpFYMP1IqnrUx7PxZ0ago0XpQKuCW0/+FtNlv+dHi/v+1HZXWzgKdyz563fyy+WRTogiW02pbo53suFTFsDMRZtIXkMXJ9o8qifpeyNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145317; c=relaxed/simple;
	bh=OleKFQ3nFPTvbQVvEfoYRzbPaXY2iSygWgPBtMcL4gU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qTW8Pxra/5OAk49+r6KNwkdzKh1uxLUa4eJQXDtm2TcgOBuWtWXln5pLpCpbG2Ixb8OnnnPcWOjVCXYIWkSwfp9JF/0G6bNfk+skMyxzS/NuP0Rk5u28EJycfx6z2JSBn0XU1rCoHUabaiOUTPAhS3gBjIsmdms4qjfRzOjUc0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KxOtVUOv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UejBEO4+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KxOtVUOv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UejBEO4+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bbkM3239074
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XSONNlxqzGS
	nred13ZjZPjtjOkQ6ypl/A3ljwR4Mbqw=; b=KxOtVUOvJECthAKRZIVk8sLYms9
	01p29ABE33ZuZ/Xwsb0D3UrkLp1d2PvFZy1fMRsMA5e9gon/AXYWh3Vb5wzhR/o2
	ixG+BlWbHLz94uaDI+6DSanhDmZ+b6ji0+YK4SDHjlioUjvQe6bu0PgltqwF1nIA
	Agqp1FHLK3D91IP+dE+qKMLkXrnXlTj+KrnBaHvfhrfELrc3bOfbxZVikR7gQLs7
	gT3irkK0B8XtbGhAANPNW1k+hnK5ecLOsXdwY4kAv+YtToAWJ25tEknkvAhw/Rtt
	Y7S1fCIvhwmn6tfVb/xdSK+NkTWFQnayqWj41+QmFW3LcPo5TP0dHk8dEHg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h0k2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:01:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc6dd43737so60929215ad.2
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 20:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145314; x=1788750114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XSONNlxqzGSnred13ZjZPjtjOkQ6ypl/A3ljwR4Mbqw=;
        b=UejBEO4+thc+jmgyGhNSBEE+fei5mF+i7Fe4/g1AjnUxlXMKuMEb1SwkpENVo9d4R7
         Iy8D0pu1JsV55GhpOtK2w+4JqeNXrJdja/FE7bX0OpEkSXWSc7J8ohPE8dW/Hie6ntbE
         GFVSWO8nBSkb9M3qFpyfg6dpcLPJs4zQU3awcelsZfaanK5fgw5Wceu4TaqQ52aXYbn9
         VX9Y6XkaBWzQNj9tmblFdyBX3UOvBUC/WqDSAbdb6/ef1YbA6SiqkaVYZESRVNwYYOwX
         ID5gSOAnt27HCdyQmqr1xNn4zgxVAzEak/nw6CumPx0hr8VHn/YPpjp3UzGQjNor1QNl
         4nNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145314; x=1788750114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XSONNlxqzGSnred13ZjZPjtjOkQ6ypl/A3ljwR4Mbqw=;
        b=W7Ek35Idv/Wff1kdl6sYK+f0QXi8Y9Lm6kdV1b7Ob1+FDdXRCEyDTQKlNhYPlkZkmd
         QufCA3xoizR3HJKkjp+ZkBZ/6DBO/gPNLhEJEEdOr+WgECzOKsj0xwkeCD1zONYwZcnM
         d7qF8/sP8F6KqfQIlxTlJR9709PedYxhZEiz1rQu63AH6ZD/3QJTbzKJrYDLgjsZ8Vwr
         TjK4CCpEwOM2cg3l6DQ69Ksd21NvnVdT1Y4cjDLB9MUMS4fP8TsS2IWdjINryr9kZsKt
         R0Jidq77WnZA9u4gx2WQG9ppob8Pxpmom+hirrPRku/omkwWCbBk81zkkykIhN82JMan
         p9GQ==
X-Forwarded-Encrypted: i=1; AKwUvByLzYEaHZeQTl/p6uLg6syb3dM/s06nJC1OTLy82DPg0IyZP6AQYwqZZVCpcDBn5KLQF5Ry2eu9YQY=@vger.kernel.org
X-Gm-Message-State: AFuF++kezPz0gfLCpd/UCuj6gtnVuD4vZo24vFOvskqiAqxkOvItKkw3
	eArIZ39EfBOI6bmefya0RM9e1k2OdipAy9grQraZ2hiZ/zTBWSalArULjYtUxQ/xvEutwO0MJ0Z
	CIcbT8gIN/am60Mpk3UwgRwq3YMyWx86ip+KjkCJL7OAW3JDS49t7TTTW+QwvGqE=
X-Gm-Gg: AYBFou1JpDGG39nOPz4ozCqVOdJzNGnTZBXl3NbxNfmYCGx8XWNNaf8xxvSIEZixG3q
	fm1UuzGArcvPVMDrX67iPWUfkTnZ8LTq4cfWvreZ/Toh0voABH7ulmVeUaRA+Wo9Ou4LSLjCdjG
	8y4nUmKbiYMgORWAbuT1Fc4Wbsq7mVfBbklJwSy2IidPkYszdAUpecFd60ULsoUIum7zYrubOk+
	zSc19LhUU0U+8uOIcsuf95GD8Ew1QMNma6UnzG/lVsCQNYxYejTP7wXxM6+o+9uYIIVQnxJqqfA
	FpiRjHajwwEUFCRF/7xPrW5SpIaIWHHUNgPx3TkoyR8Dwf5AKPKjMfVC9PhHz7azLkNYgR6W2xI
	Xhd3f3bnDgJ/9cYTdyay2NNnwrVlRKnVUDy4KZFnDCqOqrLqAYCv2RQ==
X-Received: by 2002:a17:902:c40b:b0:2d9:123c:8c49 with SMTP id d9443c01a7336-2d93fa0c365mr4501965ad.14.1788145313387;
        Sun, 30 Aug 2026 20:01:53 -0700 (PDT)
X-Received: by 2002:a17:902:c40b:b0:2d9:123c:8c49 with SMTP id d9443c01a7336-2d93fa0c365mr4501265ad.14.1788145312899;
        Sun, 30 Aug 2026 20:01:52 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:52 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v7 4/8] usb: misc: qcom_eud: add per-path role switch support
Date: Sun, 30 Aug 2026 20:01:43 -0700
Message-Id: <20260831030147.1500616-5-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a94eea2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7LOY1QleUuiESi-gyjEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfXxAgw+xOrXdVI
 dQ41EKllhyUAzMhl9gd2PRwnebgS4YrJSvtk10UQTA3PVuHKJlt43O6i5FdmEvrxYTYUsqwclgB
 GvObfPV43dYqLd1/BpuU2/CCk5n74BQJyIX3SkIfx2WtuDR5L15o6cMRIyF9ASeni7fGoiGEL4P
 Z8GLmTufFZRHJkR0ArJES90qnhMOiRSLSLvQuoOeMbblmC69yIbyAd5dWWIJhmZ+W9Wm2a/Rg9l
 2GP9O1c/TAN6JNQZcU4EjunzIj4jChiCOLtYiMKZ2iAAnDE7lELt6ILM08scxQprYGjyLAaisJg
 XvZhhBz69Pr0/UMmwJbrwC5krc/C2pe5i/9tpv8n8Y4zDJP+vsxl5Czx1a6vGQw8MiyavHHVnel
 P8QK5FHk6hvRvCy+vwNixxjCf4XjZ3X7Lv7yfKlUpKhxbYOymw5zXXAQjowrojUkECp0CCATcg1
 XKqTs2hTq76ydTcpK4w==
X-Proofpoint-ORIG-GUID: PKMORIyc4WXucYQF5tYb4N-0Vx0-iV20
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX4dRDHRth0XAz
 92fgjO1h66wN/TImEEZBUhvJqNK3nGVqcldZu1CpvMixZCsnXW3sgANAyFHg1XCy04HheB9AAen
 UXQtQeggDFYRWRyfZ3iz7kI/XOdcZpc=
X-Proofpoint-GUID: PKMORIyc4WXucYQF5tYb4N-0Vx0-iV20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310024

The EUD hardware can support multiple High-Speed USB paths, each connected
to different USB controllers. The current implementation uses a single
chip-level role switch, which cannot properly handle multi-path
configurations where each path needs independent role management. Since
EUD is physically present between the USB connector and the controller,
it should also relay the role change requests from the connector.

Restructure the driver to support per-path role switches and remove the
chip-level role switch. Additionally, as EUD need not modify the USB
role upon enabling, remove the unnecessary role switch call from
enable_eud().

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 102 +++++++++++++++++++++++++++++-------
 1 file changed, 83 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 03d1c200658c..45c90d9f3b1f 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -44,12 +44,15 @@ static const char * const eud_port_names[] = {
 struct eud_path {
 	struct eud_chip		*chip;
 	struct phy		*phy;
+	struct usb_role_switch	*controller_sw;
+	struct usb_role_switch	*eud_sw;
+	enum usb_role		curr_role;
+	char			name[16];
 	u8			num;
 };
 
 struct eud_chip {
 	struct device			*dev;
-	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
 	phys_addr_t			mode_mgr;
@@ -123,7 +126,7 @@ static int enable_eud(struct eud_chip *priv)
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
 
-	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
+	return 0;
 }
 
 static int disable_eud(struct eud_chip *priv)
@@ -270,12 +273,15 @@ static irqreturn_t handle_eud_irq(int irq, void *data)
 static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 {
 	struct eud_chip *chip = data;
+	struct eud_path *path;
 	int ret;
 
+	path = chip->paths[chip->port_idx];
+
 	if (chip->usb_attached)
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_DEVICE);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
@@ -286,17 +292,39 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void eud_role_switch_release(void *data)
+static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
-	struct eud_chip *chip = data;
+	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	int ret;
+
+	/* Forward the role request to the USB controller */
+	ret = usb_role_switch_set_role(path->controller_sw, role);
+	if (ret) {
+		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
+			usb_role_string(role), path->num, ret);
+		return ret;
+	}
+
+	path->curr_role = role;
 
-	usb_role_switch_put(chip->role_sw);
+	return 0;
+}
+
+static void eud_path_role_switch_release(void *data)
+{
+	struct eud_path *path = data;
+
+	usb_role_switch_unregister(path->eud_sw);
+	usb_role_switch_put(path->controller_sw);
 }
 
 static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 {
+	struct usb_role_switch_desc role_sw_desc = {NULL};
+	struct usb_role_switch *sw;
 	struct device_node *controller_node;
 	struct eud_path *path;
+	const char *dr_mode = "";
 	u32 path_num;
 	int ret;
 
@@ -327,14 +355,59 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 				     "failed to get controller node for path %u\n", path_num);
 
 	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
-	of_node_put(controller_node);
-
-	if (IS_ERR(path->phy))
+	if (IS_ERR(path->phy)) {
+		of_node_put(controller_node);
 		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
 				     "failed to get PHY for path %d\n", path_num);
+	}
 
 	chip->paths[path_num] = path;
 
+	of_property_read_string(controller_node, "dr_mode", &dr_mode);
+
+	/* No role switch needed for fixed role controllers */
+	if (!strcmp(dr_mode, "host")) {
+		path->curr_role = USB_ROLE_HOST;
+		of_node_put(controller_node);
+		return 0;
+	}
+
+	if (!strcmp(dr_mode, "peripheral")) {
+		path->curr_role = USB_ROLE_DEVICE;
+		of_node_put(controller_node);
+		return 0;
+	}
+
+	path->curr_role = USB_ROLE_NONE;
+
+	sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
+	if (!sw) {
+		of_node_put(controller_node);
+		return dev_err_probe(chip->dev, -EPROBE_DEFER,
+				     "Failed to get controller role switch for path %d\n",
+				     path_num);
+	}
+	path->controller_sw = sw;
+
+	of_node_put(controller_node);
+
+	role_sw_desc.fwnode = of_fwnode_handle(np);
+	role_sw_desc.set = eud_role_switch_set;
+	role_sw_desc.driver_data = path;
+	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
+	role_sw_desc.name = path->name;
+
+	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
+	if (IS_ERR(path->eud_sw)) {
+		usb_role_switch_put(path->controller_sw);
+		return dev_err_probe(chip->dev, PTR_ERR(path->eud_sw),
+				     "Failed to register EUD role switch for path %d\n", path_num);
+	}
+
+	ret = devm_add_action_or_reset(chip->dev, eud_path_role_switch_release, path);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -361,15 +434,6 @@ static int eud_probe(struct platform_device *pdev)
 	if (!chip->paths[0])
 		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
 
-	chip->role_sw = usb_role_switch_get(&pdev->dev);
-	if (IS_ERR(chip->role_sw))
-		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
-					"failed to get role switch\n");
-
-	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
-	if (ret)
-		return ret;
-
 	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
-- 
2.34.1


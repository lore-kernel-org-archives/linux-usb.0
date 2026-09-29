Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB162798F8
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 21:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717724; cv=none; b=IC5O7UjrfFeEI5yoMR4MKtUlbEzo5TlyZbprtxzEu9FmGAKGdB982cH3IcwMQYFb5s5G8IgZq1yfLyczd/5flWkvGv80Qjj0LUgO6gcdDJWRviM3PNj8gokSkUYpNEql4QZFLtLxiN5sJ8wyP3t9LHKpe1bBYGhNDfPw+8BGFa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717724; c=relaxed/simple;
	bh=5F7fqXoheI+nQtZUtZ2lGyPnKx0eff5fmA+5h4iYtLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I2B3ua12PHFg1ySZNFTsIOqGeG1VVSQKBecdwdflYEnH9q4tTrz7OcIQHmYKrmXUt0XJVAID4Uq16nnwvvbDDXaHevygPJJQVcl//AXbj2FNygslsG50DoFlrfQ0462RWrsw33o3K1DKZoqvV00n2izmV1wuWA/Z/1dkGH6kzI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QeF84HyT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJ2WGz4E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QeF84HyT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJ2WGz4E"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THTs8F826734
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 21:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iNTBdB7D+ki
	xYkp60HrocRPs7RXWgydmE5O05yA59CM=; b=QeF84HyTfJrF17WRN709rReMMMq
	WrPMB3pI0KM7RgBfa0eoRxAryfzy7uNtI6wNIYS7KVoR2TrUQKboTTj1pHlJk/Ze
	vUrQku/RT6JZ2IDAdLwrWP4O0hUeszrGFTRuhCHhSMJw0vrF2kcE9a7roI6drZ40
	711OXidwfdsZTf/+pPmQUJJXrNaNM//5I1r4nPwPzIeVrQYyxTNN/744U7v4G/YY
	oNDuoWGiIZYun+1hA5owcIzS0d09pFUqgeGYfa6MjGPUHJpQ5z99XrYySVcR6HS4
	7xpNhAdsIXuv2O92QLHHu8nN3yua1ITGO/VwBYVPC6gDza0iDBk/oIqLYMw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0hsh0x77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 21:35:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so9274160eec.1
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 14:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717720; x=1791322520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNTBdB7D+kixYkp60HrocRPs7RXWgydmE5O05yA59CM=;
        b=RJ2WGz4ErJXLuOdlrIm/FOm6NbBxrsvkXrJOEk9mlOgup4dS1SHkB9Y6CIxvsFi3tN
         fob2azMtVCBDxHcjvgZakYlPnvwpYO/oFj/1s55peLeSCSI1WA2fidVTAB4EnuF3SKey
         4i928GOoGko+6g7ezWpEPA2MEnqWjht4Q92m6U+Ip2ab1+xTHfXjpCBnXG+THx2qAcE0
         uxl5AaEej5anSAgYGuLN4lJqQPRgGWdb1/HzmON5em8a+LJRuoKp/F4hxd4KjjpUI7+4
         d5K03zoWT8qkGN8Ass7W3oIPZ1EZuReipg0uABwW8/QdKg0SKCcat6LgQvvykDH6q7f7
         LStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717720; x=1791322520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNTBdB7D+kixYkp60HrocRPs7RXWgydmE5O05yA59CM=;
        b=v/3EcG65qx3DqniC/3N678+7BOSYcOl6gAk7NCQ1+j8JP4ypon58lk6g8U56Ncc15Z
         InRlJ55Fzm07wz3ge9tX5uqnC7qOvwl16yAw/8rJjt6iYD56t8sZuiTsqKEhlC78KxBe
         doVn7KkQ+i0sGligvKmAYWzIVaOhdPx4xLv9MZMb2MmTwUJqag4zu8XHA0bmRQSMowYY
         h54uBy+y2FTq1i8YKZO1T0GsIF6sHZNNkmb07B+3bFCEL687u1N17j+FDXkaHNG2QUX3
         CwXQGzlGsfGK6ZwE2ge+KErtNWD/B3HoPw2ASatK6JC3egq0I+zjnHNtpbbh1FpDC2HA
         QG1w==
X-Forwarded-Encrypted: i=1; AKwUvBy8AD6ZTPG6ovMPEIF0KZPcn9iLDB6LXf46x7YD68TczlyN2O40Oy9CyTm8Bcb5aAfChSf3piWWbHg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgUMuv7B7rtvQ3dzezXJDNLQUUAlpJ37wPnVGt958oQYRHYOde
	RH3/+navAIn+v+AUrBhVWSpwgzR7avK0wBT+qalGE12V45iilfceHvw4zroOk1wSQeVJG2OyBt9
	zwnwOLpV4iwZTJ+D+94yDflyLIoYJ7acv1Rnzzzmhw1o5yTwLY0q3cgod7fDVSts=
X-Gm-Gg: AYBFou1obcte33KAeXkOJff3QTOpSsTLD9GUAJCHbLHS9AJ3L7SUtt2GKJ6fr+GewUT
	cI+S2Oj/q5nQ9ziM8euW1hNtksWXi+Zh603F2Zsrq6T8q5mGIyskvlVW8u/7W7OFrULuNRZ2sPf
	Um5o7DSi2DfiKkMcTsNoQEn96t9RJxk8NijymV1azsvtchTFydbElX6A0LNj1LsULxHBJAm9FIL
	IjB0l8N9azOc9KnjKIGHulb7KxFw7OBswIaVaPYHEPlWV6Q/RVhOQjwZkvYdqADE1AUfVO8+1B7
	ns/jNZcbK4jFlk2Ix6q7vkqs3zV+iJMjH3tDH7s/dqxokdBJPK/HvSQjyvXy84TCJrtPYtwwobO
	RJSXskVtOrjepnzZOcrHBvxbvalSNffCJLv2uReS0rniGA2eB7Xux
X-Received: by 2002:a05:7300:ae04:b0:33c:e61:e1e5 with SMTP id 5a478bee46e88-34c634268admr796022eec.21.1790717719880;
        Tue, 29 Sep 2026 14:35:19 -0700 (PDT)
X-Received: by 2002:a05:7300:ae04:b0:33c:e61:e1e5 with SMTP id 5a478bee46e88-34c634268admr795975eec.21.1790717719187;
        Tue, 29 Sep 2026 14:35:19 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:18 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v9 3/8] usb: misc: qcom_eud: add per-path High-Speed PHY control
Date: Tue, 29 Sep 2026 14:35:08 -0700
Message-Id: <20260929213513.2401005-4-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX8/ynct2lqsRX
 LOMzY1PJ7rxB/JACXzy9gAFQ1OkVC4ygdNkCcixW/QrYtlP1n1oGfPeVy/zE1kpnTW6spMwJIzi
 sx/M7AafLgrRTLFAYrWXEfogfu4DtffF5ccDbLvxjb5/PqU8QurnjYwXiThT2+Ym3xwcuISEumv
 4E1XttlyNAPJVbqDQFm/C5CO7tnnougHtvylfVrBFKsFEPByjj5LjXCyk5V5m8Z+4u4wSlXbi9T
 xoqo3G8iMV4+H9SLJif+wojPfE/PS7dd/Qg0uIpi1Za9b+2rEeNGxfaJFgZoRv6EJ+vN/ymGy5b
 H+5jHw2GvO0rN//u7EI65Ls8vVZryRGsHqPrA19io/1yX9u4ggZr2fTNPVBJDW1DJaPJ3jA+zug
 QlR1HDRoXQaV074epTt9Uy5Zj1w7MeDKqQlbEVwf96c7hn3yv8wa29NOZvIgT726tluoZ32Iywj
 BHxisQNay8m2lswgY4g==
X-Proofpoint-GUID: kay_iXs31r3rkElce4KkcjkK9k_kDy37
X-Proofpoint-ORIG-GUID: kay_iXs31r3rkElce4KkcjkK9k_kDy37
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX6SUy2B423T/I
 ciem3ltXIP0j2V9ZhQFPCT6PqUz6F4eaGWXerG439E350yokdaqgvk2R0DL7WtVI4tIR5OzO/Xh
 nSGBePpi+KEHL0drJaA4zLZDt8Anl78=
X-Authority-Analysis: v=2.4 cv=cZZHPXDM c=1 sm=1 tr=0 ts=6abc2f18 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OKkk4dbWoaB1VCfbt-4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290086

EUD hardware can support multiple High-Speed USB paths, each routed
through its own PHY. The active path is selected in hardware via the
EUD_PORT_SEL register. As a High-Speed hub, EUD requires access to
the High-Speed PHY associated with the active path. To support this
multi-path capability, the driver must manage PHY resources on a
per-path basis, ensuring that the PHY for the currently selected
path is properly initialized and powered.

This patch restructures the driver to implement per-path PHY management.
The driver now powers the appropriate PHY based on the selected and
enabled UTMI path, ensuring correct operation when EUD is enabled.

Historically, EUD appeared to work on single-path systems because the
USB controller kept the PHY initialized. However, EUD is designed to
operate independently of the USB controller and therefore requires
explicit PHY control for proper operation.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud |   3 +-
 drivers/usb/misc/qcom_eud.c                | 129 ++++++++++++++++++++-
 2 files changed, 130 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index fb927a003596..f20b82b5a38a 100644
--- a/Documentation/ABI/testing/sysfs-driver-eud
+++ b/Documentation/ABI/testing/sysfs-driver-eud
@@ -20,7 +20,8 @@ Description:
 		  primary   - Primary USB port
 		  secondary - Secondary USB port
 
-		Writing any other value returns -EINVAL.
+		Writing any other value returns -EINVAL. Writing a port
+		not supported on the current platform returns -EOPNOTSUPP.
 
 		The attribute is writable only while EUD is disabled.
 		Writing it while EUD is enabled returns -EBUSY. Reading
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index fa640e88c88b..a3afa3bb9348 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -11,6 +11,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
@@ -40,26 +42,84 @@ static const char * const eud_port_names[] = {
 	"secondary",
 };
 
+struct eud_path {
+	struct eud_chip		*chip;
+	struct phy		*phy;
+	u8			num;
+};
+
 struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
+	struct eud_path			*paths[EUD_MAX_PORTS];
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	bool				phy_enabled;
 	u8				port_idx;
 };
 
+static int eud_phy_enable(struct eud_chip *chip)
+{
+	struct phy *phy;
+	int ret;
+
+	if (chip->phy_enabled)
+		return 0;
+
+	phy = chip->paths[chip->port_idx]->phy;
+
+	ret = phy_init(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to initialize USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		return ret;
+	}
+
+	ret = phy_power_on(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to power on USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		phy_exit(phy);
+		return ret;
+	}
+
+	chip->phy_enabled = true;
+
+	return 0;
+}
+
+static void eud_phy_disable(struct eud_chip *chip)
+{
+	struct phy *phy;
+
+	if (!chip->phy_enabled)
+		return;
+
+	phy = chip->paths[chip->port_idx]->phy;
+
+	phy_power_off(phy);
+	phy_exit(phy);
+	chip->phy_enabled = false;
+}
+
 static int enable_eud(struct eud_chip *priv)
 {
 	int ret;
 
-	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	ret = eud_phy_enable(priv);
 	if (ret)
 		return ret;
 
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	if (ret) {
+		eud_phy_disable(priv);
+		return ret;
+	}
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
@@ -76,6 +136,8 @@ static int disable_eud(struct eud_chip *priv)
 		return ret;
 
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
+	eud_phy_disable(priv);
+
 	return 0;
 }
 
@@ -131,6 +193,10 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
 	if (port < 0)
 		return port;
 
+	/* Check if the corresponding path is available */
+	if (!chip->paths[port])
+		return -EOPNOTSUPP;
+
 	/* Port selection must be done before enabling EUD */
 	if (chip->enabled)
 		return -EBUSY;
@@ -228,8 +294,54 @@ static void eud_role_switch_release(void *data)
 	usb_role_switch_put(chip->role_sw);
 }
 
+static int eud_init_path(struct eud_chip *chip, struct device_node *np)
+{
+	struct device_node *controller_node;
+	struct eud_path *path;
+	u32 path_num;
+	int ret;
+
+	ret = of_property_read_u32(np, "reg", &path_num);
+	if (ret) {
+		/* Legacy DT uses 'ports' node without 'reg' property; treat as path 0 */
+		if (of_node_name_eq(np, "ports"))
+			path_num = 0;
+		else
+			return dev_err_probe(chip->dev, ret, "unexpected child node '%s'\n",
+					     np->name);
+	}
+
+	if (path_num >= EUD_MAX_PORTS)
+		return dev_err_probe(chip->dev, -EINVAL, "invalid path number: %u (max %d)\n",
+				     path_num, EUD_MAX_PORTS - 1);
+
+	path = devm_kzalloc(chip->dev, sizeof(*path), GFP_KERNEL);
+	if (!path)
+		return -ENOMEM;
+
+	path->chip = chip;
+	path->num = path_num;
+
+	controller_node = of_graph_get_remote_node(np, 0, -1);
+	if (!controller_node)
+		return dev_err_probe(chip->dev, -ENODEV,
+				     "failed to get controller node for path %u\n", path_num);
+
+	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
+	of_node_put(controller_node);
+
+	if (IS_ERR(path->phy))
+		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
+				     "failed to get PHY for path %d\n", path_num);
+
+	chip->paths[path_num] = path;
+
+	return 0;
+}
+
 static int eud_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct eud_chip *chip;
 	struct resource *res;
 	int ret;
@@ -258,7 +370,22 @@ static int eud_probe(struct platform_device *pdev)
 		return -ENODEV;
 	chip->mode_mgr = res->start;
 
+	for_each_child_of_node_scoped(np, child) {
+		ret = eud_init_path(chip, child);
+		if (ret)
+			return ret;
+	}
+
+	/* Primary path is mandatory. Secondary is optional */
+	if (!chip->paths[0])
+		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
+
 	chip->port_idx = readl(chip->base + EUD_REG_PORT_SEL) & EUD_PORT_SEL_MASK;
+	if (!chip->paths[chip->port_idx]) {
+		dev_info(chip->dev, "secondary path not available, falling back to primary\n");
+		chip->port_idx = 0;
+		writel(chip->port_idx, chip->base + EUD_REG_PORT_SEL);
+	}
 
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
-- 
2.34.1


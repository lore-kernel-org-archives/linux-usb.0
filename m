Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC1A3515FD
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 03:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726944; cv=none; b=bhBu4AWpzZBGH7Jpm/CWmVRm0HFOHNDISkOJ8w2k2UA8nLq/4Z/N8I1T/Mcz1MjoZPUoQ8l9IPSzfIGuldfoHmWhBjxii8cI8Lq6+o+Nu9Jul7bTV/fqEodFaQ8Uz/3ZfJWCRFZAPRUygCQ71e+wiIwqK0Ikm4FLkcU8qFflLaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726944; c=relaxed/simple;
	bh=cEqUL7LWmjZmV0f9R8kvoQt9d+i3M1jiw3JaTLMkrm4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lXSdE996rqAWYMKYyy/SphzxbR+2Q+mndbuftW9cJ2W/IXI6fp1RATiZzAIT43x14WOIbGDXIAU/K4LzIlTwwmbOpTVZ2kUfTCLhuw+LLl6g0WdsW9TyuQMyflv5EpmwMa9jdwdc5wCOf2fnBMqLPK+fx+VhOErZkBGWWZA+LI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bECTX9lg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oe6NL3Qk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bECTX9lg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oe6NL3Qk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LWPWK3961171
	for <linux-usb@vger.kernel.org>; Mon, 3 Aug 2026 03:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Vz/fmOrzqsS
	Ioh1iZe9GD60v7YN8pz9alATIH1yPiJU=; b=bECTX9lgg4HuA8/+0CQjY94oblL
	9hmhNvewisYTwi3kImbJzES1R2UYjMw4hkH/7sA6BN2TvK7CaasCQEnDy9ngwALq
	3+SwRksN/IGnjo802RXCpzbsSCeLTDysL6gVKEodCsmCsgNvijORGkM54xS4PP2M
	YNYH0UhvwkmIGaSyL9ruEJ3NTRfmYx13JLaEepA6epWGnPDmYOhiTVqtMptKoyrX
	tMpaddflRv8JmaRv8naGIuaNFhZNkANTEk2CWgqWqbWzExfm+LaXJKrmzeurD2V3
	LbyeewBG3pBTojZLdppM4LWBXeQthSBCjgUUqyIWk38zVcmVUPluWMYb5GA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fah2sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 03:15:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso3662377a12.0
        for <linux-usb@vger.kernel.org>; Sun, 02 Aug 2026 20:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726941; x=1786331741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vz/fmOrzqsSIoh1iZe9GD60v7YN8pz9alATIH1yPiJU=;
        b=Oe6NL3QkWjHGSQDOjbmXYeTd7lvIbqZne7eLQUKzZ4zuM6aFQJpjxAomAskpXDp60D
         jR8HhNKi3wUpWYu4iZiAxYo9mgQXMLseLrZlRzK5HExs1QqS6av0rGVFSaPGpzvdlO/m
         /7duYG5Com8nM7/hQPohbgDT+HE8x+0F8NlnyRRTRyWJxkP918EwjSioplmGrgqABk1u
         cTaWQeLPYiAKpeKO1T+nNKYcQzvoYdXStAR99ckz/IuCceQPXQvw5wwiFILqXZ4XCYnQ
         RondKMMrrGb6I1LKY82DbaDuAjWDoOcVFOB0L9ajLL9Gx5ouyY1j++NyooZwCESdQzrA
         WyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726941; x=1786331741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vz/fmOrzqsSIoh1iZe9GD60v7YN8pz9alATIH1yPiJU=;
        b=Di8vIYWvhhKlDTkzN1fbk0fqJ+C3CvuM+6XUoV8R1doDvKVEkHAl99TEvN37xtCW/b
         C4rCJFj+m7ECTWde/nOJk5ysybQX285nRg0hZICERp8NsWLuJctlosfGqT4wR4ttKb/L
         BA9JDvSVCBL8pEI1hZ1YztoPJF5M2oT0v0F6JVwB6keL8iKi7RqE4Tm4n85JnDdX0/3V
         PxEmHgQy+rfhDmV+PgX/xVO1eJOlSsrNre+KLGm/hxhSwvCvfL0wguQdzWmpLLiYC7Jw
         ChDreYBb134RYTKFf2iSGyd+SPWZuX8mRE368/6AqBP6Pucn1YJcU9HDaYJc3a6QATiv
         h/AQ==
X-Forwarded-Encrypted: i=1; AHgh+RphNEGcZTxecnvf3ipP7ydUMFmIbW+yd6XbdYITYxk77m+sQ2lCyRDjD1a4rLeZcoKl+J5TICe6pdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuZoZreVflCHVMulVxoPlHh40qenWglaLjS06Orx3eK06yILG4
	kZHpe1eQdHACj3dsx/sZulDGiC21DJrouONYntvh0bpL2f7AnGdE0k5o0GaOpiNx9P+cfwTR7h4
	MdiYMmTFz9HgDL5Sp+5HsteWUMiGXHUvIjieD9JnXIQ+nzW6LQe+G3LH3e/pvg98=
X-Gm-Gg: AR+sD10wXWUDmz54BcpNopbT7Ozpj0wucEiV0eSum3tE4m69D3R6B6SsZNuk/SmB7PY
	OdRIb6Fq+Cjti2R6Uh9zZRBLjtkj14t1wK9lY85wlfiUfhGgbMOB0XfVRz1FyOe0hLSeXhSMz/r
	ONbKpMZ/WioA/xskg6+eALCpASbV9LyqOaxPk/VJSc7TrlF8fq8+Q0ojWYXssaQpqodHcwVIoFT
	kYzhlK9nTex1mRYM8p/UBQ204WnDU+LEqJt65x8Eh+TLy7tZCIgrAYJEWlA9da7wDTsTMhEC3zW
	EfopS5HsV1UVlgOxrYgaNa343FHGoeT71UdrSqn0ZMazzJ9NTkbZrxROrIXH+fnVvB20+Mg3PAU
	nxECPK5qEN6ANII3Jyf9vN8UAWQ6C7EjDO38oj4CIMHSDPb89n+jm9g==
X-Received: by 2002:a05:6a20:430b:b0:3c3:aabb:dba3 with SMTP id adf61e73a8af0-3c92a99383emr8606416637.76.1785726940954;
        Sun, 02 Aug 2026 20:15:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:430b:b0:3c3:aabb:dba3 with SMTP id adf61e73a8af0-3c92a99383emr8606386637.76.1785726940509;
        Sun, 02 Aug 2026 20:15:40 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:39 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/9] usb: misc: qcom_eud: add per-path role switch support
Date: Sun,  2 Aug 2026 20:15:29 -0700
Message-Id: <20260803031534.2942628-5-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a7007dd cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=40BmpV7J9y7yzTAaPrUA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: zXL75DMkO1ychzXtterYT929hEk1-Qsm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfXzQTeIyMFOd6W
 pa0ocvecXifAELwXGYw47FQ1CqI7V80woWVpTL2XYlUu4FoxPKu71Q5uGRnwpe3kV94i2tFrkeg
 udBBOfG3N/eC7zl8rRctgwdlvRr0tZs=
X-Proofpoint-ORIG-GUID: zXL75DMkO1ychzXtterYT929hEk1-Qsm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX5IkUjY+sQoAz
 E8I/r8TMoeGaLmILSTdn/1TRdTU7sWTBTk7bep6xcVE7zk0riKOSlj2gp64d0Fqi9D5FhxyWSSR
 5/qe51TSWQScv/5G0EzcMBkqZBT8Yif0rVQCSX4Uue9F5GNkouP1MHsyA6On7A9GMzNHUOdsu0c
 36zJrvTOfWBmcp4GNPy9qQd65j4cZ0pJUUMTc10thVqNjVeDDBirKfWwt6IVQhj00wTbQNuDx4r
 n7ESOBba5XRGxTxw8Aqzz1iMsVr+aR4oN+qKdRwb29C5BAv7r3yz73cjfw9BqA34iusMfcl9mmd
 yZCdSAgLStKmmkAsidDnHx/ofROp7NFnQ21OC3BTzDUTukRI2x1GkOi65NTUXmf12MUokuf6/M8
 Yi1qszai2WhekGjGz91odR/4kbfwYL+QqruUqb7oNDzSAZg9wiivoQfIdZaC/wbowkl2qK8X5po
 CWZ/yRkJEY0i/Vr3reg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030024

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

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 100 +++++++++++++++++++++++++++++-------
 1 file changed, 81 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 03d1c200658c..48a4441b0c9c 100644
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
 
@@ -327,14 +355,57 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
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
+	if (!strcmp(dr_mode, "host"))
+		path->curr_role = USB_ROLE_HOST;
+	else if (!strcmp(dr_mode, "peripheral"))
+		path->curr_role = USB_ROLE_DEVICE;
+	else
+		path->curr_role = USB_ROLE_NONE;
+
+	/* No role switch needed for fixed role controllers */
+	if (path->curr_role != USB_ROLE_NONE) {
+		of_node_put(controller_node);
+		return 0;
+	}
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
 
@@ -361,15 +432,6 @@ static int eud_probe(struct platform_device *pdev)
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


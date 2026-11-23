Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458536;
	b=Cb3I/qfPxPO7QoAgBJiwtLNIkIZkmvqY9JLDjF7disCmEGqsL82JqQHvYX9c9LytQy7i
	 K75SI4zzJIZSOmtCV8JxxZjN1+lwLK9GBQaf7ZZzlcFw+3+B5KFmQsf1SdhZ5UOz08Ihr
	 axAFtLKotkMAE7uYjSmImfzD8v6P0M4Nd5SDIfjh4/kRB3UA/1ikm0qxTyt37PsuAif1/
	 7STbjbvAa3IXVSTPmxcfBSRy0nZ9G3/DOeVPogL5JY7Qrq20trGXb0avONs8AX1mXUplE
	 5Qd0l3DAN8I4O2mXKUxeHkyVv3zSStK690S4BsREw2ZKaC4gPdzNrZtcXWgyBBGZoCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aa7OB9HEV8D+Gu4UfkUF0JaU4DkwJz3OCjuYsIDpC3s=;
	b=W5ymRJLmQ28QETR/uTGwcs+9b2sP+yh2v7+s3wTiRtxEKYkGTVGe/C1BldNe3zp4abTQ
	 mTX15nvEysYfuWyGW5gAM1uyPO+FOTruHx0GMEubSUkBkX1tnDInsGYNFYCC2rijRlY4Z
	 yS0rY7vjuFN8e7W/gw9cXrfMd3B4hK2PGqW27JuNnjQaWJTgHiUhRoF3t1+RdJWWMUVbP
	 kiNe2nFjL5zhvpnnzt3KICdwhQHwMlsYWoqqi59J9WtSK9s/+BJCBs/DcAXQPZ3+1i/ew
	 kCChlMyKz4LM55UHsdUy4DM8mE/2bKfATo5OwDzrd00D/RtCx2Ex76fXTcRg/9XP4FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+1jT3ii;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QppwnUDk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7C460A260A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B7C460A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+1jT3ii;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QppwnUDk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGt2n2340262
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aa7OB9HEV8D
	+Gu4UfkUF0JaU4DkwJz3OCjuYsIDpC3s=; b=D+1jT3iifaVHiQAkCPuNCBnVaZq
	K+khS3asIjvpXDEoJ38583Pwk491KA9v9PPudCxmYkC+mW+A2kqgVxme3FF24dB5
	ZBFtpbl3bUGvdaPs+9Kx/FWN14xll1nUHTQIyqFVIXiNeaQijkmrY9XfbD6KW/mN
	mwQ2qqPZwy9S1Dig4i0cJNHxbDmySlBm9bq2G7/Toty4q8JAJQasNIBxyl6oaKln
	lMotTdxigcmspQ87TUr3LhvNV9xJvdsnBjlTthXBE5m7DUx5mCdM+DDIof2TmTze
	y8whsIbfQ2aEEQQyFwIBDfwJA6Vlo4FURGyPPbc2m/jjXtI0dOYE0Q4cVGA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx321q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386177b0516so9766235eec.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458534; x=1796063334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aa7OB9HEV8D+Gu4UfkUF0JaU4DkwJz3OCjuYsIDpC3s=;
        b=QppwnUDkS5f9AEL5lm6M5g+/YJjmA/eLFTUzaRAztqRRUUPYPJHggUSkaZJza/cG9I
         P2pNwYAnTRIDOD/W6R+4lP5uUMANaIjoxwePuRjZFMi2AREN+rVh2Sktb48KyzaGbn1q
         fMFB1+OuwODfdEMEhuLCjq4md1yxG26GFzB6HPSR6GzdCv84XK8045tSTbDD+Lduv0bP
         LxasFJGQWPuHSkmU957TbwrIwief1q/fjcew8qnl3qkGLNVC0aOK9UIn0W1DlqnkIUPY
         SqH6KuWd/C0pvJaSd6hDb1dhXWjlwyOJ0sVA7LQIpEV08APGQYr95F7UAz1jZqQjT6mI
         IAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458534; x=1796063334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aa7OB9HEV8D+Gu4UfkUF0JaU4DkwJz3OCjuYsIDpC3s=;
        b=oJmCeTQ/x5k3wyQIRl7NzP5sfxk0RutsaySnJFZ1NHVWFJsnO5J0+h86s0OBay83G6
         nsn0sn/RxdpQJPX1To5ZucVbMQhrgNiSaTa2TB6LMbJnRVS1A+Ky2N8ork4OiJEnrkd+
         iuu3SMb0Ei/tEs5cZcqilEDHFqWtZruIuhHcq6Myz+0Dv7MTax2xmmWb+j2V4Z6PckXO
         NIsel20FrW57kiVEB02hEpEnQmXtt90gAR39V+9ZlY8YAtARZme+2mQIt8n2ev0QfwYK
         UtpUh9tEbPWsuqDXqf2CSqG9RmN+WQQPSrv/DzC/6UE/JtjQYi8ht3B4APGtukdkSOBk
         dy2w==
X-Forwarded-Encrypted: i=1; AL+hErEMjKT0huEa+VwS0gYBbbx4Cm8uuDxmw+shyTDnXfm+ZCEnr3vqFTKJhj4Wq8WWBNa0dcRi3u6Q+4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sykzLkfOPR6vcajjtcA5aJSna1iwn0Fr9U9e19/4r/20mIzEt
	Mf7Hma32tYnKC81iA1o75YOVIN1mKU9w/fL0ox9678eSiwzltCxAPp4iiCza66+SQZNJTA4yGmI
	WCDNMbKBBYeZ+uxoah/zlNMWxfjWzxUB4+KzHyPA2G7TYEVjx8+uMUKb33L+P0ks=
X-Gm-Gg: AZFdTZfSD6tPgIuaDD5Dzt6CwFLfaEQA4dXj/eExzeS1wGZqqWPf3ZvVqDmRc3JTfQ7
	y+7mOBCY/b2+CC+Vr5lntyADUrxsCSjxviUNRMiCQn0+BZthhoccEBACU9aPy0QoE28sx4ZHxfv
	isIF9hVY+XthqBF+lF2Ugsph+HfB3fgJkx0Gtuwes1KZMhcOI4yxH8qyE+4Ob5VF+K5CIB1xscd
	yhcGLtfULfgq7u9mPNu8FUZ0n2Pz1HyfA5AY48dy5t7bpPLHNhY6DjuahRvNC1eVonOwl+XvxRz
	POcx6bo5CjAQFKKI2uO48Zk301GOTzMgjATQGFH6Jj9ZSy/uHE9iD4FhBsRBUYOTvEPFI4d1RtT
	MhyrbRtXwCwSSKX2ty7dM+8g51ml0+gzFRDUTK6Wt3+h/zuhs3IhgFxyvtlxZFGS31xYy8fMYPE
	MwbZJyse1HGgUbqz2qYtBo/cKG+Q==
X-Received: by 2002:a05:7300:ce11:b0:381:a037:b060 with SMTP id 5a478bee46e88-3856e63b3dfmr13527199eec.9.1795458534278;
        Mon, 23 Nov 2026 10:28:54 -0800 (PST)
X-Received: by 2002:a05:7300:ce11:b0:381:a037:b060 with SMTP id 5a478bee46e88-3856e63b3dfmr13527176eec.9.1795458533724;
        Mon, 23 Nov 2026 10:28:53 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:53 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v10 4/7] usb: misc: qcom_eud: add per-path role switch support
Date: Mon, 23 Nov 2026 10:28:44 -0800
Message-Id: <20261123182847.143892-5-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b0485e6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KEXfGuhMotGc95kIUyEA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: -l47Ql8tF8GG84v6_lO0TJmP8vDJoW4J
X-Proofpoint-GUID: -l47Ql8tF8GG84v6_lO0TJmP8vDJoW4J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX9r3ysnY1m/+g
 h9djeTMVM5OvG4HNqQ+CuUs8LHjhPrev1LIBj+zqzVykC1qz7OuiWbiIA62xBF7kSusFmj5sOp2
 O9r7w+K4cAz9SKfgJvBJLnr86XH830A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfXxYfXbGHergEW
 vIuvYh4RGCj9iylO5uyCncig/4dg4+B/FCk1cJ2SLuTxeEnt03ZCGi5h3Qy4l+AM7GJZqhk5yQZ
 t5X0xPdq2x2ptsMw4V1+jsEdujfE39xe6m4M29CapcvWAuBy7u1tyCAN9Z1hfWerB561f4klrit
 aauCHdYzjE6l3fK3FE2QLhX/x09Yh0cN0NdeBZgKVzdre+1lzOgmysHIIN3D6m4vYJ31hiIOhY7
 ADSJ9LrPM8AUxHDMQhBdHMx1yWNQa0fWrKjisWwoRUCnAMrkMaN2TRnh1HujP9O97eHM/tgKSyT
 dvdTU44I3AzhBblyMhBOTZYzOqXBiMfrxJYA1bktwkDFxiYYjMm2fLebnH/1evbP75CjgQ9YGMu
 x14QD5ItoX9DnKlzceWYcL5msIpmNo8meyzw46LD75iXoH+joDu1ft2KJAbuTE/K/YzXrEmmkli
 ofqetPXzJUZyALxD6mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230073

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
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 107 +++++++++++++++++++++++++++++-------
 1 file changed, 88 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 037b074318a5..2304402fc90d 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -45,12 +45,16 @@ static const char * const eud_port_names[] = {
 struct eud_path {
 	struct eud_chip		*chip;
 	struct phy		*phy;
+	struct usb_role_switch	*controller_sw;
+	struct usb_role_switch	*eud_sw;
+	struct device_node	*np;
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
@@ -124,7 +128,7 @@ static int enable_eud(struct eud_chip *priv)
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
 
-	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
+	return 0;
 }
 
 static int disable_eud(struct eud_chip *priv)
@@ -271,12 +275,15 @@ static irqreturn_t handle_eud_irq(int irq, void *data)
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
 
@@ -287,17 +294,41 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void eud_role_switch_release(void *data)
+static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
-	struct eud_chip *chip = data;
+	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	int ret;
+
+	/* curr_role tracks the role from EUD's point of view */
+	path->curr_role = role;
+
+	/* Forward the role request to the USB controller */
+	ret = usb_role_switch_set_role(path->controller_sw, role);
+	if (ret) {
+		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
+			usb_role_string(role), path->num, ret);
+		return ret;
+	}
 
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
+	of_node_put(path->np);
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
 
@@ -328,14 +359,61 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
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
+	path->np = of_node_get(np);
+	role_sw_desc.fwnode = of_fwnode_handle(path->np);
+	role_sw_desc.set = eud_role_switch_set;
+	role_sw_desc.driver_data = path;
+	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
+	role_sw_desc.name = path->name;
+
+	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
+	if (IS_ERR(path->eud_sw)) {
+		usb_role_switch_put(path->controller_sw);
+		of_node_put(path->np);
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
 
@@ -352,15 +430,6 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
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


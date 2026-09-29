Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838984FECC4
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 21:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717730; cv=none; b=fx+4LO3cZRAfVjTr+Uehx3izswrBtGdeiIP/PbsED3SEmTUp1v6M1KtOUDSr4uv01cPnSbl+NuADZk6ETApddkJKtJe1nxMF4p6p97Ej/Qn51C0PuG0TLx4a3OM91qXrHyCStJMKcxSeVT1DS3px0gsB/8F3RD/hqV6R3YobIBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717730; c=relaxed/simple;
	bh=N4mHNfsnlyveA0/4qNZh7sd+pIptRFkHByxL8A5CUFI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KkLEa9D4iCO1zXxqJAqMm92stPzv/zee0QFmyZOcDedECvMkk91UE+pp224ZswyNDHWKGXVYxv5EMaN/2vEa+po44C4Fgj/qzzBVozXOuIGZo5Q84XJg5f2dEt1haL58vOm2uY2mZ2h39bbySftv6DnQiK4Om0goT6bK4qfIaGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5qihwiz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bH+fH+vG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5qihwiz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bH+fH+vG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TI3uto1725168
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 21:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y5woa8COobc
	bxZAHY254heLz5elKvaTjIHSo9KyCdzM=; b=E5qihwizlF09QVi1hoGCSitpd2J
	IGCDxP0EN+XkkWIkW/xb2PV8S1a1P1XmAP7GqEbza3tN/KzpuxP71qW+BH0Uf467
	nQJ5/Ui6mc3eiNCYPzTvUDa5+w/3T6FQhgd7FCwBkpYqHKAKH+T6+vFafTrkGGKn
	VNz7lcG437XwOPvl5Eg39wqC7TtvLsRd9yR89oZTA4SoIkqymUId8m6T/Ag9MZh3
	XJACjiWk0qemyCT6ji+PphJRo1Sr5AXZ9imInQjonOmeDEs83fKVqeBc7G1eM3Wo
	HTDAVSQ/HDNJtQ0dmQlmB8yOKh15Kj/kM2cRfspz0yEdCW9m+JjynvnuwIA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97rstc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 21:35:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34318e88ba2so3599446eec.1
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 14:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717724; x=1791322524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5woa8COobcbxZAHY254heLz5elKvaTjIHSo9KyCdzM=;
        b=bH+fH+vGZtwWJ8MJ7xGBbPrmDJ/cMBwLrgF0Ou8IRr0rwPjkVcztxeTQijnF7iUplQ
         +13n9P5kHRpDTx6TCfzeplmxcepqpc0jtbCFK5lMX3g+qR6OuiNbqHhwZinSJ/BowLY6
         E/X+ZaEFEVyVn/oNDqSA9XvHWBzWjRMvXdcejEOLxDWJZ6GnymznyhJXI4Qk1IwIYEPT
         7BmqzbSKP0gJlP2M+i/y9xAAl0J82LjrafiM6imWDWY4xM37Akdjdg2Nl2kGezenuxtB
         u+W5HLbQoWzEnL7/Sbu5volo3smXhcKqYuLqUcVPCyAysUosMhNwtbkKpBnxAUjK2fbp
         SFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717724; x=1791322524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5woa8COobcbxZAHY254heLz5elKvaTjIHSo9KyCdzM=;
        b=vEU6xM1KJc0wzZG3gDY1zXnH9nVjTvL19y5XVu6cWpge1zozoqBY7B4oltNE4I8tyE
         RJbYU1KKUtFcuKq1U/jb/Vpa8qH0EtiuS78U31nbTXZZ99OPLOGDuSKyz2/aow43DFjE
         bpKBtkzSuUC+VNMsU8zSMFdKO/bYDC6OOflopRFFK362FCm2/sa+tnUQQdydesIjj9Hg
         j5TnI306r8Gm1+Xug15Z3kfDrC5HzQUiQ4vpVmhDcU/xxL9hrVAi9HjUnGfMDWlb9+KA
         VStogjpDtK4jZs//ot4J7ZDbu22nipTdHBTWBku7K0HNm6wxR1LHeXsBSZLHT5PJS2XM
         L0HQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaW+zzwuMNI47obvk6HnMBRRidF8e9562CausK1yDSfka3bzko250BezzJizy9Utq3RLn3yTpNKw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdBb8mgXJ07sADJE04XTPNCX5huqc3NdNwLhhBr2Q3savR1blU
	e/jIYbiYy2ocnR4kxD9gV6plu1/UHt4Kfq4BVEyd7x34286jj+1rCzaFI2ANv7RJ0b0/RYc++TC
	TH8ocSCPDVs0V8ijR9dONRG7+99Notr1CNwaHejJ25p7OHKSGUFxAaAuW2eIxsZgWpXqQ/rc=
X-Gm-Gg: AYBFou1meOt5aN23RkozeAVoNn4nexWmKZMo1ztENGyHPkDgS2YVSPlthu8Eh9t+dE7
	tFGuIhARBcDp8pxdV9jxQ/djh+Q6s8vnKdqkFvdHO9pkVC/4qqj1zvfna3DYk7m7ybExMjOeMkq
	6WYdflk5DSrS0IR91B2Ikn6UOZg9AITvetLvZ++GEhe7tEoH6zmADCy14AWhI2BoJJyHfRd5xgo
	OGtg1XSrQxG0+ZtrVDl2Y6cDGoI9IxRcC8ppR47ewaEjMuFOverLqa/P65JYmJUDHpZqigScK+X
	5w5cLP9YmlDdrojfyFVKb/FB6IOQ1/zin/rlTd8fzHWDrZLHpKWApjWHwPR0s8kwveWvu6KpdJH
	EIafhvLD3+K19M0KEkiqd2di0skUKajAzNcdPlUe8gvOP61fRz1RC
X-Received: by 2002:a05:7300:b08a:b0:328:3944:ee53 with SMTP id 5a478bee46e88-34c63321e69mr739466eec.2.1790717724052;
        Tue, 29 Sep 2026 14:35:24 -0700 (PDT)
X-Received: by 2002:a05:7300:b08a:b0:328:3944:ee53 with SMTP id 5a478bee46e88-34c63321e69mr739409eec.2.1790717723065;
        Tue, 29 Sep 2026 14:35:23 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:22 -0700 (PDT)
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
Subject: [PATCH v9 6/8] usb: misc: qcom_eud: add role-based EUD control
Date: Tue, 29 Sep 2026 14:35:11 -0700
Message-Id: <20260929213513.2401005-7-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-GUID: HaC5Y4zqvCxmOueXHXEy1nfD1D9BhzD8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX3AkIFX6B2I4H
 KLthXTSXB2rxbe56n/xWtxAfp1hWvyJSHXHbIKRtrfe8oZHJF2kfS2OSYXW8Y2nWPwLgHLKaGoP
 wqFe2JZquL1hZ/JymTkuXuIB20RouMu7ujXl5oxV28GkraBB/vaO1kZ7xTCyeh+9gE6cY49z9ck
 dyeZxvAoUK9Ly6AwPZVSJTN1dHdbIGSDeQcOFA7MPuU1P/5wJDpl6+aFQ5N9FPH0G0yOwkb7Pu8
 FNuyND33YStlhUZduu3UGjyA9Qf3oIUhsqad7oIA7d7gtyd/2FhPTBS/UHyzsJC9B28FHAm9cvp
 TnLWEYJbW8ec1DcaADZ/0AvOqW27lsXqBXfaZdnOST/lXMCrz01UyNnSDMNnK+uzDb8/69S45+t
 9issZr5+1TrWfe7fJjqDttIUXQaCLc5g6i+mV5/Z7F0vI8jVeJmwCu7n53XZxzWGUmXuklqSZzC
 qGU+FJbJicWISBPDJuA==
X-Proofpoint-ORIG-GUID: HaC5Y4zqvCxmOueXHXEy1nfD1D9BhzD8
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abc2f1d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YKK-c5bBAu3nLoGgrlsA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfXwjnfPtmqR1ej
 LPc/JZtiDfq3q5jGI8qLVF9l6oZ4RmK1vlT9Q9xUYglifAAnBjRT4cvoXQuGcnTiOD2s7lnc4Bz
 uOhAkk34R436v+xrLr5oMj8mhAjLGxw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290086

EUD functions by presenting itself as a USB device to the host PC and is
therefore only applicable when the port operates in device role. Keeping
EUD enabled in other roles provides no benefit and unnecessarily keeps
the associated PHY resources enabled. Furthermore, enabling EUD in host
role can cause the USB controller to misbehave because the EUD hub
supports only a single upstream-facing port.

Address this by treating EUD as usable only in device role. The
role-switch callback enables or disables EUD as the port enters or
leaves device role. A sysfs enable request made outside device role is
recorded and honored when the port subsequently switches to device role.
Additionally, synchronize EUD state management across different paths to
avoid races and maintain consistent hardware state.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 70 ++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index e227d05cfecd..5a21a2dd0b0c 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -15,6 +15,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include <linux/usb/role.h>
 #include <linux/firmware/qcom/qcom_scm.h>
@@ -57,6 +58,8 @@ struct eud_chip {
 	struct device			*dev;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
+	/* serializes EUD control operations */
+	struct mutex			state_lock;
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
@@ -158,17 +161,33 @@ static ssize_t enable_store(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct eud_chip *chip = dev_get_drvdata(dev);
+	struct eud_path *path;
 	bool enable;
 	int ret;
 
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	guard(mutex)(&chip->state_lock);
+
 	/* Skip operation if already in desired state */
 	if (chip->enabled == enable)
 		return count;
 
 	if (enable) {
+		path = chip->paths[chip->port_idx];
+
+		/*
+		 * If not yet in device role, honor the userspace request and defer
+		 * EUD enablement until the port transitions to device role in the
+		 * set_role callback.
+		 */
+		if (path->curr_role != USB_ROLE_DEVICE) {
+			dev_info(chip->dev, "Deferring EUD enable until port enters device mode\n");
+			chip->enabled = enable;
+			return count;
+		}
+
 		ret = enable_eud(chip);
 		if (ret) {
 			dev_err(chip->dev, "failed to enable eud\n");
@@ -206,6 +225,8 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
 	if (port < 0)
 		return port;
 
+	guard(mutex)(&chip->state_lock);
+
 	/* Check if the corresponding path is available */
 	if (!chip->paths[port])
 		return -EOPNOTSUPP;
@@ -287,14 +308,18 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	struct eud_path *path;
 	int ret;
 
+	guard(mutex)(&chip->state_lock);
+
 	path = chip->paths[chip->port_idx];
 
-	if (chip->usb_attached)
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
-	else
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
-	if (ret)
-		dev_err(chip->dev, "failed to set role switch\n");
+	if (chip->enabled && path->curr_role == USB_ROLE_DEVICE) {
+		if (chip->usb_attached)
+			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
+		else
+			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+		if (ret)
+			dev_err(chip->dev, "failed to set role switch\n");
+	}
 
 	/* set and clear vbus_int_clr[0] to clear interrupt */
 	writel(BIT(0), chip->base + EUD_REG_VBUS_INT_CLR);
@@ -306,7 +331,30 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
 	struct eud_path *path = usb_role_switch_get_drvdata(sw);
-	int ret;
+	struct eud_chip *chip = path->chip;
+	int ret = 0;
+
+	guard(mutex)(&chip->state_lock);
+
+	/*
+	 * EUD is usable only in device role. Power it down for every other
+	 * role to avoid keeping an unusable module 'ON'. chip->enabled
+	 * preserves user's sysfs configuration and is not modified across
+	 * role transitions.
+	 */
+	if (chip->enabled && path->num == chip->port_idx && role != path->curr_role) {
+		if (role == USB_ROLE_DEVICE)
+			ret = enable_eud(chip);
+		else if (path->curr_role == USB_ROLE_DEVICE)
+			ret = disable_eud(chip);
+
+		if (ret) {
+			dev_err(chip->dev, "failed to %s EUD for role %s: %d\n",
+				str_enable_disable(role == USB_ROLE_DEVICE),
+				usb_role_string(role), ret);
+			return ret;
+		}
+	}
 
 	/* curr_role tracks the role from EUD's point of view */
 	path->curr_role = role;
@@ -439,6 +487,8 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	mutex_init(&chip->state_lock);
+
 	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
@@ -485,8 +535,12 @@ static void eud_remove(struct platform_device *pdev)
 {
 	struct eud_chip *chip = platform_get_drvdata(pdev);
 
-	if (chip->enabled)
+	mutex_lock(&chip->state_lock);
+	if (chip->enabled) {
 		disable_eud(chip);
+		chip->enabled = false;
+	}
+	mutex_unlock(&chip->state_lock);
 
 	device_init_wakeup(&pdev->dev, false);
 	disable_irq_wake(chip->irq);
-- 
2.34.1


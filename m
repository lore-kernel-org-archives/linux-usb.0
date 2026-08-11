Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7255A47DD4F
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484183; cv=none; b=GXxiJPbqD9ChLtWrkD7y2rO8xT6nTcek2axXUilLyOnLI5iMRrmdYRr511gXRmHy007dbn9r97DN3c3uGOsLHpp+Hj9run1VRLZGt/CGzHnfR+okf1tueoJNfbEnP07qaCu3OoU+CoQcCEzIJ0a3ITJ7SkmkMo4zMposj6F2RrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484183; c=relaxed/simple;
	bh=5Mm/8OCSUUeiOPtEdVdedojwWX3e0j0B4fBaJRk0iT0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=luB//53ISQwuNrA0jssUBkUb5K96FbZVx5DYxno9bcMSZuvX76gF2j0eK4C8uX2whXTMu6RlpSmJCqg4YxWL1+wVKpe31m5wC53+cVfJ14bQ36ueKsD8IgvxO97Y5SqLXY/xwcTH0LDRhX6N4XWL4GRpi4ZACO8PY07b244w5/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5ApUtKA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SvTv0old; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5ApUtKA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvTv0old"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLQONx1520553
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Du0qQhW7XcX
	nwXOV5Ggqm/JiThDiZ9c3EHZ/YQFFZDY=; b=C5ApUtKAim4Vl8IEsdkw8bDmhaZ
	rGfXEsaZv4WHV9KE0wQ5WFA6bp3GfY693oE/NtJDdO2gN0+7qHA58W4SUhjot48S
	BfurbVKNQSQzND1haQjVbb2MI8/iwAen4cswwZXAdQnFDL+XX63LbQ2X5LUPcr1X
	RtZSpM37tozv6H0amy+d627EWHndgHKZptXADkdIQXnT+GUQEaNsCliQok5N5zOp
	ITq1HDFT9IiTp7a49sj3UYjcCHHJ1GnM50EL3Cz7JHSKB9iionpTuwZY/BeCnYuI
	vAJfxy1iCtXPTgGXSDubuFDcQ8o8knxbIUJX8W3WzblvFZ2E2rQzWKoMTsA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049mj612-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:36:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so511749a91.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 14:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786484179; x=1787088979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Du0qQhW7XcXnwXOV5Ggqm/JiThDiZ9c3EHZ/YQFFZDY=;
        b=SvTv0oldhUUFEWj6LlBn7ydKZcJyzR7cXU/NPH20QFPc0WTTGicA1Xm450ClVRZmYw
         RlPkF9wVadMPpT8M5ItxKnyoqJiZ5V/O5PQXStB9cqBde4gxOA9HUjomuBeuqQwGunDl
         iqN1BsHzUxsJ+LHym7XV5vYPOmYLMozBEiI+YE/e9AC4nYVADKYm6J1BwBW+bli42ehA
         ucwnJhFyFlstaYytUcH+Oy8JH1fJkndZXJhsg2ZF8+rDbv+ya7GgZd9t290JOE6mo3sr
         F3aPnxjdeihA2RdCdX2rp3osP5biMQ3ZaKSMjOQZM8hrxCrqZGiz0oXqYxzdq6uoexuo
         lNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484179; x=1787088979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Du0qQhW7XcXnwXOV5Ggqm/JiThDiZ9c3EHZ/YQFFZDY=;
        b=OleaMPQ8h8cIz7vo8rgjAZ299VU21Xcq0UjZyCIjXP84u7NhO/DJBYNF0BZjR5VwEs
         A+OqVMzN8RtEUA37tiNsf0LpW/tS9qrfrN/MOpJ6XUicHn4bCWC/SGEahW+BK/E9y/aY
         2repCPVduPHqVw3NPp6uWuHgsgHe0IFp0ILNBB7JcyyVeuHARtixkOU7Hto66oBfK/SL
         GX1+A1gKb/zPj0i/7D0vMTbjrlIptPBq/agQkgUY9Bg5qCQW1A9hcJXRqEvzhn8jtNjh
         CGhk6NEUnzWb9X4KW3SZ5zfgqUGXc0bSH9JwrHobPAMkIr6WgHCMKODw1uXawlehaRVb
         D86A==
X-Forwarded-Encrypted: i=1; AHgh+Rok4DqOVeTl2goNz+h1kO47b0L+YNgesswK1qnynjLKyn5k2f/b6vLrnmJ+LLwGXmExvI8IS5SbR3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAbWfP0tNFIaYq9ryZaq5qjllQKFIFKAb6v9xUkncEb+89br0F
	D+EvPBOMI7RcHmCBnAJdX3HkiGALuzz9LqdG76LpQr8g0328upxokWOZSQriG+3zwMVgNmEqcCK
	i/pEABB4LJbhQuVf4z12L0uEttPGsy/1lb+kcoXoqMyQbu7WD5kjEKvoAR5i8Cuc=
X-Gm-Gg: AR+sD13jYTy11fcEe2qfrY/3V3JjrLCU4NoZZNc26Yj21An/r65Mw8rE7SjmGgIU1D5
	K741rZaRw+rZwwLIw+itV0LELYcL6wewlVZxMOaWx2Nf8pHlxWKjNtkkG0JbHe38YmlyJb1MLfU
	hZZnlE0g4Q24wtCS1f5Mb6BGj0UXYL5TZJ+B02+mXWOcLXc33LSpiVQ6FcNh3sPnnjH9Rm7vI3e
	cSV1S+6X4ke1J5eJJ+e8mH0bLatm5qvTuMfcsyjY1i8wcvSf1OncMY3RPXv1CaZSTkfj+K3zyNP
	uEYm99hv4U9ufWqlKV/7PCr0JqIBnuCSlTk0aHy2y0/NuTk0a89xfAhE2Twxk66TPD41CcjAgxp
	AGtFHM9bNDVV7g2fBHabLONuldCMH3OWN1PmZamNIdn3U6k4fv9Fo0A==
X-Received: by 2002:a17:90b:48c7:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39301410288mr44764a91.14.1786484179157;
        Tue, 11 Aug 2026 14:36:19 -0700 (PDT)
X-Received: by 2002:a17:90b:48c7:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39301410288mr44717a91.14.1786484178634;
        Tue, 11 Aug 2026 14:36:18 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm2713563eec.7.2026.08.11.14.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:36:18 -0700 (PDT)
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
Subject: [PATCH v6 6/9] usb: misc: qcom_eud: add role-based EUD control
Date: Tue, 11 Aug 2026 14:36:07 -0700
Message-Id: <20260811213610.2956147-7-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Z2iAyuhhbUzxw2uF5tepR0N6Dn4WgCA6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX6b84ybKNk8nt
 fGql/BD6hiUB2rmvP3xOGBRo5o5mFQRYKbNta9Y9UEx6fEKaLYPiRtsg3z1arioUwxi4Y+NfIuI
 KOj5YDrmtQ2aw6qVH98dK13SnJh6ySRshsItBuIM6zNdmfAn2WBOyOlZno4ax066d6DSF/RfzGl
 PhOjZijvMi5GNVRseB9esbw79M3zO+X09XXtROw5nMvM24abs7A1z8d45zdQofjfxfHTXqh7s0y
 qHwosnhG9wEcgyWXioBQKC0VbsPJ4ZMhHQ0F7Rbmbn1nPA6BWpWC2ThxqbNDkA2d2LkiMMvxOvz
 no23tmWcSJ+lClIsu9cpdLlKWKkg0y/ret2QSFdN66n3bubZCjFLUlgg9fmnAeMegEfJfNC2eSX
 /frBCBowq8WHdsTipW9u59i5ND6Y+c5P4tZM3cee3NnhPhnJc8tR/SK1BGA929dRlGGrqmFe5dl
 zO/Q47pxCUpKjFXzjpw==
X-Proofpoint-ORIG-GUID: Z2iAyuhhbUzxw2uF5tepR0N6Dn4WgCA6
X-Authority-Analysis: v=2.4 cv=FbkHAp+6 c=1 sm=1 tr=0 ts=6a7b95d4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4GSD5CdKrKcBI9kQVZUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX6RPMRfeUGmom
 w75HSaJPc2k0I0EK+3ZQ4cbTctX3v2DHJ+fbjKWagIz4lPW1TIk8jFD7mDbvkDizN7S19wL6o0D
 hb6GdT/2liHDz9nInGfQtUyGXfYqafo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110182

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

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 46 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index e83a4402e4b8..538e070cc140 100644
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
@@ -55,6 +56,8 @@ struct eud_chip {
 	struct device			*dev;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
+	/* serializes EUD control operations */
+	struct mutex			state_lock;
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
@@ -156,17 +159,33 @@ static ssize_t enable_store(struct device *dev,
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
@@ -304,7 +323,30 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
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
 
 	/* Forward the role request to the USB controller */
 	ret = usb_role_switch_set_role(path->controller_sw, role);
@@ -431,6 +473,8 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	mutex_init(&chip->state_lock);
+
 	for_each_child_of_node_scoped(np, child) {
 		ret = eud_init_path(chip, child);
 		if (ret)
-- 
2.34.1


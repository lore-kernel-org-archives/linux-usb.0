Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A4B3ADB8D
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145319; cv=none; b=Prbi8T035xeVn0yzmj1QMmUhxkaYI7jr9r9LyWPGf7GCNDuUkNywrULSU6FWZQ/SioujT5Ilz5Z3RK8trej1Tm3hlzNcvTnWVg0aamxkl+A++eQJbcHLjXw82ufAMC7UYX6oYlr/9s+Lwb2Uy/drhUwvRCPZBr4wyr/7axE6pW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145319; c=relaxed/simple;
	bh=nkS4OyzZOkgIJyCEgiO8DDdg0IqU+H1YgFT9CPkNXic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MVOH67Mf13eGy5HiRAC+Rgt2HKvQ05aO2mLz95nGLtomKBLqO69AbhkBbo2U1YRVGapRJX8yPlpBlHigC0+eT9Rw5xLcWoLDjeAxuJkkzuxcGb6at90EHoZpXMrUi6IHFC3NfQrg09Kc/rs8FZB6X1J7tjhgSKWIq2St/ZjCNFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c22JV5Qy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XJlDYRw+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c22JV5Qy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XJlDYRw+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bNVg2179542
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2sd7Yaq8LYK
	WFa1rNtDRDd8+anZIsb0dma1UriPcrYE=; b=c22JV5QysiJEVOEhystbX8L70W2
	OgRPd8povQemCwVhC5uBBA7BRH5lHfLBZ7nES0IVJ5BP5dS0uRNZJBVceVRu5qOx
	xC3iLDG0W9HZ4m9Vr2sLQLtku1ZYyeaf08JhhDiwcTwSDESvcf4M2cC1y1bPcPqD
	lI+Vn2W2RQfmV0YYB1rJscTobFTBNsdJuRR0u0GyKYOKx5XWhWqBpWsr/4/HCUBO
	Rm8DAW9H8CY/5aTw9BYZ50+9ULtwly+zGNC05iqr0TI8sgpLVB2Ar/NnGVuwyDrS
	6pZL6UGcFjgmOqSDdGX2fFZXSMqUmsxGBFv/Mr98cQKbBLY9RnKxn+pbmCQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2m9k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:01:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so5633402a91.2
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 20:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145315; x=1788750115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2sd7Yaq8LYKWFa1rNtDRDd8+anZIsb0dma1UriPcrYE=;
        b=XJlDYRw+5DM0ICTDqLcqCPZT9rUdaCp663io9EYDs9sIz5904lSSrslHGBag87E1vT
         Axz/U4ZrpAs6SMlJhyTPz29T7Er7uNKUxmT09bL8Tt86qzSW3F+1ATde9cuH3eLjECEz
         OTPiS8tIa1k9dQBZsdZkcMWsNX6sq42Auvnu0pZTi11jqizmSpUdyVrNIJTipb+FDexo
         bXZxxi7MoRB9tTxhoXs5qrIv0jl72oNquI/7l6U3sf4RZVMGdMJPeFfa1kC328CIZNhm
         e9uNx0UZJlcWdN6W4khYLKlG1NluEuRl1Oh9mO0wYbz8DnjQb/HWuQLna5UaGikVjOeb
         +yFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145315; x=1788750115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2sd7Yaq8LYKWFa1rNtDRDd8+anZIsb0dma1UriPcrYE=;
        b=jbEO+YUHaYdK3U2w9yvqCGtBp6yKOTqYM1ePeS21OhA+rr3P1FySxQK+IFUUw5DnMk
         pNloGzPV7wjx+8DhpYZWViBc+Vbsut/9JYbV/6rrnJs02zzpmLYRNLtoNYfXowb1P8oR
         /nkOFrJQgSoN1+nXIOPDY6k7hsMYIK2m5pVWtF4sDvjgOvY+yd3ZOL1+nqq3Tn/1v6+u
         c1sUO076WAoix8qQbc+hw+8DnbIo4Qvm0Z/rGRf7jchmCnpG3otC0FNsYQEYw9tFDNZ0
         M87B8Xak1lWGW2FaN1GQ2yeXnKjRwgSuIAZ6gVXg3oNJPrjcRyM81F34jRHhyLqDxois
         /LhA==
X-Forwarded-Encrypted: i=1; AKwUvBzyvPV0JPV5jvm4rG4KC2p2g0VaBZcweJeo9e8KA3OZNFG/Xp2hNdn6WWAag5h9oLSjfO2gRXOyk3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lQvn8BPHe3ni9i/OPgdVqLxSuiURGwej0dzoiL5ukvHLQYdCOx
	nkdnIomiwJ1ln/WjeB674fKRJpqA4JEvSwvMcaPETMTfoqgq+9vOnVU1ud16fqCwuKMuQ3xhSIu
	c5qJu+BcYjKBKInhgxGdKF5dO1q1L2yJzo25l3x2ELJl+NF2bb9u5xRkpTD/r2J8=
X-Gm-Gg: AYBFou0UGmjJd5PjJeugyq+WwGVXybphyKlAEsSJVVuUSdr5S34uuCMlcnWXa+O3xy5
	pkjRNtmrviXkmqsYHH0a2mov0R/skWBwgj1U7A0hJ6vPmsPOHpjn4AjCa3kKKUn2HvCPXOsLZf8
	nYB+8MfPC6pGGbN6g0ALB+MtLBHZ7v/rKbMdtEWqEXrqyFQ4jANdpeEHL1nHtFlnuumrRiS1Ivr
	FLzyJQdl+cBHcpJqL35YbS9BwHHRA8S3jlaKj9S1ascUZx4r/qF8uc534XzwAltIi2vMmOJLnFs
	15baSKFk4slS2gZVzuwNZW3u80pOetztQudT+u3Egyr2Z/M+hOKtYuT9rw/JEW3DXdKM0zUfEO0
	BweVyMtKw5b3Z+MYLWr1ye4hEYPuexJPwLbUSddUR7mLoPPYSNF7eYw==
X-Received: by 2002:a17:90b:57c8:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-3989bd54c5cmr21269416a91.23.1788145315447;
        Sun, 30 Aug 2026 20:01:55 -0700 (PDT)
X-Received: by 2002:a17:90b:57c8:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-3989bd54c5cmr21269337a91.23.1788145314998;
        Sun, 30 Aug 2026 20:01:54 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:54 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v7 6/8] usb: misc: qcom_eud: add role-based EUD control
Date: Sun, 30 Aug 2026 20:01:45 -0700
Message-Id: <20260831030147.1500616-7-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: hRE9Bj8oVmQXxbmj-fu28CTGedeP4YLD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX25DEiF6xbcsB
 FYpeVdFaFj8cXXGIfp4Vinr2WGejnVam35AFnsuOiyzmXAgGqM7rDg3a4zti9/hwbFqB6iyGNJK
 XR77swK29R6hpat1gETXyxwHq0QmFug9WOctifB1g9JuVJlriNbbVVO4kkpqPsiE9UHNJUE1yRJ
 STE9eroS/cvPlgF6PM1R8qufNZEjVKivzw61K/kdwxRJTn/yW1BB4beIUx3PR7jVDM8DNYO+/sg
 8GSsAWjstgKn2T323/dy41Gy7LWMv3ZpmmuSoAZB/GjsBvE7u/w3KKQiGkycVRlHCWAOW4CDMJZ
 irhYc+rsfqL7H/9AanNQ4oMyTTm4FCfHmkcG5REXYDFNtBS9IJwcjERzd+KFl3UiOdJe5O1K/nT
 B+qN5PjkI0UIFTvwerXfDCuXJQA8OzQ/cVtWeIYVQAKhKfGzbgBI5DucLZ0pgHmaXUX1jcKnlqd
 751WNtfbSjRiv1bIZFQ==
X-Proofpoint-GUID: hRE9Bj8oVmQXxbmj-fu28CTGedeP4YLD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX1z3oP24o5Qdw
 rUzYdKxkvq6VlndRFvbEimkoeRP+vDJWvopLNtSJ8QpbMbnA2Q2a9w5iElo7TDJIm9QUTq5ooZN
 kUl52LoweoOfWpvTCZnTZRIBgyB8eA4=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a94eea4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4GSD5CdKrKcBI9kQVZUA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310024

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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 46 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 07522225a8f8..549c0d852bbb 100644
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
@@ -433,6 +475,8 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	mutex_init(&chip->state_lock);
+
 	for_each_child_of_node_scoped(np, child) {
 		ret = eud_init_path(chip, child);
 		if (ret)
-- 
2.34.1


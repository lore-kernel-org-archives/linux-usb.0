Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF8534F24E
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 03:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726947; cv=none; b=f9yG/nXs4okUSZsx8uqq+ng1ZHlhus7H7EPJKp14kND80VFpym0miz7T6PpH2huuBgVGqoIOAQRVl1guoxSOfZh5iG2ryB74lYv3I7xYLnCpWztp4JyJXYY81qdfbjazqOgVK/Nuapw9ITAGwzZqYP+8hUt9nzRAslcRZ0cnOsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726947; c=relaxed/simple;
	bh=/zuik8IdUv5jQQ9WIET1PHPqFn0iJxzjcyyR0zwdaPM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ubaFoZnMa+p36xpcpc9aUSbknqlI/JthjMJwxVD+xm1iqJoSq+q0WWEe6TaEhw/Drk0IiUtkPBvz/DsVEPAocMZU9VKB9iolaUTa/BwLGSFTmLql5MGQz8lY4kJdJLSzqs47YwTiGQomHTBGAsdW4MZmAlwmtugzECJ3gcOc+N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oudIUmBK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvJkT+1a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oudIUmBK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvJkT+1a"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LVkHp2552808
	for <linux-usb@vger.kernel.org>; Mon, 3 Aug 2026 03:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3sGB3Fal3bV
	qXiQy7bl5CeUWFPhCUyUHhWRj6XmUwrQ=; b=oudIUmBKE9c0WSEtsSaAG4T1QD7
	m6Kn0ZPCJ0x2nV1Mws4kZt1KWiL5m8mC2CAm3h6xdncQrkvT0s9icocD3W7UL38r
	vugLtNwwuLzFFKp4Vo9L0exTM5rv1OKT78ZWhfjN4XccKBjTMqayP7Q6VnBqo25d
	fg3lf7UyZ5Hg7KC8HccY/gRP0ui36CksbjZsg0fmtQgs0VHFnj+r6uLI0BbnMwBY
	IUO7/JKYuQMt3xKGEFBzvFT6TpdW3S81oxXhL5j46tUwqzFkewGgWiI2YU1vXPJv
	YjRPTQg2YXhHNFJJv0QqbHaFXGf8xl0GazvejjaKTSt3qCsVfSrECyv7hCQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fsa3842nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 03:15:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso2735114a91.3
        for <linux-usb@vger.kernel.org>; Sun, 02 Aug 2026 20:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726944; x=1786331744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3sGB3Fal3bVqXiQy7bl5CeUWFPhCUyUHhWRj6XmUwrQ=;
        b=bvJkT+1amRbAfZhXOW9Nos+sEi265p4cIAuR/ukNDTmVmCLOwJv9WU0cS0hzNPJ6ck
         7mKEtpthcJ4oopUSdEkkLNABBUev1AXxVpVxKJl4tfqIhU1LR/DSBnVbpGg5r0S3LIZD
         PLw7MvO73noZTrMcdDaYiFPcfVYd9E034uSv8EUTW8/1OrS7IpCSaqBFBfGiG1pssX2v
         pjptAHgdYFaYRl1HDCE+5T3p+8vf9CDSIexw7HmYhjGAPmzguH/++U2tC7duoPlhBZSS
         2RGlq//ZFVSXUaUz8DbJMogGE8FqqfI60JRg3vIuK2J7xe9UEF4UZ82Umn8orEG9IU0L
         xLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726944; x=1786331744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3sGB3Fal3bVqXiQy7bl5CeUWFPhCUyUHhWRj6XmUwrQ=;
        b=ryPUg1nk5P3kwdBmxWEGqAXhqWsTm4KKfhVdmiUGl7sD2o7s38Bp99GZpbVOcUscvR
         A62GtV7ZITIlhb9Yl62B3GZmAhfACKMcNlUjAj/vbH0jbSP/iCJgV8DovcpJwwUKb1F2
         SMmScXa7F3x7KOLNexHhJvehGU51N6p8HYCBZw2GWfePamTloxuUf/88FX8eOFvnwfpm
         mZRETJSy3REwnNPY6df8EFpYV3mdmHJQfLQ3DlDy+vYPy7WfJenrLjDvnUnZe3LI60cJ
         DbWi5UM1W0Nj+Rav0nBV2xxz//s3zCqayfxZcKsPCG3dzwstfUZ1gf7huBIVDC312eYo
         OiZA==
X-Forwarded-Encrypted: i=1; AHgh+RpXraAzeXzf9dgao4jL5Yrji91CNKz88pF9YmBg0u5GGAf+OJTqyW/ZfOI8dGMppeYb969DkVhE3ew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1H7Zx0KQ+bKCaRPxSS4m6UIMzjnAN6QWxjH45g1zYWwYjVMaU
	1fEWDQW3B0H6EdwtcelrW3xpQ+0CmT2gBFKKi34FtS/y74z406R3KDtfemDOFzLv1412iA/LjWD
	L5b9Q5qDkRU37+UjX9HLkLBgGQkBQB2SDbJeAUyHaK+2DXymnf3vvU/B6XzNLJbg=
X-Gm-Gg: AR+sD12y4xNUAbJoIP8KpgR8H4unw9H8Z1sgkittYXtPPRUV+ZNglQepSdRi43F0ABt
	34wTXlotl0gpYvefSjIvxP+r50nTJMky37waGCqbV2LDfrQEcxxHFTwZNRAfO/uSKTSYkYURfhr
	/x1OuGKVYUj+lPRtKlGPUNmRHYDq199sTbNOL2P1vWgbAmEnkqogYqlmvW4ZHZbY4fuUPkCkinB
	IVnkar6EW0bZdO/on2a2UAf6QmLZ9pinrqV1WdUGdXJ6TSxAV/mtPSom3BgCoJCd5k7lTXun+nq
	iJCwX2Dwv5Cf2nEeT9jXJ0jruhnYDkbqlnTkM5L/8tGqy7uZ/47Ypa1e2C2jvQdcYrrzj+i01i3
	MEQaIhuZC2FT3hbHzb3oZF8z4l0wGhCoGLk5KML8jxj8Agz/TjMJ5yg==
X-Received: by 2002:a05:6a20:d43:b0:3c6:61b9:917d with SMTP id adf61e73a8af0-3c92a9c1adbmr9012290637.49.1785726943635;
        Sun, 02 Aug 2026 20:15:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:d43:b0:3c6:61b9:917d with SMTP id adf61e73a8af0-3c92a9c1adbmr9012231637.49.1785726942719;
        Sun, 02 Aug 2026 20:15:42 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:41 -0700 (PDT)
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
Subject: [PATCH v5 6/9] usb: misc: qcom_eud: add role-based EUD control
Date: Sun,  2 Aug 2026 20:15:31 -0700
Message-Id: <20260803031534.2942628-7-elson.serrao@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KezidwYD c=1 sm=1 tr=0 ts=6a7007e0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=4GSD5CdKrKcBI9kQVZUA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfXxZbNS6RSXU2g
 /UrX59otTB8N2+pv/ldl9rhxYF184J1eCO4QB6JBxT2k//CyBMFlyHEHTbJA/zHkJ6TsLzGFJQ3
 eptqFPdb+s07Q0Q3qA+hmA8hrNNU0nA=
X-Proofpoint-ORIG-GUID: JWuv4wL_yjX-uIfxV31e3qOACQzWPl7U
X-Proofpoint-GUID: JWuv4wL_yjX-uIfxV31e3qOACQzWPl7U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX3bRKp05iX0mp
 SQOU0uWkt1abCi+6YzTFmi33eOirNmOUQaRBn77W/+5abaHQRfKpjp3Y+nvl84YMnmjolJyf+iV
 tuzAdqwxbQmreLbk3bI9E51Q1kKsoFnWCCJbNDvqHKOFZVnPu6yC6+lCqcGFN36+y/ShehrZ6wr
 pn5yDUcVhA9kvNgjIlZpQuApuAziKUGhhBo0kzoktNzEdVny56sBgN5ktYqfnm3V+RLxjya8qKI
 Pgv1rIIH8bllbUfjmeUuuUOfE7EtksogbU4B3dtJc6J24Wx1TQB3eMxepvvIx9qQMkZKXhC7j/x
 nRlgYxSLvcryrYtNi+DW4iLboM6TkJRJFQD2Xn8eDq0jZ+htqHTfpahCO4KFF08Y10TkAzEK8Eq
 dmuY8ntzMgkwVE7qBq6ugDtsLNf13Di3z57e9BaQaJzh5zLTu4Y5N8DgKlcouYTaYmlz3lD/JcT
 5wHEX+qyv9VV7DxzHHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030024

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


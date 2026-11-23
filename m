Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458538;
	b=0XQZOx1KZYNwn6he4YnRGRD74UtDrXPfaX0U839z0D8rFpQTRO/dlMf3+q2aF3JqaerN
	 j+FyBL6/sBe3Agrphi1Bj8mx+SnP/RPiw0gpOSu6O3DnrgQxqBN6oJgK7ehx8j3AFiq8F
	 UNzFRMj+Rd8PuLQWMOB78sDX30jKGjkbcYTn/lnEN2F8FPBovUPHFV+sWFkMZMOHFK0b1
	 ssfNl+mNW83KqBBi6x0jbRBhGDYcJt5F5MGbPgrMz0jxxAwSoso9uGfSUnlzxuUJatuSQ
	 GXrSdBDxRWjNlf7CiqsmWfGo0vQ0AeW88cuCdMs9ezJQhUWH2dcd8p4X+p+lshXd5nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458538;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/JIMNzd1d/PnQF2mlgIJ7k4900jCYz2iwph5AnTrVXE=;
	b=SBbU2n7uPWJA/qCCWxIWb4grAuRRQjQcXbgs2/KxRhapdeGqiRNUJYVM8+How/B2LHEI
	 IXh4/seec5evb0PmGV/HY9hdv83RbhismxMb25VacmBan783JF1pJCUBVgPdY0ngxnoQf
	 dsJXusebEP9Mm6kMEzWdYGQyROCMoTcxqjr8rd9xU8KY2UFu9qwmcSf0X2iMiLaUSfwlZ
	 dmkyW5FvHKz4oiWfRc4fPhfENFtTuWqdy/6pT6B79EPRbGaNqF1ldUF1hLwTQLwuLqGAW
	 JhTkX61VMgoSd2eM6UNBOjG5kjFW7Owr3lyaai28N8uyitwvBjl4Hw3icNfvXlvsxvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ox9I/lp4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LMxIRIos;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E793760A2620
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E793760A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ox9I/lp4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LMxIRIos
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGl1s1861144
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/JIMNzd1d/P
	nQF2mlgIJ7k4900jCYz2iwph5AnTrVXE=; b=Ox9I/lp4PWHFSxmIOZ+GxV80YH8
	7L99/xEhj0cdIP3C68Qaqbe/rqXO9+uEBnPJp3TyGRk+jlLHF0tgI79ttKvpKrSF
	iSAMOIS88CZG/K8DlfoOcb4FzijuTaS0JBnA/5CDuaC6dxezDfMv22+xwhFfqKmX
	rmm2ZEI7NceGgaPomiNnLZky5IZadDA+755q8QX2y0r5dPHmPFdVlEhCUTAegAwv
	EZBgokAVzZ+Dvpc+eSflfYhQt4cyPpmibAszRB36NRL5NGfpNqfBHJEDVF8mm4Cz
	yVwLKg2xHd7vDwsQHPQFP6Jxa1YMqMv7/cTKeUvIIPnYH4Ol19KhNoL9oLA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a2tbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:57 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso4109842eec.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458537; x=1796063337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/JIMNzd1d/PnQF2mlgIJ7k4900jCYz2iwph5AnTrVXE=;
        b=LMxIRIosMCjDuYCROLVgnVnLXB9cVntONOsD75/0Lebvd3lUkioSkCq9Jhbuqt0z/k
         2TfA6I1xay9oVqfOgv/iSGbWemrVMgbW6Sm3gcg5i/vgDqzeAENWNO6Gpz/yJX0L7z2q
         Yo2ceG4/wBDmiBA2hZJ+nc03eVO0ztjp5dN5iiXf9BpcuoZXZyTyknBB1wrDjzpFbkBK
         VTodmr/V4mESGdB7tKu0+j3wxXSDcUBFI4qdfEtNqPCa88eMvqK/sAy7GWB6R1mGVDKm
         vWm+N3WmArjTz2fCf2c0vmwIV9SjCOOgQC9iX8ZYTXkOXVX+2cWEuJZ7wke6dRisZXSR
         7oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458537; x=1796063337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/JIMNzd1d/PnQF2mlgIJ7k4900jCYz2iwph5AnTrVXE=;
        b=oerVT0DkqAXbyMblEdxs8cqWlGwRT0gYyJpdQ6K/eSTNYc7KSVrYYBOT3HJ2baZtG/
         pdCxoxNVcp/CXFRP2dZI8o6PhiUEvoFyU7RaeHNrcrJpswxoXSKggx/Ie3NoE85y3EvB
         g3/gpFeVVcz9ucU2CTz1SyvbC64bVIyDRKdqBk5kFQ7bQwUXiA3qIttaevJrkkh/TN6j
         c/wFC28H9cc0eUUg+iEzGIjXsbe6MD4w00kwA0YfV1GOZ41bhKmEM+9Nmt3ogJRb+zx+
         7dntgYqIpU0Yte/bfl3rwIv6f7uzyYYgTolnzCOw3hg7CWzwIbPT0aCBY2xvWE2wLACM
         I4Ag==
X-Forwarded-Encrypted: i=1; AL+hErHXQGC8g8pzYUIu44+nN1j5X8naleNsGF1h+jlWI9mbXj9+9LjWV1aIPRdxz4dkeVHbTE3aE6ILCoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UZpKFHjAqd+GquerxgBLJFZ/ih3q4rZwy6VIuFocaAriHcFBx
	mpxAZBnxMbbMkUPzcFv7algn4DnNHxnbjwVf6iaB9R673aGlE0fqJp5Ya0JM7ACntyTqY60WDpQ
	1l9JH4GCJRn+/Um8yjkfhjgeIe+5/5JR9nKgDebaEI6fk2vG0XjSILpPVoJodnAYnS9TMxG0=
X-Gm-Gg: AZFdTZcw0xc7oco55ZRYvQdnL9AUgK2HAF8xb+m4rgWPg06ypK7U6WhpEzKaY6Q2MIJ
	/lKZZpH4GpfmF57E+hbLlB5CWkBcmx3+7wu1RiNBDrQfxR4r3vhvfhVxQRxix54sJDpCo/LOJID
	2AYmiZnvxTB6MmslCcrY2ttCyt2S74FcKLlWY5IUV8bd4ImdhqjHMMwgH2fmk2k4QZoc3rLUCxR
	QVjyGOiTXOMLMM0j8DoSLnb/XSk+NY18rlfKGr4gCnxIPhh76MdoQjtVa3KtEoDWr+OyUcaMwyF
	ovkcrfzfkPct3u5gtqFCvO/VwD9dwvv4Xq9urnMLvO7vl3vMYyKIjUZMoBRDBGvJfEUUT9OJZAh
	wnyNcqQ8Q0RasHI6pLcCmAoQKBPLVjqPBO+rtmGcR3ZH4FnizHH/conz1ezddJYcBrlRxI/9wdQ
	Tihvfx2GAxmjsZTlfeSdod11KtEg==
X-Received: by 2002:a05:7301:6405:b0:381:a3bb:f945 with SMTP id 5a478bee46e88-38570254ec3mr14795681eec.22.1795458536468;
        Mon, 23 Nov 2026 10:28:56 -0800 (PST)
X-Received: by 2002:a05:7301:6405:b0:381:a3bb:f945 with SMTP id 5a478bee46e88-38570254ec3mr14795656eec.22.1795458535965;
        Mon, 23 Nov 2026 10:28:55 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:55 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v10 6/7] usb: misc: qcom_eud: add role-based EUD control
Date: Mon, 23 Nov 2026 10:28:46 -0800
Message-Id: <20261123182847.143892-7-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX7yg7dxjfrd5K
 kl5Am8JcQinslJ5YlIZPbdQ6FR0vvr4BO7ClFhaCcQICBmEdkupojhfWG300M7CrxQe2KOnhlxy
 u6UijGsRsiAhVKah4bLDblzM1CcFJoA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfXxPDL6dFZiv7L
 my1YqeTK4oZXykQrq53POb9STrdO9wHIykpIbZuF28Y/vyqihKHBb4vPfb9gisQiokqUE3wXCaJ
 9Cleo/h0tbBQLGPHSo7+ZWGiZ4BiKPaOWfF3WXingD9eZkhg7GCUezC1gxASrnZ6hWox6gzilAT
 KcJ47RbBpKXaLMqVfvkDGVeCIH6PMbKKGGCKhrKP55+T360fSDenmuzG8pX8jfspLTqQMehqK9v
 coDXChNzrq0iEgen0h/W7l4dr3TV/VhXDZyicMQIvV9Sp+iKrt+1dh7fD5RGwdXUd3bfUQKPJ7v
 P0AqOAa0BTgpzw7cP3QRjUUbFmJnX3lkPjfCLy9+erhw42otmJo88C0GPjemD9ufbxiJap/+XuO
 ZJ9XYdMM7vOui0jCkDBAuIpHir+GU+TiOnSBIJbhrsgtBKTFM7tx/zRda48LRV0vp1WGSYP7Mq1
 nLxLslNPHXlP2vnvgow==
X-Proofpoint-ORIG-GUID: JUTDZ7AHY-fGNtvOq6VRBuAdtJfIr3ms
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0485e9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YKK-c5bBAu3nLoGgrlsA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: JUTDZ7AHY-fGNtvOq6VRBuAdtJfIr3ms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230073

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
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 70 ++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 9f26231b6648..b434b0447613 100644
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


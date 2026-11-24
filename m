Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510409;
	b=0KzJXulLHvg30oKYW2mPbKCw76RRzbkKB26t9fgXgbV1kkBnibr2o8MXk++jDdcDcVXO
	 Lwkmg9+A0qs3VGiHMvfW4WqeQeGy7W1apv24oBLF/gnJqcjg5Qc+u8Vb2h3HCsHGxDP68
	 JQqo85I5t6QVIAQBTxDhP/FVrayi1J+aVENn4GNHwO6n97KlLggMEQmeAtPAUCMvmeVOu
	 xKgB//q3sG98WZbcmrRj/9HHAxQAO640FJHMD5Mm23jgKO8mwtMa75NZGfW+iTwGB36vu
	 tt5sebep7DXzwSz+CwuUtVzaz5PQR7NM3NgNYIJclXRYCOFbwTYeymAd0I333Q9kygA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WpOYBzCVRdFVbInzZxc+vHY/9MU+Lfz7H4ENxMVP8gY=;
	b=bzfZ27KNsuYaV/fnNlqoTmoO2iq3UXOtLSlVGK0MIm8F4sTIuZ9MKqWGBRIXKnJkgCDg
	 KCxX/I/y+y5TwWRXnOSEaUbl3ZatMTQdQopUbSZbysU6QHXHQnk+hRkslmnVzmSw8rWgf
	 vAgAq/MiOJ/9foQlndF5pLptxKernfjEqntSEV+HmvNFH5BZyCW8ovB85NHUMQw/rmbiT
	 QHKlT+nmlSkhhlQlOUChjMYAfpkpiAKXjZIXb1Nh28vnaUyXJLP7fNY8xG+LJlffMVLnC
	 yWdYYdNSuejzvugBI1TxFOVFe0C/xuybV+HaPWwWZM8hICO+7yoDu5b9D2CHSaYsemg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EUmP+pEb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hogAiqS9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808DE606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 08:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 808DE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EUmP+pEb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hogAiqS9
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO87Jak901866
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 08:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WpOYBzCVRdFVbInzZxc+vHY/9MU+Lfz7H4ENxMVP8gY=; b=EUmP+pEb1ONohaQO
	aDv2qZYfx2yo2V/i8imvZehbc44ZVUf7NNCfTUgyZX8TQy3x+1xZdEh6CFC1ktET
	CD/9ricmanB0yWQnNV4TGF0mKdVZ85qV7ad5L9uRC6n/itEnnZYFah3KUVEiVcdQ
	uNKbbA2wycyEKoJ/ajNKqHL9ERuxvfvDrGE27rGIf8+zw0+gtDewDJaVDUWw9UMx
	DCfB1QO5WuJNjMf4JecA2w+aMMN+NdGL3vwQfTfezfEM6CYqBX+vcAneVqGNUnHn
	w2FR9bMdmrb2ZWkhCNYGp/NCuKekHXhczHzmw3WfyMD0dt5ZdVDjY8YAFIRrNak5
	eYq4vw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6stajq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 08:53:28 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso4479662c88.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 00:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795510408; x=1796115208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpOYBzCVRdFVbInzZxc+vHY/9MU+Lfz7H4ENxMVP8gY=;
        b=hogAiqS9ew44opHKgcJNqS8DhZ5KzkIIdLQEAWjHmpAqdI/RVOqKoXuDOvGU75DFSK
         pX7khEAZ3tW5b69GGr+nh2gfJTZWO8olhr0IhXTKOKHT5oO5JSAUfnlWOueXsG29Ud4e
         rGhDZcFiJakZIVsb5RB1IVHUFXW/M1XxZckMsBkEKqsKjjBoNBHLwvIoaxZSIrjUbsBe
         bTb16Gjtp/BwuZsKOJNFG9Z6T/JvyxsYP8NmbuEBuP6QGngFhPuJrSj9oCnH+c67JomQ
         0OFF91qA5ubzsW4bzl0dd8T01VLjHrtsklrUB+Usketf1XvHQqBGWpg1WTdeIYS1geHi
         ZFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510408; x=1796115208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpOYBzCVRdFVbInzZxc+vHY/9MU+Lfz7H4ENxMVP8gY=;
        b=SIbe30xeUNug1ABnVlSLGjmkOIfbwLbNHpGzNc1OGLYUvW/3bX6SYI5KsB0N5aZAoO
         7k3WlA1BdbSI0dN0MtjP0fQ+u0Df2YJ6oZFpadt0AufbDIu8YeSSgHUlZedJVpQC5wKq
         vRrBabuiNbeBjQH76AnmvBgtD6K2ypn3qZ8Xx/EpiAKuY/SEnsrnCF763Q0A3XlivUfI
         73qZmJbaVOoTju56TCg93K5jm9MA5s8LStW6PZnUXldjMy7gNpgy3ebNg6TOXiDfzz6X
         EH89HacPtBBX7h4v0Ue30fiOMp7XPBguaWfZRwLYD8r54VL26m+jd0zGwhRF4kG8Ok2R
         PPyw==
X-Gm-Message-State: APuU4Z+zKEn17K0g2aGble71+ncnCTBM5G9wNEcWXdtEzXqUtZwk4ud+
	x2d61wf2M/R7gAAsOEFB9wUb4U1nS33dqJPfJaVsweg2A7qS1br8jsRt49vI6AvT4Wv9D2FQaF6
	3cyRaBW4Df9MiL2S/Y72mDz1XcItqY0xciErOYJiQRqdXyH6QqqChi72r0jrM/3Y=
X-Gm-Gg: AZFdTZe8QN+j0cmf67b2wBInkMY65b4Uu7ABUIaxCCUZXY2pqULvPzsg3QQgKrDt/VQ
	MigybWIa1kePiZUfJcgkuwQJV8UMj6mMrtQCJsmf24C6QCg6/dK6OL13VycjzpZCqcdv6wQBanW
	8SF7a8s12Qj5YGBntA7hb6cPaOFOHalX9GtGjWodqBJkRPNqQsWtPmMpiP6LpeIssy3o8AOMD3g
	+hPsd0ay5SY3MYdmtaTM2SV8lZQ998x195UPPr5WC2t3YuFg5AzfGERCOhyUKBCwKUXBE5mvo2U
	ytLdBHHAKYRdB+GcGAm3Z6z5IqKmENWeoMLA6eaDrVrb5VUnZSeL1iUct8xvhITnxSf98r7zLUa
	RwbRrEV91AjHe8DwTwqpPBGZkWFOumkWzGk5am5nTYnJ1u0QnKIXI2B7iDNBJPos9Ge8BLn2FOH
	Cibg==
X-Received: by 2002:a05:701b:4555:20b0:1b5:2988:eba7 with SMTP id a92af1059eb24-1b556947286mr14700287c88.41.1795510407878;
        Tue, 24 Nov 2026 00:53:27 -0800 (PST)
X-Received: by 2002:a05:701b:4555:20b0:1b5:2988:eba7 with SMTP id a92af1059eb24-1b556947286mr14700268c88.41.1795510407291;
        Tue, 24 Nov 2026 00:53:27 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm21748199c88.4.2026.11.24.00.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:53:27 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:23:08 +0530
Subject: [PATCH v3 4/4] usb: typec: ucsi_ccg: Add CC orientation sensing
 via GPIO
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-ucsi-ccg-cc-orientation-v3-4-73cd114e5393@oss.qualcomm.com>
References: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
In-Reply-To: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: FtHhUKmk75YtBHcOhwAAL2Gjh_R27rLs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX9At4dFpRmvn+
 peqQ7hAHpauFZhwcYkfBJZ7UjejJGkgaDAP/54tRPa+oKIDtzPSAL48WCEELtf+jGhRAnsa/02v
 6BxvfWlN2KxteDsh532tPCuR8Matow8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX81/x1Hx/WR2b
 mRehg0V23RLvCJtvdYZBN2xoK9B7L7BP3dv2SfbMSKoPVDvUFOWK5PYgJe3LZg0P4Eo4NIgexZw
 w0Bvjw0rsKv0ed3Fq5LysioGSwX4ggTQ+sWS+mNC6N0tO5hwUzGbG92v5LPke9KrfDOb9b4igWu
 qW73nXGdwMX5sW0QWdrEghFdC4IgTTHEj14W3GsSY2T/XC8KFAumLOHgmZlp6IoyOKppkY5K1Sj
 3WfYzXzigI3aD3rXqEt1C8bre/6rkC9PTbrzDkk0oziHKU/DPwIVrRSaiI8OHHHKOzDCDxgyZEC
 DcjSrbQl4QCFSvbAKzWmNIKU4xuF30F1w5OIs29cN6yEz9Ubli/3W8FAGuOjaJvlkuD2JM6RgIh
 51mT3p1bDR2jzQZrmetUrUL63z28Hk+Wb0rvtTci7Or7R2T0EEJZQQprPSShopfxoYL13S1kvH1
 gM9z0mNyNR7CBMLgCrA==
X-Proofpoint-ORIG-GUID: FtHhUKmk75YtBHcOhwAAL2Gjh_R27rLs
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b055088 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=MKUcqzDF7wo3NqxITeYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240034

The CCGx chip has no HPI register exposing CC polarity, so there is
no way for the driver to report typec_cap.orientation_aware or call
typec_set_orientation() from UCSI status alone. On boards that wire
a sense line to the connector, pick it up via the orientation-gpios
property and use it to report orientation.

Acquire an optional "orientation" GPIO for each connector child node
in ucsi_ccg_probe(), indexed by the connector's reg property. Add
update_connector and connector_status ops that mark the connector
orientation_aware when a GPIO is present, and drive
typec_set_orientation() from the GPIO value while connected.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 77 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index c560d4539302..06c536d87694 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -10,6 +10,7 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
 #include <linux/hex.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -17,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/usb/typec_dp.h>
 
 #include <linux/unaligned.h>
@@ -201,6 +203,9 @@ struct op_region {
 	__le32 message_in[CCGX_MESSAGE_IN_MAX];
 };
 
+/* CCGx can expose at most 2 PD ports per chip */
+#define CCG_MAX_PORTS 2
+
 struct ucsi_ccg {
 	struct device *dev;
 	struct ucsi *ucsi;
@@ -235,6 +240,15 @@ struct ucsi_ccg {
 	 */
 	spinlock_t op_lock;
 	struct op_region op_data;
+
+	/*
+	 * Optional per-connector CC-orientation GPIO ("orientation-gpios"
+	 * on the controller node). Not part of the UCSI spec's connector
+	 * status - the CCGx chip has no HPI register exposing CC polarity,
+	 * so orientation must come from a board-level sense line if one
+	 * exists. Left NULL (orientation_aware stays false) when absent.
+	 */
+	struct gpio_desc *orientation_gpio[CCG_MAX_PORTS];
 };
 
 static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
@@ -694,6 +708,37 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
 	return ret;
 }
 
+static void ucsi_ccg_update_connector(struct ucsi_connector *con)
+{
+	struct ucsi_ccg *uc = ucsi_get_drvdata(con->ucsi);
+
+	if (con->num > CCG_MAX_PORTS || !uc->orientation_gpio[con->num - 1])
+		return;
+
+	con->typec_cap.orientation_aware = true;
+}
+
+static void ucsi_ccg_connector_status(struct ucsi_connector *con)
+{
+	struct ucsi_ccg *uc = ucsi_get_drvdata(con->ucsi);
+	int orientation;
+
+	if (!UCSI_CONSTAT(con, CONNECTED)) {
+		typec_set_orientation(con->port, TYPEC_ORIENTATION_NONE);
+		return;
+	}
+
+	if (con->num > CCG_MAX_PORTS || !uc->orientation_gpio[con->num - 1])
+		return;
+
+	orientation = gpiod_get_value_cansleep(uc->orientation_gpio[con->num - 1]);
+	if (orientation < 0)
+		return;
+
+	typec_set_orientation(con->port, orientation ? TYPEC_ORIENTATION_REVERSE :
+							TYPEC_ORIENTATION_NORMAL);
+}
+
 static const struct ucsi_operations ucsi_ccg_ops = {
 	.read_version = ucsi_ccg_read_version,
 	.read_cci = ucsi_ccg_read_cci,
@@ -701,7 +746,9 @@ static const struct ucsi_operations ucsi_ccg_ops = {
 	.read_message_in = ucsi_ccg_read_message_in,
 	.sync_control = ucsi_ccg_sync_control,
 	.async_control = ucsi_ccg_async_control,
-	.update_altmodes = ucsi_ccg_update_altmodes
+	.update_altmodes = ucsi_ccg_update_altmodes,
+	.update_connector = ucsi_ccg_update_connector,
+	.connector_status = ucsi_ccg_connector_status,
 };
 
 static irqreturn_t ccg_irq_handler(int irq, void *data)
@@ -1506,6 +1553,34 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 	if (uc->info.mode & CCG_DEVINFO_PDPORTS_MASK)
 		uc->port_num++;
 
+	device_for_each_child_node_scoped(dev, fwnode) {
+		struct gpio_desc *desc;
+		u32 port;
+
+		status = fwnode_property_read_u32(fwnode, "reg", &port);
+		if (status < 0) {
+			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
+			return status;
+		}
+
+		if (port >= CCG_MAX_PORTS) {
+			dev_warn(dev, "invalid connector number, ignoring\n");
+			continue;
+		}
+
+		desc = devm_gpiod_get_index_optional(dev, "orientation", port, GPIOD_IN);
+
+		/* If GPIO isn't found, continue */
+		if (!desc)
+			continue;
+
+		if (IS_ERR(desc))
+			return dev_err_probe(dev, PTR_ERR(desc),
+					      "unable to acquire orientation gpio\n");
+
+		uc->orientation_gpio[port] = desc;
+	}
+
 	uc->ucsi = ucsi_create(dev, &ucsi_ccg_ops);
 	if (IS_ERR(uc->ucsi))
 		return PTR_ERR(uc->ucsi);

-- 
2.43.0


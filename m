Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923315;
	b=zGqPLD3sFKDF26uivPu4Xcmpq9CAjCnfzsQcW7k5VsWqb3bqH/gQvrKmr6X7iT8OG9mC
	 NmVpBTBb9D/L6GzJojLrkOTRvy+7tFDK95CPzIAdI+ZKMKOVrz36bDMyD/T6TJ+vXqlF7
	 +/XKnytKZf13XHNFHNGPH8lPcyaYNP08JYonGtUYLtRknWVtSysnoDraeQGhse1TPymQi
	 pi9byYcQqrbxKT94Oc7X1n+H/PgAl3HEpyiWtT9NVDmIhhU07WOXBAZyjyTqyWdgXXA1K
	 4h0Sr3qxxwJyWGojvQfBD4lQ3em/YL/N/4JdSttF+RSMACxcE7W077tMTqRg7JCEQoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923315;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZYxycVOdsHRJGStV+up+VC3v+D3DGUKkc6/2y4XwqVE=;
	b=Lmo5xOyMGRc3lWk0ZsQ0tUXAmd7mtryxBiX6uAXqaPK8HlFiiDVepVabcuQLo2xdJhrn
	 L5MAO0Z+FHfePnh2mz4xxrfnhYKH9jyJFI+hjD8e6T8egIPXNmZiJUFzmlJyJIXOdKR5W
	 La44ng/yDScIwU7oazBcmEZ09XvF4in8ScP+hWOcuXg35jUpFXaqFxL4Ryc0+hX0EHmuC
	 EyW34+zUlA4tHNnMVQVvkgld7rf0+mKSfr6kUvcqdE+W0AbSyV9qGSBI+EVPvIr5BzEG4
	 5UmFJDK7YNhFHZYIy0tAKKjCkRQWzhZKYGr5Au+7UeB7Frjs/spOLuzAnXCkkDBu/1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZgUrSWq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ayLlW6BJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506C2606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 13:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 506C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZgUrSWq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ayLlW6BJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHDEJL4626742
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 13:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYxycVOdsHRJGStV+up+VC3v+D3DGUKkc6/2y4XwqVE=; b=YZgUrSWqkCLAZaPg
	4+FjV+Kr8XEnzH+fVgqWR94jFN7oMxPtrlpyJr9012PiDh01BIYpK7mJBBZtE+z3
	yXAO1px7B5HRXTQvw64Hh+uaNyrYe7w97pIVIo6vpp1+5t/V4UVBGnK5ZdHQO2oY
	PCZRNthiOkk+uTnWVbsNgkWwTGrzLR++fYvXRukuVkvTas9zW+pvNGSuLevhJWk1
	TRGZRk1uKbMpCBpKsvZIfvbmhATNU7pJeztiXhExM04/w2W3zy8S2lj502cJ/nwk
	KwJIXMHVPKbWUecxtPRxEl5pryOmzRQwHoglkWbXlYLP9CBfXAHaB4Qafpl30cgS
	NxysnQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0qms04p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 13:48:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6658309eec.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 05:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794923314; x=1795528114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYxycVOdsHRJGStV+up+VC3v+D3DGUKkc6/2y4XwqVE=;
        b=ayLlW6BJYShf6Yu9f745Li09PskP+rVLqr51O7LjNSTSamGHjdDI3gwH4h0pLvmUQL
         IaOwDoir7vCgCVFWr6pjPTt/ERe1ZO2OgYvn2Jdg3OEwgbSOUjMGk+SyF0L6HW+rXeJS
         FiMKyhNMak0+u1WsMQq76K7VtGfYUBfAAh+vqKoNrpJD93n8SFMokY213CESe2e/Ck+a
         UqXk4/QeMqNVUk3yqY5mvXHJSMN6aJqIYQAtAgFyf3AKurAp4ctbEW2eHV3CYgbt6loZ
         9uI5vPtbwlvkGQQLFV8QvVHlbi1QMRwSsDjwW1sZzr+7fJ1P96a16VBgyTSVgGdXAT4N
         Er4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923314; x=1795528114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYxycVOdsHRJGStV+up+VC3v+D3DGUKkc6/2y4XwqVE=;
        b=rApY37RdDuWJ5uaNURRKTkEip24/muNpjNjiXqi7105K9GQ7A8nn9PdaahkMkiXafO
         sr5oLn0/Y/hIpHzLrlOc7ris5JC8Kk6/RglW0nV2TREhn8xwLKJHbKPeIYZb7uHwzS1p
         wlnoZuFeHLsXu2LJlzJsPuMvYuzNgXAc2uDkouWVl00D/f6xoThBvxepO2rKkRTE5P09
         Lk73mR+Jy+4G+a9FiWLXSqdUY02yI75Zk4sh0uihYzNbX25bXHjdeI4WYFdXHGUb8eRX
         M2lTKt6hXOSrgpnbM75NZBL2xFFmMFhTeVPIPcbLlSMswd367wOfQFofH8VL41y/tauI
         eY5A==
X-Gm-Message-State: APuU4Z/gSFqnmiz1T91m5iuq2ia60WNAp9D25imnDKtqKz5xHDdbr2/E
	d4ABaCD8MuW3/pqXHu7/OcTy08eKRYX6LpwMh6iZiLZC1RTfCt/q7Azr1VLq/z+6JQ+m/kv3bI4
	2E2HV0imHtKrnzjdNIWRYp/QBbxF0JkGRLsqgfIeX/rCoXc+9sPj4v8h7xK6m9vQ=
X-Gm-Gg: AYBFou2B/24U1t6mcBUfMtWTNRDDg1vf2VFt0XgRyf1wwOLIs4yPijYb/nM9+9+djv4
	4P/mRvJDI7f1EC7GcdmCnGBxEYW2HMwVNVbXKARKcxWlV/V44i7oc17lshyi7RzsnhLnCnXURND
	tJEQg5KFNGVCbUzgbQhPiHsPahPPLETT/eW1fmUnUnyZSRTYJ3uCgg8Pw3K4AysqsEjjz3s7sSd
	XBBGUajuCwzhdSJR3nfNHY20O43UP6SitUl0SQn6oDicvCC86bOG6XvqxKMWlBVNZ3HdTvGGQ7Y
	w0nBt6YVeiOtDdPMAfjbzYVKdd5QBogCZrmK8aaEeAOX+1TlSndjIJziozJwYq3KiC28lUYCzCn
	icT0gyJP3EmI2vGUJSEV2Nz+p0qWBFooyS2oHlI0dxLO65WH2A86jCbl1cbqQw0wnZQuuUuZ7JF
	KPZQ==
X-Received: by 2002:a05:701a:cc81:10b0:1b5:3417:9bc9 with SMTP id a92af1059eb24-1b534179cf4mr4282447c88.26.1794923313577;
        Tue, 17 Nov 2026 05:48:33 -0800 (PST)
X-Received: by 2002:a05:701a:cc81:10b0:1b5:3417:9bc9 with SMTP id a92af1059eb24-1b534179cf4mr4282417c88.26.1794923312883;
        Tue, 17 Nov 2026 05:48:32 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm42336788c88.11.2026.11.17.05.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:48:32 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 19:18:06 +0530
Subject: [PATCH 2/2] usb: typec: ucsi_ccg: Add CC orientation sensing via
 GPIO
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
Message-Id: <20261117-ucsi-ccg-cc-orientation-v1-2-a0fb052c7fcd@qti.qualcomm.com>
References: <20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com>
In-Reply-To: <20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Akash Kumar <akakum@qti.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX8r4qllT/TZyt
 sGiDkULlFQCHe/pVMhQCiBRBzPtwo178mAZe8qyLKFZvGoDeuFlMQXJ03GcEg2AdPi344tBKZNA
 GMwYzk5LY11QAl2ZNiZiNz8Zcw7hn70=
X-Proofpoint-ORIG-GUID: 5OHSC4V5Bfb5sbT7RF4NRHD1dguTu7nT
X-Proofpoint-GUID: 5OHSC4V5Bfb5sbT7RF4NRHD1dguTu7nT
X-Authority-Analysis: v=2.4 cv=BIEmP1QG c=1 sm=1 tr=0 ts=6afc5b32 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=MKUcqzDF7wo3NqxITeYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX/wzVH2Tv9Rg1
 F5WkH6vK1Wi1619iwjuZMdPCzDGGnEifw0cVzI1bNJbOvixuUnOEfErG218bRYWrMRhT/uZwY4k
 XrhleZpfATTUgVcDVoIMp8DN8QhsEcaxKXiFCrsHlMpq3ERuXQPflXWPQg7HXqzavb7+fuxDssR
 XC6Q/RoKK1TaPMPUBGylz+1AK0WWoLML4fTlUVqTkuwMV0B9Y6NqNhva0Ivr1mxE1nCZcAt3ZDo
 qPyVlf4ZmTELy6/jkrXYJTqS3t3zb3iYRSPFHgbWc3YckYANHxSuQhBY/ejfDG3f59OLgnGsAqJ
 zX2toRV4CDm8NTdcTtVGxznTJhdNcxgjrRIB5cmzHbwVECBUdXV9hNf4tXj+6d5janQDZMGI2tD
 3g3bm0xR02hOALIY4PzyC8JEOSKGU9cPVyEEA62Rgq5SeLQ2PLVr0xIYxxvJY/eE0VCTgX09Z+h
 kH+gFFbtdm/u/uSj/lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

From: Akash Kumar <akakum@qti.qualcomm.com>

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

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 76 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 34fde72fe0a6..c6cae20d8602 100644
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
@@ -694,6 +708,36 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
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
+	if (orientation >= 0)
+		typec_set_orientation(con->port,
+				       orientation ? TYPEC_ORIENTATION_REVERSE :
+						     TYPEC_ORIENTATION_NORMAL);
+}
+
 static const struct ucsi_operations ucsi_ccg_ops = {
 	.read_version = ucsi_ccg_read_version,
 	.read_cci = ucsi_ccg_read_cci,
@@ -701,7 +745,9 @@ static const struct ucsi_operations ucsi_ccg_ops = {
 	.read_message_in = ucsi_ccg_read_message_in,
 	.sync_control = ucsi_ccg_sync_control,
 	.async_control = ucsi_ccg_async_control,
-	.update_altmodes = ucsi_ccg_update_altmodes
+	.update_altmodes = ucsi_ccg_update_altmodes,
+	.update_connector = ucsi_ccg_update_connector,
+	.connector_status = ucsi_ccg_connector_status,
 };
 
 static irqreturn_t ccg_irq_handler(int irq, void *data)
@@ -1506,6 +1552,34 @@ static int ucsi_ccg_probe(struct i2c_client *client)
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


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3B0397AEF
	for <linux-usb@vger.kernel.org>; Fri,  5 Jun 2026 18:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683109; cv=none; b=iXWLUhxWzjnyMfaoHxNiXhKZFRzFq8NnFjlydBAs6MGb5CHxsz9h+rzlFIqioi+Eja3gkOubcO3zIXHlmJ3PcLEdIGsl6jJtWjX3OM718flcRX7LWQPnwmBYYrmvrDuA5nPlN5is30hjLQeINd+Tfvb3KIl2APn6hJAFE8POxW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683109; c=relaxed/simple;
	bh=uqCubVytNSJo5ucLjzvCp/VptxWJjDUsQJvFp3Cckto=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pRpkt96Z36oR4m92H6ViiO8lxxXx/yckreVqcS2bIXEGrXVFATPxrXCb/wt0UZON/ZEGiVLnv0HPeuEac2GzyT8nPPccoQolfV3/hEfQqz+4qZ2jKZRQpHEQiu7r7/w2xusdcvK2GVdVC1mQdmVPs23cCzegJ3Htjm0lRojTTSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TTiQiyPk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WID9igZa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTiQiyPk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WID9igZa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655Ft1IL3603459
	for <linux-usb@vger.kernel.org>; Fri, 5 Jun 2026 18:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tcO0JdaFdNA9IU7ARKvD88x76KWxgb2z07Z
	nvg3U3P0=; b=TTiQiyPkqGN3f+LrB9CiXQgH+Uoqeap/LiLx3mEtXFmbK8pjMBF
	F9NU7m5Yw3OHxVURbQnvmKkNnrmXFXCtuBe/TFOl+QabqJTxUHkP+s2A8yuEmp61
	RmiK1Cj3bsOcn2n9ZCYBosgsNnfXPsh1rhFXzAsHMWKVRaOg6R/BMNCSdixO9/d3
	z3JjaU32xaySA7nP+ri363Jbq8Wr5F5GbqYQz6G/AQ+fmC8IpmvYUYCRVySWEHaK
	du2szutPVLYSp0TEKJGtnXBv6ZrzRy3JUIUPIJDa9iZS6ISLIPz5oSE2hxM0Odcq
	D6bQ4YbmHIn0A7nbWxbgYZT8lOsgAr7d+9Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekmhfc2v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 05 Jun 2026 18:11:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304df51ff3eso1917272eec.0
        for <linux-usb@vger.kernel.org>; Fri, 05 Jun 2026 11:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780683106; x=1781287906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tcO0JdaFdNA9IU7ARKvD88x76KWxgb2z07Znvg3U3P0=;
        b=WID9igZaqUhleR/tuDzUjn6VqWbIYifrYa8CBK8H+7yJ8k3tqS43MPxzAHwUP/2wtT
         nX8/sSTNeeNJnFygkPLK+kcvJ8xa4qfvLQVcuScvy256yDsqTbJYp1el2YCXZ4upAQU2
         cO/Q+zY2Uxy5mTq+RQWo3sbFvFdDnZlwt4tWytalbj/cTqb1N0f6a6N3pcBY32DxlmmY
         IG1JzUPF6GOdPrV/hX5QDPXufVN7ymPcp4VJRi55Mv6oTbmVKvejwRnU3sgSx3VOYO6t
         KrSbsr3SVYNoLOZP9GHCnur5V6xKB6bsi+XagmGiNmZhxgrmpQExlhGd1H+YbjEawiy4
         vpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780683106; x=1781287906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcO0JdaFdNA9IU7ARKvD88x76KWxgb2z07Znvg3U3P0=;
        b=pB8zGHfRVV3sF8vcPjEWnpoI10m9YpzkCmss/4b8OLO9wBYUIUs7/bkCCAEqo6dkLY
         cg9IsgjqxlBnhTJR7N2z6KjWVb0c7TPyu6f96PijV71WiZ+TEXDSzLLsqf6dp96pnyr1
         UKqJdCUH+EHaFJ4DAK4xW5MkpGQ9+d2jXt4Mv76kjSOgjnefPTbNqQjXMZGhTuyHdxll
         wcikNSrjYgV8w48ILwfe+L/q60Yy70gMCwvBb6zwBvLMYRa90b8h0MtdIGosj0IVD9Vd
         r7Kgul7LhcMuLwZpoq5NtBybuV1E6/Z3XpA7hIkTxhDQI239c/T5MrcAHTzHR77UH9nN
         hrGA==
X-Gm-Message-State: AOJu0Yx7tSP5d0JWdzN/f1Pg/Nd0oHqhwRznQM9rwoM9WCrrA+egS9AV
	TD574anmxHLMWr5UsGRO5hz8QpZukcQPzNPTTVxkJuEZkYWgWoWdFR2HcaVeQQ+lpVSFM1dOdIb
	KJrQYWBfDPh/WZyvJAoOy4NwDsj51ZtoLgvbkunQczrUPLyLwb8ltXDfJlG1brHA=
X-Gm-Gg: Acq92OEsfAQrwHLmV9TLj61uF9dWxbrePESus4CwNabBFrcdKc8ayQUfdseVKhYFFum
	HF87Bb++JIpOSKYXS1LGoR44W3Jeq7bMWdyFzeqiXpZp1P/uhaGWgAaJQtfB976qA5UQu+IGTBg
	x/EKBOfOCotW2i8O2RuG4qXRiuKqFQlSBEN4V6IhufyBu4HPZTfVK5nvZucRQY+Z8KEFRzzl1q6
	75XByM9Q4rZ0BRG0hWTlIOs4NXL2RH8Vocmfe6nyTSVQl1Jp6dwuWsrXmA4Cts1hBb+Jx7CIpUA
	wQM205wLhbws4PefN8rgzu2S+odl5mBy3dLznkQc3j13OHdruMJ4pDHRYFOuhrpadW/XKcOzzeh
	QMVz3qro8wKQd2bPuNHnQZaZOknp58sLmAAHTHRy+tLdNMXEs9dxAJEzEa7XbOFRcyPQgJq2Pkj
	1oVkT39ksANQ==
X-Received: by 2002:a05:7300:6c9e:b0:2f2:5c68:5074 with SMTP id 5a478bee46e88-3077af66474mr2195058eec.13.1780683106017;
        Fri, 05 Jun 2026 11:11:46 -0700 (PDT)
X-Received: by 2002:a05:7300:6c9e:b0:2f2:5c68:5074 with SMTP id 5a478bee46e88-3077af66474mr2195028eec.13.1780683105389;
        Fri, 05 Jun 2026 11:11:45 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dba046esm7644606eec.9.2026.06.05.11.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 11:11:44 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jack.pham@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Subject: [PATCH v3] usb: dwc3: avoid probe deferral when USB power supply is not available
Date: Fri,  5 Jun 2026 11:11:42 -0700
Message-Id: <20260605181142.1925832-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDE3OSBTYWx0ZWRfX3wYgJJEWXkJX
 3ZMsr5tCqRfsBy+9z19cVkm+dlxcHjr+AhUgrObif7Zf24R6o3coP1TCiRUQl4VFEhsCJR8w56M
 uWmCix1eqqPZtFgLIWpcf0Uwn/WQExhb+XGQe+g6wwKhfa6nFoh73j4i0n+foY7d4ZCBAY+Nvkp
 dQ0mTOgtj6fTDnDwJTyQS/RZYkUJ79vWeWxE/zx03WzlyNyBnYbcl4xUB/EzpXVq0TtJdeq44Ie
 no5PuCTla2N+bep5AlG5BwGTENNVgBxAJQwRtuBM1Iaxp9y4CU9vCzBdK1mCv+2vgWEAOlPeK2K
 xR/MVmAP6Vz9qemKAgQFiE5bQd5TnBdpXA1wUZSHYGydv+FEHXlk73mO7ozRwRgYCEZV2dSvyV9
 zWADh5Pcu2H8xS1uAh1L0LnSa+Ey79QEmVy7FojNW7GICKfcJIN+BK+xM0hi1kPUvmGuk/Ly4kh
 KFDblTzB3dY/KK1drHQ==
X-Proofpoint-ORIG-GUID: B2dVXln_cES3kCaSzN_iZrgGuOVe3uR3
X-Authority-Analysis: v=2.4 cv=dfmwG3Xe c=1 sm=1 tr=0 ts=6a231163 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BnH1jSTHCRmwS-4C6JUA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: B2dVXln_cES3kCaSzN_iZrgGuOVe3uR3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050179

The dwc3 driver currently defers probe if the USB power supply is not yet
registered. On some platforms, even though charging and power supply
functionality is available during normal operation, there may exist
minimal booting modes (such as recovery or diagnostic environments) where
the relevant USB power supply device is not registered. In such cases,
probe deferral prevents USB gadget operation entirely.

USB data functionality for basic operation does not inherently depend on
the power supply framework, which is only required for enforcing VBUS
current control. The configured VBUS current limit is typically enforced
through the charger or PMIC power path. When charging functionality is
unavailable, applying a current limit has no practical effect, reducing
the benefit of strict probe-time enforcement in these environments.

Instead of deferring probe, register a power supply notifier when the
USB power supply is not yet available. Cache the requested VBUS current
limit and apply it once the matching power supply becomes available, as
notified through the registered callback.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
Changes in v3:
 - Introduced DWC3_CURRENT_UNSPECIFIED macro to replace UINT_MAX for
   improved code readability.
 - Enhanced dwc3_gadget_vbus_draw() to return success when power supply
   is expected but not ready yet, and only return -EOPNOTSUPP when truly
   not supported.
 - Link to v2: https://lore.kernel.org/all/20260526183016.3501307-1-elson.serrao@oss.qualcomm.com/

Changes in v2:
 - Removed notifier unregistration from the vbus_draw work function to
   avoid a race with remove callback.
 - Added an early psy registration check in the notifier callback.
 - Moved power supply registration check after notifier registration
   in dwc3_get_usb_power_supply() to address the race identified in v1.
 - Link to v1: https://lore.kernel.org/all/20260407232410.4101455-1-elson.serrao@oss.qualcomm.com/
---
 drivers/usb/dwc3/core.c   | 99 +++++++++++++++++++++++++++++++++------
 drivers/usb/dwc3/core.h   |  6 +++
 drivers/usb/dwc3/gadget.c | 15 +++++-
 3 files changed, 104 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 58899b1fa96d..8558bd3f38ea 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2192,22 +2192,89 @@ static void dwc3_vbus_draw_work(struct work_struct *work)
 			ret, dwc->current_limit);
 }
 
-static struct power_supply *dwc3_get_usb_power_supply(struct dwc3 *dwc)
+static int dwc3_psy_notifier(struct notifier_block *nb,
+			     unsigned long event, void *data)
 {
-	struct power_supply *usb_psy;
-	const char *usb_psy_name;
+	struct dwc3 *dwc = container_of(nb, struct dwc3, psy_nb);
+	struct power_supply *psy = data;
+	unsigned long flags;
+
+	if (dwc->usb_psy)
+		return NOTIFY_DONE;
+
+	if (strcmp(psy->desc->name, dwc->usb_psy_name) != 0)
+		return NOTIFY_DONE;
+
+	/* Explicitly get the reference for this psy */
+	psy = power_supply_get_by_name(dwc->usb_psy_name);
+	if (!psy)
+		return NOTIFY_DONE;
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	/*
+	 * The USB power_supply may already be set. This can happen if notifier
+	 * callbacks for the USB power_supply race, or if a previous notifier
+	 * callback has already successfully fetched and associated the instance.
+	 * In such cases, release the newly acquired reference and ignore
+	 * subsequent notifications until the notifier is unregistered.
+	 */
+	if (dwc->usb_psy) {
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		power_supply_put(psy);
+		return NOTIFY_DONE;
+	}
+
+	dwc->usb_psy = psy;
+	if (dwc->current_limit != DWC3_CURRENT_UNSPECIFIED)
+		schedule_work(&dwc->vbus_draw_work);
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	return NOTIFY_OK;
+}
+
+static void dwc3_get_usb_power_supply(struct dwc3 *dwc)
+{
+	struct power_supply *psy;
+	unsigned long flags;
 	int ret;
 
-	ret = device_property_read_string(dwc->dev, "usb-psy-name", &usb_psy_name);
+	ret = device_property_read_string(dwc->dev, "usb-psy-name", &dwc->usb_psy_name);
 	if (ret < 0)
-		return NULL;
-
-	usb_psy = power_supply_get_by_name(usb_psy_name);
-	if (!usb_psy)
-		return ERR_PTR(-EPROBE_DEFER);
+		return;
 
 	INIT_WORK(&dwc->vbus_draw_work, dwc3_vbus_draw_work);
-	return usb_psy;
+
+	dwc->current_limit = DWC3_CURRENT_UNSPECIFIED;
+	dwc->psy_nb.notifier_call = dwc3_psy_notifier;
+	ret = power_supply_reg_notifier(&dwc->psy_nb);
+	if (ret) {
+		dev_err(dwc->dev, "Failed to register power supply notifier: %d\n", ret);
+		dwc->psy_nb.notifier_call = NULL;
+		return;
+	}
+
+	psy = power_supply_get_by_name(dwc->usb_psy_name);
+	if (!psy)
+		return;
+
+	/* Unregister the notifier now that we have the power supply */
+	power_supply_unreg_notifier(&dwc->psy_nb);
+	dwc->psy_nb.notifier_call = NULL;
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	/*
+	 * It is possible that the notifier callback ran before we reached here
+	 * and successfully fetched the power supply. In that case we need to
+	 * release the above reference.
+	 */
+	if (dwc->usb_psy) {
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		power_supply_put(psy);
+		return;
+	}
+
+	dwc->usb_psy = psy;
+	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
 int dwc3_core_probe(const struct dwc3_probe_data *data)
@@ -2255,9 +2322,9 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 
 	dwc3_get_software_properties(dwc, &data->properties);
 
-	dwc->usb_psy = dwc3_get_usb_power_supply(dwc);
-	if (IS_ERR(dwc->usb_psy))
-		return dev_err_probe(dev, PTR_ERR(dwc->usb_psy), "couldn't get usb power supply\n");
+	spin_lock_init(&dwc->lock);
+
+	dwc3_get_usb_power_supply(dwc);
 
 	if (!data->ignore_clocks_and_resets) {
 		dwc->reset = devm_reset_control_array_get_optional_shared(dev);
@@ -2309,7 +2376,6 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 		dwc->num_usb3_ports = 1;
 	}
 
-	spin_lock_init(&dwc->lock);
 	mutex_init(&dwc->mutex);
 
 	pm_runtime_get_noresume(dev);
@@ -2377,6 +2443,8 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 err_assert_reset:
 	reset_control_assert(dwc->reset);
 err_put_psy:
+	if (dwc->psy_nb.notifier_call)
+		power_supply_unreg_notifier(&dwc->psy_nb);
 	if (dwc->usb_psy)
 		power_supply_put(dwc->usb_psy);
 
@@ -2433,6 +2501,9 @@ void dwc3_core_remove(struct dwc3 *dwc)
 
 	dwc3_free_event_buffers(dwc);
 
+	if (dwc->psy_nb.notifier_call)
+		power_supply_unreg_notifier(&dwc->psy_nb);
+
 	if (dwc->usb_psy) {
 		cancel_work_sync(&dwc->vbus_draw_work);
 		power_supply_put(dwc->usb_psy);
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e0dee9d28740..d722d3f1402a 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -677,6 +677,8 @@
 /* Force Gen1 speed on Gen2 link */
 #define DWC3_LLUCTL_FORCE_GEN1		BIT(10)
 
+#define DWC3_CURRENT_UNSPECIFIED	UINT_MAX
+
 /* Structures */
 
 struct dwc3_trb;
@@ -1059,6 +1061,8 @@ struct dwc3_glue_ops {
  * @role_switch_default_mode: default operation mode of controller while
  *			usb role is USB_ROLE_NONE.
  * @usb_psy: pointer to power supply interface.
+ * @usb_psy_name: name of the USB power supply
+ * @psy_nb: power supply notifier block
  * @vbus_draw_work: Work to set the vbus drawing limit
  * @current_limit: How much current to draw from vbus, in milliAmperes.
  * @usb2_phy: pointer to USB2 PHY
@@ -1251,6 +1255,8 @@ struct dwc3 {
 	enum usb_dr_mode	role_switch_default_mode;
 
 	struct power_supply	*usb_psy;
+	const char		*usb_psy_name;
+	struct notifier_block	psy_nb;
 	struct work_struct	vbus_draw_work;
 	unsigned int		current_limit;
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 3d4ca68e584c..c36d2a949231 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3124,15 +3124,26 @@ static void dwc3_gadget_set_ssp_rate(struct usb_gadget *g,
 static int dwc3_gadget_vbus_draw(struct usb_gadget *g, unsigned int mA)
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
+	unsigned long		flags;
 
 	if (dwc->usb2_phy)
 		return usb_phy_set_power(dwc->usb2_phy, mA);
 
-	if (!dwc->usb_psy)
-		return -EOPNOTSUPP;
+	spin_lock_irqsave(&dwc->lock, flags);
+	if (!dwc->usb_psy) {
+		if (!dwc->psy_nb.notifier_call) {
+			spin_unlock_irqrestore(&dwc->lock, flags);
+			return -EOPNOTSUPP;
+		}
+		dwc->current_limit = mA;
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		dev_dbg(dwc->dev, "Stored VBUS draw: %u mA (power supply not ready)\n", mA);
+		return 0;
+	}
 
 	dwc->current_limit = mA;
 	schedule_work(&dwc->vbus_draw_work);
+	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	return 0;
 }
-- 
2.34.1


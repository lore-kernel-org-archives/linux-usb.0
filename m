Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A303D6CB5
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 17:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939200; cv=none; b=EZGYMmGqwRJC6Lu0n4jROlHe3k6k7vLbiHBpj556PBNQRNURfNptPNEYEzr0c1N9l9ug2zhZ2l3oV1SgXM40Od+lMsfIV4V8okU7ASSINh6u5GAlgDkWgYQY7y+oqkVsKYOt+V8JziO5yts2nbvIj7gaiVm84SpZPZx/2goAoZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939200; c=relaxed/simple;
	bh=djFonw/mmhMFAySEONiWbh/B7S7mxayto7PteHyKgqo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BEBrX5IfeG7tgvJFxNNlsjxtFbpoINJfZQ0tOMmiVjzVeH0h5PzK5UcCWc3zXhcG5A1hvFcINkTGE/Ec6DfZfn2H2+ePSwXDMqOOMIuUf6fX5VjnJO5da+1Jq4/MALly0FAwvcEIUueI6OTrVqEOVf1lTWkToNhUcPFbuyK1h9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FK6xztuR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fpu5D8Gw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FK6xztuR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fpu5D8Gw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFbdF3934337
	for <linux-usb@vger.kernel.org>; Mon, 8 Jun 2026 17:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ncl8l46wVJCPO4E+pjD4fdmfWv/QlT7fHO+
	gth+eQlU=; b=FK6xztuRK1vWV1TBT9Z2dufn/ftrlkMe5SWOeziuT23VcdPVDkr
	tzsXEYunq08TZEuHLI2pkluiUiwHHReJA4w8fxy/TQkPvn2GrTGXU1yY3SHwIbQz
	hcYHiXExXjnU4wm3jSljzaSbUg+nyeE9vZS53SmM3vsYFyvfIQWeCGjfMZCaBd3X
	4PNIPoMwiY699pBn4D+akKbukvceiMTUo1ytkWxt+lIapzary8X84H52fyvhBLmf
	BwYv4znUViIP2wKRVct93c6j1O3Z3d5nBVniUIYVyD0w0A0ThzniWjm+ivG3wDUq
	V97r7av8g40C8Y7mJwjx8+uTnykOH1VqgMQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2rsd4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 08 Jun 2026 17:19:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304e7fc90b1so4513117eec.1
        for <linux-usb@vger.kernel.org>; Mon, 08 Jun 2026 10:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780939195; x=1781543995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ncl8l46wVJCPO4E+pjD4fdmfWv/QlT7fHO+gth+eQlU=;
        b=Fpu5D8GwmclLoODJfNSxGW9lJCJbxS73qP1EspaedRbv1h9IQ+9I4rBDBO1dWc3AY4
         C5uY4Nz8upIcRAEnYD3LW31vfNmk9raq+r4DrAKo2cMMe7dBGYJI5aGMFbNZeuM4Hgdg
         D5z0Q7Kz24maW+NnTmj4YaGYB1XTjPy1/3TcZFmypJTl6S94VR5c3077NMh/4k1Z8oRF
         uFS8TcjX7GkR5F3YSznyTTgHgQNmGG4B+CrY7sZvAIFF6mSDUqeUFbJPW7NCfm6gQA9v
         IuDp0UZKZtZ+h7VCOkdFoWLw7msDgjXQ7hGAdUBZBCX1EK2oEDnj2rVhtmYpMbykxXtq
         vBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780939195; x=1781543995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ncl8l46wVJCPO4E+pjD4fdmfWv/QlT7fHO+gth+eQlU=;
        b=pstjZwOXX9XVG4DgDihQhx7AkmNhLzmp83jSQrt7o4NwSDHeTBfwj5R0ymGiALaxlQ
         mKVe4b+gO07LeAzLa2xw5GbmziORjPrtdEP5j4KhDV4XIMcfOqemGFIqj5LtJsH2WlvL
         0ZH68CR+Lo0Kb0L+OVs1rJbxMF4FOVkWD1R+wo7ljYOUTx8HKFxMjl1CJTAL1NEn5yIo
         TusIO3NU4j8eRPIbl825G9jOOWpDVo7h2uQOTrlKzRM1qN5TTuMdeLjEBhQ1tdIcmFJb
         gkVt1ltTWpkliahetZ2WQB6I5aOEKqOcxp6fJeCDVVI4gvdAvkotvTwxHLTEm9JBjF1f
         1mIg==
X-Gm-Message-State: AOJu0YxMs9t7Bot2LCpvGBhmnn9qDT2rDJBw31VUv2vp6q4MRD38bTXy
	o1Js3ZH0g7M0GaLoHwR9VqE+2l79tNGXlTPmr+TVUzKWtAqibWhxv4youMNeXHNZWavtMLNpiyc
	pAoU2AXSSuIoo9bVC2veHtO5lpK/6OAyPlAIW20J5PX6+82yTExWZDX7vWOVG4DzmtZbqFxg=
X-Gm-Gg: Acq92OEUpW4JSh7M4op0Qjxw1zIXaTKV5diF2Z/HAbmEloXWdtRJ/cF7NtjnHZ/JqY1
	X2VhuF7eQ/CwVbEyZ7WCtCq5fKXGKGXJx2Spr94GwiIjNjCJ/zAvUrNay1jxt06/NirVF0i5Mvj
	qK+yWg6eRlVRh5N0pDnbUsbOywCe3Hhd/3hQTQUzknPiyAMCTOBCn4sQBXbEi8DYAIbSfW0eLeQ
	VwbGET5cHZzdNguD9rPYHywhSF3WCKKTcJiKJl7WOeAeM5dAA1fFTYcdAxZZ2seIwf9dGY65iVd
	GpXaksfqxCqUTKiHBxCO90hnPHimVszg4BgFlPQQPPq9UOMtba1tpPCSWBItjmYuhJO7I5juidS
	hR3rBe9YTYJ8BE6HKg+3dYv79rc/ThD30izDlMdywLuTqg+NDhn1PtG/Cr4jXRA/7Ywb7kjaaoZ
	qtojnSSj3/OA==
X-Received: by 2002:a05:7301:2b07:b0:307:43ff:f32e with SMTP id 5a478bee46e88-3077b36f7b6mr8414284eec.32.1780939195187;
        Mon, 08 Jun 2026 10:19:55 -0700 (PDT)
X-Received: by 2002:a05:7301:2b07:b0:307:43ff:f32e with SMTP id 5a478bee46e88-3077b36f7b6mr8414243eec.32.1780939194452;
        Mon, 08 Jun 2026 10:19:54 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcb98aasm17284253eec.12.2026.06.08.10.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:19:53 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jack.pham@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com
Subject: [PATCH v4] usb: dwc3: avoid probe deferral when USB power supply is not available
Date: Mon,  8 Jun 2026 10:19:53 -0700
Message-Id: <20260608171953.1717369-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nFu6dwze2Y67m8fZ_n7JBML4B_8S4wKU
X-Proofpoint-ORIG-GUID: nFu6dwze2Y67m8fZ_n7JBML4B_8S4wKU
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a26f9bc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=BnH1jSTHCRmwS-4C6JUA:9
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2NCBTYWx0ZWRfX98Sp6pV7uSS8
 idjfvgEnCOOkxNdWWLPoOcQtbNBdd4AqXgpb60V8MUQ5rsiHZQWEynCQJokwEejoyG5VBzF7l1y
 1b++oAfv2YDeU2QArBQoml8UzKMbR4Kp3S456j58qKS9L0HmVm1/EfmIPdEyCp01NATuIdgdx6g
 1ll0Q0ueia9o7UZS9xf2D7HjDsbCVJ5ZW9aHuyRTB0Fb55Swz9NV+xT/H4u8tf7KTr7lLILiXXN
 B4tNaYW1QBzNkFbjSJ1ZUK1gs0IzFEH1hc3cNO8w0iqun2DIEgCLhRKPyzoHyNBipKkseS+IGSC
 wZECM6HikTAlwAVVuqWHaTkKQH8NK08oo7ixAldhT53c+2cl/3/pGacvm2ACHwTtgzswxOG4Sm5
 ZRGnZbBxsm9XRq/iin71LFqMcnBC1Jz/ND7VzqDL6ZIGYqA7KBrD3FExcfvRO8oXJRpO3RBoKr9
 5bov0XRTwPh7n9TFisw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080164

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
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v4:
 - Moved DWC3_CURRENT_UNSPECIFIED macro definition to be placed right after
   the current_limit field in struct dwc3 for better code organization.
 - Link to v3: https://lore.kernel.org/all/20260605181142.1925832-1-elson.serrao@oss.qualcomm.com/

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
index 65213896de99..9c750f90213a 100644
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
index e0dee9d28740..07e0e1b8e804 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1059,6 +1059,8 @@ struct dwc3_glue_ops {
  * @role_switch_default_mode: default operation mode of controller while
  *			usb role is USB_ROLE_NONE.
  * @usb_psy: pointer to power supply interface.
+ * @usb_psy_name: name of the USB power supply
+ * @psy_nb: power supply notifier block
  * @vbus_draw_work: Work to set the vbus drawing limit
  * @current_limit: How much current to draw from vbus, in milliAmperes.
  * @usb2_phy: pointer to USB2 PHY
@@ -1251,9 +1253,13 @@ struct dwc3 {
 	enum usb_dr_mode	role_switch_default_mode;
 
 	struct power_supply	*usb_psy;
+	const char		*usb_psy_name;
+	struct notifier_block	psy_nb;
 	struct work_struct	vbus_draw_work;
 	unsigned int		current_limit;
 
+#define DWC3_CURRENT_UNSPECIFIED	UINT_MAX
+
 	u32			fladj;
 	u32			ref_clk_per;
 	u32			irq_gadget;
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


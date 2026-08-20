Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9E547ECCB;
	Thu, 20 Aug 2026 21:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787260686; cv=none; b=ZSw5m6K7Sboc6itZyMlQF7twdD2F8vC0eU8mPEUbFYZjKXY9uXn3WXPDhzUWPmQzYDyCruDtpahwUZnWzySa0djPJbwdvfdj6XJ2XihJEj/ys+0YsMwK+6PUUbUZse7tP1y7x4O/7rp0vXQZPSi1saRc7+XCEi1W+rbCsghmhCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787260686; c=relaxed/simple;
	bh=oSsU1SNlUI+iYmsPHyzirwXiLvA8vOIzjQUL65s252k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=glr6uqg+f2uO1dT4AgIgvmMJZUwXHepUjlu/NEdh6aJHvRTM2oOzLj8IP29ctOShgDVMrP6mJlQ5P4Jt696BS46V3ZS9Rnl7nCWj3K5YHf9gMqTbdsySQVKebN3ge8WY/4xatnaWmcPjfdgJIMXjU+ykxVxqzbLLsffCtRrx6SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGFYbPGk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGFYbPGk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BB50C2BCB3;
	Thu, 20 Aug 2026 21:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787260685;
	bh=oSsU1SNlUI+iYmsPHyzirwXiLvA8vOIzjQUL65s252k=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=WGFYbPGkX3gnDcpQJlIKms/Cyv+nyLccSVanceqNY0gcxzB1JK1oVtjIWbHEckK3e
	 4RLparPpBdv4u+ZoPd3gyiSVBe1N63gUFKP5ke/liki8cwVCIkXJn3AcCeWqwyNH0w
	 cMQxFSsRW+xOCWa1zOcv+wzyTZbEva3tkcYFnSrSRKFfo2NPvLRUuMyyXN8Tnp/3He
	 SioeBtRCMEKsMyLU/L4fPQXqwhRdIRU+0BkR93jWKgaFA90iM+W8Cj+Oe1Kz797iAG
	 twyU3hUnDzJwMg1oWH5jCREyEa2ShSvMtxuScIwG/w1Sf18tb4tcOJjlMNR/PETUBD
	 8DDGlXlocdsUQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63AE3C5DF8C;
	Thu, 20 Aug 2026 21:18:05 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Thu, 20 Aug 2026 21:17:58 +0000
Subject: [PATCH] usb: typec: tcpm: Support native battery energy properties
 in battery AMS
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-tcpm-energy-props-upstream-v1-1-0a0167863848@google.com>
X-B4-Tracking: v=1; b=H4sIAAVvh2oC/x3MQQqDQAwAwK9Izg2kuyptv1I8LDZqDq4hsUUR/
 +7S41zmAGcTdnhVBxj/xGXJBfdbBf2U8sgon2IIFFp6BMK11xk5s407qi3q+FVfjdOMqX7G2MS
 BqKmhBGo8yPbP3915XjqptdtsAAAA
X-Change-ID: 20260820-tcpm-energy-props-upstream-a493353f0054
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787260685; l=4796;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=3ujd4nj9Hfogfm+nYqmaVH090hvwF2tQMDh7GmzAo9w=;
 b=KFARS5HnKsDD8jDni0Aolvgr/9HPD5Rv/uHIRcq1Ptd7jRhmv7JzCgQaYilomlwSgi6WghH1D
 wzUAFXjvqLMCKgmZvfqocDBCROfMukZII3XilmZNMHUrTXJ2p3XT0BO
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com

From: Amit Sunil Dhamne <amitsd@google.com>

Some fuel gauges report battery telemetry in energy rather than charge.
Add support for querying native energy properties for Battery Status and
Battery Capabilities AMS, falling back to calculating energy from charge
and average voltage when primary properties are not supported.

+---------+--------------------+----------------------------------+
| Sr. No. | Primary            | Fallback                         |
+---------+--------------------+----------------------------------+
| 1       | ENERGY_NOW         | CHARGE_NOW + VOLTAGE_AVG         |
| 2       | ENERGY_FULL_DESIGN | CHARGE_FULL_DESIGN + VOLTAGE_AVG |
| 3       | ENERGY_FULL        | CHARGE_FULL + VOLTAGE_AVG        |
+---------+--------------------+----------------------------------+
Note: All properties above are to be prefixed with POWER_SUPPLY_PROP_.

Closes: https://lore.kernel.org/all/amVJ1u67qHENBQ5l@venus/
Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 57 +++++++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index a8cd1959c426..0d7dc0b51c87 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -410,6 +410,9 @@ struct pd_timings {
 /* Convert microwatt to watt */
 #define UW_TO_W(pow)				(div_u64((pow), 1000000))
 
+/* Convert micro-Watt-hours to USB PD energy (increments of 0.1Wh) */
+#define UWH_TO_PD_ENERGY(energy)		(UW_TO_W((u64)(energy) * 10))
+
 /*
  * As per USB PD Spec Rev 3.18 (Sec. 6.5.13.11), the number of fixed batteries
  * that a port can be queried is restricted to 4.
@@ -1580,8 +1583,7 @@ static u16 tcpm_charge_to_energy(int charge, int voltage)
 {
 	u64 energy = div_u64((u64)charge * voltage, 1000000);
 
-	/* Battery telemetry is reported in increments of 0.1Wh */
-	return (u16)UW_TO_W(energy * 10);
+	return UWH_TO_PD_ENERGY(energy);
 }
 
 static int tcpm_pd_send_batt_status(struct tcpm_port *port)
@@ -1612,16 +1614,17 @@ static int tcpm_pd_send_batt_status(struct tcpm_port *port)
 	else
 		batt_present = val.intval > 0;
 
-	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_CHARGE_NOW,
-					&val);
+	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_ENERGY_NOW, &val);
 	if (!ret) {
-		charge_now = val.intval;
-		ret = power_supply_get_property(batt,
-						POWER_SUPPLY_PROP_VOLTAGE_AVG,
-						&val);
-		if (!ret)
-			present_charge = tcpm_charge_to_energy(charge_now,
-							       val.intval);
+		present_charge = UWH_TO_PD_ENERGY(val.intval);
+	} else {
+		ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_CHARGE_NOW, &val);
+		if (!ret) {
+			charge_now = val.intval;
+			ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_VOLTAGE_AVG, &val);
+			if (!ret)
+				present_charge = tcpm_charge_to_energy(charge_now, val.intval);
+		}
 	}
 
 	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_STATUS, &val);
@@ -1678,19 +1681,31 @@ static int tcpm_pd_send_batt_cap(struct tcpm_port *port)
 
 	invalid_ref = false;
 	batt = port->fixed_batt[batt_id];
-	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_VOLTAGE_AVG,
-					&val);
-	if (!ret) {
-		vol = val.intval;
-		ret = power_supply_get_property(batt,
-						POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
-						&val);
+
+	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN, &val);
+	if (!ret)
+		design_cap = UWH_TO_PD_ENERGY(val.intval);
+
+	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_ENERGY_FULL, &val);
+	if (!ret)
+		charge_cap = UWH_TO_PD_ENERGY(val.intval);
+
+	if (design_cap != BATTERY_PROPERTY_UNKNOWN && charge_cap != BATTERY_PROPERTY_UNKNOWN)
+		goto send_cap;
+
+	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_VOLTAGE_AVG, &val);
+	if (ret)
+		goto send_cap;
+
+	vol = val.intval;
+	if (design_cap == BATTERY_PROPERTY_UNKNOWN) {
+		ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN, &val);
 		if (!ret)
 			design_cap = tcpm_charge_to_energy(val.intval, vol);
+	}
 
-		ret = power_supply_get_property(batt,
-						POWER_SUPPLY_PROP_CHARGE_FULL,
-						&val);
+	if (charge_cap == BATTERY_PROPERTY_UNKNOWN) {
+		ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_CHARGE_FULL, &val);
 		if (!ret)
 			charge_cap = tcpm_charge_to_energy(val.intval, vol);
 	}

---
base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440
change-id: 20260820-tcpm-energy-props-upstream-a493353f0054

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



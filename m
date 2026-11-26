Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795653194;
	b=3kihgmbwSLGKCv4Mq/Oa7mppHdM1fzhowGh9eh6n6KhNJlkWyBHhWPOiUXlIrUQ6b1Em
	 oXS6/phFBzOHaZVWwtavrm/rJfHmU88rjsfe8K5H6dWjQR4twEaZMlDJIGddYhN7Dkoxf
	 3WrGy47gxjH7L8zx1RvM+HXO2cD9LxSe/DP0Ud9ZY8HIqTE5B1Si30nXg6qJihT1eHgAg
	 c0EAbfTFi0zkP0Obl5sV3W5KwJhR9mGLrkX6IKWeV9I3CV8L7pahyinbkSZRU+ppAxnJW
	 4bEkV451QaIdLYM/kxzK9Jhre3bJfJGroKSeyFUsRusrkMZtJAaxo95mmWpEMLSINOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653194;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=3iyCpXEEW5g2CDdAlA3IaZaxz8XVV8pODtHbPL4GK2M=;
	b=LEYdbQe4qjZnnhBSuX8o+uZCfLa16Yq88O7lD9etNlPCg842SFyEJgIk/1smjbRSOBXv
	 5W1g6fONddbpBPsOOq7vzDdOl4n+N0R7+PomvKloUZKfxPbs3DLUHh0hNVcgI54RKjqhk
	 EY7wvThYOd5TrdcZSvFuslK+9Xbhyperkp3Qg05eV3MgPVLjsM6mR+ALCBqhVCvQqWFLw
	 FBUq2zfTHDLXs7ZN+Xdfu/jt7kjmMY27iL/DHziWwkuqgR+OKFiO9HZ56EdbYxly6f57S
	 JMT775hsypLl5N/28Uf57/GDonQ2v5Zo9LPX2KGL2nQzjpCHDHNlW0PBla8kxdztp0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUkGVEUu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3934606A321;
	Thu, 26 Nov 2026 00:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUkGVEUu
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795653193;
	b=uf3WJ3s0OA9mBAa4wPcmnjyT8x8i0ALCiLRDmBbEYkhFrG1vOVf3dKbPtfxdRLT2gXFJ
	 VIOEp6z42pAuntULp4DlqDWeD2irphGaATcfLqIKodPYfL0G4hLQZgeRJ3gYCVXCfZmzY
	 357t20FsphHq0JWbPVT6vNV+9SAgzIF39F10zdDeLFfOiR9KGfVg7Cwf9EO2LNFrFdHwZ
	 gUPuiHIoEWhPMiTHy8g75j2nblXnf1wemN9Kr9FbjuH/iorWlKb626Vf3rxO9OFUbzfZR
	 pRDmcrC9toWHz1tcYAJMaG79y2jhZ1kDSW7GYuy4E2PIsxiLNdkKCCUejR7v/N/RENA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795653193;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=3iyCpXEEW5g2CDdAlA3IaZaxz8XVV8pODtHbPL4GK2M=;
	b=GejwTrol2/jmBPPROSu3Lg1qCD4j4o4Tpzp7y628fCAcxmB3JFPAAlwL1TBVBLbYClda
	 Pc68PCBZhZgxND/xWqjox5V3SeBx7QmWbDvbwfzwSqzHG4J8TnhbegZGoY9IYdX8y43IA
	 mWi3LyOmgQk/F1Fz6GGkJPfXDDHXdFMfcQ/m7gsvf/lss3GCOu1mfX2CFLphmQZUMH1XK
	 ceTfun9H5Mindkg2771QHW5u2GtwKCqB3QoN9tmVE2RkYdSujaSN69v9BOv5fHBQPPJH7
	 M2gihcn/Wtr3NV+ma5WuyFKKwdbBfvyyaKsWBfHWKV98sWh/KxoanwV8hFx/5vPYBYg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B37C1F000C4;
	Thu, 26 Nov 2026 00:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653193;
	bh=3iyCpXEEW5g2CDdAlA3IaZaxz8XVV8pODtHbPL4GK2M=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=NUkGVEUuyoVMyVlWFLxbu8YZDojba+ahyIPKKCziPLZaqrYvNJVyq4wsYTuwMT/y/
	 9osymx/hyUZxK+tPxUG2OR/pDd5S0029nz4lszGBXQrTvyylA8NwzlThcRLum0pwi3
	 Y4BJSBs0maWk1pE9ItDLYGblwFyhPFmS6Vh7qRcOjZ3udxDK2XcB1sAbzeEibjqVd/
	 3ADyYtUJDyK+/c0c1wYGNqXoO+am7DwHRcqRu54vE4TtExVozC0gmNZ/NjDCycUV0Q
	 SY7CuLqOJy+PvntGztTOrIeke32OraOegLIRXM/EeCXx/4w6TIf9zi+a+XL1N6R9VK
	 u6uw5750jzSDg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D3E554D108;
	Thu, 26 Nov 2026 00:33:08 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
 linux@roeck-us.net
Cc: badhri@google.com, shufan_lee@richtek.com, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: tcpci_rt1711h: restart DRP toggling on Ra/Open
 in TOGGLING
Date: Thu, 26 Nov 2026 00:33:08 +0000
Message-Id: <20261126003308.48940-1-iasnezhkov@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795653188; l=4594;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=48DbZvenyoxSQC7pGCnI1KXfaG2DTeuuUgLBgoGs71c=;
 b=bcWv86hvlPh2cPfbmwLklE4wWfQw8FOHZukHKNnU9UmWJEOatPVmFd8r0xg4QVYGO8RgFJ+Xb
 f5OGUCXC3mCB3WGro977IpNVHl/xZv5E900SX0pQeIysIS0c/SgbgYs
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com
Content-Transfer-Encoding: 7bit

From: Ilia Snezhkov <iasnezhkov@gmail.com>

When a DRP port using RT1711H/RT1715 or its ETEK ET7303/ET7304
compatible silicon is connected via an e-marked USB-C cable (for example
to a USB-C PD charger whose own port is temporarily open), the hardware
can stop DRP toggling during its Rp phase upon detecting a single Ra
pull-down, reporting CC_STATUS with LOOKING4CONNECTION=0,
CONNECTRESULT=0 (Rp), and (CC1=Ra, CC2=Open).

In tcpm_cc_change(), case TOGGLING only transitions out of TOGGLING for
source (Rd), sink (Rp), audio accessory (Ra+Ra), and debug accessory
states. (Ra, Open), (Open, Ra), and (Open, Open) fall through with no
state change and no call to tcpm_start_toggling(). Because the TCPC has
already exited hardware toggling, the port remains permanently wedged
presenting Rp: PD chargers never see Rd and never source VBUS, and
subsequent USB host connections fail to enumerate until another
TCPC_CMD_LOOK4CONNECTION command is issued. (fusb302 handles the same
condition by restarting toggling on unexpected CC states.)

In rt1711h_irq(), when TCPC_ALERT_CC_STATUS fires with
TCPC_CC_STATUS_TOGGLING clear while tcpm_port_is_toggling() is true and
TCPC_ROLE_CTRL_DRP is set, decode (cc1, cc2) identically to
tcpci_get_cc(). If the state is (Open, Open), (Ra, Open), or (Open, Ra),
clear TCPC_ALERT_CC_STATUS, preserve RP_VAL while resetting CC1/CC2 to
Rd with the RT1711H DRP=0 settle delay matching
rt1711h_start_drp_toggling(), re-enable DRP, and issue
TCPC_CMD_LOOK4CONNECTION. Return IRQ_HANDLED so any co-occurring alert
bits remain pending on the level-low IRQ line and re-enter cleanly.

Observed and verified on hardware (MT6789 phone with ETEK ET7303
VID 0x6DCF PID 0x1711 DID 0x2173 and Anker/Apple USB-C PD chargers with
e-marked C-to-C cables) as well as a 1542-case host state-machine test
covering all 64 CC states, RP_VAL preservation, co-occurring alerts, and
I2C error fallbacks.

Drafted with an AI coding assistant.

Fixes: ce08eaeb6388 ("staging: typec: rt1711h typec chip driver")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 47 ++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index 0581659..e03eca7 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -253,6 +253,51 @@ static int rt1711h_start_drp_toggling(struct tcpci *tcpci,
 	return 0;
 }
 
+static bool rt1711h_cc_needs_retoggle(enum typec_cc_status cc1,
+				      enum typec_cc_status cc2)
+{
+	return (cc1 == TYPEC_CC_OPEN && cc2 == TYPEC_CC_OPEN) ||
+	       (cc1 == TYPEC_CC_RA && cc2 == TYPEC_CC_OPEN) ||
+	       (cc1 == TYPEC_CC_OPEN && cc2 == TYPEC_CC_RA);
+}
+
+static bool rt1711h_restart_toggling(struct rt1711h_chip *chip, u8 status)
+{
+	struct tcpm_port *port = tcpci_get_tcpm_port(chip->tcpci);
+	enum typec_cc_status cc1, cc2;
+	unsigned int base;
+	u8 role = 0;
+	int ret;
+
+	if (!tcpm_port_is_toggling(port))
+		return false;
+	ret = rt1711h_read8(chip, TCPC_ROLE_CTRL, &role);
+	if (ret < 0 || !(role & TCPC_ROLE_CTRL_DRP))
+		return false;
+	cc1 = tcpci_to_typec_cc(FIELD_GET(TCPC_CC_STATUS_CC1, status),
+				status & TCPC_CC_STATUS_TERM ||
+				tcpc_presenting_rd(role, CC1));
+	cc2 = tcpci_to_typec_cc(FIELD_GET(TCPC_CC_STATUS_CC2, status),
+				status & TCPC_CC_STATUS_TERM ||
+				tcpc_presenting_rd(role, CC2));
+	if (!rt1711h_cc_needs_retoggle(cc1, cc2))
+		return false;
+	base = (role & TCPC_ROLE_CTRL_RP_VAL) |
+	       FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RD) |
+	       FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RD);
+	ret = rt1711h_write8(chip, TCPC_ALERT, TCPC_ALERT_CC_STATUS);
+	if (ret < 0)
+		return false;
+	ret = rt1711h_write8(chip, TCPC_ROLE_CTRL, base);
+	if (ret < 0)
+		return false;
+	usleep_range(500, 1000);
+	ret = rt1711h_write8(chip, TCPC_ROLE_CTRL, base | TCPC_ROLE_CTRL_DRP);
+	if (ret < 0)
+		return false;
+	return rt1711h_write8(chip, TCPC_COMMAND, TCPC_CMD_LOOK4CONNECTION) == 0;
+}
+
 static irqreturn_t rt1711h_irq(int irq, void *dev_id)
 {
 	int ret;
@@ -274,6 +319,8 @@ static irqreturn_t rt1711h_irq(int irq, void *dev_id)
 		/* Clear cc change event triggered by starting toggling */
 		if (status & TCPC_CC_STATUS_TOGGLING)
 			rt1711h_write8(chip, TCPC_ALERT, TCPC_ALERT_CC_STATUS);
+		else if (rt1711h_restart_toggling(chip, status))
+			return IRQ_HANDLED;
 		else
 			rt1711h_init_cc_params(chip, status);
 	}
-- 
2.54.0 (Apple Git-157)




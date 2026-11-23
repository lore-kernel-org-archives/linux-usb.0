Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.88
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795409903;
	b=y96s9W22fE0oQsRRggqkAn4/W7+DM3HytBJyqDG3ZQ3MgULrub5DSdlB/YWaJzdsCLqY
	 qrSw8elKjjz/zwPtdBiewyw+OxkyoxqpQ3en7GXLgjJolZ8genJNX35NS8Y2ggMS5I69e
	 xzwzVYvniJFo1UtVbEBa0FZuEhu/3RU9qnY/IZ1b6yHa/4jekdv1e+Uiq6Ugm2J9CGECG
	 VyzsLnsXeeEFO4Ct1dTyZ9goNdu4YdJ/s9Ylxw0Tn7VEX6RXuxDayBIdTA0aByRJo0sfm
	 bnM7CWsjimiD6HjG7a9nrqNs3HcwXgxEIZxdhDDujsCrNSAO1L9i0Fl2kNa1MUtaR0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409903;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=MdtP9MNjKelzS2HyGgFuOpx+k1IXUf3VspmjY2T4UV0=;
	b=A2ayisRgS4j1j1LHSKeItzeF9MUeC+w4Qjyet5bflgruUy9SYlhPAOLFVQeUJgE6iu3K
	 nSeBpJ4r6nEkv/Y/0URpCfx8kqDEhIlFO+kl9Gr7YtbEHkRB5nwBZahfxlYCudab7VHe6
	 3MOuXuRMLfT0OwRpu7SGy39Zry6TKFQfe3aI33scbWiHtnQqtGc69IBJPVbLOTwRAvLAY
	 Z3HIWlcZiMoDvDLUSLPkxBNwv36uZchRqyh/ANPuc56qqmsOZ/8SXduDnYOIwHxqdZ8bH
	 sL9HGfkCwjMdrtaffJCB/UxG7Zru+pzPPxBBqHjZ51B2r6mrkQrSdYbWc1L5SZxZorw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.88
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022088.outbound.protection.outlook.com [52.101.126.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D64606A31A;
	Mon, 23 Nov 2026 04:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0D64606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obCLfHVC2wkKyAeKM6scM3MyXT+b3MeGoZdXTpEVcGcAtF5n5sMWjNQJXSX8TRWdh1oUo5Wq3QXEN9/kh8PdponuIMb5bAYuLAZSd4g2xHwtC9hhOfi3VZRfRxnIB/P4UM2AVkzzpvwfnXCJrhvNrQZuMlFWLr5przjp4/1bQQQYvKqVbnS6xGoYewJnxeKAc68ii8SUrfV/dwFCGBZgPCmleZbVDJ29a1KSzvyWOFioE9bncS0LzkwueT/bxp8uzaYWtzZW2zWniBLox5zsR5PkjO0QUswbvBpcl3ghq5QzL8W5X2RJiecDxxNIr2INiFq4CA906ixHwaSrb/CUuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdtP9MNjKelzS2HyGgFuOpx+k1IXUf3VspmjY2T4UV0=;
 b=MKZStMXVlzDelte1+3OrV0tBfiE0gFdPg5uHjF6TXqxcp0TuPyvetCrExE92l+jN+XGMvQFAbe49gxOUUHjX8tlRYc6qQSKNSWpTU1bVP49BDzx+zigbuAkCm6NGir05khoK7IbBqQ8Q1wAjI+tYIE576Fo5oQxjxUhKEI8k4tJ+AuIcwOcmN1mWxMr8nRa6QvdI6QpgFrPMTdaTzGnqybyBCDwwZffc5807Y8q6tLEEMv/0QXaT+x49UJ4GQs87knFfsnlLD2x19yTWKdFUsI1LWu64iTMOSQrqSrhvTrcSlFZIXY6eyNPvnRG1pY4Igaf5XREpvkiKkg4VVt+CUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P301CA0017.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:2b1::18)
 by SE3PR06MB8229.apcprd06.prod.outlook.com (2603:1096:101:2f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Mon, 23 Nov
 2026 04:58:18 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:405:2b1:cafe::62) by TY4P301CA0017.outlook.office365.com
 (2603:1096:405:2b1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 04:58:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 04:58:17 +0000
Received: from gary-System-Product-Name (unknown [172.16.66.27])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CF140427EFC7;
	Mon, 23 Nov 2026 12:58:15 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v7 0/2] usb: typec: add CIX Type-C PD controller driver
Date: Mon, 23 Nov 2026 12:58:13 +0800
Message-ID: <20261123045815.812561-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|SE3PR06MB8229:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ef1e80ff-365f-4ba6-c8ad-08df491e63b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|261026121527099003|10067099003|56012099006|261028144727099003|261021121427099003|261022075727099003|261021123027099003|261009223027099003|261022105027099003|261026140227099003|261102123227099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	yySG4POhj0lxbjXOkL8l5HZ3Z1cipym2KTdwxz/XhFFHbOS6vumL4ofbaMi3KgWD4fIurc49zyjDM36UC6rrXd1o3ZTSNf746kvsJy+wtYDgqoln+upI1k/zUoGrWqGQAlXJ6cLQ3USQwpF3RiK7PMzH476Mm9gMFL/Miv3SQumKFudGg8wKopuWvoo+h//ifeXMUoKHALAoLT4cz3Fz+QreZ9gZK1Mmf36FnEgbyFdqre89UoiuuQx8S6wx3X1s8p0WAENYFoIv4Ml7CLvKo8EOzRY7Kvk3TQSHk0WUT6jiSrIvphz8QnT8YpSpv1uDaklSczjwbYImUA5GeEiR7c/DUftDNbENHt1yWQWOjDnWE4ya16VNAq2oLSWhl+f4LDtMOo74mAt0/Hv6Daoh5HI3DRypwbF2kxUpQ7ptUZ0wf1Xr5+bK7kjN1p3td/4q7PTlDxEdiPqzgsrv66YJLm9Ik2OzcK06OVo0B4eGdA30dUjLTJyk5nh7jhiPOjU7XfTooiiZwBraBBFxKHgug5FOUsIZwGMWykoBqYwEjINPeqXRkwaJbyptmJjU9dN0LTi/WTvXKSqHz37+537EnawqOalUxUZq8e/AwUXZ6S6HfH3yIRr7TZ40Tkf8QGr4otdilEuE8zWdoXRmKK1uipYHsn7cL4D65No8OE9/XqXOa2d0ty2m1ek+x2rApnGbKKGpBPvLYPCFnt5rlnlhiQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(261026121527099003)(10067099003)(56012099006)(261028144727099003)(261021121427099003)(261022075727099003)(261021123027099003)(261009223027099003)(261022105027099003)(261026140227099003)(261102123227099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kQT7XrLbmkeeRWSBUDW77RrkS0j9Eu70kGTlkhLIuHmx+KwY+CuoOxdyVfI6IUBG3tUTTZS2nO2rY3Z5gcvGVt6+AJHYsxGHt9j8k0NX7wnO+kd5vCM1aQa5kyE1HRilD3OL0sqQquCWsA8HS0CyVtxr3t5QP6nO/N//WB1tkEyj6HNK6mLororXXWRaPbT9MiTnEOQNFQOjw7Mu7Kx0bKegL0uFlmi2wflF7bwKcMZqKsxy33Gz7HLajJSVdXcbWaZCR7/fZbxT490WFOJzoMeG//3OBvX2jkzldy8q7r+UTQRVvLAXu2/Qy561t27Q0W9bgUEVMaozJl2VMvxwcCFlmKPRc0v6OnvpuPs5o7qb4bh6/WOskAAeIh4j7hPFXFSeK0wkypbp0oKDtJv0pasUu7w9JB59Ykmdn6Q9HtSbnXPbPZ4bNOrB0WPrpsmy
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 04:58:17.5070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1e80ff-365f-4ba6-c8ad-08df491e63b0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8229

This series adds a Type-C PD controller driver for CIX platforms.

The first supported controller is the Realtek RTS5453H, a stand-alone
port controller: the CC and USB Power Delivery state machines run in
its firmware and are configured through vendor registers rather than
the TCPC register interface, so it cannot be driven by the tcpm
framework. The driver translates the controller status registers into
Type-C class notifications and drives the platform PHY's orientation
switch and mode mux.

The register addresses are agreed between CIX and the controller vendor
and are configured into the PD firmware, so the host interface is not
specific to the RTS5453H. The driver is therefore named after the
platform integration rather than the first chip: further
register-compatible controllers are supported by adding their compatible
string, without renaming the driver, the module or the Kconfig symbol.

Patch 1 adds the devicetree binding and patch 2 adds the driver and its
MAINTAINERS entry. The DTS patches from v1 are sent separately through
the SoC tree.

Changes in v7:
- Align the register definition macros.
- Use guard(mutex) for the event handler lock.
- Return the actual I2C/regmap error from the event handler instead of
  -ESHUTDOWN, and drop the now-redundant -ESHUTDOWN to -EIO conversions
  in probe and resume.

Changes in v6:
- Explain the host interface in the commit message instead of the I2C
  transport, and state that the register addresses are agreed between
  CIX and the controller vendor and configured into the PD firmware, so
  the driver is not RTS5453H specific.
- Trim the commit message to the facts that are specific to the
  controller; the kernel-side details are kept as comments in the code.
- Drop the partner register and unregister dev_info messages and print
  the port state summary with dev_dbg.

Changes in v5:
- Exclude HPD_IRQ from the status comparison and handle it as an event
  of its own. The bit stays set until the interrupt is acknowledged, so
  caching it in the previous status made a repeated HPD interrupt look
  unchanged, and an acknowledged event look like a status change on the
  next interrupt of a sibling port.
- Reprogram the port only when the decoded status changed or an HPD
  interrupt arrived, and skip the orientation write when the orientation
  did not change, so a shared interrupt aimed at a sibling port no
  longer re-reports unchanged state to the Type-C class. Invalidate the
  cached status when a port update fails, so the update is retried on
  the next interrupt instead of being lost with the acknowledged event.
- Take the alternate mode device lock around device_is_bound() and
  typec_altmode_update_active(), so activation cannot race driver
  unbind.
- Keep the shared interrupt line masked for the whole system sleep:
  ->suspend() disables the line and waits for an in-flight handler, and
  ->resume() reads the status back and acknowledges the controller
  before re-enabling it. An event during suspend can no longer loop on
  the level-triggered line. Wake-up through this line is not offered:
  the GPIO controller behind it has no irq_set_wake() callback.

Changes in v4:
- Keep the interrupt disabled across system sleep and re-enable it in
  ->resume() only, after the parent I2C adapter has resumed.
- Return IRQ_NONE when the port status did not change, so that the
  interrupt core can attribute the shared level-triggered line and
  disable a line that stays asserted.
- Mark the DisplayPort alternate mode active only after a driver is
  bound, so that the module reference taken by
  typec_altmode_update_active() stays balanced.
- binding: drop the nodes below the documented device from the
  example.
- Carry Reviewed-by from Krzysztof Kozlowski.

Changes in v3:
- Report the Type-C data role from the controller status for every
  connection, including DisplayPort-only configurations where no USB
  data role is available, instead of deriving it from the USB role
  switch.
- Pass the port alternate mode in the mux state, matching other
  firmware-driven port drivers.
- Force the USB role switch to be reprogrammed on system resume and
  check the enable_irq_wake() return value.
- Acknowledge a pending controller interrupt during probe so that a
  shared interrupt line is not left asserted.
- Do not drop the borrowed fwnode reference when parsing the connector
  properties fails.
- Treat all fwnode_usb_role_switch_get() errors as fatal; a connector
  without a role switch link returns NULL, not -ENODEV.
- Drop a redundant include.

Changes in v2:
- Drop the DTS patches from the series.
- binding: describe the single connector as a plain "connector" child
  node instead of an addressed node, and stop requiring
  "try-power-role", which only applies to dual-role ports.
- driver: add the missing USB_ROLE_SWITCH Kconfig dependency.
- driver: register the DisplayPort partner alternate mode only for
  actual DP connections, with a valid VDO, call
  typec_altmode_update_active() on attach/detach and set
  no_mode_control since the firmware drives mode entry.
- driver: never pass a NULL alternate mode to typec_mux_set(), and
  treat debug accessories as disconnected everywhere.
- driver: handle USB 2.0-only connections in orientation, role and
  mux state.
- driver: only cache the USB role after the role switch accepted it,
  and force a role refresh on resume.
- driver: use typec_get_fw_cap() instead of open-coding the connector
  properties.
- driver: acquire the mux and role switch before registering the
  port, use dev_err_probe() on probe failures and reset the mux to the
  safe state on teardown.
- driver: remove the undocumented disable_pd_interrupt sysfs attribute
  and the manual disable_irq()/IRQ_DISABLE_UNLAZY handling that could
  leak the shared IRQ's disable depth. This also fixes the build error
  reported by the kernel test robot on sparc64 and s390.
- driver: use a named i2c_device_id initializer and add the missing
  hibernation PM callbacks.

Tested on a Radxa Orion O6 (Sky1): attach/detach, USB-only and DP-only
alt modes, cable orientation detection and HPD reporting all work.
--

Gary Yang (2):
  dt-bindings: usb: add Realtek RTS5453H Type-C port controller
  usb: typec: add CIX Type-C PD controller driver

 .../bindings/usb/realtek,rts5453h.yaml        |  70 ++
 MAINTAINERS                                   |   7 +
 drivers/usb/typec/Kconfig                     |  13 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/cix_pd.c                    | 766 ++++++++++++++++++
 5 files changed, 857 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
 create mode 100644 drivers/usb/typec/cix_pd.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.50.1


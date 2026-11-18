Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794978800;
	b=SVUGur+203DGIL5dqYpMHOQ13I4UzTUuMPmfPqSE3scHPufCUyV8wnydOO8dmnwVCKki
	 x1xrc6MD1gF/SX1zhVQFn712xpqlikjbv5HcmBk0fkzo8LbMTsjO9qCbiiUGuU4hlriBx
	 2E7E9gKbVXiCNLK+bm9vyQ9yB5OSJjFiebdQIAv2I7R87fCP6RHCczEzQP2vmWqTs53LM
	 oYvN4TusBOwZ9nQqdgviuZPmxTsy9F/y04qFdNz0vuF/hqX6s5xvtDU3zVPvQ3p/eFvJL
	 dk8OHrK6woyFbA09JQAnYjHIqvlIKDiVIbBzclRA1S3/ydFH3g6N499Bhoi25/AgnwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978800;
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
	bh=b5hK6A8JSZ53HXa204O58YV27/IeDm3JVwoktRlrji8=;
	b=jmidkOBJW8EuH+dsGA7VuIoN9EVDFZD7tWIAE8lVcLjpO7uoeXgsepi60PWBf+7JD1k8
	 Bkm6GX/TBFWnUE49OEZGoQJkNrTQ381KIAgpWG+Uw7zdGQMZDO//HcFddWr0k3X6QVfdp
	 LgnQyGpUo2nNjsOT2z0ZEVx92cqbw8Q/yeRXCDcEQvUYEvU987TDt+bQk7OLaU+koSlqH
	 iNYNDhaYsZJZyxZvMc2fjhSqCdf5FNxIYZ6E1IHsdQfyrlgZGYqnSYVugIwfueOwenYuC
	 SKLV0Kz1zZpKj+FXrYpfZ8pcXOr6DN/HO3Py8n4Qoe131x0vy1yNnrepbned5jGhUqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.75
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022075.outbound.protection.outlook.com [40.107.75.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B65606A325;
	Wed, 18 Nov 2026 05:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7B65606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYdvKnP6WMb+HZSGbxDx3HhIzyYahPhzUrQAx7hv72G2rkbWUXUy+i1PhsOmfeyuD4QMDX/yRBsJP24aoXoO88Wf4/Q0QlXVnpI/74FbCYrgpUrwE9ZU1pLrGUDz2dp9TwN3Zma5M2cE4wHUKPIEtew8iHLibucFpY6q0cMW0nttxB53Is0R5pNmV9zFm6MDEmmcIfzmy/CN5cTStvCt/VjHF9tZHNUiANjoJwW6NjPmvtvlyHQKp4h9GgfWhPEsMyzR26LF/fgo2Cma9eiJ1GtHvH6VPDXbzVCLGlWNNaY4dsVeG0eA0tVbPUdPEHPyuPsYk9hISnmmv+6UE2pEyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5hK6A8JSZ53HXa204O58YV27/IeDm3JVwoktRlrji8=;
 b=At5DCsWvR+Bnr+KufM3ljFxeyVelEBcuTAbi+zqa40q8sgVPtoCXMfUt566WC0ABXHpbY/FLTxAgowTqV3oKQs6tOJmuHXrlccmkhckka3vCTdRZiFtRnVGaFv4aEESqAOAtdSiNNjL9ufRN5UpeYTcnjGqeNbCDQtZeEwLbW5NWo/QlewmnKzx41P5frlllXBkZfA5YdiPzOa82tWAyIsMfQEj3HyzXkhuNWeJZanxENcjMEga4d0uR6CaUHI7xpJ6KHF/8rha+5kAYEarlxuuux7JwXkNn1y1iNy7bA8ojUDd6yIdC7qoqPu1zW6CGuphXGHEGiZPpthCMh91Nxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::10) by
 SI2PR06MB824503.apcprd06.prod.outlook.com (2603:1096:4:18d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 05:13:15 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::21) by SG2P153CA0023.outlook.office365.com
 (2603:1096:4:c7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.1 via Frontend Transport; Wed, 18
 Nov 2026 05:13:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 05:13:14 +0000
Received: from gary-System-Product-Name (unknown [172.16.66.27])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B874F427EFC6;
	Wed, 18 Nov 2026 13:13:13 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v6 0/2] usb: typec: add CIX Type-C PD controller driver
Date: Wed, 18 Nov 2026 13:13:11 +0800
Message-ID: <20261118051313.3634833-1-gary.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|SI2PR06MB824503:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b1698a4f-5795-4f38-bd86-08df4532a640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|18002099003|6133799003|261009223027099003|56012099006|261026140227099003|10067099003|261102123227099003|261028144727099003|261026121527099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	Uxa+nTYTJQ+ooNsFe7EBDbHC9Cd6KtYXEIkMkBxKJ/jFpExQC+NcWk1t4EceUFGwC/tDxMxfIGjuyWC9ZXEn3eZcMKUp0uhTY3oWnHgv0W4KHls3fFyOc4dHwvX8qQhHfC9QfmBG4p67dWtYdXL99O+aJ1fe7ef/S9y9I3c9OB9/YEtbdcBWEG+6wDnkJfCpzC6nRllIH6jM9AbIxXcVWxUDvJ0C/Dzc8LdcZh3ksCFj4P9YVRWpnltf0z6PqiFl/usmWN0/Du0vi/yk7uzOvKl7Ng9Lh+XgVGqY5T59hgkhNY4bdUtOyPI1eF8FeUiN8joNPZ1vU/x/AmwKPPKpylyiVQtXEbRc2lR/gAxi0sjAll/xkefzHsgXm3WnLIfKTyvl7K3OZ06IVRKIz0PrIE+J6oVazu1vW4ODq+U1r77Ttt4Cee0cX/iwNOJjpyS4DpBzctVOBYokYq4QGr+f0zsLMEIuTfUrgeppkscQrJYlKvl/xy7OyFhJhMqDhAHk5ywvL/+3/9zUiI6KNXWM+q7lv8CpXCtuq3QV+gis1erqPqJ+IgKMJaGb36jTAhT/L8jaXofjUtHL+zn1LRZWbGHbfAU2zN30k/wtLcGku+UgKmfFyds/rsbePai+Zkx+wUAqXp2UwuwO6cAJsccxzPUOPFJIllL1YlknLsbk07kbkgGPcnxdB+2t6eRzfQEqr6O3McXIypFZZJ86yY6PXg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(18002099003)(6133799003)(261009223027099003)(56012099006)(261026140227099003)(10067099003)(261102123227099003)(261028144727099003)(261026121527099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DRIAhrYTzWGSIWG78AuixWLTvxJnLKR5ASVTXVNRyiddknbMXCwchU+fOas0a6RkIZMYf84FYhbX0WmABBL8bgkEMGx42KWdTZWG0ruOZeWmxvRP2JwZZ5VZNvAkfW3FlpEuVCdH5YiP+JEpXztRYX3NC3JVKsUAG4JT7NPUfJW5ksWZZPQ/muZ9hz8z/IqXUvAHbxqp3VhLaI69SIYt4sZg6ufVmNi+MmHL8QRI4H0d5ZsADQg+J8oL8gYLr8qGRYakA8oYeZomxyqUkHh+hyCfXzQWuzAbwabX8q02bauOx7bgkkY5FXDNtngzPly0Rk6ma6dx81D7L7PMop7kH3QYrtmKOnvo+mJ4yPOiVjiPsi0+vnBZicM4uKV7ZCkL5kxaJ36AYPmRhWUsogNjQupMbrSFeVsBUYHhfa/Kqr7kZ24hGgL13Gly9DnSLt55
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 05:13:14.7234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1698a4f-5795-4f38-bd86-08df4532a640
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB824503

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
 drivers/usb/typec/cix_pd.c                    | 774 ++++++++++++++++++
 5 files changed, 865 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
 create mode 100644 drivers/usb/typec/cix_pd.c

-- 
2.50.1


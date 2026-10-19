Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441756;
	b=PaijhtEwoyhiaVTsCk2H1DbMpicZv5vecdoz6CXE6kj5RPvtrmTntKbUVWx8nS3mygwv
	 8JaIAc1j2wtI7m3WxIylcSs3c0bjXRCBpDqe73JNr52F+ThnKqpg3/dYxUvzwLgjT1tAq
	 n7UnjHcIz9G2cZrJlyJwVFqJIn8QXX5BezQ/tWnGBwevPdaD6ac4jEFQmiVYSMyWdRxln
	 msjyHY+s5D/mpyBpgEHRZ1wjlCK4sEczlOnJw6UlmFJPFtfT6UtAfnWlER/1cbRTyR7KN
	 rBX06jrg9FIm6AF+xUjKzWF2znq45NdDhczM+fF/W32PDjuTzZpoPEsVnnG4jE1lTyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=l4LDzxN8GEE/it3mOfnt74vctUfggTvlJCTevGHzH6g=;
	b=DOXRuF7zmQe2wfAUvcwoE0ekZ+ziR3U5tSiF/yu7GRiqLpXCgvLqRE45QbGGehWn8QJe
	 V6UQEk8a3Nph/paBclNypMm55pTKkbg5AeEBpS1pN7zF7AE5Znairt1KwyPA9SPNHAR9L
	 sZPBJUd6QQtp+0bYKowsSdgL8LJLpc8/VTxV51WcmeEMUJnjDNkCx5XDm5ABWu0XwbZ34
	 gRcUBfebT7xMdATi1u+0oxpHoSsUvozZHz0BhMMghyZr3sF1Y0pFsHxUzTqfJeYrQHqh3
	 2f8qEWMTD/TIe5ZkPgak75BoQIvnM+TfmtSqSsPtJ1dvwOHvBkgtLazRft4RxsVANRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NVFOw7LW;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDDA606A31C
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 20:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCDDA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NVFOw7LW
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-980c4258105so1492532241.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 13:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792441755; x=1793046555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l4LDzxN8GEE/it3mOfnt74vctUfggTvlJCTevGHzH6g=;
        b=NVFOw7LWaZOsApKAbgUcGvwTvjm0Jfhy3rvUbFbl7GpmrZcXegLVQ6v0d+jeRxLaPw
         nZ3dgOHtuxKsbumWzfN2kYE0uFbtFmSn76k+9I7OzDzyvw072UU7KzZ/s5gC4QKrFwO7
         zfdxSGDrpJaz1lqrNPUSsq2IX6vjx2Gmg4KLi+nwBbX4ef7Z3enbMiGeavBHxd1DDN6c
         wOB+iO6cu7CIJIKoSpmoB7zoRmQIbGcbl/NME5csxmx4jRlIUVDp6DqEng7yZdU58zVR
         dsuP7bM2Rc0I1CEUK2vWu427sTHIQVpnYYpVQ2LugNvYcuBp0KfxcM0ooTAlN6MfNwbI
         5jxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441755; x=1793046555;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l4LDzxN8GEE/it3mOfnt74vctUfggTvlJCTevGHzH6g=;
        b=oo+Kba1JF4NrFACDFsIVy02XyBD0gTtQHhHhoMW7gFJEVZ5x9Fdj0FkEzclzSzJ/TQ
         wnzoD5qYHqrKraLh9gbpVH1WjDXsUWMB2glUzfDyR7W9YqHUuSW0loeHsu9DpYSORBA4
         hoigCqnKfti5PoN8e1ZdI5Xbzym9ccyrAQHkE3TuA3Ai5VcWYwlrMua2KzPxDRPdAbRE
         SZyVPJ3JGTSYjzJKnB+HWk/sGxSeD4gjXwtgrt2sw354nfPE8Ed1bnmVZx36RktDlINz
         Rz2ks1FCEWNlqsAEzZD/xOJrDxz/4PnvNYs4+5luHGUEq6lvNN4VQFBxCwW9MlnQmwF/
         JEZA==
X-Forwarded-Encrypted: i=1; AKwUvBwWd7u7adrPA66J9QUImQBCMmDtSyshtKnEzTq6sGnfl0UIVHegkZWRkZSDpGNP3G6UemgHSy29vUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYImX1d5owy/5jrXNjwyyc1J7p3NfJ1pHaf7xipe6gpx1b8SqzFa
	yPIFbVz9kMfB0690xNGJCWJbCoJBX7JOWq6rllcJVNNtgu3dGawrrRST
X-Gm-Gg: AYBFou1OhY9al9Wn3dWAxsq+V4fVSgk1MaTTJwxMLjRlxWCVWaINglMRIb7TOx75786
	V8dJg+FByi0jaBj4n59oxF3/JqWIPHO4mXRzMAV8GoA+mVB3HQ8U3zQCncQlJuyc62+/XVn5YPj
	aS/jJ13M0IU41jfjusbv9AlEsX1tauKUok6fAJAX9M7/3Qlis9WMNfuMH5H/tqldkkPghDlOLAo
	tBXIse923dhVM7/vlaYZc9/5bTeZIYCs08wmjtjVop3XiLwAwOBXQ6+YsAuE/rEk2iAOQFd4Mj/
	vGkefU2HBBUY1iPbYBvyPVnOZIl2Ks4dxBlRVMZZwgJOsA2PepqhzWPX3V+4LEjK9nULTcemYEl
	x2aSbpdK2/F5IiqhGVqU7NgWLRWweHE97swlhdZ6XRXmljQ8gkMGTDoDaGh6FytlRQFSe2AgLuo
	2IlGZPsvLN7r/yAc5eTi3bBn+3sWrvhd+73Q7CSPRpqS0jOjrlGHj3iogxNxDkVDYJxB7vEytEO
	w9Upv4/
X-Received: by 2002:a05:6102:955:b0:7cb:fd69:4155 with SMTP id ada2fe7eead31-7cc3672eb71mr2784233137.5.1792441754705;
        Mon, 19 Oct 2026 13:29:14 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:1c75:eeaa:b22f:20dc])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc77234464sm1122912137.8.2026.10.19.13.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:29:14 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: andreas.noever@gmail.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	helgaas@kernel.org,
	bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	lukas@wunner.de,
	d@rrell.co
Subject: [PATCH v2] thunderbolt: Call SXFP() on Apple systems with Alpine Ridge when suspending
Date: Mon, 19 Oct 2026 17:29:00 -0300
Message-ID: <20261019202900.39062-1-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Apple systems with Alpine Ridge, suspending to RAM with a device
connected to a Type-C port leaves the PCIe link to the upstream port of
the controller down on resume, and the ports are lost until reboot.
Calling the SXFP(0) ACPI method under the NHI before entering sleep
avoids that, so do it from suspend_noirq of the software connection
manager.

The firmware can set bit 26 of plug events CS_20 when it resumes the
NHI. While it is set SXFP(0) turns the router off and it does not come
back on resume, so clear the bit first and skip SXFP(0) if that fails.

Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
---
Thanks for the review, Mika.

I am sending this alongside "PCI/PM: Keep the saved config space of an
inaccessible device":
https://lore.kernel.org/all/20261019202445.38259-1-fbeltranmillalen@gmail.com/

SXFP(0) also powers down the xHCI on the side of the controller with
nothing connected.  The automated review of v1 pointed out that if this
happens before the xHCI saves its state in its own suspend_noirq,
pci_save_state() stores all ones today, and resume writes them back.
I found the same by reading the code.  The xHCI and the NHI suspend
asynchronously, so their order is not fixed.  In my tests below the
xHCI always saved first, except when I forced SXFP(0) earlier; then the
PCI patch kept the previous snapshot and the xHCI came back.

v2:
- Call SXFP(0) from tb_suspend_noirq() instead of adding a suspend_late
  callback.  In v1 I wrote that suspend_noirq was too late.  That was
  measured from the suspend_noirq of the upstream port of the
  controller, which runs after the NHI and the other devices below it.
  From the suspend_noirq of the NHI it works (tests below).
- Renamed to tb_acpi_apple_force_power().
- Use tb_switch_is_alpine_ridge(), so all Alpine Ridge variants are
  covered.
- Use ACPI_COMPANION() and call SXFP through adev->handle, with
  acpi_execute_simple_method() since it takes a single integer.
- Added tb_switch_set_bit26(sw, value) in switch.c, without the read
  back.  It only writes when the bit has to change.  tb->lock is already
  held by tb_domain_suspend_noirq().
- Dropped the !sw and going_away checks and the two warnings, moved the
  register definitions before TB_PLUG_EVENTS_PCIE_*, and dropped the
  Assisted-by tag.
- Kept pm_suspend_via_firmware(), as in the Cactus Ridge quirk
  (quirk_apple_poweroff_thunderbolt()): the OS does not know how to power
  the controller back on.  Added pm_suspend_in_progress(), because
  __nhi_suspend_noirq() also runs from nhi_poweroff_noirq() when entering
  hibernation, where pm_suspend_via_firmware() is true.  Together they
  limit the call to suspend-to-RAM via firmware.

v1: https://lore.kernel.org/all/20261019134851.7496-1-fbeltranmillalen@gmail.com/

About calling SXFP from _PSx or a power resource: I checked the ACPI
tables of this machine.  SXFP is defined once under each NHI and
nothing calls it.  The _PS3 of the NHI is empty.

Testing:
I tested it on a MacBookPro14,3 (two Alpine Ridge controllers, software
connection manager) with 6.18.49 and a backport of this patch, which
uses &nhi->pdev->dev in place of nhi->dev.  The kernel also carried the
PCI patch above, and a local change equivalent to the ACPICA fix
mentioned in v1, without which the firmware does not set bit 26 here.
The PCI quirk from the earlier version was switched off, except where
noted.  All cycles were 30 second suspends to RAM.

- Three cycles with a USB 3 disk on one side or the other.  Both
  domains came back each time, with both upstream port links at 8 GT/s
  x4, and the disk could be read.
- One cycle removing the disk while suspended, and one with nothing
  connected.  Both domains came back, and the disk worked when plugged
  in afterwards (on both sides after the first, on one after the
  second).
- Three more cycles with the disk attached and the old PCI quirk
  switched on as well, so that SXFP(0) was called earlier, in the PCI
  suspend phase, to check the PCI patch.  This patch then calls it a
  second time.  All three resumed with both domains and the disk
  working, and the disk also worked when moved afterwards to the side
  that had been empty.

Not tested:
- Real Thunderbolt devices, only the USB 3 disk behind the
  controller's xHCI.
- Other Alpine Ridge variants.
- A suspend aborted after SXFP(0).  With v1 I tried it with pm_test set
  to "platform", but not with this version.
- An NHI that is runtime suspended when the system suspends.  Here
  both NHIs were always active.  If one is runtime suspended, the PM
  core may skip its suspend_noirq (direct_complete), and then SXFP(0)
  is not called.
- Suspend-to-idle and hibernation; the checks above keep the patch out
  of both.

As noted in v1, a device plugged in while the system is suspended does
not wake it.  I measured that with the PCI quirk; this patch makes the
same call, and I did not repeat it.

 drivers/thunderbolt/acpi.c    | 46 +++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c  | 32 ++++++++++++++++++++++++
 drivers/thunderbolt/tb.c      |  1 +
 drivers/thunderbolt/tb.h      |  3 +++
 drivers/thunderbolt/tb_regs.h |  2 ++
 5 files changed, 84 insertions(+)

diff --git a/drivers/thunderbolt/acpi.c b/drivers/thunderbolt/acpi.c
index 53546bc477a5..7a25f89ba14b 100644
--- a/drivers/thunderbolt/acpi.c
+++ b/drivers/thunderbolt/acpi.c
@@ -7,7 +7,9 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/platform_data/x86/apple.h>
 #include <linux/pm_runtime.h>
+#include <linux/suspend.h>
 
 #include "tb.h"
 
@@ -279,6 +281,50 @@ int tb_acpi_power_off_retimers(struct tb_port *port)
 	return tb_acpi_retimer_set_power(port, false);
 }
 
+/**
+ * tb_acpi_apple_force_power() - Call SXFP(0) on Apple systems with Alpine Ridge
+ * @tb: Domain that is being suspended
+ *
+ * On Apple systems with Alpine Ridge the PCIe link to the upstream port
+ * of the controller does not come up on resume from system sleep if a
+ * device is connected, unless SXFP(0) ("Sx Force Power") under the NHI
+ * is called before entering it. Bit 26 of plug events CS_20 must be
+ * clear when SXFP(0) is called, otherwise the router is turned off and
+ * does not come back on resume.
+ *
+ * Call only when entering system sleep. Does nothing on other systems.
+ */
+void tb_acpi_apple_force_power(struct tb *tb)
+{
+	struct tb_switch *sw = tb->root_switch;
+	struct acpi_device *adev;
+	acpi_status status;
+
+	if (!x86_apple_machine || !tb_switch_is_alpine_ridge(sw))
+		return;
+	/*
+	 * Only when firmware handles system suspend, as in
+	 * quirk_apple_poweroff_thunderbolt(): the OS does not know how to
+	 * power the controller back on. pm_suspend_in_progress() excludes
+	 * hibernation.
+	 */
+	if (!pm_suspend_in_progress() || !pm_suspend_via_firmware())
+		return;
+
+	adev = ACPI_COMPANION(tb->nhi->dev);
+	if (!adev || !acpi_has_method(adev->handle, "SXFP"))
+		return;
+
+	if (tb_switch_set_bit26(sw, false))
+		return;
+
+	tb_sw_dbg(sw, "ACPI: calling SXFP\n");
+	status = acpi_execute_simple_method(adev->handle, "SXFP", 0);
+	if (ACPI_FAILURE(status))
+		tb_sw_warn(sw, "ACPI: SXFP failed: %s\n",
+			   acpi_format_exception(status));
+}
+
 static bool tb_acpi_bus_match(struct device *dev)
 {
 	return tb_is_switch(dev) || tb_is_usb4_port_device(dev);
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 4b8bcba7bd2f..44141b19c1f2 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -4027,6 +4027,38 @@ int tb_switch_xhci_connect(struct tb_switch *sw)
 	return 0;
 }
 
+/**
+ * tb_switch_set_bit26() - Set or clear bit 26 of plug events CS_20
+ * @sw: Alpine Ridge router
+ * @value: %true to set the bit, %false to clear it
+ *
+ * On Apple systems the firmware can set this bit when it resumes the
+ * NHI. While it is set, SXFP(0) turns the router off and it does not
+ * come back on resume.
+ *
+ * Return: %0 on success, negative errno otherwise.
+ */
+int tb_switch_set_bit26(struct tb_switch *sw, bool value)
+{
+	unsigned int offset = sw->cap_plug_events + TB_PLUG_EVENTS_CS_20;
+	u32 val;
+	int ret;
+
+	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, offset, 1);
+	if (ret)
+		return ret;
+
+	if (!!(val & TB_PLUG_EVENTS_CS_20_BIT26) == value)
+		return 0;
+
+	if (value)
+		val |= TB_PLUG_EVENTS_CS_20_BIT26;
+	else
+		val &= ~TB_PLUG_EVENTS_CS_20_BIT26;
+
+	return tb_sw_write(sw, &val, TB_CFG_SWITCH, offset, 1);
+}
+
 /**
  * tb_switch_xhci_disconnect() - Disconnect internal xHCI
  * @sw: Router whose xHCI to disconnect
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 7e39b067e5ff..dd3da25453fa 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -3099,6 +3099,7 @@ static int tb_suspend_noirq(struct tb *tb)
 	struct tb_cm *tcm = tb_priv(tb);
 
 	tb_dbg(tb, "suspending...\n");
+	tb_acpi_apple_force_power(tb);
 	tb_disconnect_and_release_dp(tb);
 	tb_switch_exit_redrive(tb->root_switch);
 	tb_switch_suspend(tb->root_switch, false);
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e86845762e22..472e7fbe1a19 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1097,6 +1097,7 @@ static inline bool tb_switch_clx_is_enabled(const struct tb_switch *sw,
 int tb_switch_pcie_l1_enable(struct tb_switch *sw);
 
 int tb_switch_xhci_connect(struct tb_switch *sw);
+int tb_switch_set_bit26(struct tb_switch *sw, bool value);
 void tb_switch_xhci_disconnect(struct tb_switch *sw);
 
 int tb_port_state(struct tb_port *port);
@@ -1524,6 +1525,7 @@ int tb_acpi_init(void);
 void tb_acpi_exit(void);
 int tb_acpi_power_on_retimers(struct tb_port *port);
 int tb_acpi_power_off_retimers(struct tb_port *port);
+void tb_acpi_apple_force_power(struct tb *tb);
 #else
 static inline bool tb_acpi_add_links(struct tb_nhi *nhi) { return false; }
 
@@ -1537,6 +1539,7 @@ static inline int tb_acpi_init(void) { return 0; }
 static inline void tb_acpi_exit(void) { }
 static inline int tb_acpi_power_on_retimers(struct tb_port *port) { return 0; }
 static inline int tb_acpi_power_off_retimers(struct tb_port *port) { return 0; }
+static inline void tb_acpi_apple_force_power(struct tb *tb) { }
 #endif
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 92d893634d2b..58c8757882f5 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -562,6 +562,8 @@ struct tb_regs_hop {
 #define TB_PLUG_EVENTS_CS_1_DPOUT_DISABLE	BIT(4)
 #define TB_PLUG_EVENTS_CS_1_LOW_DPIN_DISABLE	BIT(5)
 #define TB_PLUG_EVENTS_CS_1_HIGH_DPIN_DISABLE	BIT(6)
+#define TB_PLUG_EVENTS_CS_20			0x14
+#define TB_PLUG_EVENTS_CS_20_BIT26		BIT(26)
 
 #define TB_PLUG_EVENTS_PCIE_WR_DATA		0x1b
 #define TB_PLUG_EVENTS_PCIE_CMD			0x1c

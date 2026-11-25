Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616608;
	b=Q01YvoNxVX55lfuHhWelqHayenH55BtP2uUtCzbW2yL0A59Rdc/mzyQA4PxpmMYbozHr
	 EHhMxDHW75XQYIyOce0DKlKPTtLokJWcPOkXgupr5MeZJnf3tBQW5IET7cwhhNhJV86ie
	 YLzSQ/fiKdKXtKlmGJklb6Y6k82wfeex+hIkKPX9l7sBWXu60NGWHjffA0l3VTel1JtHf
	 S0uj2sRUcMITpnWWt+Nbx+Al83AlrD68fF5x0M4Fq7l7Re3mDj+rOlXRbMIKA9QiSWKzM
	 yuChqgdRcZ6bvGXUkTVvst5eiCJ/Dg/gmswJUbhKrHjTeFQQ7TM3bum9b5zPIPImrZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616608;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Upl5nOzaPmkAjtLOXMa8WOMVqKTWYoekp9h1vnN2RWg=;
	b=Gq0v5IgmaOL5EEAmSpIZizQGWw2ncd6MOA5pDlZxo0UUxWh07InGDIM4x+NsVsmiY6l/
	 Gi2MEFD5cymPzWpURkl85VfuCPsA+S9b9u8aFwqFDu7BKvPwdDh0gZeRwmRWliOO/8Kbj
	 3NhxmptZJgLTf326qCE2l2GBkus6s2RCeqlSyBovW3K/DaCTHLPNz0LPFm9ux14d6Ux7K
	 VqaNdpxrq6JcUvD96yFt0I/6t5MUcbFVbTZkMQfaSunRlB+230HSv0d55MVnWxmcPTAld
	 tKkul7JxWej7MW6jla9vlB/mRlzmFUss4enG/vmWl5DiuMGmmXA7yb4nLb7nPLHdGOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=TfO0UiZn;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CCE606A33C;
	Wed, 25 Nov 2026 14:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61CCE606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=TfO0UiZn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=Upl5nOzaPmkAjtLOXMa8WOMVqKTWYoekp9
	h1vnN2RWg=; b=TfO0UiZneJLTBInzeMqFKxCdliUmrtAtOYcvl7MK54YuKNsDGA
	IZQUrVBJ4D174EeiG3mj6D21z7xlE+jZT33w3J3QPA2hYowq7f8WevYSIKhBBiMF
	XhRzJyxwAaRJuZC6Kv7SEI0qKVEP2H+CGHkddCEk81mjcGQ25tID7Hu9c=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.196])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBXxSlN7wZrtu73AA--.1127S5;
	Wed, 25 Nov 2026 22:23:14 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v16 3/3] usb: dwc3: select the shared HS data bus with a mux controller
Date: Wed, 25 Nov 2026 22:23:09 +0800
Message-ID: <20261125142309.3265777-4-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125142309.3265777-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261125142309.3265777-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgBXxSlN7wZrtu73AA--.1127S5
X-Coremail-Antispam: 1UD129KBjvAXoWfCw1xZrWDCr1xAFyfWFWkXrb_yoW8KrWkJo
	WfX3ykZw48KryrWrykCFn7Jry8Za92krW7Ar1rZrsrZF18XrWrKr9rGF4jqFW3JF42vr15
	XayxAr4FgFWIyr95n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYu7k0a2IF6w4kM7kC6x804xWl14x267AKxVWrJVCq3wAFc2x0
	x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87
	I2jVAFwI0_JrWl82xGYIkIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY
	1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20x
	vEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
	Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5DOzDUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARECB2sGHiAuFQAcsh

Two connectors can share one High Speed D+/D- pair only if a multiplexer
selects which receptacle drives the controller, and that selection has to
follow the USB mode: leaving it to a board level GPIO means the controller
can end up driving the data lines of the connector that is not in use, and
a host or gadget instance cannot be torn down while its own lines are still
selected.

A mux controller cannot be read back, so the connector in use at boot
cannot be detected: the first mode request claims the mux for state 0
instead.  A move of the data path to the other connector is a mode
switch even when the role does not change, which is why it goes through
the same worker.

mux_control_select() sleeps while waiting for the controller and
mux_control_deselect() may sleep as well, so both are only called from
__dwc3_set_mode() on system_freezable_wq and from dwc3_drd_exit() after the
mode work has been drained; the role-switch set() callback keeps recording
the request and never touches the mux.  The mux stays selected between
switches, since the controller always drives exactly one of the two
connectors, and it is deselected on unbind.  The arbitration,
publication ordering and teardown rules of the per-connector role switches
are unchanged.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/usb/dwc3/core.c    | 116 ++++++++++++-
 drivers/usb/dwc3/core.h    |  43 +++++
 drivers/usb/dwc3/debugfs.c |   4 +
 drivers/usb/dwc3/drd.c     | 329 ++++++++++++++++++++++++++++++++++++-
 4 files changed, 489 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 372737f4750b..ce309792864b 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -21,6 +21,7 @@
 #include <linux/io.h>
 #include <linux/list.h>
 #include <linux/delay.h>
+#include <linux/mux/consumer.h>
 #include <linux/dma-mapping.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -165,7 +166,11 @@ EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
 static void __dwc3_set_mode(struct work_struct *work)
 {
 	struct dwc3 *dwc = work_to_dwc(work);
+	struct dwc3_role_mux *mux = dwc->role_mux;
 	unsigned long flags;
+	bool pending, port_switch;
+	int mux_port = 0;
+	int active_port = -1;
 	int ret;
 	u32 reg;
 	u32 desired_dr_role;
@@ -174,6 +179,10 @@ static void __dwc3_set_mode(struct work_struct *work)
 	mutex_lock(&dwc->mutex);
 	spin_lock_irqsave(&dwc->lock, flags);
 	desired_dr_role = dwc->desired_dr_role;
+	if (mux) {
+		mux_port = mux->desired_port;
+		active_port = mux->active_port;
+	}
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	pm_runtime_get_sync(dwc->dev);
@@ -184,7 +193,14 @@ static void __dwc3_set_mode(struct work_struct *work)
 	if (!desired_dr_role)
 		goto out;
 
-	if (desired_dr_role == dwc->current_dr_role)
+	/*
+	 * Moving the shared data path to the other connector is a mode switch even
+	 * when the role does not change: the running host or gadget instance has to
+	 * be torn down while its own data lines are still selected.
+	 */
+	port_switch = mux && mux_port != active_port;
+
+	if (desired_dr_role == dwc->current_dr_role && !port_switch)
 		goto out;
 
 	if (desired_dr_role == DWC3_GCTL_PRTCAP_OTG && dwc->edev)
@@ -233,8 +249,60 @@ static void __dwc3_set_mode(struct work_struct *work)
 		dwc3_writel(dwc, DWC3_GCTL, reg);
 	}
 
+	/*
+	 * The previous host or gadget instance has been torn down above, so the
+	 * shared High Speed data path can now be moved to the requesting
+	 * connector.  A failure here must not abort the mode change half-way:
+	 * the controller would be left with a torn-down role and a stale
+	 * current_dr_role, which the next request would tear down a second time.
+	 */
+	if (port_switch) {
+		/*
+		 * mux_control_select() sleeps while waiting for the controller, so
+		 * the switch is only done here, in the mode worker.  The mux is kept
+		 * selected between switches: dwc3 is its only consumer and always
+		 * drives one of the two connectors.
+		 *
+		 * Only deselect a mux that is actually selected: active_port is -1
+		 * before the first selection and after a failed one, and deselecting
+		 * an unselected mux would release a semaphore that was never taken.
+		 */
+		if (active_port >= 0)
+			mux_control_deselect(mux->ctrl);
+		ret = mux_control_select(mux->ctrl, mux_port);
+		if (ret)
+			dev_err_ratelimited(dwc->dev,
+					    "failed to select USB port %d: %d\n",
+					    mux_port, ret);
+
+		spin_lock_irqsave(&dwc->lock, flags);
+		if (ret) {
+			mux->ports[mux_port].errors++;
+			/*
+			 * No port owns the mux any more: the previous one has been
+			 * deselected above and the new one could not be selected.
+			 * Keeping the old index would make the next request skip
+			 * the select and drive a connector that is not connected.
+			 */
+			mux->active_port = -1;
+		} else {
+			mux->active_port = mux_port;
+		}
+		spin_unlock_irqrestore(&dwc->lock, flags);
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 
+	/*
+	 * dwc3_set_prtcap() only clears GUSB3PIPECTL.SUSPENDENABLE and
+	 * GUSB2PHYCFG.SUSPHY when PRTCAP actually changes, but a same-role port
+	 * switch reinitialises the controller too and must start from the same
+	 * state: the instance created below would otherwise inherit the SUSPHY
+	 * setting of the one torn down above.
+	 */
+	if (port_switch)
+		dwc3_enable_susphy(dwc, false);
+
 	dwc3_set_prtcap(dwc, desired_dr_role, false);
 
 	spin_unlock_irqrestore(&dwc->lock, flags);
@@ -283,24 +351,68 @@ static void __dwc3_set_mode(struct work_struct *work)
 	}
 
 out:
+	/*
+	 * A request that arrived while this work was running did not re-queue it:
+	 * queue_work() returns false for a work item that is already running.  Pick
+	 * such a request up here instead of waiting for the next connector event.
+	 * The pair is compared with the snapshot taken above, so a data-path switch
+	 * that failed is not retried in a loop.
+	 */
+	if (mux) {
+		spin_lock_irqsave(&dwc->lock, flags);
+		pending = dwc->desired_dr_role != desired_dr_role ||
+			  mux->desired_port != mux_port;
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		if (pending)
+			queue_work(system_freezable_wq, &dwc->drd_work);
+	}
+
 	pm_runtime_put_autosuspend(dwc->dev);
 	mutex_unlock(&dwc->mutex);
 }
 
-void dwc3_set_mode(struct dwc3 *dwc, u32 mode)
+static void dwc3_queue_mode(struct dwc3 *dwc, u32 mode, int port)
 {
 	unsigned long flags;
 
 	if (dwc->dr_mode != USB_DR_MODE_OTG)
 		return;
 
+	/*
+	 * The connector that owns the shared data path is published together with
+	 * the mode request: __dwc3_set_mode() snapshots both under dwc->lock, and
+	 * a torn pair would move the data path for the connector that asked last
+	 * while bringing up the role requested by the one before it.
+	 */
 	spin_lock_irqsave(&dwc->lock, flags);
 	dwc->desired_dr_role = mode;
+	if (dwc->role_mux && port >= 0)
+		dwc->role_mux->desired_port = port;
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	queue_work(system_freezable_wq, &dwc->drd_work);
 }
 
+void dwc3_set_mode(struct dwc3 *dwc, u32 mode)
+{
+	dwc3_queue_mode(dwc, mode, -1);
+}
+
+/**
+ * dwc3_set_mode_port - request a mode and the connector that owns the data path
+ * @dwc: pointer to our controller context structure
+ * @mode: mode to be requested
+ * @port: index of the connector that should drive the shared data path
+ *
+ * Same as dwc3_set_mode(), except that the data-path selection is published
+ * atomically with the mode request, so the mode worker never pairs the new
+ * connector with the previous role.
+ */
+void dwc3_set_mode_port(struct dwc3 *dwc, u32 mode, int port)
+{
+	dwc3_queue_mode(dwc, mode, port);
+}
+
 u32 dwc3_core_fifo_space(struct dwc3_ep *dep, u8 type)
 {
 	struct dwc3		*dwc = dep->dwc;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f3dabb37f806..e6cf7b240b23 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1008,6 +1008,46 @@ struct dwc3_glue_ops {
 	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
 };
 
+/* Per-connector state of the optional shared-HS-data-bus mux. */
+struct dwc3_role_port {
+	struct dwc3		*dwc;
+	struct usb_role_switch	*sw;
+	struct fwnode_handle	*fwnode;
+	enum usb_role		role;
+	unsigned int		state;
+	/* request order, see dwc3_role_mux.seq */
+	u64			seq;
+	/* data-path switch failures, for diagnostics only */
+	unsigned int		errors;
+};
+
+/**
+ * struct dwc3_role_mux - optional data-path mux between two connectors
+ * @ctrl: mux controller selecting which connector drives the shared HS data lines
+ * @lock: serialises role requests coming from both connectors
+ * @ready: both switches registered and the initial mode request issued
+ * @ports: per-connector state, indexed by the endpoint's "mux-state"
+ * @desired_port: index of the connector that currently wins
+ * @active_port: index of the connector currently driving the data lines
+ * @seq: monotonic request counter used to order pending requests
+ *
+ * Two connectors can share the High Speed data lines of one controller while
+ * keeping their Super Speed lanes separate.  Each connector then needs its own
+ * role-switch input, and the shared data path has to be moved before the
+ * controller is reinitialised for the requested role.
+ */
+struct dwc3_role_mux {
+	struct mux_control	*ctrl;
+	/* serialises role requests coming from both connectors */
+	struct mutex		lock;
+	/* false until both switches are registered and the mode was requested */
+	bool			ready;
+	struct dwc3_role_port	ports[2];
+	int			desired_port;
+	int			active_port;
+	u64			seq;
+};
+
 /**
  * struct dwc3 - representation of our controller
  * @drd_work: workqueue used for role swapping
@@ -1064,6 +1104,7 @@ struct dwc3_glue_ops {
  *		- USBPHY_INTERFACE_MODE_UTMI
  *		- USBPHY_INTERFACE_MODE_UTMIW
  * @role_sw: usb_role_switch handle
+ * @role_mux: optional shared data-path mux plus per-connector role switches
  * @role_switch_default_mode: default operation mode of controller while
  *			usb role is USB_ROLE_NONE.
  * @usb_psy: pointer to power supply interface.
@@ -1265,6 +1306,7 @@ struct dwc3 {
 	struct notifier_block	edev_nb;
 	enum usb_phy_interface	hsphy_mode;
 	struct usb_role_switch	*role_sw;
+	struct dwc3_role_mux	*role_mux;
 	enum usb_dr_mode	role_switch_default_mode;
 
 	struct power_supply	*usb_psy;
@@ -1614,6 +1656,7 @@ struct dwc3_gadget_ep_cmd_params {
 /* prototypes */
 void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy);
 void dwc3_set_mode(struct dwc3 *dwc, u32 mode);
+void dwc3_set_mode_port(struct dwc3 *dwc, u32 mode, int port);
 u32 dwc3_core_fifo_space(struct dwc3_ep *dep, u8 type);
 
 #define DWC3_IP_IS(_ip)							\
diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 01ebd73198e0..82e7a334b135 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -434,6 +434,10 @@ static ssize_t dwc3_mode_write(struct file *file,
 	u32			mode = 0;
 	char			buf[32];
 
+	/* The connector providers own both the role and the data-path selection. */
+	if (dwc->role_mux)
+		return -EBUSY;
+
 	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
 		return -EFAULT;
 
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index f3e37d383627..906cac4f3e6e 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/extcon.h>
+#include <linux/mux/consumer.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -501,10 +502,319 @@ static enum usb_role dwc3_usb_role_switch_get(struct usb_role_switch *sw)
 	return role;
 }
 
+/*
+ * Index of the connector that should own the shared data path: the oldest
+ * pending request wins, and the last selection is kept when neither connector
+ * requests a role.  Requests are ordered by a monotonic counter rather than by
+ * a timestamp, so a wrapped counter cannot be mistaken for an old request.
+ */
+static int dwc3_role_mux_pick(struct dwc3_role_mux *mux)
+{
+	int sel = mux->desired_port;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mux->ports); i++) {
+		if (mux->ports[i].role == USB_ROLE_NONE)
+			continue;
+		if (mux->ports[sel].role == USB_ROLE_NONE ||
+		    mux->ports[i].seq < mux->ports[sel].seq)
+			sel = i;
+	}
+
+	return sel;
+}
+
+static u32 dwc3_role_mux_mode(struct dwc3 *dwc, enum usb_role role)
+{
+	if (role == USB_ROLE_HOST)
+		return DWC3_GCTL_PRTCAP_HOST;
+	if (role == USB_ROLE_DEVICE)
+		return DWC3_GCTL_PRTCAP_DEVICE;
+	if (dwc->role_switch_default_mode == USB_DR_MODE_HOST)
+		return DWC3_GCTL_PRTCAP_HOST;
+
+	return DWC3_GCTL_PRTCAP_DEVICE;
+}
+
+static int dwc3_mux_role_set(struct usb_role_switch *sw, enum usb_role role)
+{
+	struct dwc3_role_port *port = usb_role_switch_get_drvdata(sw);
+	struct dwc3 *dwc = port->dwc;
+	struct dwc3_role_mux *mux = dwc->role_mux;
+	unsigned long flags;
+	enum usb_role selected_role;
+	int selected;
+
+	if (role > USB_ROLE_DEVICE)
+		return -EINVAL;
+
+	mutex_lock(&mux->lock);
+
+	/*
+	 * The switches are registered before the initial mode request is issued and
+	 * before mux->ready is set, so a connector can find its switch while the
+	 * mux is still being set up.  Refusing the request keeps it from racing
+	 * with the initial mode request and from queueing work that the error path
+	 * would then have to undo.
+	 */
+	if (!mux->ready) {
+		mutex_unlock(&mux->lock);
+		return -ENODEV;
+	}
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	/*
+	 * A role change between two non-NONE roles of the same connector must not
+	 * give that connector a new request ticket: it would otherwise steal the
+	 * data path from the connector that asked first.
+	 */
+	if (port->role == USB_ROLE_NONE && role != USB_ROLE_NONE)
+		port->seq = ++mux->seq;
+	port->role = role;
+	selected = dwc3_role_mux_pick(mux);
+	selected_role = mux->ports[selected].role;
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	/*
+	 * Notify the glue layer before touching the controller, in the same order
+	 * as the single-connector path.  It may sleep (the Qualcomm glue calls
+	 * pm_runtime_resume_and_get()), so it runs outside of dwc->lock -
+	 * dwc3_set_mode() takes that lock itself and a recursive take deadlocks
+	 * the controller on the very first role change.
+	 *
+	 * Pairing with the selection above is provided by mux->lock: a second
+	 * connector blocks in mutex_lock() until this request has been issued.
+	 *
+	 * Same asynchronous semantics as the single-connector role switch: the
+	 * data path and the controller are reprogrammed from __dwc3_set_mode().
+	 */
+	dwc3_pre_set_role(dwc, selected_role);
+	/*
+	 * The selected connector and the mode are published by one call, under
+	 * dwc->lock, so __dwc3_set_mode() cannot observe the new connector together
+	 * with the role of the previous request.  Publishing happens after
+	 * dwc3_pre_set_role() so the work cannot start before the glue layer has
+	 * been notified.
+	 */
+	dwc3_set_mode_port(dwc, dwc3_role_mux_mode(dwc, selected_role), selected);
+
+	mutex_unlock(&mux->lock);
+
+	/*
+	 * A data-path switch failure is reported through the console and counted
+	 * per connector; it is not returned here.  This call has already updated
+	 * the request state, so a stale error from another connector must not be
+	 * reported as the result of this (successful) request.
+	 */
+	return 0;
+}
+
+static enum usb_role dwc3_mux_role_get(struct usb_role_switch *sw)
+{
+	struct dwc3_role_port *port = usb_role_switch_get_drvdata(sw);
+	struct dwc3 *dwc = port->dwc;
+	unsigned long flags;
+	enum usb_role role;
+
+	/*
+	 * Report the role this connector itself requested, whether or not it owns
+	 * the shared data path right now.  Hiding a pending request behind
+	 * active_port makes connector drivers read back USB_ROLE_NONE, so they
+	 * never send the set_role(USB_ROLE_NONE) that would release it; the stale
+	 * request then keeps winning dwc3_role_mux_pick() after the connector has
+	 * been unplugged and starves the other one.
+	 */
+	spin_lock_irqsave(&dwc->lock, flags);
+	role = port->role;
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	return role;
+}
+
+static void dwc3_role_mux_exit(struct dwc3 *dwc)
+{
+	struct dwc3_role_mux *mux = dwc->role_mux;
+	unsigned int i;
+
+	if (!mux)
+		return;
+
+	/*
+	 * Refuse new requests first.  dwc3_mux_role_set() takes this lock for its
+	 * whole duration, so once it is held no request is in flight, and every
+	 * later one returns before it can queue a mode request.  The work itself
+	 * is drained by the caller, which is the only way to keep a request from
+	 * being queued after the drain.
+	 */
+	mutex_lock(&mux->lock);
+	mux->ready = false;
+	mutex_unlock(&mux->lock);
+
+	for (i = 0; i < ARRAY_SIZE(mux->ports); i++) {
+		if (mux->ports[i].sw)
+			usb_role_switch_unregister(mux->ports[i].sw);
+		mux->ports[i].sw = NULL;
+		fwnode_handle_put(mux->ports[i].fwnode);
+		mux->ports[i].fwnode = NULL;
+	}
+}
+
+/*
+ * Release the mux when this controller still owns it.  devm_mux_control_get()
+ * only puts the controller on release and does not restore its idle state, so
+ * the mux has to be deselected explicitly; the caller must already have drained
+ * dwc->drd_work, otherwise a switch could select it again.
+ */
+static void dwc3_role_mux_deselect(struct dwc3 *dwc)
+{
+	struct dwc3_role_mux *mux = dwc->role_mux;
+	unsigned long flags;
+	int active_port;
+
+	if (!mux)
+		return;
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	active_port = mux->active_port;
+	mux->active_port = -1;
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	if (active_port >= 0)
+		mux_control_deselect(mux->ctrl);
+}
+
+/* Returns 1 when the optional two-connector mux has been set up. */
+static int dwc3_role_mux_init(struct dwc3 *dwc, u32 mode)
+{
+	struct usb_role_switch_desc desc = {};
+	struct dwc3_role_mux *mux;
+	struct fwnode_handle *ep;
+	char name[64];
+	u32 state;
+	int ret, i;
+
+	if (!fwnode_property_present(dev_fwnode(dwc->dev), "mux-controls"))
+		return 0;
+
+	mux = devm_kzalloc(dwc->dev, sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return -ENOMEM;
+
+	mux->ctrl = devm_mux_control_get(dwc->dev, NULL);
+	if (IS_ERR(mux->ctrl))
+		return PTR_ERR(mux->ctrl);
+
+	/*
+	 * Both connectors must be addressable states of the mux controller.
+	 */
+	if (mux_control_states(mux->ctrl) < ARRAY_SIZE(mux->ports))
+		return -EINVAL;
+
+	/*
+	 * The current position of a mux controller cannot be read back, so the
+	 * boot-time connector cannot be detected here.  The first mode request
+	 * selects state 0 instead (the mode worker sees active_port == -1 and
+	 * claims the mux for endpoint 0).
+	 */
+	mux->desired_port = 0;
+	mux->active_port = -1;
+	mutex_init(&mux->lock);
+
+	/*
+	 * Publish the mux before the first endpoint reference is taken:
+	 * dwc3_role_mux_exit() is a no-op while dwc->role_mux is NULL, so every
+	 * error path below would otherwise leak the fwnode references already
+	 * acquired.
+	 */
+	dwc->role_mux = mux;
+
+	fwnode_graph_for_each_endpoint(dev_fwnode(dwc->dev), ep) {
+		if (!fwnode_property_present(ep, "usb-role-switch"))
+			continue;
+
+		ret = fwnode_property_read_u32(ep, "mux-state", &state);
+		if (ret || state >= ARRAY_SIZE(mux->ports)) {
+			ret = -EINVAL;
+			goto err_put_ep;
+		}
+		if (mux->ports[state].fwnode) {
+			ret = -EINVAL;
+			goto err_put_ep;
+		}
+
+		mux->ports[state].fwnode = fwnode_handle_get(ep);
+		mux->ports[state].state = state;
+		mux->ports[state].dwc = dwc;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(mux->ports); i++) {
+		if (!mux->ports[i].fwnode) {
+			ret = -EINVAL;
+			goto err;
+		}
+	}
+
+	/*
+	 * Registering the switches makes them reachable from the connector
+	 * drivers, so the initial mode request has to be issued inside the same
+	 * critical section: a set() arriving in between would be silently
+	 * overwritten by it while port->role keeps the requested value.
+	 * dwc3_mux_role_set() serialises on the same lock.
+	 */
+	mutex_lock(&mux->lock);
+
+	for (i = 0; i < ARRAY_SIZE(mux->ports); i++) {
+		snprintf(name, sizeof(name), "%s-port%u", dev_name(dwc->dev), i);
+		desc.name = name;
+		desc.fwnode = mux->ports[i].fwnode;
+		desc.set = dwc3_mux_role_set;
+		desc.get = dwc3_mux_role_get;
+		desc.driver_data = &mux->ports[i];
+		mux->ports[i].sw = usb_role_switch_register(dwc->dev, &desc);
+		if (IS_ERR(mux->ports[i].sw)) {
+			ret = PTR_ERR(mux->ports[i].sw);
+			mux->ports[i].sw = NULL;
+			mutex_unlock(&mux->lock);
+			goto err;
+		}
+	}
+
+	/*
+	 * The controller is only started in its default role once both switches
+	 * are registered: before that a connector driver cannot request a role,
+	 * so nothing can race with this initial mode request.
+	 */
+	dwc3_set_mode(dwc, mode);
+	mux->ready = true;
+
+	mutex_unlock(&mux->lock);
+
+	return 1;
+
+err:
+	/*
+	 * Unregister the switches before draining the work: dwc3_role_mux_exit()
+	 * refuses every further request, and a request that was already past that
+	 * check has queued its work by the time the lock is released, so the drain
+	 * below cannot miss it.  The reverse order would let a blocked request
+	 * queue the work after the drain and run it on a half-torn-down mux.
+	 * dwc->role_mux is left in place: it is devm-managed and freeing it here
+	 * would only turn a late request into a NULL dereference.
+	 */
+	dwc3_role_mux_exit(dwc);
+	cancel_work_sync(&dwc->drd_work);
+	dwc3_role_mux_deselect(dwc);
+	return ret;
+err_put_ep:
+	fwnode_handle_put(ep);
+	goto err;
+}
+
 static int dwc3_setup_role_switch(struct dwc3 *dwc)
 {
 	struct usb_role_switch_desc dwc3_role_switch = {NULL};
 	u32 mode;
+	int ret;
 
 	dwc->role_switch_default_mode = usb_get_role_switch_default_mode(dwc->dev);
 	if (dwc->role_switch_default_mode == USB_DR_MODE_HOST) {
@@ -513,6 +823,11 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 		dwc->role_switch_default_mode = USB_DR_MODE_PERIPHERAL;
 		mode = DWC3_GCTL_PRTCAP_DEVICE;
 	}
+
+	ret = dwc3_role_mux_init(dwc, mode);
+	if (ret)
+		return ret < 0 ? ret : 0;
+
 	dwc3_set_mode(dwc, mode);
 
 	dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
@@ -526,7 +841,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 
 	if (dwc->dev->of_node) {
 		/* populate connector entry */
-		int ret = devm_of_platform_populate(dwc->dev);
+		ret = devm_of_platform_populate(dwc->dev);
 
 		if (ret) {
 			usb_role_switch_unregister(dwc->role_sw);
@@ -541,6 +856,8 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 #else
 #define ROLE_SWITCH 0
 #define dwc3_setup_role_switch(x) 0
+static inline void dwc3_role_mux_exit(struct dwc3 *dwc) {}
+static inline void dwc3_role_mux_deselect(struct dwc3 *dwc) {}
 #endif
 
 int dwc3_drd_init(struct dwc3 *dwc)
@@ -597,6 +914,7 @@ void dwc3_drd_exit(struct dwc3 *dwc)
 {
 	unsigned long flags;
 
+	dwc3_role_mux_exit(dwc);
 	if (dwc->role_sw)
 		usb_role_switch_unregister(dwc->role_sw);
 
@@ -626,6 +944,15 @@ void dwc3_drd_exit(struct dwc3 *dwc)
 		break;
 	}
 
+	/*
+	 * Deselect only after the active role has been torn down, in the same
+	 * order as __dwc3_set_mode(): mux_control_deselect() switches the shared
+	 * High Speed lines back to the mux' idle state, which would cut the data
+	 * path off underneath a host or gadget instance that is still running.
+	 * The mode worker is drained, so nothing can select the mux again.
+	 */
+	dwc3_role_mux_deselect(dwc);
+
 	if (dwc->otg_irq)
 		free_irq(dwc->otg_irq, dwc);
 }
-- 
2.53.0


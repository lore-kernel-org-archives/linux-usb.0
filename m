Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC45D3C5523
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076657; cv=none; b=Clh0N3Bz5wy/cvcmgDLmnQWicwJukACrGvKEOp4tC4hHT1XRjBHsQRgWJfP/WlxF5KDzy0qfV89baDWWYHBUmLRPsCHIRN1vAvW0PT56lvlVEZ1AJcb0kihXahbEso/vT8/xOBbFSJ5ZRMxaY3RnTPqiNpU3jFpFR+pmudTsnWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076657; c=relaxed/simple;
	bh=rXeDSkdfrRrJ8GHfTTKUKDWzRCdFt2wHMjeqQRTZSYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWIDypmU7eJOP2TpR6RwmvmWUNAE8mbSqVeTDPcMeLgTkVb9qpG3KeSUtbW2VDFf/8/fQUxr9VNHjgMUdYiBqaHiwO55rgrGaP6Df8Zs9HsbpahMc5DOFgMgfakSbRILdMoNLC0F5PCIWNrEYcP+EDMXZOtv1ZkDUt9U/mGWDUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oSxXI/Q/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oSxXI/Q/"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so4267895ad.0
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 04:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076651; x=1783681451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOb8vZkypDhiCK5oWGkMlPDQ0lYXQ1vc7Yfl2MuBtSo=;
        b=oSxXI/Q/GgQsPW5w180HtgDUl649thns915rIyi6mbtBA3tNX1T2FPxu4446ogDZYL
         EmckkzZZh714wPk6ZnLVhDica9RwYtU11J0XBXfsg3OkF3Gw3kEQ2yzTnOliAXMuz2y1
         STGnoHDZKHY6Sscrq58AJNG574CVY9iYI2fbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076651; x=1783681451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yOb8vZkypDhiCK5oWGkMlPDQ0lYXQ1vc7Yfl2MuBtSo=;
        b=esQXy8H49fDQmcxvtOH6KcKZauIDiNgy8Ciwjdy8XJLtUQaaelc7NM+B7kk3eWZBK9
         3lCHiyWlN3WQe3oai93gzZSEJ9fxJyDQ6q+9Ay6YXz0CXbcsKkuU4wvgGDE7bcutc/qH
         x/LlCjz+BOxwtWqtDAAC0dhCh/ik4/pykdL9zgMeeqbkITh+8YEC45rXwE52dvDaMU0X
         SFZVOLex/h5tnRuY77CQAV4Gp93LF9f2PshY34tmWTttvwsxeUpVQpR0Kj5WR46rXIXw
         qdkgP4tJ15MN4HAtYsiUOO6TaVYmkIPLaOFXlQhqdQsa8+LRH5JdnmoEhbxPy7rkRFlA
         i+Zg==
X-Forwarded-Encrypted: i=1; AHgh+RpGCOsKV9liskPWKeO8/ZIZpuzPPlNjuoUr0IpG5SmXdBoDvyCKkQmCoBQ0QTzzLbtF8omZUUsY7kU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeY78hpqr3OeFjiWrorsW/BFCAf3sVj0ycyWgJR+F7dotq7t1X
	EwYNfgOfw64e5/dJuJ6RK8/GkLu5BHGjoRGorOxRnNOXYxFNZM2giIdDyGVWboT+Yw==
X-Gm-Gg: AfdE7cl+McB8nbcQhM4MWosYFQ9fYPzv/n/XuYhfAm223qmLOULs0DwPUAiSUgCAA5n
	f80zykpUx6fH/SQ8pU+UMl8HDHqxY131snQnX8YKR+pcI0+M3cNiEZ59OrwIIud79kwZ9pjbq2T
	CNsaPrGsrAqIOf1rdJmnvE49Io393XioPD/xqdjCBXdKiQWSFR1dEh5Xmb4kkKNw9i3Sd107ux/
	EFi2aq05EOdQvQkMY5fxlt9v4o9R9UCJeBbS6kGSJOi3OPoFNLF4QOzk5w0z5KZj7p23n7eKC7A
	UAdoWXF4GX6ww9qTNQSv5Of1ON2q6NOSDJqt3oStnHA9i7QnDN70UInQ1Fdb2fLARyh9k4GAwIN
	6PcvOx94LdZ2kqyBdMyqjAKrJwykfUI8pLzD5EXZ7csa9yrsA0v5vI+tyMwIb2RX0vavF1Z00yx
	20x4t8xrI+gv6iVRJdTHP7mrz84IyQzkio2M7JAuLhA0sXvy82Cbw/dvM20OkhjI/xc9Wy0Q==
X-Received: by 2002:a17:902:f711:b0:2ca:10c6:f69b with SMTP id d9443c01a7336-2ca7e654868mr112077965ad.5.1783076651250;
        Fri, 03 Jul 2026 04:04:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:10 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 08/13] usb: hub: Power on connected M.2 E-key connectors with power sequencing API
Date: Fri,  3 Jul 2026 19:03:09 +0800
Message-ID: <20260703110317.1283411-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new M.2 E-key connector can have a USB connection. For the USB device
on this connector to work, its power must be enabled and the W_DISABLE2#
signal deasserted. The connector driver handles this and provides a
toggle over the power sequencing API.

This feature currently only supports a directly connected (no mux in
between) M.2 E-key connector. Existing USB connector types are not
covered. The USB A connector was recently added to the onboard devices
driver. USB B connectors have historically been managed by the USB
gadget or dual-role device controller drivers. USB C connectors are
handled by TCPM drivers.

The power sequencing API does not know whether a power sequence provider
is not needed or not available yet, so we only request it for connectors
that we know need it, which at this time is just the E-key connector.

On the USB side, the port firmware node (if present) is tied to the
usb_port device. This device is used to acquire the power sequencing
descriptor. This allows the provider to tell the different ports on one
hub apart.

This feature is not implemented in the onboard USB devices driver. The
power sequencing API expects the consumer device to make the request,
but there is no device node to instantiate a platform device to tie
the driver to. The connector is not a child node of the USB host or
hub, and the graph connection is from a USB port to the connector.
And the connector itself already has a driver.

Power sequencing is not directly enabled in the connector driver as
that would completely decouple the timing of it from the USB subsystem.
It would not be possible for the USB subsystem to toggle the power
for a power cycle or to disable the port.

Also rewrite the existing set_bit() and clear_bit() branches with
assign_bit() to make it cleaner.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Expanded subject to mention power sequencing API
- Dropped commit message bit about power sequencing Kconfig symbol change
  to bool
- Added optional dependency on POWER_SEQUENCING to USB
- Split out pwrseq_power_*() calls into separate helpers
- Rewrote set_bit() and clear_bit() branches with assign_bit()
- Dropped the pwrseq_power_off() before pwrseq_put(): pwrseq_put() does it
  automatically.
- Removed pwrseq_power_on() from usb_hub_create_port_device(); it will
  get called through usb_hub_set_port_power() in hub_activate().
- Added checks for port->pwrseq in hub_is_port_power_switchable()

- Use separate pwrseq descriptors for HighSpeed and SuperSpeed ports.
  This makes things simpler. On the other hand to power cycle a port
  userspace needs to toggle it on both the HS and SS ports together.
- Dropped pwrseq state tracking again
  The power sequencing consumer API already tracks the state internally;
  doing it again in |struct usb_port| is not necessary especially now
  that the descriptors aren't shared.

It's unclear to me how actual hubs reconcile USB_PORT_FEAT_POWER settings
from the HS side and SS side. One hub chip vendor said that VBUS_EN for
a port is on if the flag is set on either side; however actually testing
on one of their hubs showed that VBUS was cut as soon as the flag is
cleared on the HS port. Maybe it could be different if a SS device was
connected? That scenario was not tested. Testing on another retail
bought hub seemed to work exactly as described though: USB_PORT_FEAT_POWER
needed to be clear on both HS and SS ports to turn off VBUS.

Under this scheme, I'm not sure how the power cycle in hub_port_connect()
would work correctly.

- Link to v2:
  https://lore.kernel.org/all/20260610084053.2059858-1-wenst@chromium.org/

Changes since v1:
- Switch to fwnode instead of OF
- Tie port@ fwnode to usb_port device
- Move remote node compatible checking to separate helper
- Use usb_port device to request power sequencing descriptor
- Drop "index" parameter from pwrseq_get()
- Do not get pwrseq descriptor for SuperSpeed port; share one for one
  physical port
- Add pwrseq state tracking
- Link to v1:
  https://lore.kernel.org/all/20260515090149.3169406-1-wenst@chromium.org/
---
 drivers/usb/Kconfig     |  1 +
 drivers/usb/core/hub.c  | 44 +++++++++++++++++++++++++++++-----
 drivers/usb/core/hub.h  | 10 +++++++-
 drivers/usb/core/port.c | 52 ++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 99 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
index abf8c6cdea9e..ef1959363fb1 100644
--- a/drivers/usb/Kconfig
+++ b/drivers/usb/Kconfig
@@ -44,6 +44,7 @@ config USB_ARCH_HAS_HCD
 config USB
 	tristate "Support for Host-side USB"
 	depends on USB_ARCH_HAS_HCD
+	depends on POWER_SEQUENCING if POWER_SEQUENCING
 	select GENERIC_ALLOCATOR
 	select USB_COMMON
 	select NLS  # for UTF-8 strings
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 8ae97e8c26aa..dfa0f5dd75e8 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -32,6 +32,7 @@
 #include <linux/mutex.h>
 #include <linux/random.h>
 #include <linux/pm_qos.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/kobject.h>
 
 #include <linux/bitfield.h>
@@ -871,6 +872,30 @@ static void hub_tt_work(struct work_struct *work)
 	spin_unlock_irqrestore(&hub->tt.lock, flags);
 }
 
+static int usb_hub_set_port_pwrseq(struct usb_port *port, bool set)
+{
+	int ret = 0;
+
+	if (set)
+		ret = pwrseq_power_on(port->pwrseq);
+	else
+		ret = pwrseq_power_off(port->pwrseq);
+
+	return ret;
+}
+
+static int usb_hub_restore_port_pwrseq(struct usb_port *port, bool set)
+{
+	int ret = 0;
+
+	if (set)
+		ret = pwrseq_power_off(port->pwrseq);
+	else
+		ret = pwrseq_power_on(port->pwrseq);
+
+	return ret;
+}
+
 /**
  * usb_hub_set_port_power - control hub port's power state
  * @hdev: USB device belonging to the usb hub
@@ -886,20 +911,24 @@ static void hub_tt_work(struct work_struct *work)
 int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 			   int port1, bool set)
 {
+	struct usb_port *pwrseq_port = hub->ports[port1 - 1];
 	int ret;
 
+	ret = usb_hub_set_port_pwrseq(pwrseq_port, set);
+	if (ret)
+		return ret;
+
 	if (set)
 		ret = set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 	else
 		ret = usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
-	if (ret)
+	if (ret) {
+		usb_hub_restore_port_pwrseq(pwrseq_port, set);
 		return ret;
+	}
 
-	if (set)
-		set_bit(port1, hub->power_bits);
-	else
-		clear_bit(port1, hub->power_bits);
+	assign_bit(port1, hub->power_bits, set);
 	return 0;
 }
 
@@ -3249,7 +3278,10 @@ int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus)
 			ret = 1;
 	}
 
-	return ret;
+	if (!port->pwrseq)
+		return ret;
+
+	return ret && pwrseq_power_is_on(port->pwrseq);
 }
 
 static void usb_lock_port(struct usb_port *port_dev)
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index b65d9192379d..99bae6ace4da 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -85,6 +85,7 @@ struct usb_hub {
  * @port_owner: port's owner
  * @peer: related usb2 and usb3 ports (share the same connector)
  * @connector: USB Type-C connector
+ * @pwrseq: power sequencing descriptor for the port
  * @req: default pm qos request for hubs without port power control
  * @connect_type: port's connect type
  * @state: device state of the usb device attached to the port
@@ -104,6 +105,7 @@ struct usb_port {
 	struct usb_dev_state *port_owner;
 	struct usb_port *peer;
 	struct typec_connector *connector;
+	struct pwrseq_desc *pwrseq;
 	struct dev_pm_qos_request *req;
 	enum usb_port_connect_type connect_type;
 	enum usb_device_state state;
@@ -147,7 +149,13 @@ static inline bool hub_is_port_power_switchable(struct usb_hub *hub)
 	if (!hub)
 		return false;
 	hcs = hub->descriptor->wHubCharacteristics;
-	return (le16_to_cpu(hcs) & HUB_CHAR_LPSM) < HUB_CHAR_NO_LPSM;
+	if ((le16_to_cpu(hcs) & HUB_CHAR_LPSM) < HUB_CHAR_NO_LPSM)
+		return true;
+	/* check for controllable external power sequencers */
+	for (unsigned int i = 1; i <= hub->hdev->maxchild; i++)
+		if (hub->ports[i] && hub->ports[i]->pwrseq)
+			return true;
+	return false;
 }
 
 static inline int hub_is_superspeed(struct usb_device *hdev)
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 77dbf51f1760..87b8e4f90be6 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -8,11 +8,14 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include <linux/pm_qos.h>
+#include <linux/property.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/component.h>
 #include <linux/usb/of.h>
 
@@ -29,6 +32,9 @@ static bool usb_port_allow_power_off(struct usb_device *hdev,
 	if (hub_is_port_power_switchable(hub))
 		return true;
 
+	if (port_dev->pwrseq)
+		return true;
+
 	if (!IS_ENABLED(CONFIG_ACPI))
 		return false;
 
@@ -749,6 +755,39 @@ static const struct component_ops connector_ops = {
 	.unbind = connector_unbind,
 };
 
+static bool port_pwrseq_is_supported(struct usb_port *port_dev)
+{
+	struct device *dev = &port_dev->dev;
+	struct fwnode_handle *port = dev->fwnode;
+	struct fwnode_handle *ep __free(fwnode_handle) =
+			fwnode_graph_get_next_port_endpoint(port, NULL);
+	if (!ep)
+		return false;
+
+	struct fwnode_handle *remote __free(fwnode_handle) =
+			fwnode_graph_get_remote_port_parent(ep);
+	if (!remote)
+		return false;
+
+	if (!fwnode_device_is_compatible(remote, "pcie-m2-e-connector")) {
+		dev_dbg(dev, "remote endpoint %pfw is not a supported connector", remote);
+		return false;
+	}
+
+	return true;
+}
+
+static struct pwrseq_desc *usb_hub_port_pwrseq_get(struct usb_port *port_dev)
+{
+	if (!IS_ENABLED(CONFIG_POWER_SEQUENCING))
+		return NULL;
+
+	if (!port_pwrseq_is_supported(port_dev))
+		return NULL;
+
+	return pwrseq_get(&port_dev->dev, "usb");
+}
+
 int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 {
 	struct usb_port *port_dev;
@@ -809,10 +848,18 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 		goto err_put_kn;
 	}
 
+	port_dev->pwrseq = usb_hub_port_pwrseq_get(port_dev);
+	if (IS_ERR(port_dev->pwrseq)) {
+		retval = PTR_ERR(port_dev->pwrseq);
+		dev_err_probe(&port_dev->dev, retval,
+			      "failed to get power sequencing descriptor\n");
+		goto err_put_kn;
+	}
+
 	retval = component_add(&port_dev->dev, &connector_ops);
 	if (retval) {
 		dev_warn(&port_dev->dev, "failed to add component\n");
-		goto err_put_kn;
+		goto err_put_pwrseq;
 	}
 
 	find_and_link_peer(hub, port1);
@@ -850,6 +897,8 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	}
 	return 0;
 
+err_put_pwrseq:
+	pwrseq_put(port_dev->pwrseq);
 err_put_kn:
 	sysfs_put(port_dev->state_kn);
 err_unregister:
@@ -866,6 +915,7 @@ void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
 	peer = port_dev->peer;
 	if (peer)
 		unlink_peers(port_dev, peer);
+	pwrseq_put(port_dev->pwrseq);
 	component_del(&port_dev->dev, &connector_ops);
 	sysfs_put(port_dev->state_kn);
 	device_unregister(&port_dev->dev);
-- 
2.55.0.rc0.799.gd6f94ed593-goog


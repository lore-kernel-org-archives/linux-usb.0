Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562119;
	b=XXYooEVTmsWagT3U0lsvs2j4779DhtV4eO5A3JzNzGkkZ+gXRTeKVWRPS6uiTQIN442Y
	 KlBOBLKIV955QrWqj5/IBsaOgriLZ3RqVHpUKkXvtknEV40Zyu2C23eBiH6l9dvoRgnBl
	 CtQk2VnThPXUe+9IxMY7NQo559MzczSMaqM9nZTghYNuviBlwSpzx+XqPaNt6427KXtdI
	 n/BVp20srq4APtgAHupBD0nlEwkgUmdbrL3qgPW/oo8EPFjpeJoqxqbX7cQi6y2O0s5mr
	 jsHHz0O7c7FmyPFlm3Ey5MIY/TgpPFLHun5p8726lAt/PuqF0Tv2PhBVNQlFkFB87Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=0vWx9BqEaiUQNAfAQ83U10AE5+7Kstc3SicxGPngEqQ=;
	b=nms10bOKTb7B3Xui/hoWVW0B5xpt2zEwzDfxUuRVD/s3+wPCboKPas1hMR2H5sTo4dmZ
	 gjZBngscVXTml62dZcpiZH3MqDPC87/SztNCOhozxhtU1USb8NuJeDpf+OPEWjJwcC42c
	 2l2XFOIPMuxESzX/zpGL0Y8/I4lc+c5F0AqNQGu2+HsevZPhX0C/nKeUoz6cIMJpfm5cl
	 tWtyzDM80vVcP8qk+Mj8SOP+2CFNR84S6RWSe3wlutBBYfyOPJW1uMTtWxuZAHtRZAHON
	 J9o7DLedr5x7JgLwJKwDABz+FTe2cLQmVJT4k2cneDfn5mKDWWncLdkRwK7KkzZqdfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=noR+xO3+;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C25C60A260F
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 09:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C25C60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=noR+xO3+
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so11851445e9.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 01:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794562117; x=1795166917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0vWx9BqEaiUQNAfAQ83U10AE5+7Kstc3SicxGPngEqQ=;
        b=noR+xO3+fF11jG3/VDor3Wa+3yc/PrrbK33lkhx1cakUTVfBBlgRHg8uYFVjigOaBS
         FU0uR3kFFqTVnavioCvOeCFFcn4hYNDBr66vJQKbiQqLE60Xrlbhtxra2rr/pHlKaEgA
         OrNYCMRTKid9iDbnveYA8Fj8AvZBDemWGUGO3tpmv5x0ElBi08qlrwFuL6Zx83D4F5MJ
         ml4QEQbiMf/CmAFHdSTbHAZvJLpAphpvWRq1Jh+EQMPXCLJmwauWHPQQkGanOuMgnf9j
         3JDtB1AKPjoRtHVLNu/0ql5bVtSIlk0Ze05bM/oArkXukY7+U0JqmapNvIsV66PfCVmw
         zFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562117; x=1795166917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vWx9BqEaiUQNAfAQ83U10AE5+7Kstc3SicxGPngEqQ=;
        b=QfgmYkSQeVvljuh0eUn6CqJqbHSS+DJV93O4VULJyO15fnYO1CfjrJUi3IGJeRc28P
         J/IovFWazF6o18Z/Js4/AFMaEVcbvBeh1nh0eD+qeBBfwzSvpEpafpfiAGtedo7JpfN0
         KkTZkz70HaKQj2Vrn8YP9zgEv/Jw5i6FuhycEde7kwAPOBKsjkY+6U1UYWYLFahbMKaB
         YUn7qqrFtcRba6D8UXy7NnkSOd0IbiyoDBu4tN7PGeykFbczuV/13Svq2V8IvQlhGCc6
         yydVccAKAZhQT3a4y421oF4YS9wO3zJ3yXxnGBgEYxvwQXF4PMwGjCo2xFkh78plokD9
         l4aw==
X-Gm-Message-State: APuU4Z9ouRsrf0yQbzhkG7+knC4/8ygAAJ0unmTBMbRIIhw82mBu0Ju7
	w8YKC1195YfKhHsCWQEYt1/Kk8X/+Bjm08TnozH6Q/JoZU1lWzfpBzJzY4sh2jd6a9M=
X-Gm-Gg: AYBFou2IIcBUimuZnvqLc47ZthRFUtN/HswvyLsfDfe3KE1A8rii7o7R/SpIX6xF2hC
	0jkMQCuqqR5hlH8Dqv3MaWO1f7enN+GqIeBIneXUtLy6zQ5ff290wf5eFhMA0k6nEGDOgI5M9v6
	RtdP5Qx2RUBCCNAcEGx7qFa7xnsvboFiCSnWrG+S+wYcqTjFnciwUv6BloIuzKmNS2HcgE95hik
	0nXcWJTL9b/aJIsIM/sKLFKfG6r3DxjaQ1GTCjOuxcUavrpam+lAShNm9ffbUAEHevl3i0Cfltt
	ElYreLPbHWMJEiI1CiVm/3AbjR6wj0VL9AJInWc7wsCuw51UJnIOSKOE/k2v3SAmCqrHZFhcjmX
	baFGDmUTcTf3zeIZPHjsMoApS+MlJeTJBO11GoM7uWcVRw4BJzhwrWmHHoVuyOCabkSihGfkclF
	tULX7i1G34sdOkhNfQZRUCUkhtsZBPqTZRHPLjBqF1Dz070+UGEbYH3u0ghDA23/YDHHPRJQUA3
	fKaKngSsKYOpJ9g59S/soKDBO0HFDm+gEC2JJRjYWzL6sBzKq2ypE8mIa6umE7B/jw6YkmQ0tah
	FkDNvDKW6sLbdL+VFjv2UMLdOxruRzyW+X1hVrWa85g04tCWxmmC1e57Sy5z4MjNrvGVsmMwVVH
	Fv3ouMMwEPvkxj330HOFtE4OTn8DiMA==
X-Received: by 2002:a05:600c:3e1a:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4bb55a878camr35334285e9.27.1794562116740;
        Fri, 13 Nov 2026 01:28:36 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm238668335e9.1.2026.11.13.01.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:28:36 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 13 Nov 2026 13:28:19 +0400
Subject: [PATCH v2 4/4] usb: gadget: udc: Decide on connecting in one place
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
Message-Id: <20261113-udc-connect-v2-4-f51b11f07eb8@flipper.net>
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
In-Reply-To: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=15567; i=alchark@flipper.net;
 h=from:subject:message-id; bh=EeSV8AU5b373lypGku+BM4C2CfCsGo70Fxu4aQ1UHVQ=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9u2HxYmLe/X1ez59r3b+054nev6iFN7/Uuzt9Xd7a7
 r37mhbD646JLAxiXAyWYoosc78tsZ1qxDdrl4fHV5g5rEwgQ6RFGhiAgIWBLzcxr9RIx0jPVNtQ
 z9BIx1jHiIGLUwCmOr6I4X/VtJ/PjezZjZjsi/YLM99S2ej9wDo6VGra+stG6sXVoosYGZ7nz89
 nNmZ/X/YwJcF4QslKrrfmrV8U9uv6JxbGZQjeZgUA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The UDC core connects or disconnects the gadget on bind and unbind, on
VBUS events, in usb_gadget_{de,}activate() and through the soft_connect
attribute, and each path applies its own rules. gadget->connected
records both whether the pullup is enabled and whether to enable it once
that becomes possible, so the paths misread each other's state: a VBUS
event before bind kept the pullup off until the previous patch cleared
the flag on UDC start. soft_connect also starts and stops the UDC behind
the gadget driver's back, and its "connect" overrides both VBUS and
deactivation.

Settle the rules in one place. The gadget may connect only while a
gadget driver is bound, VBUS is present, the driver hasn't deactivated
the gadget and userspace hasn't disconnected it through soft_connect.
Have usb_udc_update_connection_locked() record that in
udc->allow_connect under connect_lock and connect or disconnect the
gadget to match, and call it wherever one of those conditions changes.
gadget->connected then only tracks the pullup, as the UDC drivers that
read it already assume, so the clearing on UDC start can go.

Reduce soft_connect to setting or clearing a disconnect request under
connect_lock, rather than the gadget's device lock, and forget the
request at unbind like the deactivation. If the pullup can't follow,
keep the old request and report the error, so that the request and the
pullup still agree. Leave starting and stopping the UDC to bind and
unbind alone: the attribute is documented to control the pullup, not the
controller.

Let the helper succeed on a UDC without a pullup control, as there is
nothing to switch there. Activation and deactivation keep working on
such UDCs, and binding them works again: it has most likely failed with
-EOPNOTSUPP since commit 0ea39e030a80 ("usb: gadget: udc: Handle
gadget_connect failure during bind operation"), but I don't have any
affected hardware to confirm it.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/gadget/udc/core.c | 194 +++++++++++++++++++++---------------------
 include/linux/usb/gadget.h    |   4 +-
 2 files changed, 99 insertions(+), 99 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 84dc0820c2cb..e592705de55e 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -38,14 +38,18 @@ static const struct bus_type gadget_bus_type;
  * @vbus: for udcs who care about vbus status, this value is real vbus status;
  * for udcs who do not care about vbus status, this value is always true
  * @started: the UDC's started state. True if the UDC had started.
- * @allow_connect: Indicates whether UDC is allowed to be pulled up.
- * Set/cleared by gadget_(un)bind_driver() after gadget driver is bound or
- * unbound.
+ * @bound: True while a gadget driver is bound and the UDC is started for it.
+ * @soft_disconnected: True if userspace has disconnected the gadget through
+ * the soft_connect attribute. Forgotten when the gadget driver unbinds.
+ * @allow_connect: True if the gadget may connect to the host: a gadget driver
+ * is bound, VBUS is present, the driver hasn't deactivated the gadget, and
+ * userspace hasn't disconnected it. Only usb_udc_update_connection_locked()
+ * sets it, and it connects or disconnects the gadget to match.
  * @vbus_work: work routine to handle VBUS status change notifications.
- * @connect_lock: protects udc->started, gadget->connect,
- * gadget->allow_connect and gadget->deactivate. The routines
+ * @connect_lock: protects udc->started, udc->bound, udc->soft_disconnected,
+ * udc->allow_connect, gadget->connected and gadget->deactivated. The routines
  * usb_gadget_connect_locked(), usb_gadget_disconnect_locked(),
- * usb_udc_connect_control_locked(), usb_gadget_udc_start_locked() and
+ * usb_udc_update_connection_locked(), usb_gadget_udc_start_locked() and
  * usb_gadget_udc_stop_locked() are called with this lock held.
  *
  * This represents the internal data structure which is used by the UDC-class
@@ -59,6 +63,8 @@ struct usb_udc {
 	struct list_head		list;
 	bool				vbus;
 	bool				started;
+	bool				bound;
+	bool				soft_disconnected;
 	bool				allow_connect;
 	struct work_struct		vbus_work;
 	struct mutex			connect_lock;
@@ -715,20 +721,13 @@ static int usb_gadget_connect_locked(struct usb_gadget *gadget)
 		goto out;
 	}
 
-	if (gadget->connected)
+	/*
+	 * If the gadget may not connect yet, usb_udc_update_connection_locked()
+	 * will connect it once it may.
+	 */
+	if (gadget->connected || !gadget->udc->allow_connect)
 		goto out;
 
-	if (gadget->deactivated || !gadget->udc->allow_connect || !gadget->udc->started) {
-		/*
-		 * If the gadget isn't usable (because it is deactivated,
-		 * unbound, or not yet started), we only save the new state.
-		 * The gadget will be connected automatically when it is
-		 * activated/bound/started.
-		 */
-		gadget->connected = true;
-		goto out;
-	}
-
 	ret = gadget->ops->pullup(gadget, 1);
 	if (!ret)
 		gadget->connected = 1;
@@ -747,6 +746,10 @@ static int usb_gadget_connect_locked(struct usb_gadget *gadget)
  * enumerating this gadget when the pullup is active and a VBUS session
  * is active (the link is powered).
  *
+ * Does nothing while the gadget may not connect: no gadget driver is bound,
+ * VBUS is absent, the gadget is deactivated or userspace has disconnected it.
+ * The UDC core connects the gadget by itself once all of that changes.
+ *
  * Returns zero on success, else negative errno.
  */
 int usb_gadget_connect(struct usb_gadget *gadget)
@@ -774,15 +777,6 @@ static int usb_gadget_disconnect_locked(struct usb_gadget *gadget)
 	if (!gadget->connected)
 		goto out;
 
-	if (gadget->deactivated || !gadget->udc->started) {
-		/*
-		 * If gadget is deactivated we only save new state.
-		 * Gadget will stay disconnected after activation.
-		 */
-		gadget->connected = false;
-		goto out;
-	}
-
 	ret = gadget->ops->pullup(gadget, 0);
 	if (!ret)
 		gadget->connected = 0;
@@ -809,6 +803,10 @@ static int usb_gadget_disconnect_locked(struct usb_gadget *gadget)
  * Following a successful disconnect, invoke the ->disconnect() callback
  * for the current gadget driver so that UDC drivers don't need to.
  *
+ * The gadget stays disconnected until usb_gadget_connect() is called or the
+ * UDC core connects it again on the next change of VBUS, binding, activation
+ * or soft_connect.
+ *
  * Returns zero on success, else negative errno.
  */
 int usb_gadget_disconnect(struct usb_gadget *gadget)
@@ -823,6 +821,32 @@ int usb_gadget_disconnect(struct usb_gadget *gadget)
 }
 EXPORT_SYMBOL_GPL(usb_gadget_disconnect);
 
+static bool usb_udc_may_connect(struct usb_udc *udc)
+	__must_hold(&udc->connect_lock)
+{
+	return udc->bound && udc->vbus && !udc->gadget->deactivated &&
+	       !udc->soft_disconnected;
+}
+
+/*
+ * Decide whether the gadget may connect and connect or disconnect it to match.
+ * Call this after changing any of the state that usb_udc_may_connect() checks.
+ */
+static int usb_udc_update_connection_locked(struct usb_udc *udc)
+	__must_hold(&udc->connect_lock)
+{
+	udc->allow_connect = usb_udc_may_connect(udc);
+
+	/* Without a pullup control there is nothing to switch */
+	if (!udc->gadget->ops->pullup)
+		return 0;
+
+	if (udc->allow_connect)
+		return usb_gadget_connect_locked(udc->gadget);
+
+	return usb_gadget_disconnect_locked(udc->gadget);
+}
+
 /**
  * usb_gadget_deactivate - deactivate function which is not ready to work
  * @gadget: the peripheral being deactivated
@@ -845,18 +869,13 @@ int usb_gadget_deactivate(struct usb_gadget *gadget)
 	if (gadget->deactivated)
 		goto unlock;
 
-	if (gadget->connected) {
-		ret = usb_gadget_disconnect_locked(gadget);
-		if (ret)
-			goto unlock;
-
-		/*
-		 * If gadget was being connected before deactivation, we want
-		 * to reconnect it in usb_gadget_activate().
-		 */
-		gadget->connected = true;
-	}
 	gadget->deactivated = true;
+	ret = usb_udc_update_connection_locked(gadget->udc);
+	if (ret) {
+		/* Still connected, so stay active */
+		gadget->deactivated = false;
+		gadget->udc->allow_connect = usb_udc_may_connect(gadget->udc);
+	}
 
 unlock:
 	mutex_unlock(&gadget->udc->connect_lock);
@@ -871,7 +890,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_deactivate);
  * @gadget: the peripheral being activated
  *
  * This routine activates gadget which was previously deactivated with
- * usb_gadget_deactivate() call. It calls usb_gadget_connect() if needed.
+ * usb_gadget_deactivate() call, and connects it if it may connect.
  *
  * This routine may sleep; it must not be called in interrupt context.
  *
@@ -886,15 +905,7 @@ int usb_gadget_activate(struct usb_gadget *gadget)
 		goto unlock;
 
 	gadget->deactivated = false;
-
-	/*
-	 * If gadget has been connected before deactivation, or became connected
-	 * while it was being deactivated, we call usb_gadget_connect().
-	 */
-	if (gadget->connected) {
-		gadget->connected = false;
-		ret = usb_gadget_connect_locked(gadget);
-	}
+	ret = usb_udc_update_connection_locked(gadget->udc);
 
 unlock:
 	mutex_unlock(&gadget->udc->connect_lock);
@@ -1147,21 +1158,12 @@ EXPORT_SYMBOL_GPL(usb_gadget_set_state);
 
 /* ------------------------------------------------------------------------- */
 
-/* Acquire connect_lock before calling this function. */
-static int usb_udc_connect_control_locked(struct usb_udc *udc) __must_hold(&udc->connect_lock)
-{
-	if (udc->vbus)
-		return usb_gadget_connect_locked(udc->gadget);
-	else
-		return usb_gadget_disconnect_locked(udc->gadget);
-}
-
 static void vbus_event_work(struct work_struct *work)
 {
 	struct usb_udc *udc = container_of(work, struct usb_udc, vbus_work);
 
 	mutex_lock(&udc->connect_lock);
-	usb_udc_connect_control_locked(udc);
+	usb_udc_update_connection_locked(udc);
 	mutex_unlock(&udc->connect_lock);
 }
 
@@ -1175,12 +1177,12 @@ static void vbus_event_work(struct work_struct *work)
  * according to vbus status.
  *
  * This function can be invoked from interrupt context by irq handlers of
- * the gadget drivers, however, usb_udc_connect_control() has to run in
- * non-atomic context due to the following:
+ * the gadget drivers, however, usb_udc_update_connection_locked() has to run
+ * in non-atomic context due to the following:
  * a. Some of the gadget driver implementations expect the ->pullup
  * callback to be invoked in non-atomic context.
  * b. usb_gadget_disconnect() acquires udc_lock which is a mutex.
- * Hence offload invocation of usb_udc_connect_control() to workqueue.
+ * Hence offload invocation of usb_udc_update_connection_locked() to workqueue.
  */
 void usb_udc_vbus_handler(struct usb_gadget *gadget, bool status)
 {
@@ -1236,16 +1238,8 @@ static inline int usb_gadget_udc_start_locked(struct usb_udc *udc)
 	}
 
 	ret = udc->gadget->ops->udc_start(udc->gadget, udc->driver);
-	if (!ret) {
+	if (!ret)
 		udc->started = true;
-		/*
-		 * The pullup is never enabled while the UDC is stopped, so any
-		 * connection recorded meanwhile was only a request. Forget it,
-		 * so that the next usb_gadget_connect_locked() enables the
-		 * pullup rather than returning early.
-		 */
-		udc->gadget->connected = false;
-	}
 
 	return ret;
 }
@@ -1652,6 +1646,7 @@ static void usb_udc_forget_driver_locked(struct usb_udc *udc)
 	__must_hold(&udc->connect_lock)
 {
 	udc->gadget->deactivated = false;
+	udc->soft_disconnected = false;
 }
 
 static int gadget_bind_driver(struct device *dev)
@@ -1686,8 +1681,8 @@ static int gadget_bind_driver(struct device *dev)
 		goto err_start;
 	}
 	usb_gadget_enable_async_callbacks(udc);
-	udc->allow_connect = true;
-	ret = usb_udc_connect_control_locked(udc);
+	udc->bound = true;
+	ret = usb_udc_update_connection_locked(udc);
 	if (ret)
 		goto err_connect_control;
 
@@ -1697,6 +1692,7 @@ static int gadget_bind_driver(struct device *dev)
 	return 0;
 
  err_connect_control:
+	udc->bound = false;
 	udc->allow_connect = false;
 	usb_gadget_disable_async_callbacks(udc);
 	if (gadget->irq)
@@ -1733,15 +1729,17 @@ static void gadget_unbind_driver(struct device *dev)
 
 	dev_dbg(&udc->dev, "unbinding gadget driver [%s]\n", driver->function);
 
-	udc->allow_connect = false;
-	cancel_work_sync(&udc->vbus_work);
 	mutex_lock(&udc->connect_lock);
-	usb_gadget_disconnect_locked(gadget);
+	udc->bound = false;
+	usb_udc_update_connection_locked(udc);
 	usb_gadget_disable_async_callbacks(udc);
 	if (gadget->irq)
 		synchronize_irq(gadget->irq);
 	mutex_unlock(&udc->connect_lock);
 
+	/* A VBUS event can no longer connect the gadget, so just wait it out */
+	cancel_work_sync(&udc->vbus_work);
+
 	udc->driver->unbind(gadget);
 
 	mutex_lock(&udc->connect_lock);
@@ -1826,35 +1824,37 @@ static ssize_t soft_connect_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t n)
 {
 	struct usb_udc		*udc = container_of(dev, struct usb_udc, dev);
-	ssize_t			ret;
-
-	device_lock(&udc->gadget->dev);
-	if (!udc->driver) {
-		dev_err(dev, "soft-connect without a gadget driver\n");
-		ret = -EOPNOTSUPP;
-		goto out;
-	}
+	bool			disconnect, was_disconnected;
+	int			ret;
 
 	if (sysfs_streq(buf, "connect")) {
-		mutex_lock(&udc->connect_lock);
-		usb_gadget_udc_start_locked(udc);
-		usb_gadget_connect_locked(udc->gadget);
-		mutex_unlock(&udc->connect_lock);
+		disconnect = false;
 	} else if (sysfs_streq(buf, "disconnect")) {
-		mutex_lock(&udc->connect_lock);
-		usb_gadget_disconnect_locked(udc->gadget);
-		usb_gadget_udc_stop_locked(udc);
-		mutex_unlock(&udc->connect_lock);
+		disconnect = true;
 	} else {
 		dev_err(dev, "unsupported command '%s'\n", buf);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
-	ret = n;
-out:
-	device_unlock(&udc->gadget->dev);
-	return ret;
+	guard(mutex)(&udc->connect_lock);
+
+	if (!udc->bound) {
+		dev_err(dev, "soft-connect without a gadget driver\n");
+		return -EOPNOTSUPP;
+	}
+
+	/* "connect" only lifts the disconnect, it doesn't override VBUS etc. */
+	was_disconnected = udc->soft_disconnected;
+	udc->soft_disconnected = disconnect;
+	ret = usb_udc_update_connection_locked(udc);
+	if (ret) {
+		/* The pullup didn't change, so neither does the request */
+		udc->soft_disconnected = was_disconnected;
+		udc->allow_connect = usb_udc_may_connect(udc);
+		return ret;
+	}
+
+	return n;
 }
 static DEVICE_ATTR_WO(soft_connect);
 
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 8285b19a25e0..53ace954d189 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -412,8 +412,8 @@ struct usb_gadget_ops {
  *	u_ether.c to improve performance.
  * @is_selfpowered: if the gadget is self-powered.
  * @deactivated: True if gadget is deactivated - in deactivated state it cannot
- *	be connected.
- * @connected: True if gadget is connected.
+ *	be connected. Cleared when the gadget driver unbinds.
+ * @connected: True if the gadget's pullup is enabled.
  * @lpm_capable: If the gadget max_speed is FULL or HIGH, this flag
  *	indicates that it supports LPM as per the LPM ECN & errata.
  * @wakeup_capable: True if gadget is capable of sending remote wakeup.

-- 
2.56.0


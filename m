Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0692DF132;
	Thu, 18 Jun 2026 14:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781793227; cv=none; b=UAhFvW7JMwdJyhTXNakyAjIWgcLfWDpCWd+evyYKW9AA8d8KRueqNm+2iBjWzKeooQAiX4aEgLqpQTDE/bKD6ReAeAEyy6cIuoCiuNduT30kDUjV3XRCuQy5OGqiyOcXA7nSrPsO9JqzLtdn8r2VxbqVbmfcOuwNldFcqyiDLM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781793227; c=relaxed/simple;
	bh=jAx4EgYigl6+805gsoCFJt8yOurnxjXty4BVOw5ndr0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RM1Lmw6SNoKkr0HVFprEFppZ/MYLkbSGJOt2RWpWy+nRu3/pgZmx/oSYhgNqPXhSUAeeJxQrVdfQKzLYEExjWZbGz4HzQpiJQeyH+0WbiuQ+lw5ISN2uRyKbw4UvODc2SIRcFnmatn+B3kPDh+3wY9MtBX6wjFCHuIZnEmtMvog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8fGQdH2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8fGQdH2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF3C1F000E9;
	Thu, 18 Jun 2026 14:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781793226;
	bh=LV24FgzbadwGKhJwEbi/JLsHSzUcUm4qPKHUdvzONLk=;
	h=From:To:Cc:Subject:Date;
	b=F8fGQdH28JacQC1B+JcuxbnqT93jBA6cnr6MobZPDnvwDLyGK2xHYzdFhrBbdRVSH
	 3lVqyOXXTydJf93CDTSXxH0d57KrMvR74ATk4pFYyjAazpApWqCVtBMwiN6YkyhGHA
	 E5I6hvSiS3iCtI+QA1XU9t8ccIY6IBlDXoVk9TCEgXdqYNmu8N78LpWB2OKB+iO+TK
	 7XSZlx1CgnLHWoOFWGu/QX+Sjfz0tR3zlgE74ht1dVdyKm8YAzRilgUrt8NOGDt3YY
	 rXGvMzulUX3PbXnyTspWioKkjcDuRR0QeD6S6ZMIFcGyzW19B+Cp9KHTRdDHBuAs5q
	 vf9sW4fQxDo/Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Duoming Zhou <duoming@zju.edu.cn>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: ucsi: huawei_gaokun: move typec_altmode off stack
Date: Thu, 18 Jun 2026 16:33:14 +0200
Message-Id: <20260618143341.1900221-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The typec_altmode structure contains a 'struct device' object
that cannot be allocated on the stack because of its size, even
when ignoring the lifetime rules:

drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c:326:13: error: stack frame size (1456) exceeds limit (1280) in 'gaokun_ucsi_usb_notify_ind' [-Werror,-Wframe-larger-than]
  326 | static void gaokun_ucsi_usb_notify_ind(struct gaokun_ucsi *uec)

Since the altmode is always associated with a port here, move
it into the port object and avoid at least the stack allocation
issue.

Fixes: 1c2b66a7d725 ("usb: ucsi: huawei_gaokun: support mode switching")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This is probably not the fix we want, as it still leaves an uninitialized
device object in the structure, but it illustrates the issue and
fixing it like this has no immediate downsides.

Please check if you want this as a hotfix for the moment, or can provide
a more elaborate fix. Reverting 1c2b66a7d725 may also be an option.
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index ad669d2f8b9c..ca1b534cb183 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -84,6 +84,8 @@ struct gaokun_ucsi_port {
 	struct auxiliary_device *bridge;
 
 	struct typec_mux *typec_mux;
+	struct typec_mux_state state;
+	struct typec_altmode dp_alt;
 
 	int idx;
 	enum gaokun_ucsi_ccx ccx;
@@ -292,24 +294,22 @@ static int gaokun_ucsi_refresh(struct gaokun_ucsi *uec)
 static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
 {
 	struct gaokun_ucsi *uec = port->ucsi;
-	struct typec_mux_state state = {};
-	struct typec_altmode dp_alt = {};
 	int idx = port->idx, ret;
 
 	/*
 	 * For every typec port on this platform, the only mode-switch is
 	 * controlled by its qmp combo phy which consumes svid and mode only.
 	 */
-	dp_alt.svid = port->svid;
-	state.mode = port->mode;
-	state.alt = &dp_alt;
+	port->dp_alt.svid = port->svid;
+	port->state.mode = port->mode;
+	port->state.alt = &port->dp_alt;
 
 	if (idx >= uec->num_ports) {
 		dev_warn(uec->dev, "altmode port out of range: %d\n", idx);
 		return;
 	}
 
-	ret = typec_mux_set(port->typec_mux, &state);
+	ret = typec_mux_set(port->typec_mux, &port->state);
 	if (ret)
 		dev_err(uec->dev, "failed to set mux %d\n", ret);
 
-- 
2.39.5


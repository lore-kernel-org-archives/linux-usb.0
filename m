Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267241;
	b=qqVTkeM9C5fPWaJDRFlC4U+ow98/o69OzhaWnW3GqzgUqUplbcCTgC1juH6sbdyeZGBk
	 W1zPgZ+3Wyip9wXAZxfPC/4A1pI7SmcS0B8FtnwHCc61DuG+v3a56lo9eBaNi5I4IpqMX
	 5rlEtbJFCyBT7shffzzGYrelZ7ztSfzyxeNG/SSLTaXNSDQCgIhXO+DrC98+mIMsWAWYq
	 mszVGCVYUjAiKWq6NEdjSQUHec+TJFlQ+/2AgHgHD6gnjSkdkUHGcy1Wyp2sfbaKGuIhj
	 rMEmPk5IXsR4gjkcjV5aL5p/C4hl2nouBUJ/9ZUl/Fp4jCQvdfoYs3kWXU7ZM2SuBEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267241;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=D/C5WVldHqbUUcW5BkEw06TdZ/AWEE83/rEG7g3uqtM=;
	b=sGHzXH8CQEbwX5mrmvoFvW0odkI1wStWtcuPRvAbkO0LOu7SSirZAusGoyJ2a2Byk8z7
	 rO8JKEsEXXwAvlzRliWneaKsbrxBhoD0Y3U/pvTD4KIraPnyNZG9xPc1DsVq0OqXhqgdt
	 ZwUP13ddxtKwqVq3NjNQ5+sDhkWPsD/qefh8eCbgggaXnG4E9gALQcyxDFnfrS2F2Vrvm
	 5i5ZMoYh2Pt6kHHThIrtS/IOMUDqipnnGIHstCW1OIt9xszdhUPX3AuJUdTiGcXzAWVt5
	 dvlOmzHsD+bMuQxCVlXR94W9KnXDPndpcIFWGIrpOZlw2p1K9GqdCiAGm2vU/7qaxaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=gSmusYx9;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914CF606A338;
	Sat, 21 Nov 2026 13:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 914CF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=gSmusYx9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=D/C5WVldHqbUUcW5BkEw06TdZ/AWEE83/r
	EG7g3uqtM=; b=gSmusYx9zsTJlugFuiBYrdFTgbx+lf8uaLsQcHVJsdGGMrgz7s
	FqzcE3KSfCT42zzLJWZjO3qW9EKwXuWq7UjxGXL/ciJLo/4SqBhYwl0jnHXZBHcu
	9A5+nO44P5kuc/KIOBZn3P73RmWA1nhJl5+A7chnhIM0NpovqSWDu5SEc=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.187.147])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCnKT6dmgFr9DfkAA--.3095S4;
	Sat, 21 Nov 2026 21:20:32 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 2/3] usb: roles: look up role switches attached to a graph endpoint
Date: Sat, 21 Nov 2026 21:20:28 +0800
Message-ID: <20261121132029.2379449-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121132029.2379449-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261121022104.1507987-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261121132029.2379449-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCnKT6dmgFr9DfkAA--.3095S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4fZFy3ur1DCryDZr1kXwb_yoWrJw4kpr
	y5KF4Fqr4DJFya9w4fKa1DAFWrur4fGFWUJF4Iqw1fC3ZaqrWfJr18ta4ayr15CanFgw1Y
	v348A3409a4DA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4
	vE14v_Xr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUslks
	DUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARESB2sAn9smxQBMsF

usb_role_switch_get() and fwnode_usb_role_switch_get() look for a switch
on the caller's parent device node or through device_connection.  That does
not work when one controller exposes a role switch per connector endpoint:
the switch is registered against the remote graph endpoint and the
consumer, the connector, has no phandle to it.

Add usb_role_switch_at_endpoint(), which walks the caller's OF graph
endpoints and matches a switch registered on the remote endpoint, and try
it after the existing parent lookup.  A switch that is described by the
graph but not registered yet comes back as -EPROBE_DEFER, as the rest of
the role-switch API does, so the caller retries instead of concluding that
the connector has no role switch at all.  There is no behaviour change for
existing users: if nothing is registered against an endpoint the lookup
falls through to the previous paths.

This is needed by DWC3 designs where two Type-C receptacles share one High
Speed data bus.

*** AI-assistance disclosure ***
This patch was prepared with the help of an LLM coding assistant.  The
author reviewed every line and ran the gates quoted in the series notes.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/usb/roles/class.c | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index edec139b68..ee186d542a 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -157,6 +157,47 @@ usb_role_switch_is_parent(struct fwnode_handle *fwnode)
 	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
 }
 
+/*
+ * Look up a role switch registered against the remote endpoint of one of the
+ * caller's OF graph endpoints.  This is how a connector endpoint that shares a
+ * USB data bus with another connector (for example two Type-C receptacles on a
+ * single DWC3 controller, selected by a GPIO mux) finds its own role switch.
+ */
+static struct usb_role_switch *
+usb_role_switch_at_endpoint(struct fwnode_handle *fwnode)
+{
+	struct fwnode_handle *ep, *remote, *parent;
+	struct usb_role_switch *sw;
+	bool available;
+
+	fwnode_graph_for_each_endpoint(fwnode, ep) {
+		parent = fwnode_graph_get_remote_port_parent(ep);
+		if (!parent)
+			continue;
+		available = fwnode_device_is_available(parent);
+		fwnode_handle_put(parent);
+		if (!available)
+			continue;
+
+		remote = fwnode_graph_get_remote_endpoint(ep);
+		if (!remote)
+			continue;
+		sw = usb_role_switch_match(remote, "usb-role-switch", NULL);
+		fwnode_handle_put(remote);
+		/*
+		 * ERR_PTR(-EPROBE_DEFER) means the switch is described by the graph
+		 * but not registered yet: pass it up so the caller defers instead of
+		 * concluding that this connector has no role switch at all.
+		 */
+		if (sw) {
+			fwnode_handle_put(ep);
+			return sw;
+		}
+	}
+
+	return NULL;
+}
+
 /**
  * usb_role_switch_get - Find USB role switch linked with the caller
  * @dev: The caller device
@@ -169,6 +210,8 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
 	struct usb_role_switch *sw;
 
 	sw = usb_role_switch_is_parent(dev_fwnode(dev));
+	if (!sw)
+		sw = usb_role_switch_at_endpoint(dev_fwnode(dev));
 	if (!sw)
 		sw = device_connection_find_match(dev, "usb-role-switch", NULL,
 						  usb_role_switch_match);
@@ -192,6 +235,8 @@ struct usb_role_switch *fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
 	struct usb_role_switch *sw;
 
 	sw = usb_role_switch_is_parent(fwnode);
+	if (!sw)
+		sw = usb_role_switch_at_endpoint(fwnode);
 	if (!sw)
 		sw = fwnode_connection_find_match(fwnode, "usb-role-switch",
 						  NULL, usb_role_switch_match);
-- 
2.53.0


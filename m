Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244895;
	b=ko8c7DrWdQVhbno4RDhikZwTFbT0RlKofzjNrJPb0zzS0GjwWnAzRL1RkGW2wWfXk90Z
	 vCKTyHTGKeAOAGhDodB1LXcIU9dt94nN62N/t08cM02+g+y/1MWLFxzfc2rzkzGOiHr/f
	 CceQE/GyD5tlkyaXdr42U45cgL9GIVmDeR9EgOCErNy1NSVEPkfL4C7nsSDYmGX4JbCOK
	 wDWSNbHHXD7Imk/5hLEwqkIFlyTxxp8IjKa4Kd430l57zgX5SBkkWsPfPWxOdvOghzR5m
	 G4nur7MfiypGapDtW2jUsDwycPvkmMkq7M9yft4+yFhxn8sk/wjCLZNhXIK+l1j9TWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jggiWoga1NJk7y9SQGC+twyNAV0WmO0xloKYic2KKGU=;
	b=HmVvU9zSy6J/FlWEriLq8N8hdl7eDA5q2UTeaIg2k4pjX9ny6Oz94InmimgqSJ8qgVfV
	 3G7i4UyuF52PyDJBpPTWcHVW1CrZb+xWjwG/l4JH2atfDbb/0KXt8ye6CxJ5blWvSOzET
	 +5vd1tJCB58XhyRArtRAGQIpunrJnYPpeABhPl2tRSS6pMbUsVEorC5R7gZLlPfcnPZDg
	 9GNQoXMXYjpGgED460rmkwQ92qEtzEvL4j66uqUQFwoYNCOpf4XdVLChsCfPBo+h/vwrD
	 ubMBerDXMZMLmY/ZgBJAgCWxxBTxOwjpc7W4fKNaUeBF5yBPQk3XIJVM0HY05W8q41A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=swWh2SPr;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3299F606A325
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 07:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3299F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=swWh2SPr
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-862b090e3c3so953974a34.2
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 23:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795244894; x=1795849694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jggiWoga1NJk7y9SQGC+twyNAV0WmO0xloKYic2KKGU=;
        b=swWh2SPraKH11s8llPywjH2PX9jXWQPMOYAoqePeiNUBsAZGN9QUOLJmcpjc6G7iJn
         8gn7kg6htd0zgX45ftC+OHCgiXplujt3uG0MiDbu2Ripsad+Pwhl1gQmGGXVJnVTDVs+
         CeBT/CvO2So1aPA5ZRhcT5RXfHqo0vQ9OzCjSQ6LbpLKPyFkti24ub/4UBs1c7og5yD7
         FeaefATMtRz92ehVx+OjwUHpdaVR0g/l1VNvn9kt/iZLjMGXi8x2yOHLQrpIOCnUVdE3
         sNjQNb2OPXbOD+eEiKAznKKxp+0m2QA1vmQybPO9c8CSPsiDvKAm/M3BrPSl66cbHhvb
         2V7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244894; x=1795849694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jggiWoga1NJk7y9SQGC+twyNAV0WmO0xloKYic2KKGU=;
        b=IG44K3gwOk8Mh2dgdzBZC8afx1JgTOxEGsiwwxs/UxHSeUT8HI/WjWEOeFIZrui04J
         qQotuPXD880h8sDMTSV27InK7Gl6GDAlknEVVaVBeuD0IkeuIi0fRQewkzxkxY1w/J6G
         Y0AVaMXBG/Cwz4oHVOuu55FhptPMT7ORI0a8Qqo9uOy/W28AYxTfnQ0XFz39hPOtgtbY
         uiJO7k8LQXsv30ejq23LBsY3I6yP1IIjB+v3GvOz9Vc9ckr2CSy+Cwcuku/tXmt3l7Z0
         aTkULGaaG8fE92Pan+E+AMXSmOnFtMsw5JJqNU3/NYuvL2otuTh51PPaqAtfg4F+oljc
         hSEg==
X-Forwarded-Encrypted: i=1; AL+hErHY0zA5rrkiO0t/7FMsOFAIYJryuAC9jlFISIgNI1kmtaBRCWooWmQn2ijbzdub7zr7rIfZYeeAbiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TAGNZYLa4mCjbmIG67ZbP67bjO2sKelFAV2zEX1w2y0JBYCNT
	QloNE2awhZS/xUVK8dnAjexoL1LMyoV+dcH3/nBnIBC4XWYQKBM4c6pp
X-Gm-Gg: AZFdTZfVOW2Cv3NUF/rKkxcfXrtL4DIo35sZ8F7vYYOxoVgb4Q/DgK7upFGA4PeJBMU
	qD0JCAf8ZEHcbSFdRyxHWHNZ0e1xgVsoJowqJC6skuiBZRV17gAfDqBkvFUJNFbgIHdXNAOOrR7
	HXqeEje5bV1WoYQWmboYJE1nEZYL7pGRBYz0o+n5+LQnWKV5o0nJZXLgEvcRekCYT2xtQRxTrnt
	2cUuVT47cIOWY8t11DjXTdtYzNxEAXAfxTXjQ3fPjeFzwQsRPW8zYIe53XyJcnoeLusJ9RC4xfO
	MO5vz6tzaB7gW5kydBaBR33n8TgAmuHO7kdVL7FT6GEOf/tVXmz13hb6tMNBu+Aa/w8dU69N1Nm
	3Y+gjGh9cHJgmS9Xi5NgyOhbwQhslJkVP+pYRvwA+JQiLkYhxKRDC8oxbEtvAKi7wBf1ZwixyeF
	UFn868BkFuaYGdCLTVoguOAjfyHc1foqk4fX/07NMHffQSH9UYmbX1c09HtXlszk5SM1/AApewN
	ci1tCx2z9mFxIUwXZlB0g7v66c6jzwiGorUiOuaxM3LHP8z3U1qPukKmVV969/AvuEpnYA+F5pM
	fC7plu6fC+xlU9w0X2Qqo2Fk5UwqlGwZOt5cceAMsCimpFN/tTttymaDj7vZ3LoPLxsoHp0l/ak
	TrRuLSMnvXDc5OSg=
X-Received: by 2002:a05:6830:44a2:b0:862:bda5:b88b with SMTP id 46e09a7af769-86315a0c16cmr6284627a34.21.1795244893993;
        Fri, 20 Nov 2026 23:08:13 -0800 (PST)
Received: from hyprland ([189.146.113.144])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6d8sm3737609a34.10.2026.11.20.23.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:08:13 -0800 (PST)
From: Alfonso Villalobos Ulate <alfonsocvu@gmail.com>
To: westeri@kernel.org
Cc: andreas.noever@gmail.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	Alfonso Villalobos Ulate <alfonsocvu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] thunderbolt: Re-add host router DP IN adapters after DPRX failure
Date: Sat, 21 Nov 2026 01:08:04 -0600
Message-ID: <20261121070804.26185-1-alfonsocvu@gmail.com>
X-Mailer: git-send-email 2.53.0
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

When DPRX negotiation fails, the DP IN adapter is removed from the DP
resources and is only added back on a hotplug event for that adapter.
Host router DP IN adapters never get such events, so after one failure
(for example when the GPU feeding it is runtime suspended) the adapter
stays unused until the driver is reloaded.

Re-check the host router DP IN adapters when a DP OUT adapter appears
or a device router is plugged in, and skip adapters already on the
list. Keep host DP IN adapters in adapter order so a re-added one is
paired with the same DP OUT as before, instead of swapping monitors
with the other host DP IN.

Tested on an ASM4242 host with a CalDigit TS5 Plus dock.

Written with assistance from Claude Code (Claude Opus 5.5), which
proposed the code changes and drafted this message.

Fixes: d6d458d42e1e ("thunderbolt: Handle DisplayPort tunnel activation asynchronously")
Cc: stable@vger.kernel.org
Signed-off-by: Alfonso Villalobos Ulate <alfonsocvu@gmail.com>
---
 drivers/thunderbolt/tb.c | 52 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 57c11ba13459..4a43da6817a2 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -109,6 +109,29 @@ static void tb_queue_hotplug(struct tb *tb, u64 route, u8 port, bool unplug)
 
 /* enumeration & hot plug handling */
 
+/*
+ * Insert a host router DP IN adapter so that host DP IN adapters stay
+ * in adapter number order. A DP IN that is re-added after it was
+ * dropped (for example because DPRX negotiation failed) then gets
+ * paired with the same DP OUT as before, instead of swapping DP OUT
+ * adapters (and therefore monitors) with the other host DP IN.
+ */
+static void tb_add_host_dp_in(struct tb_cm *tcm, struct tb_port *port)
+{
+	struct tb_port *p;
+
+	list_for_each_entry(p, &tcm->dp_resources, list) {
+		if (tb_port_is_dpin(p) && !tb_route(p->sw) &&
+		    p->port > port->port) {
+			/* Insert before the first higher numbered one */
+			list_add_tail(&port->list, &p->list);
+			return;
+		}
+	}
+
+	list_add_tail(&port->list, &tcm->dp_resources);
+}
+
 static void tb_add_dp_resources(struct tb_switch *sw)
 {
 	struct tb_cm *tcm = tb_priv(sw->tb);
@@ -118,6 +141,9 @@ static void tb_add_dp_resources(struct tb_switch *sw)
 		if (!tb_port_is_dpin(port))
 			continue;
 
+		if (!list_empty(&port->list))
+			continue;
+
 		if (!tb_switch_query_dp_resource(sw, port))
 			continue;
 
@@ -130,7 +156,7 @@ static void tb_add_dp_resources(struct tb_switch *sw)
 		if (tb_route(sw))
 			list_add(&port->list, &tcm->dp_resources);
 		else
-			list_add_tail(&port->list, &tcm->dp_resources);
+			tb_add_host_dp_in(tcm, port);
 
 		tb_port_dbg(port, "DP IN resource available\n");
 	}
@@ -1421,6 +1447,16 @@ static void tb_scan_port(struct tb_port *port)
 		tb_sw_warn(sw, "USB3 tunnel creation failed\n");
 
 	tb_add_dp_resources(sw);
+
+	/*
+	 * Host router DP IN adapters may have been dropped earlier
+	 * (for example because DPRX negotiation failed) and they do
+	 * not get hotplug events of their own, so re-check them now
+	 * that there is potentially a new DP OUT to pair with.
+	 */
+	if (tcm->hotplug_active)
+		tb_add_dp_resources(sw->tb->root_switch);
+
 	tb_scan_switch(sw);
 
 out_rpm_put:
@@ -1971,8 +2007,10 @@ static void tb_dp_tunnel_active(struct tb_tunnel *tunnel, void *data)
 		 * also tear down the tunnel and try to re-use the
 		 * released DP OUT.
 		 *
-		 * It will be added back only if there is hotplug for
-		 * the DP IN again.
+		 * It will be added back if there is hotplug for the
+		 * DP IN again. Host router DP IN adapters do not get
+		 * such events, so they are re-checked whenever a new
+		 * DP OUT or device router appears instead.
 		 */
 		tb_tunnel_warn(tunnel, "not active, tearing down\n");
 		tb_dp_resource_unavailable(tb, in, "DPRX negotiation failed");
@@ -2234,6 +2272,14 @@ static void tb_dp_resource_available(struct tb *tb, struct tb_port *port)
 	list_add_tail(&port->list, &tcm->dp_resources);
 	tb_exit_redrive(port);
 
+	/*
+	 * Host router DP IN adapters removed because DPRX negotiation
+	 * failed never get a hotplug event of their own. Give them
+	 * another chance now that a DP OUT became available.
+	 */
+	if (tb_port_is_dpout(port))
+		tb_add_dp_resources(tb->root_switch);
+
 	/* Look for suitable DP IN <-> DP OUT pairs now */
 	tb_tunnel_dp(tb);
 }
-- 
2.53.0


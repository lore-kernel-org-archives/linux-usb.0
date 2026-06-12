Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4BD39B4A3
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 05:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781241682; cv=none; b=i5T+F/znDzyPMLdQZJcdZtRrNZJfT0j/UX7N+dcoD3aHbLxgK0akBaSD6UlCSbzWYp92HpPia60UFpzYx4CB0+ZGrp28ZfLH4rHeW1oIhQo+qnx54XAO93Tw+RNzRs2OQL+tj26Zo1fEtmfcFWT4yOGRmdrksE8KOq9dxNOnFRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781241682; c=relaxed/simple;
	bh=0gCO3nAwCjgUWtVQj9b6QyAFiq5F7Yhs8aWwpLpGvgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OrgyF4vT6MptX1q5yUMv9MWlmCuK+INJjqaOnL1rpQ4oqAeqE0rDrG/f6DIGehU4V5UFA+yJeFNIQt6tvMF38LugdwOKsnjhoOWEJHUeH4TiMuROdrsJd1VSbfb92VE8VBVtteOeFUgizjb5107chZNtLGOWN0GXLocdtbwYe4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGcWZajE; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGcWZajE"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso408838a91.0
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 22:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781241680; x=1781846480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJYc3L5xpjGXnD28WY0F2UDxSAtMKFQnuNF/YV4o4zk=;
        b=NGcWZajEaTDaD65sYqlEzJlrjgK6HqFiNKf1Du9V3hJi3GCzzjcay96WU0pGjiZC9p
         oj/6HLbCYs3xqRjxzaZ2A9JUi7IiOCaPGezjl6ti57sXIgjL+HtbzNiHqBztCas9egTx
         YPCyG7+uUzejg8CTf7X9czaYl5xXJboa+hj+WlZvLaMdsWzePmZtjSKVOO8arb5qTtVY
         uB0Liz2f1V4t3e/Bsr3RNWz2J1Yd24uSyean6Wm/XvXKnqel5sPgfZumzD8cr+RvRLxL
         VGVQNE9M/Rgv5ZS+cQ+p27LaKE+RVhBkEvDqVtqdQkuJ6lktnoEFZezfvyNSKmwW5W1W
         hrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781241680; x=1781846480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vJYc3L5xpjGXnD28WY0F2UDxSAtMKFQnuNF/YV4o4zk=;
        b=mu55JUDl8CtPAE8kdF5KDVeo7tNRw3y+mA0upDensXrhCPrw6e5ffS+VsxTLkddE6g
         HnuimTHvxr3yPnvdKg89vYZaaooLm13jBthj0uiIkoYOyhIczTSzyVw2k4BRnumi22vg
         J/o8Fg0i0W0g4MFfb9+AWNgL8wtRMOEYbe7ySZU23SYanGq5J7Setn7IAR1iDnnd4A3I
         +onVQvVfZRr7gP69MMVdR2Y8opTSvRz8iWoJ1o/7bplBp8czsZQ6Ib7Z6MdJcBXcPXQV
         NAekrNi0VwO/q+ZjW8kKwcOkAXZ9/GGjE+mfHDUosrWp6BSouVxCf/+ZO0X/Hr49/jWj
         u3lw==
X-Forwarded-Encrypted: i=1; AFNElJ+LQ6EpS+sDuJFQEEk08aqT3yMHyDgU0V5hvvdY6fiytmcAqPLceAGF6S2hLQWRar5JxsfuPQjNrxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOhnzyEW2YOYE7Kr+tRkR/WG+o2+V175rN3nLQs9gFSBakD40n
	qCB2o91mbZPltuN80jAjVedKuYYdjFfvEvk55giMu655cXwwyEBXz1qi
X-Gm-Gg: Acq92OFrF4iE7m1PyUKFLrH187ACXK3h5xrisDRQlzuRU5iJwbAcOEYl3CotMyGBNJ+
	tEoCnkrPoNbHQTbAHFJBxBwVmDRwQQJPTallP3FCFqd//pycBMQBiRvfVHqUnK1KPlG98uVrlz/
	Vew6TWNE605uuxlxYqyFBWj6bxUSq+c0ViJ12P+RSplQTcYTF5kDbLtbt1cjIU9h00TbIIgeHXt
	Rxg2MXEeLaoT6SmYGjObvhB14XsstpMWTLs+LwnkRUTJuoer3w59W0QHOI2kgL1PKn7OofoovH4
	J026wK2gHf98UvQHQBwJCHb7GXkLYECJ1j64uZ8NXOZNrsMmg+MeUHwErdbn9gAepuz1A2zWD/6
	rlJrATEU8/g5dVvUTLCRVyUW+c/BAdik2JHqjxvxQPLxqS6WgUJnMqnq2xcPqGBPORUR2Epvz6q
	2WPQ1ysgOq5/6R72lJba5B02qNlKH9+bafBJvneLCjSerWOBfFgG/B
X-Received: by 2002:a17:90b:3a05:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-37a01845ec7mr1468991a91.4.1781241679742;
        Thu, 11 Jun 2026 22:21:19 -0700 (PDT)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e84e7011sm602092a91.1.2026.06.11.22.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 22:21:19 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: bleung@chromium.org,
	jthies@google.com,
	myrrhperiwinkle@qtmlabs.xyz,
	pooja.katiyar@intel.com,
	abelvesa@kernel.org,
	yuanhsinte@chromium.org,
	johan@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] usb: typec: ucsi: Detect and skip duplicate altmodes from buggy firmware
Date: Fri, 12 Jun 2026 13:21:10 +0800
Message-ID: <20260612052112.1325812-2-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612052112.1325812-1-acelan.kao@canonical.com>
References: <20260612052112.1325812-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some firmware implementations incorrectly return the same altmode
multiple times at different offsets when queried via
UCSI_GET_ALTERNATE_MODES.  This causes sysfs duplicate filename errors
and kernel call traces when the driver attempts to register the same
altmode twice:

  sysfs: cannot create duplicate filename '/devices/.../typec/port0/port0.0/partner'
  typec-thunderbolt port0-partner.1: failed to create symlinks
  typec-thunderbolt port0-partner.1: probe with driver typec-thunderbolt failed with error -17

The matching rules differ by recipient:

  - UCSI_RECIPIENT_CON (port) and UCSI_RECIPIENT_SOP_P (plug):
    Two altmodes with identical SVID and VDO are byte-for-byte
    duplicates and the second has no observable function, so drop it.

  - UCSI_RECIPIENT_SOP (partner):
    The typec class binds each partner altmode to a port altmode of
    the same SVID via altmode_match()/device_find_child(), which
    returns the first port altmode with a matching SVID.  If the
    partner advertises more altmodes for SVID X than the port
    advertises, the surplus partner altmode(s) collapse onto an
    already-paired port altmode and trigger the
    "duplicate filename .../partner" sysfs error during
    typec_altmode_create_links().  Use the port-side altmode count for
    SVID X as the authoritative cap and reject any partner altmode
    that would exceed it.  This preserves legitimate multi-Mode
    partner altmodes (vendor SVIDs that the port really does
    advertise more than once) while filtering the firmware-generated
    duplicates that have no port counterpart, and is therefore
    stricter than a plain SVID+VDO comparison (which still admits the
    Thunderbolt case where firmware reports the same SVID twice with
    different VDOs) without being over-broad like a plain SVID match
    (which would falsely drop legitimate vendor multi-Mode entries).

If a duplicate is detected, skip it and emit a clean warning instead
of generating a kernel call trace:

  ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode SVID 0x8087 at offset 1, ignoring.
  ucsi_acpi USBC000:00: con2: VDO mismatch: 0x8087a043 vs 0x00000001

The duplicate detection logic lives in a reusable helper
ucsi_altmode_is_duplicate() and is invoked from
ucsi_register_altmodes().  It applies to all three recipient types:
partner (SOP), port (CON), and plug (SOP_P) altmodes.

Fixes: a79f16efcd00 ("usb: typec: ucsi: Add support for the partner USB Modes")
Cc: stable@vger.kernel.org
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
--
v6. - New helper ucsi_altmode_count_svid() counts altmodes with a given
      SVID in any of the per-connector altmode arrays.
    - ucsi_altmode_is_duplicate() for UCSI_RECIPIENT_SOP no longer asks
      "have I seen this SVID before". It now checks whether
      partner_count_for(svid) >= port_count_for(svid) and rejects only the
      surplus.
    - For UCSI_RECIPIENT_CON and UCSI_RECIPIENT_SOP_P, behavior is
      unchanged: still SVID+VDO exact-dup match.
    - Commit message rewritten to spell out the per-recipient rules and
      why partner needs the cardinality cap (avoids both the SVID-only
      false positives that hurt the legitimate Dell 0x413c case and the
      SVID+VDO false negatives that let the Thunderbolt 0x8087 firmware
      bug through).
---
 drivers/usb/typec/ucsi/ucsi.c | 132 ++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 92166a3725b16..9cd7fd7a38521 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -529,6 +529,129 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 	return ret;
 }
 
+static void ucsi_dump_duplicate_altmode(struct ucsi_connector *con,
+					u8 recipient, u16 svid,
+					u32 existing_vdo, u32 new_vdo,
+					int offset)
+{
+	static const char * const recipient_names[] = {
+		[UCSI_RECIPIENT_CON]    = "port",
+		[UCSI_RECIPIENT_SOP]    = "partner",
+		[UCSI_RECIPIENT_SOP_P]  = "plug",
+		[UCSI_RECIPIENT_SOP_PP] = "cable plug prime",
+	};
+
+	dev_warn(con->ucsi->dev,
+		 "con%d: Firmware bug: duplicate %s altmode SVID 0x%04x at offset %d, ignoring.\n",
+		 con->num, recipient_names[recipient], svid, offset);
+
+	if (existing_vdo != new_vdo)
+		dev_warn(con->ucsi->dev,
+			 "con%d: VDO mismatch: 0x%08x vs 0x%08x\n",
+			 con->num, existing_vdo, new_vdo);
+}
+
+/* Count altmodes in @altmodes that advertise @svid. */
+static int ucsi_altmode_count_svid(struct typec_altmode **altmodes, u16 svid)
+{
+	int count = 0;
+	int k;
+
+	for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
+		if (!altmodes[k])
+			break;
+		if (altmodes[k]->svid == svid)
+			count++;
+	}
+
+	return count;
+}
+
+/*
+ * Check if an altmode is a duplicate. Some firmware implementations
+ * incorrectly return the same altmode multiple times, causing sysfs errors.
+ * Returns true if the altmode should be skipped.
+ *
+ * The matching rules differ by recipient:
+ *
+ *   - UCSI_RECIPIENT_CON (port) and UCSI_RECIPIENT_SOP_P (plug):
+ *     Two altmodes with identical SVID and VDO are byte-for-byte duplicates
+ *     and the second has no observable function. Drop them.
+ *
+ *   - UCSI_RECIPIENT_SOP (partner):
+ *     The typec class binds each partner altmode to a port altmode of the
+ *     same SVID via altmode_match()/device_find_child(), which returns the
+ *     first port altmode with a matching SVID. If the partner advertises
+ *     more altmodes for SVID X than the port advertises, the surplus
+ *     partner altmode(s) collapse onto an already-paired port altmode and
+ *     trigger a "duplicate filename .../partner" sysfs error during
+ *     typec_altmode_create_links(). Use the port-side altmode count for
+ *     SVID X as the authoritative cap and reject any partner altmode that
+ *     would exceed it. This preserves legitimate multi-Mode partner
+ *     altmodes (e.g. vendor SVIDs that the port really does advertise
+ *     twice) while filtering the firmware-generated duplicates that have
+ *     no port counterpart.
+ */
+static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 recipient,
+				      const struct ucsi_altmode *alt_batch, int batch_idx,
+				      u16 svid, u32 vdo, int offset)
+{
+	struct typec_altmode **altmodes;
+	int port_count, partner_count;
+	int k;
+
+	/* Check for duplicates within the current batch first */
+	for (k = 0; k < batch_idx; k++) {
+		if (alt_batch[k].svid == svid && alt_batch[k].mid == vdo) {
+			ucsi_dump_duplicate_altmode(con, recipient, svid,
+						    vdo, vdo, offset);
+			return true;
+		}
+	}
+
+	switch (recipient) {
+	case UCSI_RECIPIENT_SOP:
+		/*
+		 * Cap partner altmodes per SVID by the port-side count:
+		 * any further partner altmode for that SVID would alias an
+		 * already-paired port altmode and break typec sysfs.
+		 */
+		port_count = ucsi_altmode_count_svid(con->port_altmode, svid);
+		partner_count = ucsi_altmode_count_svid(con->partner_altmode,
+							svid);
+		if (port_count && partner_count >= port_count) {
+			ucsi_dump_duplicate_altmode(con, recipient, svid,
+						    con->partner_altmode[partner_count - 1]->vdo,
+						    vdo, offset);
+			return true;
+		}
+		return false;
+	case UCSI_RECIPIENT_CON:
+		altmodes = con->port_altmode;
+		break;
+	case UCSI_RECIPIENT_SOP_P:
+		altmodes = con->plug_altmode;
+		break;
+	default:
+		return false;
+	}
+
+	/* CON and SOP_P: drop only exact SVID+VDO duplicates. */
+	for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
+		if (!altmodes[k])
+			break;
+
+		if (altmodes[k]->svid != svid || altmodes[k]->vdo != vdo)
+			continue;
+
+		ucsi_dump_duplicate_altmode(con, recipient, svid,
+					    altmodes[k]->vdo, vdo, offset);
+		return true;
+	}
+
+	return false;
+}
+
 static int
 ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 {
@@ -653,6 +776,15 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 			if (!alt[j].svid)
 				return 0;
 
+			/*
+			 * Check for duplicates in current batch and already
+			 * registered altmodes. Skip if duplicate found.
+			 */
+			if (ucsi_altmode_is_duplicate(con, recipient, alt, j,
+						      alt[j].svid, alt[j].mid,
+						      i - num + j))
+				continue;
+
 			memset(&desc, 0, sizeof(desc));
 			desc.vdo = alt[j].mid;
 			desc.svid = alt[j].svid;
-- 
2.53.0


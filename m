Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E96E3B5854
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 08:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783932212; cv=none; b=qs7MDOZLBGt+XP028NrSEcU+oTR/Lc5L4AeTF0nfo59Ad05NQsMTOU62PrxDR+mKw9nP/SyVoFoV/kogZg1ivBDb2fOtACmimB8IExt+ZbdDagtV6vtbv6UonvGyFybYfTJxobeiKsTx2pmElJcKrTRjoM9XJO1eOi7G9s7AJ1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783932212; c=relaxed/simple;
	bh=9r6vNgPdZriUw+Ort+7U53TP0/hxMFFhg7LY/aEq2k0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n+4AlSjpMl2xlD3u59dU2XUtzfo2zi1e/BOKBVnIuwQOVKYQXTHY/MV5+P/kaHH/f9dX38nUXjyE6UOrsRtDjKcMRR/9Dk9nt2sDLg4nViDtp5S6eaCMP5owAPu0lDyk/rE9quOetYJkChVO4e/KcyUzHS11HahZKXhfqQhmYZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3NwooKO; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3NwooKO"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8486ac3f347so3285111b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 01:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783932209; x=1784537009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=teLti4iMYlIocxulMXkupiIzri+xOBAObTaeQIJy7Q8=;
        b=l3NwooKOwdkVS3l0rvXpwEEzRuUt2nTV0LIDsug4BCz7uNkiMvliVoew15YHg5JAKw
         3GA6u5t529SqPEkf7nZyMv78tDFC0NK1gmiuVWAvZpwKUgnW0G9iT/j6hTgIFOhzOo6r
         P+u6lac9A8f9nK59G649MycIrdH3bs4nBB4mHVxVCFYc6P7F4Ki3dzeSqatqKrLbw5wu
         z1VK78WHyrN55855DLmZTO7r2Y2BrTCIWfEYhixuZS9sCAp+98eTco/bavn0cyyq5hfe
         ji3Unb90ZNy4QXB9vcV86FV7JQHLAqsrcf2mH7xS68YzytEItWkaMFFSqOIDI+9GNlLZ
         Jx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783932209; x=1784537009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teLti4iMYlIocxulMXkupiIzri+xOBAObTaeQIJy7Q8=;
        b=GHz83U/QCXR4bd2zxITpdgI0gRash1DLohUmbkY5L2KE12tcLYS+BN6iyYoS6MlQRh
         XLUjwrcfYTYyOa4avbqfzn0dNPU3WZZKdZir+cRmxMy0DSa/UyuBXWFgzc6Hl0v/enkR
         3b7rx34572stSvxlsD8SqLoiMU2TjQ4oDuBU49fW7ou8RpAg0dQUzP0Xl5AmI8yfCJ5B
         NCQ+2RlN5vNKEJbaC3H0EdYEETVwmpZwpFp8YybaiC1BnzLPk3TDMy9AklC9FaFJKIU3
         EyQubJAetvsMRX4Z89unf35MRw68i8E7qKUJsAFaxzEyBeilrA8BlLXEPbsHWAuvJh8p
         uB5A==
X-Gm-Message-State: AOJu0Yxr4bVG6FpGC4OCVEU2Ly9vtUEMDLplHJ9VoHx66tqLKvqi2akL
	Hr1xcbUjOwuDPmh7TZLBKTf2QOXr77LzkZPQX45KYc4hKa/YOPgzcxf4qGp1iK2rFIo=
X-Gm-Gg: AfdE7clGwyJ69RTqTV88x3jrYufJUTDl41u9ORFI/Em6DJSH/ZGgY/BaBvzg6L9xuP2
	O+mkI2BzOYejZ8Ejuvpd0NtT7A2Q+OQycSDgCxnXOovydFxzCa/F4RT62tXIttbEFjtQB7cPXRs
	Dtbqu7CDXysEfu3EnoTP3WvDc3l1N3FtbKibqsbrYqDZcXmk2Lp9g4lzwx5HMzPxB+i17Mw8yWd
	ep6aE+gcOsyGLTLPwyVV+p782HpkddrKudtzk6n+KKxbGuNN0VWT/xEmrd7Rd1MbVbZcDeEj98B
	OiQk++xsGD/H92b3Awu90nbCn3eQqZf+A0JZut//nuLGce5TbeBqJZ0P2TsgTpc7eCVUzelTs9G
	YD7rmQf6SIyn/9ry8lU5sUS1Qk/4CfbIm08n48U8+2K/RI1dqOwgNVrlWKd+DjDe9z0WmNyP+T8
	lKLO7pq4mRwpVL0RSHr7nacPUQBiIwZqVJc7/2Yebe4oA4HNfh79gL
X-Received: by 2002:a05:6a00:3404:b0:845:e210:3771 with SMTP id d2e1a72fcca58-8488ac9f4a7mr6824226b3a.20.1783932209454;
        Mon, 13 Jul 2026 01:43:29 -0700 (PDT)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a3b8d3310sm1007735b3a.40.2026.07.13.01.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:43:28 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jameson Thies <jthies@google.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/3] usb: typec: ucsi: Detect and skip duplicate altmodes from buggy firmware
Date: Mon, 13 Jul 2026 16:43:21 +0800
Message-ID: <20260713084323.287516-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
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
v7. - Rephrase the warning message ", ignoring." to ", ignoring but
      please contact the BIOS vendor to fix this issue."
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
index 642acc09d861..b9343bf67357 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -550,6 +550,129 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
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
+		 "con%d: Firmware bug: duplicate %s altmode SVID 0x%04x at offset %d, ignoring but please contact the BIOS vendor to fix this issue.\n",
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
@@ -674,6 +797,15 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
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


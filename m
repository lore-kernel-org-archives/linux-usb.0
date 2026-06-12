Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2853612F1
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 05:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781241678; cv=none; b=lCw8jOIerojN9JfgSa+CcA1Epgz1JmpLt3iKLlKZfaz/eHImXZXFnlF0tpjmib3pRMt0r2IPpSyXjI96aryQkw1DzhfYPQ0fYHqPg6EAQrCdDgu2bY/dDUVuVrv68TSs1Ef1LJkkv8dVW/3K1rNUi+3x/wXpZlzUGI8V0/IQc8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781241678; c=relaxed/simple;
	bh=rxrIrZ5VyIcRuSKY5kjX6+lZjXzF36pFqBDoFhJ/41c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FRCWzx8hbe7GY86TRO2g8Ola3aQQh8nxsmyMNzL6lXil1U0eieapzyvQX7VO7TQUx6UhbK39YafP3SNzvCI5ladKSuF3WH5cM9F3ubOkAxvy+GGtUHsn1IaqDKEl4jCBULl6MztSIKX1qq/Y8x+olpjvE6lb+IDAirTEVvnNw6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJDRErvF; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJDRErvF"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso646903a91.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 22:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781241676; x=1781846476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kr9VyXryrFmpbH26hnWPdHWdxPD5C2gkiYuGFKODD1c=;
        b=iJDRErvFAgB1/+baZvp/6rqMb+6BkSRr5F+qW4SWdyUNTF9SsfBepqklOoyl3Gs5PY
         yPjFh3a+hMnO3/nLp1yisoFtYRiNAOFaAkvOaXvL6MqYvjCOYT5dUW7/7FZurd29JBKk
         2nmD2aTbEaScB4Q/R9tATHfNdiaG/moJBy+bAJP9S62fsxLL1qSCTF5fZOXC2TKMjE1/
         xk2Q2+BENKP6RRudjlx5YM3C8xf6rE6zP41QfTHljtBw4WmpP4RuR5MsclEN8GXLdkBl
         ebNVNhqxVvu2lAAj7PNU9wlaEDM6uLzhBXIXW8/ZyFvcqqjfgM3fv0Zy9Wf2CRyX1zMo
         qeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781241676; x=1781846476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr9VyXryrFmpbH26hnWPdHWdxPD5C2gkiYuGFKODD1c=;
        b=QAb6luCKu58fzeTw+ywxfctXraFxC/W6n3lqscjKNH5zAGcPL27k4/3YrSLmOE++n3
         GdlvuIZQ7Bw0RdMBXk3Lwvfifls+hvIxCaGXhxlmjvGQBA6rWQ1IZyN4s1mrp5pMkxwc
         XEH91ajpS43jrVdT7BE/Y2n9sYZUUR5DI2hbxSmN3rRisomcVxSVB4URf5wQ3DCUHphQ
         q33F1JJMF516UOrIjP8HqwI1YRA7WXUk9I6E03yM+WTNNnD5VVEJHogcc6Yq6Hswg2ww
         jNJUsGNWDK7PlzUFlqxOXzD5vA5gLDzB5uXuVg5dnZYtOP9lk8/ma6PemEE8NGdEsJP+
         1BkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eUIAQw3QM/q4JA4XQoQMX+pK4IZujPOetOxylaI1a1xFGALSQtQon7uuoS75x9yjzCD9heSqNh1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcxHAc1kxcTQfQxacSHIwkPg7ch50vA8Seajfw2oYzxQYhB8QV
	k1gt6LHIiEnTAlMjpdhGKkFS9Aa4hccgxvnWNXV/0tIGmD7zDjDE9yP+
X-Gm-Gg: Acq92OEBX/EPRIGjrriuCkUsc64kRfeTkZKQ73Ta86qIafIpTiGFg5jc1U1LxVi9MJg
	DSIheGr7Sibde1DDYqxlQYy6nUxaOMVJwubwC4RmmPrXJ77gPXr7OfSRi6VZcJG0TZxeTn48a2m
	khMqS/KDsDidUYxhT7EVWonljdnhLJrn8VtoLVE79nGreOTQjjdO95ZAgRzGumWLJ7ARRbgcs0x
	I8DCqjj7d7ZC6BYZe6RdGwdqIBPrOm35pTcOPOkK+jGhBW8n9E7OmvgNwM4YI5QTzjY8N27HtsJ
	nIcJ71rCbKa53Vha2aO4VGOeJ875IVxsCdl2roCpLpt2fhCfuLbYD/a48azU178ndW6C4ar2nnm
	H2K9nwfijgTS2x4u9HTRo39KhgJzaP/uNu6SlAPn+J2xLLxkDqZCUvVSqrU/hp9qP8OV8LOIvSB
	3RC88kBetQliFr1k2RYbcZD46h9RFx0+U4c7qlURcrDaCoAABzkZES
X-Received: by 2002:a17:90b:2884:b0:36d:635a:ac1b with SMTP id 98e67ed59e1d1-37a03ccdeadmr1628446a91.22.1781241676137;
        Thu, 11 Jun 2026 22:21:16 -0700 (PDT)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434aca3041sm887435b3a.5.2026.06.11.22.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 22:21:15 -0700 (PDT)
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
Subject: [PATCH v6 0/3] usb: typec: ucsi: Filter duplicate altmodes from buggy firmware
Date: Fri, 12 Jun 2026 13:21:09 +0800
Message-ID: <20260612052112.1325812-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some UCSI firmware implementations return the same altmode multiple
times when queried with UCSI_GET_ALTERNATE_MODES.  When the resulting
duplicate partner altmodes reach the typec class, two altmodes with the
same SVID end up matched to the same port-side altmode by
altmode_match()/device_find_child(), and the second registration
collides on /sys/.../portN.M/partner with a sysfs duplicate-filename
error and a probe failure (visible as a kernel call trace from
typec_altmode_create_links()).

  sysfs: cannot create duplicate filename '/devices/.../typec/port0/port0.0/partner'
  typec-thunderbolt port0-partner.1: failed to create symlinks
  typec-thunderbolt port0-partner.1: probe with driver typec-thunderbolt failed with error -17

This series teaches ucsi_register_altmodes() and
ucsi_register_altmodes_nvidia() to filter these duplicates before they
hit the typec class, replacing the call trace with a single dev_warn().
It also retires the open-coded workaround that ucsi_yoga_c630.c was
using for the same firmware bug now that the core handles it.

The matching rules differ by recipient, because the pairing semantics
in the typec class differ:

  - UCSI_RECIPIENT_CON  (port) and
    UCSI_RECIPIENT_SOP_P (plug):
    Drop only byte-for-byte duplicates (same SVID and same VDO);
    a second copy adds nothing.

  - UCSI_RECIPIENT_SOP  (partner):
    A partner altmode is paired with a port altmode of the same SVID
    via altmode_match()/device_find_child(), which returns the first
    port altmode with the matching SVID.  The number of partner
    altmodes that can coexist for a given SVID is therefore bounded
    by the number of port altmodes the firmware advertises for that
    SVID.  Use that port-side count as the cap and reject any partner
    altmode that would exceed it.

Why cardinality and not just SVID+VDO?  A plain SVID+VDO comparison is
too lax for the partner case: real firmware in the wild reports two
"partner" Thunderbolt altmodes (SVID 0x8087) with different VDOs while
the port side only advertises one, and both would still collapse onto
the same port altmode and trip the sysfs collision.  A plain SVID
comparison is the other extreme: it would falsely drop the second mode
of vendor SVIDs that the port really does advertise twice (for example,
Dell's 0x413c which legitimately registers as port1.1 and port1.2 with
two distinct VDOs).  The cardinality cap captures both cases correctly
and is consistent with how the typec class actually pairs altmodes.

Tested on two Dell platforms:

  * Dell platform A: firmware reports two partner altmodes for SVID
    0x8087 (Thunderbolt) against a single port-side 0x8087, and the
    same port also advertises two distinct 0x413c altmodes
    (port1.1 and port1.2) paired with two 0x413c partner altmodes.
    Before: sysfs duplicate-filename error and probe failure on
    portN-partner.1 / typec-thunderbolt.
    After: the surplus 0x8087 partner altmode is dropped with a
    clean dev_warn(); typec-thunderbolt probes once and the dock
    works, and both legitimate 0x413c partner altmodes still
    register as portN-partner.1 and portN-partner.2.  DisplayPort
    (0xff01) is unaffected.

  * Dell platform B: firmware reports a single 0x8087 partner
    altmode matching its single port-side 0x8087 (no firmware bug
    present).  Used as a regression-check baseline.
    After: behaviour unchanged; no altmodes are spuriously dropped.

v5 -> v6:
  - Replace the partner-side SVID+VDO duplicate check with a
    cardinality cap: skip a partner altmode for SVID X once the
    number of already-registered partner altmodes for X has reached
    the number of port altmodes for X.  This is the only rule that
    is consistent with how the typec class pairs partner-to-port
    altmodes, and is the change that actually fixes the Thunderbolt
    case while keeping the Dell case working.
  - Add a small ucsi_altmode_count_svid() helper used by the
    cardinality check.
  - Move the recipient-name table into ucsi_dump_duplicate_altmode()
    as a function-local static const; it has no other users.
  - Expand the kernel-doc block on ucsi_altmode_is_duplicate() to
    document the per-recipient rules and the rationale.
  - Reword patch 3/3 to use the canonical 'commit <sha12> ("<title>")'
    style for the reference to the original yoga_c630 workaround.
  - Tested on the two platforms described above (TBT firmware bug
    machine and Dell multi-Mode 0x413c machine); no regression on
    either, call trace gone on the TBT machine.

v4 -> v5:
  - Add ucsi_dump_duplicate_altmode() helper to consolidate the
    duplicate-detected dev_warn() output; all three previous
    open-coded warning callsites (batch-internal, partner already
    registered, port/plug already registered) route through it.
  - Add ucsi_recipient_names[] lookup table and use it in the new
    helper instead of repeating the switch over recipient values
    inside ucsi_altmode_is_duplicate() and the warning strings.
    (v6 later moves this table into the helper itself as a
    function-local static const; see "Changes since v5".)
  - Split the user-visible warning into two shorter lines:
      "Firmware bug: duplicate <recipient> altmode SVID 0xNNNN at
       offset N, ignoring."
      "VDO mismatch: 0xNNNNNNNN vs 0xNNNNNNNN" (only emitted when
      the two VDOs actually differ).
    The previous single line ran past 75 chars and embedded the
    VDOs and a "Please update your system firmware." trailer.

v3 -> v4:
  - Rebased onto the latest tree.

v2 -> v3:
  - Move ucsi_altmode_is_duplicate() above
    ucsi_register_altmodes_nvidia() so the nvidia path can call it
    too (groundwork for the nvidia-path fix that later lands as
    patch 2/3).
  - Use struct typec_altmode ** to walk the already-registered
    altmode arrays (port_altmode / partner_altmode / plug_altmode)
    instead of three separate branches; simplifies the dedup logic.

v1 -> v2:
  - Split the single patch into a 3-patch series:
      1/3 core helper + standard registration path,
      2/3 same dedup applied in the nvidia registration path so
          all drivers benefit, not just those on the standard path,
      3/3 retire the open-coded duplicate filter in ucsi_yoga_c630.c
          now that the core covers it.
  - Extend ucsi_altmode_is_duplicate() to cover all three recipient
    types (CON / SOP / SOP_P), not just SOP.
  - Improve the warning message to also include the differing VDOs
    when a partner altmode collides on SVID with a different VDO,
    so the firmware bug is actually diagnosable from dmesg.
  - Print a single dev_warn() per skipped altmode instead of letting
    the registration path generate a sysfs duplicate-filename call
    trace.

Previous revisions:
  [v1] https://lore.kernel.org/lkml/20251016055332.914106-1-acelan.kao@canonical.com/
  [v2] https://lore.kernel.org/lkml/20251111010541.145421-1-acelan.kao@canonical.com/
  [v3] https://lore.kernel.org/lkml/20251224070022.4082182-1-acelan.kao@canonical.com/
  [v4] https://lore.kernel.org/lkml/20260413073552.894395-1-acelan.kao@canonical.com/
  [v5] https://lore.kernel.org/lkml/20260504115927.48925-1-acelan.kao@canonical.com/

Some UCSI firmware implementations return the same altmode multiple
times when queried with UCSI_GET_ALTERNATE_MODES.  When the resulting
duplicate partner altmodes reach the typec class, two altmodes with the
same SVID end up matched to the same port-side altmode by
altmode_match()/device_find_child(), and the second registration
collides on /sys/.../portN.M/partner with a sysfs duplicate-filename
error and a probe failure (visible as a kernel call trace from
typec_altmode_create_links()).

  sysfs: cannot create duplicate filename '/devices/.../typec/port0/port0.0/partner'
  typec-thunderbolt port0-partner.1: failed to create symlinks
  typec-thunderbolt port0-partner.1: probe with driver typec-thunderbolt failed with error -17

This series teaches ucsi_register_altmodes() and
ucsi_register_altmodes_nvidia() to filter these duplicates before they
hit the typec class, replacing the call trace with a single dev_warn().
It also retires the open-coded workaround that ucsi_yoga_c630.c was
using for the same firmware bug now that the core handles it.

The matching rules differ by recipient, because the pairing semantics
in the typec class differ:

  - UCSI_RECIPIENT_CON  (port) and
    UCSI_RECIPIENT_SOP_P (plug):
    Drop only byte-for-byte duplicates (same SVID and same VDO);
    a second copy adds nothing.

  - UCSI_RECIPIENT_SOP  (partner):
    A partner altmode is paired with a port altmode of the same SVID
    via altmode_match()/device_find_child(), which returns the first
    port altmode with the matching SVID.  The number of partner
    altmodes that can coexist for a given SVID is therefore bounded
    by the number of port altmodes the firmware advertises for that
    SVID.  Use that port-side count as the cap and reject any partner
    altmode that would exceed it.

Why cardinality and not just SVID+VDO?  A plain SVID+VDO comparison is
too lax for the partner case: real firmware in the wild reports two
"partner" Thunderbolt altmodes (SVID 0x8087) with different VDOs while
the port side only advertises one, and both would still collapse onto
the same port altmode and trip the sysfs collision.  A plain SVID
comparison is the other extreme: it would falsely drop the second mode
of vendor SVIDs that the port really does advertise twice (for example,
Dell's 0x413c which legitimately registers as port1.1 and port1.2 with
two distinct VDOs).  The cardinality cap captures both cases correctly
and is consistent with how the typec class actually pairs altmodes.

Tested on two Dell platforms:

  * Dell platform A: firmware reports two partner altmodes for SVID
    0x8087 (Thunderbolt) against a single port-side 0x8087, and the
    same port also advertises two distinct 0x413c altmodes
    (port1.1 and port1.2) paired with two 0x413c partner altmodes.
    Before: sysfs duplicate-filename error and probe failure on
    portN-partner.1 / typec-thunderbolt.
    After: the surplus 0x8087 partner altmode is dropped with a
    clean dev_warn(); typec-thunderbolt probes once and the dock
    works, and both legitimate 0x413c partner altmodes still
    register as portN-partner.1 and portN-partner.2.  DisplayPort
    (0xff01) is unaffected.

  * Dell platform B: firmware reports a single 0x8087 partner
    altmode matching its single port-side 0x8087 (no firmware bug
    present).  Used as a regression-check baseline.
    After: behaviour unchanged; no altmodes are spuriously dropped.

v5 -> v6:
  - Replace the partner-side SVID+VDO duplicate check with a
    cardinality cap: skip a partner altmode for SVID X once the
    number of already-registered partner altmodes for X has reached
    the number of port altmodes for X.  This is the only rule that
    is consistent with how the typec class pairs partner-to-port
    altmodes, and is the change that actually fixes the Thunderbolt
    case while keeping the Dell case working.
  - Add a small ucsi_altmode_count_svid() helper used by the
    cardinality check.
  - Move the recipient-name table into ucsi_dump_duplicate_altmode()
    as a function-local static const; it has no other users.
  - Expand the kernel-doc block on ucsi_altmode_is_duplicate() to
    document the per-recipient rules and the rationale.
  - Reword patch 3/3 to use the canonical 'commit <sha12> ("<title>")'
    style for the reference to the original yoga_c630 workaround.
  - Tested on the two platforms described above (TBT firmware bug
    machine and Dell multi-Mode 0x413c machine); no regression on
    either, call trace gone on the TBT machine.

v4 -> v5:
  - Add ucsi_dump_duplicate_altmode() helper to consolidate the
    duplicate-detected dev_warn() output; all three previous
    open-coded warning callsites (batch-internal, partner already
    registered, port/plug already registered) route through it.
  - Add ucsi_recipient_names[] lookup table and use it in the new
    helper instead of repeating the switch over recipient values
    inside ucsi_altmode_is_duplicate() and the warning strings.
    (v6 later moves this table into the helper itself as a
    function-local static const; see "Changes since v5".)
  - Split the user-visible warning into two shorter lines:
      "Firmware bug: duplicate <recipient> altmode SVID 0xNNNN at
       offset N, ignoring."
      "VDO mismatch: 0xNNNNNNNN vs 0xNNNNNNNN" (only emitted when
      the two VDOs actually differ).
    The previous single line ran past 75 chars and embedded the
    VDOs and a "Please update your system firmware." trailer.

v3 -> v4:
  - Rebased onto the latest tree.

v2 -> v3:
  - Move ucsi_altmode_is_duplicate() above
    ucsi_register_altmodes_nvidia() so the nvidia path can call it
    too (groundwork for the nvidia-path fix that later lands as
    patch 2/3).
  - Use struct typec_altmode ** to walk the already-registered
    altmode arrays (port_altmode / partner_altmode / plug_altmode)
    instead of three separate branches; simplifies the dedup logic.

v1 -> v2:
  - Split the single patch into a 3-patch series:
      1/3 core helper + standard registration path,
      2/3 same dedup applied in the nvidia registration path so
          all drivers benefit, not just those on the standard path,
      3/3 retire the open-coded duplicate filter in ucsi_yoga_c630.c
          now that the core covers it.
  - Extend ucsi_altmode_is_duplicate() to cover all three recipient
    types (CON / SOP / SOP_P), not just SOP.
  - Improve the warning message to also include the differing VDOs
    when a partner altmode collides on SVID with a different VDO,
    so the firmware bug is actually diagnosable from dmesg.
  - Print a single dev_warn() per skipped altmode instead of letting
    the registration path generate a sysfs duplicate-filename call
    trace.

Previous revisions:
  [v1] https://lore.kernel.org/lkml/20251016055332.914106-1-acelan.kao@canonical.com/
  [v2] https://lore.kernel.org/lkml/20251111010541.145421-1-acelan.kao@canonical.com/
  [v3] https://lore.kernel.org/lkml/20251224070022.4082182-1-acelan.kao@canonical.com/
  [v4] https://lore.kernel.org/lkml/20260413073552.894395-1-acelan.kao@canonical.com/
  [v5] https://lore.kernel.org/lkml/20260504115927.48925-1-acelan.kao@canonical.com/

Chia-Lin Kao (AceLan) (3):
  usb: typec: ucsi: Detect and skip duplicate altmodes from buggy
    firmware
  usb: typec: ucsi: Add duplicate detection to nvidia registration path
  usb: typec: ucsi: yoga_c630: Remove redundant duplicate altmode
    handling

 drivers/usb/typec/ucsi/ucsi.c           | 158 ++++++++++++++++++++++--
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c |  23 ----
 2 files changed, 148 insertions(+), 33 deletions(-)


base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
--
2.53.0


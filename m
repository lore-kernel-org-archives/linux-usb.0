Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AAAE571;
	Tue, 23 Jun 2026 00:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782172947; cv=none; b=l9O/XRErjYyMq9rCKiWl+Ah0lDJRGRYWcODE3BxmJ5jphU7SNZKQKLvtNlxNm5SymtoxGEzFUWdMhEZqdG7sXkgY0/GSVNiru5V++YeyqwI5BSQvbbn+BoC1NEBQnvWVlnUaYhnO6C21IzmrxaQ7Q6zzWwTpvqbQkpw0tER9CVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782172947; c=relaxed/simple;
	bh=nfgqYhajdoUxpAAG+qWrLcrRuw4Y9IT6SCFp/lIQpnQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MPKLmo4Dd4XMpzH2rC+3y76p0mxguhDP5hPFn+N1jl2yxumr5uh/L3aw4b+otan1m7m219cypV9LlEGk5afrdBZ7x1x1ysieWgcjHVybje/dltxl522g+AE1v/foxJ6VGehGZoRLqGepjIZJaQIaSkBWkJ9/S9WzIYLBtCMSkEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGKq+ERj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGKq+ERj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782172945; x=1813708945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nfgqYhajdoUxpAAG+qWrLcrRuw4Y9IT6SCFp/lIQpnQ=;
  b=fGKq+ERj3DfA+FDLkPqkH3iATykb3pp7jB8LWbRlNRjlk100/G00fO1G
   eqHWPhA5rcjXLjAwh2c//MdzGuhvqvb4OxsvPamEbNoGJNHZs+/K7mCBm
   b7bn7+xO/o67DhDODbQ8q/FTJq9Yrh7KdfJ27ONOYWTF5JlkxfLQ8w+T1
   uF1dW6fS5aYZM490EeexYRDflaiWY3Gi3bRHZYQ4A58SayegkdWQHAiFf
   ZeOXLokUoS73GORBSOMu6sBbBtEXzhw/wBfs3XaICsTWOTrHL7nYGTGRl
   /uyPeRubCzcACzVtfjgQ0tBcyyR/TykIy6hWNWl1COLBVndB3Z0ZSxEPf
   g==;
X-CSE-ConnectionGUID: gOO4R0A7Qempdvu3u8LUnA==
X-CSE-MsgGUID: xqyPeLJ5Sd2rXYJmnQNVXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93567546"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="93567546"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 17:02:25 -0700
X-CSE-ConnectionGUID: Sc/8sg2GQvaRXEwnp/h5tQ==
X-CSE-MsgGUID: BvfWT0hqQomfs28JbfK+wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="249227264"
Received: from madhum (HELO madhum..) ([10.223.131.52])
  by orviesa008.jf.intel.com with ESMTP; 22 Jun 2026 17:02:23 -0700
From: madhu.m@intel.com
To: gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	akuchynski@chromium.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Madhu M <madhu.m@intel.com>
Subject: [PATCH v3] usb: typec: displayport: Reject DP Alt Mode VDO with no pin assignment for its capability
Date: Tue, 23 Jun 2026 06:02:15 +0530
Message-Id: <20260623003215.4077711-1-madhu.m@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619163109.3529666-1-madhu.m@intel.com>
References: <20260619163109.3529666-1-madhu.m@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Madhu M <madhu.m@intel.com>

Some docks/Type-C dongles expose a malformed DP Capabilities VDO: they
claim a DFP_D (source) or UFP_D (sink) capability but leave the
corresponding pin assignment field empty. Such a device can never have
Alt Mode configured. Currently the driver still proceeds, which is
misleading and offers no diagnostic.

Per VESA DPAM v2.1a Section 5.4.1 (Table 5-6):
Case 1 (receptacle): A DP Source device receptacle (DFP_D) declares its
lane routing in the DP Source Pin field (Bits 15:8); a DP Sink device
receptacle (UFP_D) declares its lanes in the DP Sink Pin field
(Bits 23:16).
Case 2 (direct-attach plug): A DP Sink device plug (UFP_D) declares its
lane routing in the DP Source Pin field (Bits 15:8), and a DP Source
device plug (DFP_D) declares its lanes in the DP Sink Pin field
(Bits 23:16).
In either case the field holds the supported pin assignment values
(e.g. C/D/E); 00000000b means no pin assignment is supported for that
capability.

Reject such a DP Alt Mode VDO in dp_altmode_probe(): if the claimed
capability has no matching pin assignments, fail probe with -ENODEV,
releasing the SOP' plug reference on the error path.

Signed-off-by: Madhu M <madhu.m@intel.com>
Reviewed-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes in v3:
- No functional change. Restore the version changelog below the --- line.

Note: v1 was an internal review (with Heikki) and was never posted to the
list, so v2 was effectively the first public submission.

Changes in v2 (vs internal v1):
- Drop the explicit "if (alt->vdo & DP_CAP_RECEPTACLE)" guard and the
  nested block. Use the receptacle-aware DP_CAP_PIN_ASSIGN_DFP_D()/
  DP_CAP_PIN_ASSIGN_UFP_D() macros instead of the raw
  DP_CAP_DFP_D_PIN_ASSIGN()/DP_CAP_UFP_D_PIN_ASSIGN() ones. They already
  apply the Bit 6 (Receptacle Indication) swap, so a single check now
  covers both receptacles and direct-attach plugs.
- Return -ENODEV instead of -EOPNOTSUPP, matching the existing
  pin-configuration rejection path right above.
- Drop the dev_err() diagnostic line (raw VDO + "DFP_D"/"UFP_D" string).
- Hoist "cap" to a function-scope u32 at the top of dp_altmode_probe()
  (was a local u8 inside the receptacle block).
- Reword subject: "usb: typec: altmodes/displayport: validate dp pin
  assignments for USB-C receptacles" -> "usb: typec: displayport: Reject
  DP Alt Mode VDO with no pin assignment for its capability".
- Rewrite commit body: describe the VESA Table 5-6 pin-field routing for
  both receptacles and direct-attach plugs (including the 00000000b
  "not supported" encoding).

 drivers/usb/typec/altmodes/displayport.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 263a89c5f324..2a553cfcf61d 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -764,6 +764,7 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	struct typec_altmode *plug = typec_altmode_get_plug(alt, TYPEC_PLUG_SOP_P);
 	struct fwnode_handle *fwnode;
 	struct dp_altmode *dp;
+	u32 cap = DP_CAP_CAPABILITY(alt->vdo);
 
 	/* Port can only be DFP_U. */
 	if (typec_altmode_get_data_role(alt) != TYPEC_HOST)
@@ -778,6 +779,18 @@ int dp_altmode_probe(struct typec_altmode *alt)
 		return -ENODEV;
 	}
 
+	/*
+	 * Make sure the DisplayPort VDO is valid (VESA DPAM v2.1a, Section
+	 * 5.4.1, Table 5-6, DP Capabilities VDO). A device exposing DP on a
+	 * USB-C receptacle must advertise at least one pin assignment for the
+	 * capability it claims, otherwise Alt Mode can never be configured.
+	 */
+	if ((cap == DP_CAP_DFP_D && !DP_CAP_PIN_ASSIGN_DFP_D(alt->vdo)) ||
+	    (cap == DP_CAP_UFP_D && !DP_CAP_PIN_ASSIGN_UFP_D(alt->vdo))) {
+		typec_altmode_put_plug(plug);
+		return -ENODEV;
+	}
+
 	dp = devm_kzalloc(&alt->dev, sizeof(*dp), GFP_KERNEL);
 	if (!dp) {
 		typec_altmode_put_plug(plug);
-- 
2.34.1


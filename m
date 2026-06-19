Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2992DA765;
	Fri, 19 Jun 2026 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884881; cv=none; b=usp1LC4Hi4FDc9PCo1D3SVWlWlvYUlPPojMhlensMM8iYjZIXW+Y8JNSfUwKLMpARVzTn+G3/2HO/3Ryd1AQ6X8a5uYhxTjKu0skyesP0nnZUOOVxzLYlGnzBnRQjdg6/KLouL9ZOM8R8FHwTQQFXFFB9Rvrf9HiiZiPwcBwhTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884881; c=relaxed/simple;
	bh=CdM0Xa8h4nr5+OTA5G3o+WFIdJyocfZOVbaAuR7k2hI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qx1dUo31ID+xFUC1tuRRtQQzaOfyuqplEHx9RIOOyE4FKizQ7PVbMCkQhvuYxmmMMJxr4fUFiQ+j7rY3ULYzw4zFG8UTq5psVJiNfkiXrh80baxlm3q184iTRaK9K3svQxSbOPEm27/xYMTPGRLicg4nYWBJ5TcANhjUjKJ8jSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOuJNZu4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOuJNZu4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781884879; x=1813420879;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CdM0Xa8h4nr5+OTA5G3o+WFIdJyocfZOVbaAuR7k2hI=;
  b=gOuJNZu4HRjlpM0QX9n7pvxRJice57swahkVTnAsHvzIgu+x3bu+EseS
   RuC+V7LuOPgt6zaWAOB4TQxL77JKuaddmDUOhjEvkwTrgfAPYho3hlRFO
   Sawwk7bqF3z5vO1pxK3M8Su84VwMD32ypRytkugj2aeIeu4ohZ6PHaeBd
   e+KdR0gJf4dPbv/O8sfeByNWPMfRpIVoyMkd8boO9TdwBdOm9ITG2y5aw
   zUfsp5WkIbrMVW7OWwSx3xm0ugo6kBqkJtUuI1N/8eVH2UY5OlDrTz06d
   RKZB/ExV9QFAz3Jem5bCcUbottwSbE+pf/YlaxMbV5/vCQESqhpg//aJh
   w==;
X-CSE-ConnectionGUID: m+yk8o4DTwKlDTtePmHOHA==
X-CSE-MsgGUID: zp8oT4Y9S0Ga3wA/rk7pwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82839789"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; 
   d="scan'208";a="82839789"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 09:01:17 -0700
X-CSE-ConnectionGUID: 96Qq+acXQWW9GK0ZRJm/gA==
X-CSE-MsgGUID: auwsh9zMTr+ymASnfoeU1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; 
   d="scan'208";a="245732256"
Received: from madhum (HELO madhum..) ([10.223.131.52])
  by fmviesa007.fm.intel.com with ESMTP; 19 Jun 2026 09:01:15 -0700
From: madhu.m@intel.com
To: gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	akuchynski@chromium.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Madhu M <madhu.m@intel.com>
Subject: [PATCH v2] usb: typec: displayport: Reject DP Alt Mode VDO with no pin assignment for its capability
Date: Fri, 19 Jun 2026 22:01:09 +0530
Message-Id: <20260619163109.3529666-1-madhu.m@intel.com>
X-Mailer: git-send-email 2.34.1
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


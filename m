Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F197B23BD1D
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133335; cv=none; b=OSJzQqIkCgLjLE7IOek2Np9QxWZAkZ5f6dtumVDijOL2YmKfBhBSsuUuco1XE97sdvFofEBRii5v2qcjPTAOfa2QOMBqVNwOxdcM0x8/0ezVg4lB+8XV/3WpFH0moo+9Wf3hX26FroG8UbYMWk0VXFgY/2vLbZZZwy1JpKF7SUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133335; c=relaxed/simple;
	bh=lsA3snkWNRUh/3FE8jC+3A97vtwrfJqIVLqsX3sKTwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HywXTgTLbCM9eu3eiYCUtjUYjm1J4/vUdCwwL+v0f7ESvqiB3aC63tBIP110h+8fLRn/mfjmyYIthUUn/mPho/yQ0nsMc4M4BSBgd7OFwYmrlZwNbcXLwO0i0Hb1rrui1JlEyMk1m9RQUM1ftLDySN8A4VPBgQVKyUEQHo5sfZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLXdnm7c; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLXdnm7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789133334; x=1820669334;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lsA3snkWNRUh/3FE8jC+3A97vtwrfJqIVLqsX3sKTwM=;
  b=iLXdnm7c/AqrwX6PacHvPiTx9gUyx67hucd+mXzUMUnAyzfxy5KCgHvg
   TSzCsfL+z1QQzKCs5uQ8ZgGa8TZpxzdxoelW5Y077NoGic7Hqcm5u5PGK
   OhEeP+ueR8Rs0PvhUukTfhbWho3E/herPi3Gu/oRdJG8WIvNlWRbh0kNc
   GrxdaHBj3kOIkDY8TGunCemFo5xw+wq21IUPTaasalSQDnFeHQqXpn3Hg
   H6wnpnPym88iOwsPmEBqrEcX4JDQuupKMyESDzR/K4UdE4gGkD84vGoXj
   NuqGJAK99lJURsxZEyE0PDbXTBW8MR9UXqXzVRYc+5WQ52gYlmajLHU+N
   g==;
X-CSE-ConnectionGUID: +A0zdTwcRHSZTSY+Ur1IzA==
X-CSE-MsgGUID: ZXzp21QXRY+MC+MRp2JAjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="107426"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="107426"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 06:28:53 -0700
X-CSE-ConnectionGUID: 9mhWWXNbQgqNQ4jehWOIiQ==
X-CSE-MsgGUID: SUVYjdiMSwSlqRYZ/YX+EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="310186975"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 11 Sep 2026 06:28:51 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Manuel Knitza <manuel.knitza@googlemail.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v1] usb: typec: ucsi: acpi: Add DMI quirk for Dell XPS platforms
Date: Fri, 11 Sep 2026 15:28:50 +0200
Message-ID: <20260911132850.1580669-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Dell XPS systems, the UCSI firmware incorrectly reports duplicate
or extra DisplayPort and Thunderbolt alternate mode entries with
conflicting and malformed VDOs when querying alternate mode details.
This causes the kernel to retain an invalid VDO descriptor, breaking
DisplayPort Alternate Mode functionality during hotplug events.

Work around this issue by clearing the UCSI_CAP_ALT_MODE_DETAILS
feature flag in a DMI quirk matching Dell XPS platforms so that the
driver does not attempt to register alternate modes on these systems.

Reported-by: Manuel Knitza <manuel.knitza@googlemail.com>
Closes: https://lore.kernel.org/linux-usb/CAMRbua4xZfsQ0FXsrfq=SCbyZa1n=Aw5UrD3bEaU41d+J3KmXw@mail.gmail.com/
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Hi,

This has to be tested, I'm "guessing" the DMI match.
Manuel, can you test this?

Thanks,

---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 41 ++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 18286d3e9cc59..58cdc07a095eb 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -161,6 +161,39 @@ static const struct ucsi_operations ucsi_gram_ops = {
 	.async_control = ucsi_acpi_async_control
 };
 
+static int ucsi_dell_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
+				  void *val, size_t len, void *msg_out,
+				  size_t msg_out_size)
+{
+	int ret;
+
+	ret = ucsi_sync_control_common(ucsi, command, cci, val, len,
+				       msg_out, msg_out_size);
+	if (ret < 0)
+		return ret;
+
+	if (UCSI_COMMAND(command) == UCSI_GET_CAPABILITY && val) {
+		struct ucsi_capability *cap = val;
+
+		if (cap->features & UCSI_CAP_ALT_MODE_DETAILS) {
+			dev_warn(ucsi->dev,
+				 "Firmware bug: broken altmode details reporting, disabling\n");
+			cap->features &= ~UCSI_CAP_ALT_MODE_DETAILS;
+		}
+	}
+
+	return ret;
+}
+
+static const struct ucsi_operations ucsi_dell_ops = {
+	.read_version = ucsi_acpi_read_version,
+	.read_cci = ucsi_acpi_read_cci,
+	.poll_cci = ucsi_acpi_poll_cci,
+	.read_message_in = ucsi_acpi_read_message_in,
+	.sync_control = ucsi_dell_sync_control,
+	.async_control = ucsi_acpi_async_control
+};
+
 static const struct dmi_system_id ucsi_acpi_quirks[] = {
 	{
 		.matches = {
@@ -170,6 +203,14 @@ static const struct dmi_system_id ucsi_acpi_quirks[] = {
 		},
 		.driver_data = (void *)&ucsi_gram_ops,
 	},
+	{
+		.ident = "Dell XPS",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "XPS"),
+		},
+		.driver_data = (void *)&ucsi_dell_ops,
+	},
 	{ }
 };
 
-- 
2.50.1


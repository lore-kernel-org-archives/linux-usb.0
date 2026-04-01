Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31C947DD5F
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 18:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775069937; cv=none; b=drWN2En/iuQZBi5PwEj0Wx5So61LuW7HXqa2AeTl1r6d8bWEH9DkTyF93pqlU9B9g4Iz0lxRSIhQIq+XO8Ufy02iKEm33QBdVk38dh38dak9UVx9gAfVmZ8650rNI0zKd30ShESqTJh/MsK06gN/TfYYGLQNJxJdXQ8gAYpnQqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775069937; c=relaxed/simple;
	bh=rPnyMhbzBHiE9bzEbSVJT92KWrRvc58FWj5YAcR8d8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uB5ZqVFq3sr+XuTpGjbvtPPt8k2GWnoe6stS8Wacgn57HCKZCGvWN5+hMR94+2gZXqGI1YntVrOnmWNE7PgrK1P1uUGsfDXjiuNV7+INk0+kcArocKTQx5erTiYRS3pEX8JknADf7BnbvEcSP4HMS+DKXm68Sn0NdiSm39hOl+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TuisZ7CI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TuisZ7CI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775069936; x=1806605936;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rPnyMhbzBHiE9bzEbSVJT92KWrRvc58FWj5YAcR8d8w=;
  b=TuisZ7CI0ox8diCod0HDVgbyQriETIeZISVgMOn4tNa6a8TKfOQIBubx
   gmzeKPFRvmuN5sBoKhT77io++5ikmBxJqZiHXzh6ymWimsq5LNpeiS+Ui
   DqhwPrRzPhXP8PRnCYm/zLir0fgrYjMXis+uPCLVWHJbrqWqRDcXXTRw0
   s0g0xt+LpdpnEft4G6Df+OTtscBnyrMEzVzEwGuiXNtcqeWLbbSEKskfG
   vgKq4CUtqoRcWBq6taEvZHOoHMRvWcY2JBTgC6IlIL+iin5kdeGKk4zaq
   /dfTqmIjLySAAFppmrQh3+09TjjVeTFvKG4O7WO/WgOrODFxwKtE5KY2h
   Q==;
X-CSE-ConnectionGUID: Qt3phH8YRxKvcoeXud0PBw==
X-CSE-MsgGUID: hgBMkcPIRW2EpeHBWSeCgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79975592"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="79975592"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 11:58:56 -0700
X-CSE-ConnectionGUID: s3z1W3dsSzqx7zW6h/1rig==
X-CSE-MsgGUID: 7marOPn4TISHUA2VJrUaTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="226744462"
Received: from pooja-nuc9i7qnx.fm.intel.com ([10.80.169.153])
  by orviesa008.jf.intel.com with ESMTP; 01 Apr 2026 11:58:55 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	dmitry.baryshkov@oss.qualcomm.com,
	johan@kernel.org,
	asutosh.pathak@intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH v7 2/3] usb: typec: ucsi: Enable debugfs for message_out data structure
Date: Wed,  1 Apr 2026 12:00:43 -0700
Message-ID: <8fadf49a624ee53c190e3845ed2121346bc5fb31.1774994425.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774994425.git.pooja.katiyar@intel.com>
References: <cover.1774994425.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add debugfs entry for writing message_out data structure to handle
UCSI 2.1 and 3.0 commands through debugfs interface.

Users writing to the message_out debugfs file should ensure the input
data adheres to the following format:
1. Input must be a non-empty valid hexadecimal string.
2. Input length of hexadecimal string must not exceed 256 bytes of
   length to be in alignment with the message out data structure size
   as per the UCSI specification v2.1.
3. If the input string length is odd, then user needs to prepend a
   '0' to the first character for proper hex conversion.

Below are examples of valid hex strings. Note that these values are
just examples. The exact values depend on specific command use case.

        #echo 1A2B3C4D > message_out
        #echo 01234567 > message_out

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
Changelog v7:
- Added changelog.

Changelog v6:
- Removed message_out field from UCSI structure and added it back
  to ucsi_debugfs_entry structure. 

Changelog v3:
- Updated debugfs message_out write handler to use message_out fields
  in UCSI structure.

 drivers/usb/typec/ucsi/debugfs.c | 26 ++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h    |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index a4b9a6b51649..be987e53a8bd 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -110,6 +110,30 @@ static int ucsi_vbus_volt_show(struct seq_file *m, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(ucsi_vbus_volt);
 
+static ssize_t ucsi_message_out_write(struct file *file,
+				      const char __user *data, size_t count, loff_t *ppos)
+{
+	struct ucsi *ucsi = file->private_data;
+	int ret;
+
+	char *buf __free(kfree) = memdup_user_nul(data, count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	ret = hex2bin(ucsi->debugfs->message_out, buf,
+		      min(count / 2, sizeof(ucsi->debugfs->message_out)));
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static const struct file_operations ucsi_message_out_fops = {
+	.open = simple_open,
+	.write = ucsi_message_out_write,
+	.llseek = generic_file_llseek,
+};
+
 void ucsi_debugfs_register(struct ucsi *ucsi)
 {
 	ucsi->debugfs = kzalloc_obj(*ucsi->debugfs);
@@ -122,6 +146,8 @@ void ucsi_debugfs_register(struct ucsi *ucsi)
 	debugfs_create_file("peak_current", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_peak_curr_fops);
 	debugfs_create_file("avg_current", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_avg_curr_fops);
 	debugfs_create_file("vbus_voltage", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_vbus_volt_fops);
+	debugfs_create_file("message_out", 0200, ucsi->debugfs->dentry, ucsi,
+			    &ucsi_message_out_fops);
 }
 
 void ucsi_debugfs_unregister(struct ucsi *ucsi)
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 82565f502bdf..e51a8472fc27 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -455,6 +455,8 @@ struct ucsi_bitfield {
 
 /* -------------------------------------------------------------------------- */
 
+#define MESSAGE_OUT_MAX_LEN 256
+
 struct ucsi_debugfs_entry {
 	u64 command;
 	struct ucsi_data {
@@ -462,6 +464,7 @@ struct ucsi_debugfs_entry {
 		u64 high;
 	} response;
 	int status;
+	u8 message_out[MESSAGE_OUT_MAX_LEN];
 	struct dentry *dentry;
 };
 
-- 
2.43.0


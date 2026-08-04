Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756CE44CAF5
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 14:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853334; cv=none; b=CDZof5ckXRm8kqQUh8XX3PnwcgyUG9TwfwpQ4MBNBXecKtGCKF17bFl4Hcn8C1Wt72E9Tb5aIvr+fKPbJDKha1QU6WiP/Dq0aSXEMn2xRCMKRNlzcBs/m7LtHUqKJtYhDCH7dQKkHCewurN/Kew+2O+E+7PxfPxiR08Jcz6VAXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853334; c=relaxed/simple;
	bh=tWa9M2+Vtz7po3MMB1mRoFHpLNDKG6jAdnu5SIsjVCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Nav4jYNYKCBERNDew3MMYCPX7MT+1zOE+4TVtNYEm9NRm0dWqQ1ezin2UOFzrgl2sV6UfPmWdAKRIow9MaJ8T47SgdKu68DAd1MtXvQu3oiiXYii44DtKcyAuU94iVTOKA2TeGuxESUitlR8HInh9Vhpyy9CiAVBsUrl5IZ2Rl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net; spf=pass smtp.mailfrom=marmottus.net; dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b=b/gppWKu; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b="b/gppWKu"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC9A33ECE7;
	Tue,  4 Aug 2026 14:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1785853306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FumQ9NDI5lUGks/8j/0mdov0n/Y07bXDg8ghDSzM//U=;
	b=b/gppWKurQgBvuhIiau7vPxm0Owk9929qBUv5pqo5COHNrxO4It/pKGkDQ8wo3vj7oj0tl
	nBlCjBph1bOZWrUKW3jB9CVKwU29h96Cds0pPz5V31OlDRaqAcX/toi36nhVGZTIn9IgY9
	V839L+w0uCNKqjxZMwYnaieHXP0NPJaGJACkUiSNxNQ0Mb4f3Fx4uKIwhhCUQCCy0DgGS9
	zyUFduEEvsNHPYkEjJdciB8sqeDKy2aYB+noUQgVbMtmoMov3Q6ybJY0nWIO3TKNy/fB11
	O+ocqvmFan3ST6s5lW/Bc4CR0ep1gcsmOlUjkougT6RnUKFLaDCquW480dbdrA==
From: =?utf-8?q?Arthur_Cr=C3=A9pin_Leblond?= <arthur@marmottus.net>
Date: Tue, 04 Aug 2026 16:21:38 +0200
Subject: [PATCH v3] usb: gadget: f_hid: allow setting different interval
 for each speed
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260804-usb_hid_interval-v3-1-975a9fec2d7b@marmottus.net>
X-B4-Tracking: v=1; b=H4sIAHH1cWoC/3WNzQ6CMBAGX8X0bEm3FFo8+R7GkALV1kgx/YuG8
 O5SuHjxOJtvZmfklTPKo9NhRk4l481kVyiPB9Rrae8Km2FlRAmtiSAMR9+12gytsUG5JJ+YDKK
 hQnAmaI1W7eXUzby35OW6s4/dQ/Uhd/JCGx8m99l+Jsi7Pc+hBsYaCgVAPlQYsHRBR3cepRunE
 KIvrAooZxP9ESmHinJSFbwpBfurLcvyBax4FnnxAAAA
X-Change-ID: 20260804-usb_hid_interval-0d8928874826
To: linux-usb@vger.kernel.org
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Ben Hoff <hoff.benjamin.k@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arthur_Cr=C3=A9pin_Leblond?= <arthur@marmottus.net>
X-Mailer: b4 0.15.2
X-GND-Sasl: arthur@marmottus.net
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTGMgWA0omKA+sYUvw5NBo97QORqhykX93dlpSWSqcVqHygOEJdL71uXc2VnQf7AKeuLbWYmfInqtusEtCgYxrtVNZDBSREJQlAzeKL1O3wVuUCqEP+7CifH5QMa53THzrz38m/iF9qMsXVMqc9EpUjvY5+UfhIuKctva4uP78qJ1SmwAOk+8b0FO8AFFp8lOWhLxlMzctEzKamkSDRQG6G2IoHu937aG7EdYNfcrtfqcpIRMbvbG2cQRXocGdU35NMRWtUuh7eKrosi5AqjdF44GR7dja9m0ByZfRPfRyQSb29w4jbhwY7PgHh688I6qq2hsrjnuRjw4UJn/3YkmvMUTI5YPBc7e9kjauR1uz8SzkgqVsPsZZP7P0qd9XkXQs4Ps7G1awFC2siG9Mb5NKuNtvekQszqcWDb1a51OADtZAL7KhpuuohtWQsnsk1V920p2o/Ja4KBkpGfbpjraFNuQ6BpV7cKpVg4zAQ6PqI4TZzOd7a8Ott2RsK8lh7c3G+uYFexEm5fuZXILjmuXPoIAPpSTPKSeISDdCo3C73UMK5eqGs2TMadH+Z3Ijpn+CXSfgwRIFosJXGTtEoXLJr3CuXzdQyyV5xCyo/urcEc60ujdJRWJOy7nX4fIKgvsrDXfe5q3PoPCq+5SaQ3f1ME60CNyFCa9TFt6RIWAgy+zw

The HID polling interval unit depends on the USB speed.

 - Full speed: the units are in milliseconds
 - High/Super speed: the units are in micro-frames of 0.125ms

Exposing directly the bInterval means that the user needs to know
which speed is currently in use and has to convert it accordingly.

The solution is to expose the interval for each speed:
 - interval_fs: bInterval for full-speed
 - interval_hs: bInterval for high-speed
 - interval_ss: bInterval for super-speed
 - interval: legacy attribute that takes precedence over the per-speed
attributes and sets the same bInterval for each speed.

Signed-off-by: Arthur Crépin Leblond <arthur@marmottus.net>
---
Changes in v3:
- Use sysfs_emit
- Link to v2: https://patch.msgid.link/20260727152705.79384-1-arthur@marmottus.net

Changes in v2:
- Expose a specific interval attribute per USB speed
- Use a define for the default values
- Update ABI documentation
- Link to v1: https://patch.msgid.link/20260716144921.1120265-1-arthur@marmottus.net
---
 Documentation/ABI/testing/configfs-usb-gadget-hid |  18 ++
 drivers/usb/gadget/function/f_hid.c               | 193 +++++++++++++---------
 drivers/usb/gadget/function/u_hid.h               |   9 +-
 3 files changed, 143 insertions(+), 77 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-hid b/Documentation/ABI/testing/configfs-usb-gadget-hid
index 748705c4cb58..a81f5b527b59 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-hid
+++ b/Documentation/ABI/testing/configfs-usb-gadget-hid
@@ -11,3 +11,21 @@ Description:
 		report_length	HID report length
 		subclass	HID device subclass to use
 		=============	============================================
+
+What:		/config/usb-gadget/gadget/functions/hid.name
+Date:		Jul 2026
+KernelVersion:	7.3
+Description:
+		The attributes:
+
+		=============	============================================
+		interval	HID endpoint bInterval for all speeds; if
+				set, it takes precedence over the
+				per-speed attributes below
+		interval_fs	HID endpoint bInterval for full-speed
+				(in milliseconds, default: 10)
+		interval_hs	HID endpoint bInterval for high-speed
+				(in 125 us units, default: 4)
+		interval_ss	HID endpoint bInterval for super-speed
+				(in 125 us units, default: 4)
+		=============	============================================
diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3c6b43d06a6d..bcf31640fa68 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -30,6 +30,11 @@
  */
 #define GET_REPORT_TIMEOUT_MS 2500
 
+/* Default bInterval values */
+#define HIDG_DEFAULT_FS_BINTERVAL 10
+#define HIDG_DEFAULT_HS_BINTERVAL 4
+#define HIDG_DEFAULT_SS_BINTERVAL 4
+
 static int major, minors;
 
 static const struct class hidg_class = {
@@ -63,7 +68,9 @@ struct f_hidg {
 	char				*report_desc;
 	unsigned short			report_length;
 	unsigned char			interval;
-	bool				interval_user_set;
+	struct f_hid_opt_interval	interval_fs;
+	struct f_hid_opt_interval	interval_hs;
+	struct f_hid_opt_interval	interval_ss;
 
 	/*
 	 * use_out_ep - if true, the OUT Endpoint (interrupt out method)
@@ -1204,16 +1211,24 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	hidg_fs_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
 	hidg_ss_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
 
-	/* IN endpoints: FS default=10ms, HS default=4µ-frame; user override if set */
-	if (!hidg->interval_user_set) {
-		hidg_fs_in_ep_desc.bInterval = 10;
-		hidg_hs_in_ep_desc.bInterval = 4;
-		hidg_ss_in_ep_desc.bInterval = 4;
-	} else {
-		hidg_fs_in_ep_desc.bInterval = hidg->interval;
-		hidg_hs_in_ep_desc.bInterval = hidg->interval;
-		hidg_ss_in_ep_desc.bInterval = hidg->interval;
-	}
+	/* IN endpoints: set defaults unless user set */
+	if (hidg->interval_fs.user_set)
+		hidg_fs_in_ep_desc.bInterval = hidg->interval_fs.value;
+	else
+		hidg_fs_in_ep_desc.bInterval =
+			HIDG_DEFAULT_FS_BINTERVAL;
+
+	if (hidg->interval_hs.user_set)
+		hidg_hs_in_ep_desc.bInterval = hidg->interval_hs.value;
+	else
+		hidg_hs_in_ep_desc.bInterval =
+			HIDG_DEFAULT_HS_BINTERVAL;
+
+	if (hidg->interval_ss.user_set)
+		hidg_ss_in_ep_desc.bInterval = hidg->interval_ss.value;
+	else
+		hidg_ss_in_ep_desc.bInterval =
+			HIDG_DEFAULT_SS_BINTERVAL;
 
 	hidg_ss_out_comp_desc.wBytesPerInterval =
 				cpu_to_le16(hidg->report_length);
@@ -1238,16 +1253,28 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 		hidg_fs_out_ep_desc.bEndpointAddress;
 
 	if (hidg->use_out_ep) {
-		/* OUT endpoints: same defaults (FS=10, HS=4) unless user set */
-		if (!hidg->interval_user_set) {
-			hidg_fs_out_ep_desc.bInterval = 10;
-			hidg_hs_out_ep_desc.bInterval = 4;
-			hidg_ss_out_ep_desc.bInterval = 4;
-		} else {
-			hidg_fs_out_ep_desc.bInterval = hidg->interval;
-			hidg_hs_out_ep_desc.bInterval = hidg->interval;
-			hidg_ss_out_ep_desc.bInterval = hidg->interval;
-		}
+		/* OUT endpoints: set defaults unless user set */
+		if (hidg->interval_fs.user_set)
+			hidg_fs_out_ep_desc.bInterval =
+				hidg->interval_fs.value;
+		else
+			hidg_fs_out_ep_desc.bInterval =
+				HIDG_DEFAULT_FS_BINTERVAL;
+
+		if (hidg->interval_hs.user_set)
+			hidg_hs_out_ep_desc.bInterval =
+				hidg->interval_hs.value;
+		else
+			hidg_hs_out_ep_desc.bInterval =
+				HIDG_DEFAULT_HS_BINTERVAL;
+
+		if (hidg->interval_ss.user_set)
+			hidg_ss_out_ep_desc.bInterval =
+				hidg->interval_ss.value;
+		else
+			hidg_ss_out_ep_desc.bInterval =
+				HIDG_DEFAULT_SS_BINTERVAL;
+
 		status = usb_assign_descriptors(f,
 			    hidg_fs_descriptors_intout,
 			    hidg_hs_descriptors_intout,
@@ -1334,14 +1361,17 @@ static const struct configfs_item_operations hidg_item_ops = {
 	.release	= hid_attr_release,
 };
 
-#define F_HID_OPT(name, prec, limit)					\
-static ssize_t f_hid_opts_##name##_show(struct config_item *item, char *page)\
+#define F_HID_OPT_U(name, prec, limit)					\
+static ssize_t f_hid_opts_##name##_show(struct config_item *item,	\
+					char *page)			\
 {									\
 	struct f_hid_opts *opts = to_f_hid_opts(item);			\
 	int result;							\
+	u##prec value;							\
 									\
 	mutex_lock(&opts->lock);					\
-	result = sprintf(page, "%d\n", opts->name);			\
+	value = get_hid_opt_##name(opts);				\
+	result = sysfs_emit(page, "%d\n", value);			\
 	mutex_unlock(&opts->lock);					\
 									\
 	return result;							\
@@ -1368,7 +1398,7 @@ static ssize_t f_hid_opts_##name##_store(struct config_item *item,	\
 		ret = -EINVAL;						\
 		goto end;						\
 	}								\
-	opts->name = num;						\
+	set_hid_opt_##name(opts, num);					\
 	ret = len;							\
 									\
 end:									\
@@ -1378,11 +1408,54 @@ end:									\
 									\
 CONFIGFS_ATTR(f_hid_opts_, name)
 
+#define F_HID_OPT(name, prec, limit)					\
+static void set_hid_opt_##name(struct f_hid_opts *opts, u##prec val)	\
+{									\
+	opts->name = val;						\
+}									\
+static u##prec get_hid_opt_##name(struct f_hid_opts *opts)		\
+{									\
+	return opts->name;						\
+}									\
+F_HID_OPT_U(name, prec, limit)
+
+#define F_HID_OPT_INTERVAL(name)					\
+static void set_hid_opt_##name(struct f_hid_opts *opts, u8 val)		\
+{									\
+	opts->name.value = val;						\
+	opts->name.user_set = true;					\
+}									\
+static u8 get_hid_opt_##name(struct f_hid_opts *opts)			\
+{									\
+	return opts->name.value;					\
+}									\
+F_HID_OPT_U(name, 8, 255)
+
 F_HID_OPT(subclass, 8, 255);
 F_HID_OPT(protocol, 8, 255);
 F_HID_OPT(no_out_endpoint, 8, 1);
 F_HID_OPT(report_length, 16, 65535);
 
+F_HID_OPT_INTERVAL(interval_fs);
+F_HID_OPT_INTERVAL(interval_hs);
+F_HID_OPT_INTERVAL(interval_ss);
+
+static void set_hid_opt_interval(struct f_hid_opts *opts, u8 val)
+{
+	set_hid_opt_interval_fs(opts, val);
+	set_hid_opt_interval_hs(opts, val);
+	set_hid_opt_interval_ss(opts, val);
+
+	opts->interval = val;
+}
+
+static u8 get_hid_opt_interval(struct f_hid_opts *opts)
+{
+	return opts->interval;
+}
+
+F_HID_OPT_U(interval, 8, 255);
+
 static ssize_t f_hid_opts_report_desc_show(struct config_item *item, char *page)
 {
 	struct f_hid_opts *opts = to_f_hid_opts(item);
@@ -1428,58 +1501,11 @@ static ssize_t f_hid_opts_report_desc_store(struct config_item *item,
 
 CONFIGFS_ATTR(f_hid_opts_, report_desc);
 
-static ssize_t f_hid_opts_interval_show(struct config_item *item, char *page)
-{
-	struct f_hid_opts *opts = to_f_hid_opts(item);
-	int result;
-
-	mutex_lock(&opts->lock);
-	result = sprintf(page, "%d\n", opts->interval);
-	mutex_unlock(&opts->lock);
-
-	return result;
-}
-
-static ssize_t f_hid_opts_interval_store(struct config_item *item,
-		const char *page, size_t len)
-{
-	struct f_hid_opts *opts = to_f_hid_opts(item);
-	int ret;
-	unsigned int tmp;
-
-	mutex_lock(&opts->lock);
-	if (opts->refcnt) {
-		ret = -EBUSY;
-		goto end;
-	}
-
-	/* parse into a wider type first */
-	ret = kstrtouint(page, 0, &tmp);
-	if (ret)
-		goto end;
-
-	/* range-check against unsigned char max */
-	if (tmp > 255) {
-		ret = -EINVAL;
-		goto end;
-	}
-
-	opts->interval = (unsigned char)tmp;
-	opts->interval_user_set = true;
-	ret = len;
-
-end:
-	mutex_unlock(&opts->lock);
-	return ret;
-}
-
-CONFIGFS_ATTR(f_hid_opts_, interval);
-
 static ssize_t f_hid_opts_dev_show(struct config_item *item, char *page)
 {
 	struct f_hid_opts *opts = to_f_hid_opts(item);
 
-	return sprintf(page, "%d:%d\n", major, opts->minor);
+	return sysfs_emit(page, "%d:%d\n", major, opts->minor);
 }
 
 CONFIGFS_ATTR_RO(f_hid_opts_, dev);
@@ -1490,6 +1516,9 @@ static struct configfs_attribute *hid_attrs[] = {
 	&f_hid_opts_attr_no_out_endpoint,
 	&f_hid_opts_attr_report_length,
 	&f_hid_opts_attr_interval,
+	&f_hid_opts_attr_interval_hs,
+	&f_hid_opts_attr_interval_fs,
+	&f_hid_opts_attr_interval_ss,
 	&f_hid_opts_attr_report_desc,
 	&f_hid_opts_attr_dev,
 	NULL,
@@ -1537,8 +1566,13 @@ static struct usb_function_instance *hidg_alloc_inst(void)
 		return ERR_PTR(-ENOMEM);
 	mutex_init(&opts->lock);
 
-	opts->interval = 4;
-	opts->interval_user_set = false;
+	opts->interval = HIDG_DEFAULT_HS_BINTERVAL;
+	opts->interval_fs.value = HIDG_DEFAULT_FS_BINTERVAL;
+	opts->interval_fs.user_set = false;
+	opts->interval_hs.value = HIDG_DEFAULT_HS_BINTERVAL;
+	opts->interval_hs.user_set = false;
+	opts->interval_ss.value = HIDG_DEFAULT_SS_BINTERVAL;
+	opts->interval_ss.user_set = false;
 
 	opts->func_inst.free_func_inst = hidg_free_inst;
 	ret = &opts->func_inst;
@@ -1628,8 +1662,15 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
 	hidg->bInterfaceProtocol = opts->protocol;
 	hidg->report_length = opts->report_length;
 	hidg->report_desc_length = opts->report_desc_length;
+
 	hidg->interval = opts->interval;
-	hidg->interval_user_set = opts->interval_user_set;
+	hidg->interval_fs.value = opts->interval_fs.value;
+	hidg->interval_fs.user_set = opts->interval_fs.user_set;
+	hidg->interval_hs.value = opts->interval_hs.value;
+	hidg->interval_hs.user_set = opts->interval_hs.user_set;
+	hidg->interval_ss.value = opts->interval_ss.value;
+	hidg->interval_ss.user_set = opts->interval_ss.user_set;
+
 	if (opts->report_desc) {
 		hidg->report_desc = kmemdup(opts->report_desc,
 					    opts->report_desc_length,
diff --git a/drivers/usb/gadget/function/u_hid.h b/drivers/usb/gadget/function/u_hid.h
index a9ed9720caee..e666cd9968eb 100644
--- a/drivers/usb/gadget/function/u_hid.h
+++ b/drivers/usb/gadget/function/u_hid.h
@@ -15,6 +15,11 @@
 
 #include <linux/usb/composite.h>
 
+struct f_hid_opt_interval {
+	unsigned char value;
+	bool user_set;
+};
+
 struct f_hid_opts {
 	struct usb_function_instance	func_inst;
 	int				minor;
@@ -26,7 +31,9 @@ struct f_hid_opts {
 	unsigned char			*report_desc;
 	bool				report_desc_alloc;
 	unsigned char			interval;
-	bool				interval_user_set;
+	struct f_hid_opt_interval	interval_fs;
+	struct f_hid_opt_interval	interval_hs;
+	struct f_hid_opt_interval	interval_ss;
 
 	/*
 	 * Protect the data form concurrent access by read/write




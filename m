Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.129.46.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740488;
	b=3LgiCXWAjU/+U4VXgK5vZqZwAStBY0vNHu+Z66puIDWA20dtM2WtLA4L/Aj0spLEcloQ
	 BUkMaoYOoLaHZyCwX3pOpp9FQVBoV5ME1MbRMHf8q8amQaDski+UVL5IqXTTgGrelYFcH
	 DaZUKO2wMOWZ98JfoXRK2PkNEb+SJ8Aa3mN1nSu2NSXb30BA/yGqUgL4eFH+dRiMeH2nm
	 dxaEGODFiZQfIrsIFubAeQuP7QDaZXZOwTFiKQ/NmNGjnE8mmWcd50CPZy5fkTvkOXEzM
	 zvA6jq5Yuw1qLy40c7f7EqZe3jx5TnjHyrFxT/tPeQyHuZbOJmiNIIMkjRehctmxHRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740488;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6IEO22Xm+2KUtB/7mAD9PGWu6m+2JGC1SzU4howrC9E=;
	b=1iw/mV2WpMA+AwKLiyuBn2eBGEaQYzuA+8HSlndK4Ppg+wnHMyzDt/3q/bxzvIweyuTA
	 se3k/XnVlDYtyUNfco8tV1xkCSSSb4h4ZNnyjECJJS8XEvg1vvzMXkmOqr78mh4oNYxiI
	 MZdADMosWBrrgmJpuUVMS0gzsQ/+CSO9E1LobyCntECe8WWlzTHB9eVUZlr8WBaBMSRvg
	 rF7AXWg/eekPLt90LISwSmj0CgedgvRHP7fa/5z0WrWINWwA9lpcfyxztFKNoO01LJ4Pr
	 V75+cZjHOey/9OhL/0lHIdcnaxg/3AEohDLswxKuEFXWPVrTA2/QslEWY2sSvdUYlKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nwlink.com;
	spf=pass smtp.mailfrom=nwlink.com;
	dkim=pass header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=fkKtu7tv;
	arc=none smtp.remote-ip=52.129.46.36
Received: from smtp2.iinet.com (smtp2.iinet.com [52.129.46.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFBC606EEA0;
	Tue,  3 Nov 2026 21:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EFBC606EEA0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=fkKtu7tv
Received: from porter.hsd1.wa.comcast.net (c-98-203-133-45.hsd1.wa.comcast.net [98.203.133.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kaf@nwlink.com)
	by smtp2.iinet.com (Postfix) with ESMTPSA id C6C65B404E4;
	Tue,  3 Nov 2026 13:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1793740485; bh=6IEO22Xm+2KUtB/7mAD9PGWu6m+2JGC1SzU4howrC9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fkKtu7tvRXQHWi1zfiATwURj7AdrQGrIHI9emf60YhtjMdXPWKAVsFgqtX523BXMY
	 2jSnQxPlv5/1oXCLaqU6Uqu5nWccDj+76cI5vpx17ivDLzFUrPER5eh17/Vwfu8O78
	 3z+KTpkuUsJHd/1zp0e7l1acMMSZkazJbLZU+uVJE1FG9Ae+lQmATsalf4vTwsEgrt
	 DQNxLcr8qYeRSEh7muGEOaAOAoTKb4QJh+GupJ0stKkk3WnK8uuwsX86FxcxvKf+ZC
	 EGshTOM+26WtYkCZ/z4mIfZbKeV39YiE7P9WX8irCkT33Ra4+WV1HpAF3qiBt8/z3K
	 mQ35Ogu5oLKtw==
From: Kyle Farrell <kaf@nwlink.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org,
	flavra@baylibre.com,
	Kyle Farrell <kaf@nwlink.com>
Subject: [PATCH v3 3/3] usb: gadget: f_uac2: allow explicit channel count independent of channel mask
Date: Tue,  3 Nov 2026 13:14:34 -0800
Message-Id: <20261103211434.996135-4-kaf@nwlink.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103211434.996135-1-kaf@nwlink.com>
References: <20261103211434.996135-1-kaf@nwlink.com>
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

The UAC2 gadget driver currently derives bNrChannels from the number
of set bits in bmChannelConfig. Since the bmChannelConfig
channel-location bitmap provides only 27 predefined channel locations,
this limits playback and capture streams to 27 channels. UAC2 allows
bNrChannels to specify up to 255 channels, including channels without
predefined locations in bmChannelConfig.

Add ConfigFS p_channels and c_channels attributes to configure the
playback and capture channel counts explicitly.  Preserve the existing
p_chmask and c_chmask interface and semantics. The default value of
zero for p_channels and c_channels continues to derive the channel count
from the corresponding p_chmask and c_chmask.

When an explicit channel count and a nonzero channel mask are both
specified, require the number of set bits in the mask to match the
channel count. Partial channel-location assignments permitted by UAC2
are therefore not supported. Additionally, reject Feature Unit
configurations whose descriptor length would exceed the one-byte
bLength field.

Signed-off-by: Kyle Farrell <kaf@nwlink.com>
---
 .../ABI/testing/configfs-usb-gadget-uac2      | 18 ++++-
 Documentation/usb/gadget-testing.rst          | 18 ++++-
 drivers/usb/gadget/function/f_uac2.c          | 66 ++++++++++++++-----
 drivers/usb/gadget/function/u_uac2.h          |  4 ++
 4 files changed, 85 insertions(+), 21 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
index 133e995c3e92..8e264843e492 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
@@ -5,7 +5,14 @@ Description:
 		The attributes:
 
 		=====================	=======================================
-		c_chmask		capture channel mask
+		c_chmask		capture channel-location mask. The number of
+					capture channels is derived from the number of
+					set bits unless c_channels is specified.
+		c_channels		explicit capture channel count. A value of 0
+					derives the channel count from c_chmask. When
+					nonzero, c_chmask specifies channel locations
+					and may be 0. If both c_channels and c_chmask
+					are nonzero, the values must agree.
 		c_srate			list of capture sampling rates (comma-separated)
 		c_ssize			capture sample size (bytes)
 		c_hs_bint		capture bInterval for HS/SS (1-4: fixed, 0: auto)
@@ -20,7 +27,14 @@ Description:
 		c_volume_res		capture volume control resolution
 					(in 1/256 dB)
 		fb_max			maximum extra bandwidth in async mode
-		p_chmask		playback channel mask
+		p_chmask		playback channel-location mask. The number of
+					playback channels is derived from the number of
+					set bits unless p_channels is specified.
+		p_channels		explicit playback channel count. A value of 0
+					derives the channel count from p_chmask. When
+					nonzero, p_chmask specifies channel locations
+					and may be 0. If both p_channels and p_chmask
+					are nonzero, the values must agree.
 		p_srate			list of playback sampling rates (comma-separated)
 		p_ssize			playback sample size (bytes)
 		p_hs_bint		playback bInterval for HS/SS (1-4: fixed, 0: auto)
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index 4921e5307d49..c050218291d1 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -741,7 +741,14 @@ The function name to use when creating the function directory is "uac2".
 The uac2 function provides these attributes in its function directory:
 
 	================ ====================================================
-	c_chmask         capture channel mask
+	c_chmask         capture channel-location mask. The number of
+			 capture channels is derived from the number of
+			 set bits unless c_channels is specified.
+	c_channels	 explicit capture channel count. A value of 0
+			 derives the channel count from c_chmask. When
+			 nonzero, c_chmask specifies channel locations
+			 and may be 0. If both c_channels and c_chmask
+			 are nonzero, the values must agree.
 	c_srate          list of capture sampling rates (comma-separated)
 	c_ssize          capture sample size (bytes)
 	c_sync           capture synchronization type (async/adaptive)
@@ -752,7 +759,14 @@ The uac2 function provides these attributes in its function directory:
 	c_volume_res     capture volume control resolution (in 1/256 dB)
 	c_hs_bint        capture bInterval for HS/SS (1-4: fixed, 0: auto)
 	fb_max           maximum extra bandwidth in async mode
-	p_chmask         playback channel mask
+	p_chmask         playback channel-location mask. The number of
+			 playback channels is derived from the number of
+			 set bits unless p_channels is specified.
+	p_channels	 explicit playback channel count. A value of 0
+			 derives the channel count from p_chmask. When
+			 nonzero, p_chmask specifies channel locations
+			 and may be 0. If both p_channels and p_chmask
+			 are nonzero, the values must agree.
 	p_srate          list of playback sampling rates (comma-separated)
 	p_ssize          playback sample size (bytes)
 	p_mute_present   playback mute control enable
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 19578fbc6af5..5973484a4233 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -50,8 +50,17 @@
 #define UNFLW_CTRL	8
 #define OVFLW_CTRL	10
 
-#define EPIN_EN(_opts) ((_opts)->p_chmask != 0)
-#define EPOUT_EN(_opts) ((_opts)->c_chmask != 0)
+static unsigned int uac2_num_channels(bool is_playback,
+				      const struct f_uac2_opts *opts)
+{
+	u8 channels = is_playback ? opts->p_channels : opts->c_channels;
+	u32 chmask = is_playback ? opts->p_chmask : opts->c_chmask;
+
+	return channels ? channels : num_channels(chmask);
+}
+
+#define EPIN_EN(_opts) (uac2_num_channels(true, (_opts)) != 0)
+#define EPOUT_EN(_opts) (uac2_num_channels(false, (_opts)) != 0)
 #define FUIN_EN(_opts) (EPIN_EN(_opts) \
 				&& ((_opts)->p_mute_present \
 				|| (_opts)->p_volume_present))
@@ -676,11 +685,11 @@ static u32 get_max_bw_for_bint(const struct f_uac2_opts *uac2_opts,
 	u32 max_size_bw;
 
 	if (is_playback) {
-		channels = num_channels(uac2_opts->p_chmask);
+		channels = uac2_num_channels(true, uac2_opts);
 		srate = get_max_srate(uac2_opts->p_srates);
 		ssize = uac2_opts->p_ssize;
 	} else {
-		channels = num_channels(uac2_opts->c_chmask);
+		channels = uac2_num_channels(false, uac2_opts);
 		srate = get_max_srate(uac2_opts->c_srates);
 		ssize = uac2_opts->c_ssize;
 	}
@@ -766,10 +775,9 @@ static int set_ep_max_packet_size_bint(struct device *dev, const struct f_uac2_o
 	return 0;
 }
 
-static struct uac2_feature_unit_descriptor *build_fu_desc(int chmask)
+static struct uac2_feature_unit_descriptor *build_fu_desc(unsigned int channels)
 {
 	struct uac2_feature_unit_descriptor *fu_desc;
-	int channels = num_channels(chmask);
 	int fu_desc_size = UAC2_DT_FEATURE_UNIT_SIZE(channels);
 
 	fu_desc = kzalloc(fu_desc_size, GFP_KERNEL);
@@ -978,13 +986,27 @@ static int afunc_validate_opts(struct g_audio *agdev, struct device *dev)
 {
 	struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
 	const char *msg = NULL;
+	unsigned int p_channels = uac2_num_channels(true, opts);
+	unsigned int c_channels = uac2_num_channels(false, opts);
 
-	if (!opts->p_chmask && !opts->c_chmask)
-		msg = "no playback and capture channels";
-	else if (opts->p_chmask & ~UAC2_CHANNEL_MASK)
+	if (opts->p_chmask & ~UAC2_CHANNEL_MASK)
 		msg = "unsupported playback channels mask";
 	else if (opts->c_chmask & ~UAC2_CHANNEL_MASK)
 		msg = "unsupported capture channels mask";
+	else if (!p_channels && !c_channels)
+		msg = "no playback and capture channels";
+	else if (opts->p_channels && opts->p_chmask &&
+		 opts->p_channels != num_channels(opts->p_chmask))
+		msg = "playback channel count does not match channel mask";
+	else if (opts->c_channels && opts->c_chmask &&
+		 opts->c_channels != num_channels(opts->c_chmask))
+		msg = "capture channel count does not match channel mask";
+	else if (FUIN_EN(opts) &&
+		 UAC2_DT_FEATURE_UNIT_SIZE(p_channels) > U8_MAX)
+		msg = "too many playback channels for feature unit descriptor";
+	else if (FUOUT_EN(opts) &&
+		 UAC2_DT_FEATURE_UNIT_SIZE(c_channels) > U8_MAX)
+		msg = "too many capture channels for feature unit descriptor";
 	else if ((opts->p_ssize < 1) || (opts->p_ssize > 4))
 		msg = "incorrect playback sample size";
 	else if ((opts->c_ssize < 1) || (opts->c_ssize > 4))
@@ -1061,12 +1083,16 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		return PTR_ERR(us);
 
 	if (FUOUT_EN(uac2_opts)) {
-		out_feature_unit_desc = build_fu_desc(uac2_opts->c_chmask);
+		unsigned int c_channels = uac2_num_channels(false, uac2_opts);
+
+		out_feature_unit_desc = build_fu_desc(c_channels);
 		if (!out_feature_unit_desc)
 			return -ENOMEM;
 	}
 	if (FUIN_EN(uac2_opts)) {
-		in_feature_unit_desc = build_fu_desc(uac2_opts->p_chmask);
+		unsigned int p_channels = uac2_num_channels(true, uac2_opts);
+
+		in_feature_unit_desc = build_fu_desc(p_channels);
 		if (!in_feature_unit_desc) {
 			ret = -ENOMEM;
 			goto err_free_fu;
@@ -1101,13 +1127,13 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 
 
 	/* Initialize the configurable parameters */
-	usb_out_it_desc.bNrChannels = num_channels(uac2_opts->c_chmask);
+	usb_out_it_desc.bNrChannels = uac2_num_channels(false, uac2_opts);
 	usb_out_it_desc.bmChannelConfig = cpu_to_le32(uac2_opts->c_chmask);
-	io_in_it_desc.bNrChannels = num_channels(uac2_opts->p_chmask);
+	io_in_it_desc.bNrChannels = uac2_num_channels(true, uac2_opts);
 	io_in_it_desc.bmChannelConfig = cpu_to_le32(uac2_opts->p_chmask);
-	as_out_hdr_desc.bNrChannels = num_channels(uac2_opts->c_chmask);
+	as_out_hdr_desc.bNrChannels = uac2_num_channels(false, uac2_opts);
 	as_out_hdr_desc.bmChannelConfig = cpu_to_le32(uac2_opts->c_chmask);
-	as_in_hdr_desc.bNrChannels = num_channels(uac2_opts->p_chmask);
+	as_in_hdr_desc.bNrChannels = uac2_num_channels(true, uac2_opts);
 	as_in_hdr_desc.bmChannelConfig = cpu_to_le32(uac2_opts->p_chmask);
 	as_out_fmt1_desc.bSubslotSize = uac2_opts->c_ssize;
 	as_out_fmt1_desc.bBitResolution = uac2_opts->c_ssize * 8;
@@ -1309,7 +1335,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 
 	agdev->gadget = gadget;
 
-	agdev->params.p_channels = num_channels(uac2_opts->p_chmask);
+	agdev->params.p_channels = uac2_num_channels(true, uac2_opts);
 	memcpy(agdev->params.p_srates, uac2_opts->p_srates,
 			sizeof(agdev->params.p_srates));
 	agdev->params.p_ssize = uac2_opts->p_ssize;
@@ -1321,7 +1347,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		agdev->params.p_fu.volume_max = uac2_opts->p_volume_max;
 		agdev->params.p_fu.volume_res = uac2_opts->p_volume_res;
 	}
-	agdev->params.c_channels = num_channels(uac2_opts->c_chmask);
+	agdev->params.c_channels = uac2_num_channels(false, uac2_opts);
 	memcpy(agdev->params.c_srates, uac2_opts->c_srates,
 			sizeof(agdev->params.c_srates));
 	agdev->params.c_ssize = uac2_opts->c_ssize;
@@ -2091,10 +2117,12 @@ end:									\
 CONFIGFS_ATTR(f_uac2_opts_, name)
 
 UAC2_ATTRIBUTE(u32, p_chmask);
+UAC2_ATTRIBUTE(u8, p_channels);
 UAC2_RATE_ATTRIBUTE(p_srate);
 UAC2_ATTRIBUTE(u32, p_ssize);
 UAC2_ATTRIBUTE(u8, p_hs_bint);
 UAC2_ATTRIBUTE(u32, c_chmask);
+UAC2_ATTRIBUTE(u8, c_channels);
 UAC2_RATE_ATTRIBUTE(c_srate);
 UAC2_ATTRIBUTE_SYNC(c_sync);
 UAC2_ATTRIBUTE(u32, c_ssize);
@@ -2134,10 +2162,12 @@ UAC2_ATTRIBUTE(s16, c_terminal_type);
 
 static struct configfs_attribute *f_uac2_attrs[] = {
 	&f_uac2_opts_attr_p_chmask,
+	&f_uac2_opts_attr_p_channels,
 	&f_uac2_opts_attr_p_srate,
 	&f_uac2_opts_attr_p_ssize,
 	&f_uac2_opts_attr_p_hs_bint,
 	&f_uac2_opts_attr_c_chmask,
+	&f_uac2_opts_attr_c_channels,
 	&f_uac2_opts_attr_c_srate,
 	&f_uac2_opts_attr_c_ssize,
 	&f_uac2_opts_attr_c_hs_bint,
@@ -2207,10 +2237,12 @@ static struct usb_function_instance *afunc_alloc_inst(void)
 				    &f_uac2_func_type);
 
 	opts->p_chmask = UAC2_DEF_PCHMASK;
+	opts->p_channels = UAC2_DEF_PCHANNELS;
 	opts->p_srates[0] = UAC2_DEF_PSRATE;
 	opts->p_ssize = UAC2_DEF_PSSIZE;
 	opts->p_hs_bint = UAC2_DEF_PHSBINT;
 	opts->c_chmask = UAC2_DEF_CCHMASK;
+	opts->c_channels = UAC2_DEF_CCHANNELS;
 	opts->c_srates[0] = UAC2_DEF_CSRATE;
 	opts->c_ssize = UAC2_DEF_CSSIZE;
 	opts->c_hs_bint = UAC2_DEF_CHSBINT;
diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
index 0df808289ded..bacd841c9df6 100644
--- a/drivers/usb/gadget/function/u_uac2.h
+++ b/drivers/usb/gadget/function/u_uac2.h
@@ -17,10 +17,12 @@
 #include "uac_common.h"
 
 #define UAC2_DEF_PCHMASK 0x3
+#define UAC2_DEF_PCHANNELS 0  /* 0 = derive from p_chmask */
 #define UAC2_DEF_PSRATE 48000
 #define UAC2_DEF_PSSIZE 2
 #define UAC2_DEF_PHSBINT 0
 #define UAC2_DEF_CCHMASK 0x3
+#define UAC2_DEF_CCHANNELS 0  /* 0 = derive from c_chmask */
 #define UAC2_DEF_CSRATE 64000
 #define UAC2_DEF_CSSIZE 2
 #define UAC2_DEF_CHSBINT 0
@@ -46,11 +48,13 @@ struct f_uac2_opts {
 	int				p_srates[UAC_MAX_RATES];
 	int				p_ssize;
 	u8				p_hs_bint;
+	u8				p_channels;
 	int				c_chmask;
 	int				c_srates[UAC_MAX_RATES];
 	int				c_ssize;
 	int				c_sync;
 	u8				c_hs_bint;
+	u8				c_channels;
 
 	bool			p_mute_present;
 	bool			p_volume_present;
-- 
2.34.1

